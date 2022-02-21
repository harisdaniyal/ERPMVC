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

    }

}