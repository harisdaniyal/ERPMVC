using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class StateController : Controller
    {
        // GET: State
        StateService _stateservice = null;

        public ActionResult Index()
        {
            return View();
        }

        public StateController()
        {
            _stateservice = new StateService();
        }

        [HttpGet]
        public JsonResult GetStates()
        {
            
                return Json(_stateservice.GetAllStates().Select(x => new
                {
                    StateID = x.StateId,
                    StateName = x.StateName
                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
    }
}