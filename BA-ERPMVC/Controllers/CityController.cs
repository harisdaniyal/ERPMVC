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
    public class CityController : Controller
    {
        CityService _cityservice = null;
        // GET: City
        public ActionResult Index()
        {
            return View();
        }

        public CityController()
        {
            _cityservice = new CityService();
        }


        [HttpPost]
        public JsonResult EditCity(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Invoice = from opo in db.stp_City.Where(a => a.CityID == id)
                               join div in db.stp_Country on opo.CountryID equals div.CountryID
                               select new
                               {
                                   ID = opo.CityID,
                                   Citycode = opo.CityCode,
                                   CCityName = opo.CityName,
                                   CCityPhoneCode = opo.CityPhoneCode,
                                   CCountryName = div.CountryID,
                                   CStatus = opo.Status,

                               };


                return Json(new { result = Invoice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }



        public ActionResult GetCountry()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Country.Select(x => new
                {
                    CID = x.CountryID,
                    CName = x.CountryName
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }




        public ActionResult AddOrEditeCity(stp_City obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.CityID != 0)
                    {
                        stp_City a = db.stp_City.First(i => i.CityID == obj.CityID);

                        a.CityCode = obj.CityCode;
                        a.CityName = obj.CityName;
                        a.CityPhoneCode = obj.CityPhoneCode;
                        a.CountryID = obj.CountryID;

                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        db.stp_City.Add(obj);
                        done = db.SaveChanges();
                        responseText = "Data Inserted Successfully.";

                    }
                    if (done == 1)
                    {

                        return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
                    }
                    return Json(new { success = false, responseText = "Data Not Inserted Successfully." }, JsonRequestBehavior.AllowGet);


                }
                catch (Exception E)
                {

                    return Json(new { success = false, responseText = E }, JsonRequestBehavior.AllowGet);
                }
            }

        }




        [HttpPost]
        public ActionResult GetCityGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var City = (from opo in db.stp_City
                                join VV in db.stp_Country on opo.CountryID equals VV.CountryID
                                select new
                                {
                                    ID = opo.CityID,
                                    Citycode = opo.CityCode,
                                    CCityName = opo.CityName,
                                    CCityPhoneCode = opo.CityPhoneCode,
                                    CCountryName = VV.CountryName,
                                    CStatus = opo.Status,

                                }).ToList();

                return Json(new { City });
            }

        }


        [HttpPost]
        public JsonResult GetCityByState(int id)
        {
            
                return Json(_cityservice.GetCityByStateID(id).Select(x => new
                {
                    CityID = x.CityId,
                    CityName = x.CityName
                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }


    }
}