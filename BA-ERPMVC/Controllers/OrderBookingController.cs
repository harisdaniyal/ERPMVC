using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BA_ERPMVC.Models;
using BA_ERPMVC.BusinessLayer;
using System.Threading.Tasks;
using BA_ERPMVC.BusinessLayer.OrderBooking;
using BA_ERPMVC.ViewModels.OrderBooking;
using AutoMapper;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.UtilityClasses;
using BA_ERPMVC.ViewModels.ExportOrderBooking;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using MasterLayer;
using System.Data;

namespace BA_ERPMVC.Controllers
{
    public class OrderBookingController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        ReportDocument rd = new ReportDocument();
        private readonly OrderBookingService orderBookingService;
        private readonly BusinessDivisionService businessDivisionService;
        private readonly ContainerTypeService containerTypeService;
        private readonly CustomerService customerService;
        private readonly FacilityService facilityService;
        private readonly LocationService locationService;
        private readonly VendorExpensesService vendorExpensesService;

        public OrderBookingController()
        {
            orderBookingService = new OrderBookingService();
            businessDivisionService = new BusinessDivisionService();
            containerTypeService = new ContainerTypeService();
            customerService = new CustomerService();
            facilityService = new FacilityService();
            locationService = new LocationService();
            vendorExpensesService = new VendorExpensesService();
        }

        // GET: OrderBooking
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TripsExecution()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> Booking(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be a valid id" });
            }
            this.ViewBag.ShippingLines = orderBookingService.GetShippingLine();
            this.ViewBag.ShippingAgents = orderBookingService.GetShippingAgent();

            this.ViewBag.Customers = await customerService.GetAllCustomersAsync();
            this.ViewBag.Facilities = await facilityService.GetAllFacilitiesAsync();
            this.ViewBag.BusinessDivisions = await businessDivisionService.GetAllBusinessDivisionsAsync();

            var bookingViewModel = await orderBookingService.GetOrderBookingAsync(orderBookingId);

