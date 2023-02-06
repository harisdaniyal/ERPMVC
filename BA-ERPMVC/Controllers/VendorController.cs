using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CoreRepo = BA_ERPMVC.Repositories.CoreRepositories;
using IRepo = BA_ERPMVC.Repositories.IRepositories;
using ViewModel = BA_ERPMVC.ViewModels;
using BA_ERPMVC.Models;
using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class VendorController : Controller
    {
        // GET: Vendor
        PartyService _partyService = null;
        public ActionResult Index()
        {
                return View();
            //if (Session["UserName"] != null)
            //{

            //}
            //else
            //{
            //    return Redirect("/Account/Login");
            //}
        }


        public VendorController()
        {
            _partyService = new PartyService();
        }

        [HttpGet]
        public JsonResult GetAllVendors()
        {
            var records = _partyService.GetAllVendors().ToList();

            return Json(records, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetVendors(int typeId)
        {
            var records = _partyService.GetVendors(typeId).ToList();

            return Json(records, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult GetVendorByID(int VendorID)
        {
            return Json(_partyService.GetVendorByID(VendorID), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddVendor(ViewModel.VendorListViewModel addedvendor)
        {
            try
            {
                var _addedvendor = _partyService.AddVendor(addedvendor);

                return Json(new { Status = "1", Message = "Vendor has been added successfully.", Data = _addedvendor }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Status = "0", Message = ex.Message, Data = "" }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult UpdateVendor(ViewModel.VendorListViewModel updatedvendor)
        {
            try
            {
                var _updatedvendor = _partyService.UpdateVendor(updatedvendor);

                return Json(new { Status = "1", Message = "Vendor has been updated successfully.", Data = _updatedvendor }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Status = "0", Message = ex.Message, Data = "" }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeleteVendor(int VendorID)
        {
            try
            {
                var _deletedvendor = _partyService.DeleteVendor(VendorID);

                return Json(new { Status = "1", Message = "Vendor has been deleted successfully.", Data = _deletedvendor }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Status = "0", Message = ex.Message, Data = "" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}