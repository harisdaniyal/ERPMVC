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
    public class BusinessDivisionController : Controller
    {
        // GET: BusinessDivision
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult AddOrEditeBusinessDivision(stp_BusinessDivision obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.BusinessDivisionID != 0)
                    {
                        stp_BusinessDivision a = db.stp_BusinessDivision.First(i => i.BusinessDivisionID == obj.BusinessDivisionID);

                        a.BusinessDivisionCode = obj.BusinessDivisionCode;
                        a.BusinessDivisionName = obj.BusinessDivisionName;
                        a.CompanyID = obj.CompanyID;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.CreatedBy = Session["UserName"].ToString();
                        obj.CreateDate = DateTime.Now;
                        db.stp_BusinessDivision.Add(obj);
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
        public JsonResult EditBusinessDivision(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Divison = from opo in db.stp_BusinessDivision.Where(a => a.BusinessDivisionID == id)
                              join VV in db.stp_Company on opo.CompanyID equals VV.CompanyID
                              select new
                              {
                                  //  ID = opo.ID,
                                  BCode = opo.BusinessDivisionCode,
                                  BName = opo.BusinessDivisionName,
                                  BCompany = VV.CompanyName,
                                  BActive = opo.Status,
                              };


                return Json(new { result = Divison.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        [HttpPost]
        public ActionResult GetBusinessDivisionGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Division = (from opo in db.stp_BusinessDivision
                               join VV in db.stp_Company on opo.CompanyID equals VV.CompanyID
                               select new
                               {
                                   ID = opo.BusinessDivisionID,
                                   BCode = opo.BusinessDivisionCode,
                                   BName = opo.BusinessDivisionName,
                                   BCompany = VV.CompanyName,
                                   BActive = opo.Status,

                               }).ToList();

                return Json(new { Division });
            }

        }










    }
}