            if (bookingViewModel == null)
            {
                var orderNo = await orderBookingService.GetNewOrderNumber();

                return PartialView("Partials/_Booking", new BookingViewModel
                {
                    OrderNo = orderNo
                });
            }
            return PartialView("Partials/_Booking", bookingViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> Booking(BookingViewModel bookingViewModel)
        {
            if (bookingViewModel == null)
            {
                return Json(new { success = false, message = $"{nameof(bookingViewModel)} should be null or empty" });
            }

            try
            {
                if (bookingViewModel.OrderId == 0)
                {
                    await orderBookingService.CreateOrderBookingAsync(bookingViewModel);

                    return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
                }

                await orderBookingService.UpdateOrderBookingAsync(bookingViewModel);

                return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public async Task<ActionResult> Logistics(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be positive integer" });
            }

            this.ViewBag.Location = await locationService.GetLocationsAsync();
            this.ViewBag.EmptyDropOffLocation = await locationService.GetEmptyDropOffLocAsync();
            this.ViewBag.ContainerTypes = await containerTypeService.GetAllContainerTypesAsync();
            this.ViewBag.ContainerSizes = await orderBookingService.GetContainerSizesAsync();
            this.ViewBag.PortAndTerminals = await orderBookingService.GetPortAndTerminal();

            var logisticsModel = await orderBookingService.GeLogisticsAsync(orderBookingId);

            if (logisticsModel == null || !logisticsModel.Any())
            {
                return PartialView("Partials/_Logistics", new List<LogisticsViewModel>
                {
                });
            }
            //logisticsModel = logisticsModel.Where(x => x.Status != OrdersStatus.Completed.ToString()); //  For Completed Status Hidden

            var logisticsViewModel = Mapper.Map<IEnumerable<Logistic>, IEnumerable<LogisticsViewModel>>(logisticsModel);

            return PartialView("Partials/_Logistics", logisticsViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> Logistics(LogisticsViewModel logisticsViewModels)
        {
            if (logisticsViewModels == null)
            {
                return Json(new { success = false, message = $"{nameof(logisticsViewModels)} should be null or empty" });
            }

            try
            {

                var logistics = Mapper.Map<LogisticsViewModel, Logistic>(logisticsViewModels);
                if (logistics.PreDispatched.GetValueOrDefault())
                {
                    logistics.Status = OrdersStatus.PreDispatched.ToString();
                }
                else
                {
                    logistics.Status = OrdersStatus.Dispatched.ToString();
                }
                await orderBookingService.SaveLogisticsAsync(logistics);

                return Json(new { success = true, logisticsId = logistics.logisticsid });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
        [HttpPost]
        public async Task<ActionResult> DeleteLogistics(int logisticsId)
        {
            if (logisticsId < 0)
            {
                return Json(new { success = false, message = $"{nameof(logisticsId)} should be a valid id" });
            }

            try
            {
                if (!orderBookingService.DeleteLogistics(logisticsId))
                {
                    return Json(new { success = false, message = $"Logistic can not be delete after Dispatched." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Container can not be deleted, it is used in trip." });
            }

            return Json(new { success = true });
        }

        [HttpGet]
        public async Task<ActionResult> Trips(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be positive integer" });
            }

            var containers = await orderBookingService.GeLogisticsAsync(orderBookingId);

            this.ViewBag.Vendors = await orderBookingService.GetVendorsAsync();
            this.ViewBag.Locations = await locationService.GetLocationsAsync();
            this.ViewBag.NewTripCode = await orderBookingService.GetNewTripCode();
            this.ViewBag.Containers = Mapper.Map<IEnumerable<Logistic>, IEnumerable<TripContainersViewModel>>(containers);

            var tripsModel = await orderBookingService.GetTripsDetailAsync(orderBookingId);

            if (tripsModel == null || !tripsModel.Any())
            {
                return PartialView("Partials/_Trips", new List<ViewModels.OrderBooking.TripViewModel>()
                {
                });
            }

            var tripsViewModel = Mapper.Map<IEnumerable<BAtrip>, IEnumerable<ViewModels.OrderBooking.TripViewModel>>(tripsModel);

            return PartialView("Partials/_Trips", tripsViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> Trips(ViewModels.OrderBooking.TripViewModel tripViewModel)
        {
            if (tripViewModel == null)
            {
                return Json(new { success = false, message = $"{nameof(tripViewModel)} should be null or empty" });
            }

            try
            {
                var tripModel = Mapper.Map<ViewModels.OrderBooking.TripViewModel, BAtrip>(tripViewModel);

                await orderBookingService.AddTripAsync(tripModel);

                return Json(new { success = true, tripId = tripModel.ID }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public async Task<ActionResult> Invoice(int orderId = 0)
        {
            return PartialView("Partials/_Invoice");
        }

        [HttpGet]
        public async Task<ActionResult> GetVendorExpenses(int vendorId)
        {
            if (vendorId < 0)
            {
                return Json(new { success = false, message = $"{nameof(vendorId)} should be a valid id" });
            }
            var vendorExpenses = await vendorExpensesService.GetVendorExpensesAsync(vendorId);
            var vendorExpensesViewModel = Mapper.Map<IEnumerable<VendorExpens>, IEnumerable<VendorExpensesViewModel>>(vendorExpenses);

            return Json(new { success = true, VendorExpenses = vendorExpensesViewModel }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public async Task<ActionResult> DeleteTrip(int tripId)
        {
            if (tripId < 0)
            {
                return Json(new { success = false, message = $"{nameof(tripId)} should be a valid id" });
            }
            try
            {
                await orderBookingService.DeleteTrip(tripId);
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return Json(new { success = true, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public async Task<ActionResult> GetTripsByContainer(int logisticsId)
        {
            if (logisticsId < 0)
            {
                return Json(new { success = false, message = $"{nameof(logisticsId)} should be a valid id" });
            }
            try
            {
                var tripsModel = await orderBookingService.GetTripsByContainerAsync(logisticsId);

                if (tripsModel == null || !tripsModel.Any())
                {
                    return Json(new { success = true, message = "No data found." }, JsonRequestBehavior.AllowGet);
                }
                var tripsViewModel = Mapper.Map<IEnumerable<BAtrip>, IEnumerable<ViewModels.OrderBooking.TripViewModel>>(tripsModel);
                return Json(new { success = true, trips = tripsViewModel }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = true, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public async Task<ActionResult> GetNewTripCode()
        {
            try
            {
                var tripCode = await orderBookingService.GetNewTripCode();
                return Json(new { success = true, newTripCode = tripCode }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = true, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public async Task<ActionResult> OrderList(int businessDivisionId = 0)
        {
            try
            {
                this.ViewBag.BusinessDivisions = await businessDivisionService.GetAllBusinessDivisionsAsync();
                var upcomingTrips = orderBookingService.GetOrderList(businessDivisionId);
                return View("OrderList", upcomingTrips);
            }
            catch (Exception ex)
            {
                return View("OrderList", new List<OrderListViewModel>());
            }
        }

        //*****Export OrderList********///
        [HttpGet]
        public async Task<ActionResult> ExportOrderList()
        {
            try
            {
                //this.ViewBag.BusinessDivisions = await businessDivisionService.GetAllBusinessDivisionsAsync();
                var upcomingTrips = orderBookingService.GetExportOrderList();
                return View("ExportOrderList", upcomingTrips);
            }
            catch (Exception ex)
            {
                return View("ExportOrderList", new List<OrderListViewModel>());
            }
        }

        [HttpGet]
        public async Task<ActionResult> Dispatched(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be a valid id" });
            }

            this.ViewBag.Customers = await customerService.GetAllCustomersAsync();
            this.ViewBag.Facilities = await facilityService.GetAllFacilitiesAsync();
            this.ViewBag.BusinessDivisions = await businessDivisionService.GetAllBusinessDivisionsAsync();

            var bookingViewModel = await orderBookingService.GetOrderBookingAsync(orderBookingId);

            if (bookingViewModel == null)
            {
                var orderNo = await orderBookingService.GetNewOrderNumber();

                return PartialView("OrderExecutionPartials/_Dispatched", new BookingViewModel
                {
                    OrderNo = orderNo
                });
            }
            return PartialView("OrderExecutionPartials/_Dispatched", bookingViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> Dispatched(BookingViewModel bookingViewModel)
        {
            if (bookingViewModel == null)
            {
                return Json(new { success = false, message = $"{nameof(bookingViewModel)} should be null or empty" });
            }

            try
            {
                if (bookingViewModel.OrderId == 0)
                {
                    await orderBookingService.CreateOrderBookingAsync(bookingViewModel);

                    return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
                }

                await orderBookingService.UpdateOrderBookingAsync(bookingViewModel);

                return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public async Task<ActionResult> ExecuteTrips(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be positive integer" });
            }

            this.ViewBag.Locations = await locationService.GetLocationsAsync();
            this.ViewBag.ContainerTypes = await containerTypeService.GetAllContainerTypesAsync();
            this.ViewBag.ContainerSizes = await orderBookingService.GetContainerSizesAsync();

            var logisticsModel = await orderBookingService.GeLogisticsAsync(orderBookingId);

            if (logisticsModel == null || !logisticsModel.Any())
            {
                return PartialView("OrderExecutionPartials/_ExecuteTrips", new List<LogisticsViewModel>
                {
                });
            }

            var logisticsViewModel = Mapper.Map<IEnumerable<Logistic>, IEnumerable<LogisticsViewModel>>(logisticsModel);

            return PartialView("OrderExecutionPartials/_ExecuteTrips", logisticsViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExecuteTrips(LogisticsViewModel logisticsViewModels)
        {
            if (logisticsViewModels == null)
            {
                return Json(new { success = false, message = $"{nameof(logisticsViewModels)} should be null or empty" });
            }

            try
            {
                var logistics = Mapper.Map<LogisticsViewModel, Logistic>(logisticsViewModels);

                await orderBookingService.SaveLogisticsAsync(logistics);

                return Json(new { success = true, logisticsId = logistics.logisticsid });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public async Task<ActionResult> OrderDelivery(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be a valid id" });
            }

            this.ViewBag.Customers = await customerService.GetAllCustomersAsync();
            this.ViewBag.Facilities = await facilityService.GetAllFacilitiesAsync();
            this.ViewBag.BusinessDivisions = await businessDivisionService.GetAllBusinessDivisionsAsync();

            var bookingViewModel = await orderBookingService.GetOrderBookingAsync(orderBookingId);

            if (bookingViewModel == null)
            {
                var orderNo = await orderBookingService.GetNewOrderNumber();

                return PartialView("OrderExecutionPartials/_OrderDelivery", new BookingViewModel
                {
                    OrderNo = orderNo
                });
            }
            return PartialView("OrderExecutionPartials/_OrderDelivery", bookingViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> OrderDelivery(BookingViewModel bookingViewModel)
        {
            if (bookingViewModel == null)
            {
                return Json(new { success = false, message = $"{nameof(bookingViewModel)} should be null or empty" });
            }

            try
            {
                if (bookingViewModel.OrderId == 0)
                {
                    await orderBookingService.CreateOrderBookingAsync(bookingViewModel);

                    return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
                }

                await orderBookingService.UpdateOrderBookingAsync(bookingViewModel);

                return Json(new { success = true, orderBookingId = bookingViewModel.OrderId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


        //////*************************Export Booking Order**********************************///////

        //Get ExportOrder

        public ActionResult ExportOrder()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> ExportBooking(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be a valid id" });
            }
            this.ViewBag.Facilities = await facilityService.GetAllFacilitiesAsync();
            this.ViewBag.LoadingStation = await locationService.GetLocationsAsync();

            var bookingViewModel = await orderBookingService.GetExportOrderBookingAsync(orderBookingId);

            if (bookingViewModel == null)
            {
                var orderNo = await orderBookingService.GetExportNewOrderNumber();

                return PartialView("ExportPartials/_ExportBooking", new ExportOrderBookingViewModel
                {
                    OrderNo = orderNo
                });
            }
            return PartialView("ExportPartials/_ExportBooking", bookingViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportBooking(ExportOrderBookingViewModel bookingViewModel)
        {
            if (bookingViewModel == null)
            {
                return Json(new { success = false, message = $"{nameof(bookingViewModel)} should be null or empty" });
            }

            try
            {
                if (bookingViewModel.OrderID == 0)
                {
                    await orderBookingService.CreateExportOrderBookingAsync(bookingViewModel);

                    return Json(new { success = true, orderBookingId = bookingViewModel.OrderID });
                }

                await orderBookingService.UpdateExportOrderBookingAsync(bookingViewModel);

                return Json(new { success = true, orderBookingId = bookingViewModel.OrderID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        ////////********** Export Logistic**********///////

        [HttpGet]
        public async Task<ActionResult> ExportLogistic(int orderBookingId)
        {
            if (orderBookingId < 0)
            {
                return Json(new { success = false, message = $"{nameof(orderBookingId)} should be positive integer" });
            }

            this.ViewBag.ShippingLines = orderBookingService.GetShippingLine();
            this.ViewBag.ContainerTypes = await containerTypeService.GetAllContainerTypesAsync();
            this.ViewBag.ContainerSizes = await orderBookingService.GetContainerSizesAsync();

            var exportlogisticsModel = await orderBookingService.GetExportLogisticsAsync(orderBookingId);

            if (exportlogisticsModel == null || !exportlogisticsModel.Any())
            {
                return PartialView("ExportPartials/_ExportLogistic", new List<ExportLogisticViewModel>
                {
                });
            }
            //logisticsModel = logisticsModel.Where(x => x.Status != OrdersStatus.Completed.ToString()); //  For Completed Status Hidden

            var exportlogisticsViewModel = Mapper.Map<IEnumerable<ExportLogistic>, IEnumerable<ExportLogisticViewModel>>(exportlogisticsModel);

            return PartialView("ExportPartials/_ExportLogistic", exportlogisticsViewModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportLogistic(ExportLogisticViewModel exportlogisticsViewModels)
        {
            if (exportlogisticsViewModels == null)
            {
                return Json(new { success = false, message = $"{nameof(exportlogisticsViewModels)} should be null or empty" });
            }

            try
            {
                await orderBookingService.SaveExportLogisticsAsync(exportlogisticsViewModels);

                return Json(new { success = true, logisticsId = exportlogisticsViewModels.LogisticId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult> DeleteExportLogistic(int logisticId)
        {
            if (logisticId < 0)
            {
                return Json(new { success = false, message = $"{nameof(logisticId)} should be a valid id" });
            }

            try
            {
                if (!orderBookingService.ExportDeleteLogistic(logisticId))
                {
                    return Json(new { success = false, message = $"Logistic can not be delete after PreDispatched." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Container can not be deleted, it is InProcessed." });
            }

            return Json(new { success = true });
        }
        public ActionResult BLOrCROReport()
        {
            return View();
        }

        // Get BL and CRO DropDown //

        public ActionResult GetBlByCustomerNo()
        {
            var data = Json(db.GenerateOrders.Where( x => x.isCompleted == false && x.BL != null).Select(x => new
            {
                BL = x.BL

            }
            ).ToList(), JsonRequestBehavior.AllowGet);
            return data;


            }
        public ActionResult GetCROByCustomerNo()
        {
            var data = Json(db.ExportBookingOrders.Where(x => x.IsCompleted == false && x.CRO != null).Select(x => new
            {
                CRO = x.CRO
            }
            ).ToList(), JsonRequestBehavior.AllowGet);
            return data;
        }

        public ActionResult GetCustomerName()
        {
            var data = Json(db.BACustomerRegistrations.Where(x => x.Customer_Status == true).Select(x => new
            {
                CustomerId = x.CustomerID,
                Customer_Name = x.Customer_Name
            }
            ).ToList(), JsonRequestBehavior.AllowGet);
            return data;
        }

        public ActionResult PrintImportBLReport()
        {
            var ImportReport = orderBookingService.PrintImportReport().Select(c => new
            {
                c.OrderType,
                c.BL,
                c.ContainerNo,
                //c.Customer_Name,
                c.ContainerSize,
                c.ContainerWeight,
                c.Remarks,
                c.WagonNo,
                InvoiceAmount = c.InvoiceAmount.GetValueOrDefault(),


            }).ToList();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "ImportBl.rpt"));
            //rd.SetDataSource(ImportReport);
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            rd.PrintOptions.PaperOrientation = CrystalDecisions.Shared.PaperOrientation.Portrait;
            rd.PrintOptions.ApplyPageMargins(new CrystalDecisions.Shared.PageMargins(4, 4, 4, 4));
            rd.PrintOptions.PaperSize = CrystalDecisions.Shared.PaperSize.PaperA5;

            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "ImportBLReport.pdf");

               }


        }
}