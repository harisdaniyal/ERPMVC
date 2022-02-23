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

namespace BA_ERPMVC.Controllers
{
    public class OrderExecutionController : Controller
    {
        private readonly OrderBookingService orderBookingService;

        public OrderExecutionController()
        {
            orderBookingService = new OrderBookingService();
        }
        // GET: OrderExecution
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

        // GET: PreDispatched
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


        // GET: Dispatched
        [HttpGet]
        public ActionResult Dispatched()
        {
           this.ViewBag.Stations = orderBookingService.GetStationList();
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
        public ActionResult InTransactTrain()
        {
            this.ViewBag.Stations = orderBookingService.GetStationList();
            var InTransactModel = orderBookingService.GetInTransactTrainAsync();

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

        // GET : Delivery Train
        [HttpGet]
        public ActionResult DeliveryTrain()
        {
            var DeliveryModel = orderBookingService.GetInDeliveryTrainAsync();

            return View(DeliveryModel);
        }

    }

}