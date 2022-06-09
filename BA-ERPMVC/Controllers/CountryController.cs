using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class CountryController : Controller
    {
        // GET: Country
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult EditCountry(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Invoice = from opo in db.stp_Country.Where(a => a.CountryID == id)
                             // join div in db.stp_Country on opo.CountryID equals div.CountryID
                              select new
                              {
                                  ID = opo.CountryID,
                                  Countrycode = opo.CountryCode,
                                  CCountryName = opo.CountryName,
                                  CCountryPhoneCode = opo.CountryPhoneCode,
                                  CStatus = opo.Status,

                              };


                return Json(new { result = Invoice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }




        public ActionResult AddOrEditeCountry(stp_Country obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.CountryID != 0)
                    {
                        stp_Country a = db.stp_Country.First(i => i.CountryID == obj.CountryID);

                        a.CountryCode = obj.CountryCode;
                        a.CountryName = obj.CountryName;
                        a.CountryPhoneCode = obj.CountryPhoneCode;
                        a.Status = obj.Status;

                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        db.stp_Country.Add(obj);
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
        public ActionResult GetCountryGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Country = (from opo in db.stp_Country
                            //join VV in db.stp_Country on opo.CountryID equals VV.CountryID
                            select new
                            {
                                ID = opo.CountryID,
                                CCountryCode = opo.CountryCode,
                                CCountryName = opo.CountryName,
                                CCountryPhoneCode = opo.CountryPhoneCode,
                                CStatus = opo.Status,

                            }).ToList();

                return Json(new { Country });
            }

        }










    }
}