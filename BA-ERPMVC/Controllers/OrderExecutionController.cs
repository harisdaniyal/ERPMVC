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
using BA_ERPMVC.ViewModels.ExportOrderBooking;
using System.Data;
using System.IO;
using ClosedXML.Excel;
using Hangfire;
using System.Web.Hosting;
using MasterLayer;
using System.Configuration;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class OrderExecutionController : Controller
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private readonly OrderBookingService orderBookingService;

        public OrderExecutionController()
        {
            orderBookingService = new OrderBookingService();
        }

        [HttpGet]
        public ActionResult ReadyForDispatched()
        {
            var readyForDispatchedModel = orderBookingService.GetReadyForDispatchedAsync();

            return View(readyForDispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> ReadyForDispatched(ReadyForDispatchedViewModel readyForDispatchedVM)
        {
            if (readyForDispatchedVM == null)
            {
                return Json(new { success = false, message = $"{nameof(readyForDispatchedVM)} should not be null or empty" });
            }

            try
            {
                if (readyForDispatchedVM.ID == 0)
                {
                    await orderBookingService.SaveReadyForDispatchedAsync(readyForDispatchedVM);

                    return Json(new { success = true, Id = readyForDispatchedVM.ID });
                }

                await orderBookingService.UpdateReadyForDispatchedAsync(readyForDispatchedVM);

                return Json(new { success = true, Id = readyForDispatchedVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult PreDispatched()
        {
            var PreDispatchedModel = orderBookingService.GetPreDispatchedMovementAsync();

            return View(PreDispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> PreDispatched(PreDispatchedMovementViewModel preDispatchedMovementVM)
        {
            if (preDispatchedMovementVM == null)
            {
                return Json(new { success = false, message = $"{nameof(preDispatchedMovementVM)} should not be null or empty" });
            }

            try
            {
                if (preDispatchedMovementVM.ID == 0)
                {
                    await orderBookingService.SavePreDispatchedMovementAsync(preDispatchedMovementVM);

                    return Json(new { success = true, Id = preDispatchedMovementVM.ID });
                }

                await orderBookingService.UpdatePreDispatchedMovementAsync(preDispatchedMovementVM);

                return Json(new { success = true, Id = preDispatchedMovementVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult Dispatched()
        {
            this.ViewBag.Stations = orderBookingService.GetStationList();
            this.ViewBag.TrainId = orderBookingService.GetTrainID();
            var DispatchedModel = orderBookingService.GetDispatchedOrderAsync();

            return View(DispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> Dispatched(DispatchedOrderViewModel dispatchedOrderVM)
        {
            if (dispatchedOrderVM == null)
            {
                return Json(new { success = false, message = $"{nameof(dispatchedOrderVM)} should not be null or empty" });
            }

            try
            {
                if (dispatchedOrderVM.ID == 0)
                {
                    await orderBookingService.SaveDispatchedOrderAsync(dispatchedOrderVM);

                    return Json(new { success = true, Id = dispatchedOrderVM.ID });
                }

                await orderBookingService.UpdateDispatchedOrderAsync(dispatchedOrderVM);

                return Json(new { success = true, Id = dispatchedOrderVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult ReDispatched(int stationID = 0)
        {
            this.ViewBag.Stations = orderBookingService.GetStationList();
            var reDispatchedModel = orderBookingService.GetReDispatchedAsync(stationID);

            return View(reDispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> ReDispatched(ReDispatchedViewModel reDispatchedVM)
        {
            if (reDispatchedVM == null)
            {
                return Json(new { success = false, message = $"{nameof(reDispatchedVM)} should not be null or empty" });
            }

            try
            {
                if (reDispatchedVM.ID == 0)
                {
                    await orderBookingService.SaveReDispatchedAsync(reDispatchedVM);

                    return Json(new { success = true, Id = reDispatchedVM.ID });
                }

                await orderBookingService.UpdateReDispatchedAsync(reDispatchedVM);

                return Json(new { success = true, Id = reDispatchedVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult InTransactTrain(int stationID = 0)
        {
            this.ViewBag.Stations = orderBookingService.GetStationList();
            var InTransactModel = orderBookingService.GetInTransactTrainAsync(stationID);

            return View(InTransactModel);
        }

        [HttpPost]
        public async Task<ActionResult> InTransactTrain(InTransactTrainViewModel intransacttrainVM)
        {
            if (intransacttrainVM == null)
            {
                return Json(new { success = false, message = $"{nameof(intransacttrainVM)} should not be null or empty" });
            }

            try
            {
                if (intransacttrainVM.ID == 0)
                {
                    await orderBookingService.SaveIntransactTrainAsync(intransacttrainVM);

                    return Json(new { success = true, Id = intransacttrainVM.ID });
                }

                await orderBookingService.UpdateIntransactTrainAsync(intransacttrainVM);

                return Json(new { success = true, Id = intransacttrainVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult DeliveryTrain()
        {
            var DeliveryModel = orderBookingService.GetDeliveryTrainAsync();

            return View(DeliveryModel);
        }

        [HttpPost]
        public async Task<ActionResult> DeliveryTrain(DeliveryTrainViewModel deliverytrainVM)
        {
            if (deliverytrainVM == null)
            {
                return Json(new { success = false, message = $"{nameof(deliverytrainVM)} should not be null or empty" });
            }

            try
            {
                if (deliverytrainVM.ID == 0)
                {
                    await orderBookingService.SaveDeliveryTrainAsync(deliverytrainVM);

                    return Json(new { success = true, Id = deliverytrainVM.ID });
                }

                await orderBookingService.UpdateDeliveryTrainAsync(deliverytrainVM);

                return Json(new { success = true, Id = deliverytrainVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult EmptyDropOff(int PortAndTerminalId = 0)
        {
            this.ViewBag.PortAndTerminals = orderBookingService.GetTerminalList();
            var EmptyDropOffModel = orderBookingService.GetEmptyDropOffAsync(PortAndTerminalId);

            return View(EmptyDropOffModel);
        }

        [HttpPost]
        public async Task<ActionResult> EmptyDropOff(EmptyDropOffViewModel emptydropoffVM)
        {
            if (emptydropoffVM == null)
            {
                return Json(new { success = false, message = $"{nameof(emptydropoffVM)} should not be null or empty" });
            }

            try
            {
                if (emptydropoffVM.ID == 0)
                {
                    await orderBookingService.SaveEmptyDropOffAsync(emptydropoffVM);

                    return Json(new { success = true, Id = emptydropoffVM.ID });
                }

                await orderBookingService.UpdateEmptyDropOffAsync(emptydropoffVM);

                return Json(new { success = true, Id = emptydropoffVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult DispatchedTruck()
        {
            var DispatchedtruckModel = orderBookingService.GetDispatchedTruckAsync();

            return View(DispatchedtruckModel);
        }

        [HttpPost]
        public async Task<ActionResult> DispatchedTruck(DispatchedTruckViewModel dispatchedtruckVM)
        {
            if (dispatchedtruckVM == null)
            {
                return Json(new { success = false, message = $"{nameof(dispatchedtruckVM)} should not be null or empty" });
            }

            try
            {
                if (dispatchedtruckVM.ID == 0)
                {
                    await orderBookingService.SaveDispatchedTruckAsync(dispatchedtruckVM);

                    return Json(new { success = true, Id = dispatchedtruckVM.ID });
                }

                await orderBookingService.UpdateDispatchedTruckAsync(dispatchedtruckVM);

                return Json(new { success = true, Id = dispatchedtruckVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult DeliveryTruck()
        {
            var DeliveryTruckModel = orderBookingService.GetDeliveryTruckAsync();

            return View(DeliveryTruckModel);
        }

        [HttpPost]
        public async Task<ActionResult> DeliveryTruck(DeliveryTruckViewModel deliverytruckVM)
        {
            if (deliverytruckVM == null)
            {
                return Json(new { success = false, message = $"{nameof(deliverytruckVM)} should not be null or empty" });
            }

            try
            {
                if (deliverytruckVM.ID == 0)
                {
                    await orderBookingService.SaveDeliveryTruckAsync(deliverytruckVM);

                    return Json(new { success = true, Id = deliverytruckVM.ID });
                }

                await orderBookingService.UpdateDeliveryTrucknAsync(deliverytruckVM);

                return Json(new { success = true, Id = deliverytruckVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult TrainReport()
        {
            var TrainReport = orderBookingService.TrainOrderReport();

            return View(TrainReport);
        }

        [HttpGet]
        public ActionResult ExportTrainReport()
        {
            var ExportTrainReport = orderBookingService.ExportTrainOrderReport();

            return View(ExportTrainReport);
        }

        [HttpGet]
        public ActionResult ImportOrderReport()
        {
            var ImportOrderReport = orderBookingService.ImportBookingReportTrain();

            return View(ImportOrderReport);
        }

        [HttpGet]
        public string AutomaticReportsOnEmail()
        {
            CustomLogger.Info("AutomaticReportsOnEmail started");
            const string jobRegisteredMessage = "Hangfire Scheduler! Background jobs are registered successfully.";
            string cronExpression = ConfigurationManager.AppSettings["CronExpressionForEmailService"];
            RecurringJob.AddOrUpdate(() => ExportExcel(), cronExpression);
            return jobRegisteredMessage;
        }

        [AutomaticRetry(Attempts = 1, LogEvents = true, OnAttemptsExceeded = AttemptsExceededAction.Fail)]
        public ActionResult ExportExcel()
        {
            var ImportOrderReport = orderBookingService.ImportBookingReportTrain();
            DataTable dt = new DataTable("Grid");
            dt.Columns.AddRange(new DataColumn[38] { new DataColumn("BL"),
                                            new DataColumn("BLDate"),
                                            new DataColumn("BookingPOCName"),
                                            new DataColumn("Comodities"),
                                            new DataColumn("ContainerNo"),
                                            new DataColumn("ContainerSize"),
                                            new DataColumn("ContainerType"),
                                            new DataColumn("ContainerTypeName"),
                                            new DataColumn("ContainerWeight"),
                                            new DataColumn("CustomerName"),
                                            new DataColumn("DOGuarantee"),
                                            new DataColumn("EmptyReturnDate"),
                                            new DataColumn("EmptyReturnLocation"),
                                            new DataColumn("FortyContainerPrice"),
                                            new DataColumn("FortyContainerQty"),
                                            new DataColumn("TwentyContainerPrice"),
                                            new DataColumn("TwentyContainerQty"),
                                            new DataColumn("FreeDays"),
                                            new DataColumn("FromLocation"),
                                            new DataColumn("GD"),
                                            new DataColumn("ImportEIR"),
                                            new DataColumn("InvoiceAmount"),
                                            new DataColumn("JobType"),
                                            new DataColumn("ModeOfTransportation"),
                                            new DataColumn("OrderDate"),
                                            new DataColumn("OrderId"),
                                            new DataColumn("OrderNo"),
                                            new DataColumn("OrderType"),
                                            new DataColumn("OutSidePortWeighment"),
                                            new DataColumn("PortWeighment"),
                                            new DataColumn("PreDispatched"),
                                            new DataColumn("Remarks"),
                                            new DataColumn("ShippingAgentName"),
                                            new DataColumn("ShippingLineName"),
                                            new DataColumn("ShippingLineId"),
                                            new DataColumn("ShippingAgentId"),
                                            new DataColumn("ToLocation"),
                                            new DataColumn("VesselBerthingDate"),

            });

            foreach (var order in ImportOrderReport)
            {
                dt.Rows.Add(order.BL,
                        order.BLDate,
                        order.BookingPOCName,
                        order.Comodities,
                        order.ContainerNo,
                        order.ContainerSize,
                        order.ContainerType,
                        order.ContainerTypeName,
                        order.ContainerWeight,
                        order.CustomerName,
                        order.DOGuarantee,
                        order.EmptyReturnDate,
                        order.EmptyReturnLocation,
                        order.FortyContainerPrice,
                        order.FortyContainerQty,
                        order.TwentyContainerPrice,
                        order.TwentyContainerQty,
                        order.FreeDays,
                        order.FromLocation,
                        order.GD,
                        order.ImportEIR,
                        order.InvoiceAmount,
                        order.JobType,
                        order.ModeOfTransportation,
                        order.OrderDate,
                        order.OrderId,
                        order.OrderNo,
                        order.OrderType,
                        order.OutSidePortWeighment,
                        order.PortWeighment,
                        order.PreDispatched,
                        order.Remarks,
                        order.ShippingAgentName,
                        order.ShippingLineName,
                        order.ShippingLineId,
                        order.ShippingAgentId,
                        order.ToLocation,
                        order.VesselBerthingDate
                    );
            }

            using (XLWorkbook wb = new XLWorkbook())
            {

                string rootPath = AppDomain.CurrentDomain.BaseDirectory;
                string filePath = $"{rootPath}ExcelReports\\{DateTime.Now.ToString("ddMMyyyy_HHmmss")}_Report.xlsx";
                CustomLogger.Info(filePath);
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    //write to file
                    FileStream file = new FileStream(filePath, FileMode.Create, FileAccess.Write);
                    stream.WriteTo(file);
                    file.Close();
                    stream.Close();
                }
                UtilityClasses.UserDetail.email_send(filePath);
                return Json(new { success = true, path = filePath });
            }
        }


        [HttpGet]
        public ActionResult ImportOrderReportTruck()
        {
            var ImportOrderReporttruck = orderBookingService.ImportBookingReportTruck();

            return View(ImportOrderReporttruck);
        }

        ////********* Export PreDispatched**********/////////////

        [HttpGet]
        public ActionResult ExportPreDispatched()
        {
            var ExportPreDispatchedModel = orderBookingService.GetExportPreDispatchedAsync();

            return View(ExportPreDispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportPreDispatched(ExportPreDispatchedViewModel ExportpreDispatchedVM)
        {
            if (ExportpreDispatchedVM == null)
            {
                return Json(new { success = false, message = $"{nameof(ExportpreDispatchedVM)} should not be null or empty" });
            }

            try
            {
                if (ExportpreDispatchedVM.ID == 0)
                {
                    await orderBookingService.SaveExportPreDispatchedAsync(ExportpreDispatchedVM);

                    return Json(new { success = true, Id = ExportpreDispatchedVM.ID });
                }

                await orderBookingService.UpdateExportPreDispatchedAsync(ExportpreDispatchedVM);

                return Json(new { success = true, Id = ExportpreDispatchedVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
        ////////////********* Export DispatchedTrain**************////////////

        [HttpGet]
        public ActionResult ExportDispatchedTrain()
        {
            this.ViewBag.ExportTrainId = orderBookingService.GetExportTrainID();
            var exportDispatchedtrainModel = orderBookingService.GetExportDispatchedTrainAsync();

            return View(exportDispatchedtrainModel);
        }


        [HttpPost]
        public async Task<ActionResult> ExportDispatchedTrain(ExportDispatchedTrainViewModel ExportDispatchedTrainVM)
        {
            if (ExportDispatchedTrainVM == null)
            {
                return Json(new { success = false, message = $"{nameof(ExportDispatchedTrainVM)} should not be null or empty" });
            }

            try
            {
                if (ExportDispatchedTrainVM.ID == 0)
                {
                    await orderBookingService.SaveExportDispatchedTrainAsync(ExportDispatchedTrainVM);

                    return Json(new { success = true, Id = ExportDispatchedTrainVM.ID });
                }

                await orderBookingService.UpdateExportDispatchedTrainAsync(ExportDispatchedTrainVM);

                return Json(new { success = true, Id = ExportDispatchedTrainVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        /////********* Export Dispatched Truck*********/////

        [HttpGet]
        public ActionResult ExportDispatchedTruck()
        {

            var exportDispatchedtruckModel = orderBookingService.GetExportDispatchedTruckAsync();

            return View(exportDispatchedtruckModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportDispatchedTruck(ExportDispatchedTruckViewModel ExportDispatchedTruckVM)
        {
            if (ExportDispatchedTruckVM == null)
            {
                return Json(new { success = false, message = $"{nameof(ExportDispatchedTruckVM)} should not be null or empty" });
            }

            try
            {
                if (ExportDispatchedTruckVM.ID == 0)
                {
                    await orderBookingService.SaveExportDispatchedTruckAsync(ExportDispatchedTruckVM);

                    return Json(new { success = true, Id = ExportDispatchedTruckVM.ID });
                }

                await orderBookingService.UpdateExportDispatchedTruckAsync(ExportDispatchedTruckVM);

                return Json(new { success = true, Id = ExportDispatchedTruckVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        /////********* Export ReDispatched *********/////

        [HttpGet]
        public ActionResult ExportReDispatched()
        {

            var exportReDispatchedModel = orderBookingService.GetExportReDispatchedAsync();

            return View(exportReDispatchedModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportReDispatched(ExportReDispatchedViewModel ExportReDispatchedVM)
        {
            if (ExportReDispatchedVM == null)
            {
                return Json(new { success = false, message = $"{nameof(ExportReDispatchedVM)} should not be null or empty" });
            }

            try
            {
                if (ExportReDispatchedVM.ID == 0)
                {
                    await orderBookingService.SaveExportReDispatchedAsync(ExportReDispatchedVM);

                    return Json(new { success = true, Id = ExportReDispatchedVM.ID });
                }

                await orderBookingService.UpdateExportReDispatchedAsync(ExportReDispatchedVM);

                return Json(new { success = true, Id = ExportReDispatchedVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        /////********* Export Delivery *********/////

        [HttpGet]
        public ActionResult ExportDelivery()
        {

            var exportDeliveryModel = orderBookingService.GetExportDeliveryAsync();

            return View(exportDeliveryModel);
        }

        [HttpPost]
        public async Task<ActionResult> ExportDelivery(ExportDeliveryViewModel ExportDeliveryVM)
        {
            if (ExportDeliveryVM == null)
            {
                return Json(new { success = false, message = $"{nameof(ExportDeliveryVM)} should not be null or empty" });
            }

            try
            {
                if (ExportDeliveryVM.ID == 0)
                {
                    await orderBookingService.SaveExportDeliveryAsync(ExportDeliveryVM);

                    return Json(new { success = true, Id = ExportDeliveryVM.ID });
                }

                await orderBookingService.UpdateExportDeliveryAsync(ExportDeliveryVM);

                return Json(new { success = true, Id = ExportDeliveryVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

    }

}