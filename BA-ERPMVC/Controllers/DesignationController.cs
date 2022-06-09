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
    public class DesignationController : Controller
    {
        // GET: Designation
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public JsonResult EditDesignation(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Invoice = from opo in db.Designations.Where(a => a.DesignationId == id)
                             // join div in db.stp_Country on opo.CountryID equals div.CountryID
                              select new
                              {
                                  ID = opo.DesignationId,
                                  DesignationName = opo.Designation_Name
                              };


                return Json(new { result = Invoice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }






        public ActionResult AddOrEditeDesignation(Designation obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.DesignationId != 0)
                    {
                        Designation a = db.Designations.First(i => i.DesignationId == obj.DesignationId);

                        a.Designation_Name = obj.Designation_Name;

                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        db.Designations.Add(obj);
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
        public ActionResult GetDesignationGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Desgnation = (from opo in db.Designations
                           // join VV in db.stp_Country on opo.CountryID equals VV.CountryID
                            select new
                            {
                                ID = opo.DesignationId,
                                Designationname = opo.Designation_Name,

                            }).ToList();

                return Json(new { Desgnation });
            }

        }





    }
}