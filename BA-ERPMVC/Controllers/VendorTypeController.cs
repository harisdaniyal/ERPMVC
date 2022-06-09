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
    public class VendorTypeController : Controller
    {
        private readonly VendorTypeService _vendorTypeService;
        public VendorTypeController()
        {
            _vendorTypeService = new VendorTypeService();
        }
        // GET: VendorType
        public ActionResult Index()
        {
            return View();
        }
        
        [HttpGet]
        public JsonResult GetAllVendorTypes()
        {
            return Json(_vendorTypeService.GetAllVendorTypes().Select(x => new
            {
                Id = x.VendorTypeID,
                Name = x.VendorTypeName
            }).ToList(), JsonRequestBehavior.AllowGet);
        }
    }
}