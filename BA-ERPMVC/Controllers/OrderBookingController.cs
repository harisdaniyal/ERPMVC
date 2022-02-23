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

namespace BA_ERPMVC.Controllers
{
    public class OrderBookingController : Controller
    {
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
            this.ViewBag.ShippingAgents =  orderBookingService.GetShippingAgent();

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

            this.ViewBag.Locations = await locationService.GetLocationsAsync();
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
                logistics.Status = OrdersStatus.ReadyForDispatched.ToString();
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
                await orderBookingService.DeleteLogisticsAsync(logisticsId);
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

    }
}