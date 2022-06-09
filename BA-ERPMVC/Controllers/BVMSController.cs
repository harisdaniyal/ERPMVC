using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class BVMSController : Controller
    {
        // GET: BVMS
        public ActionResult VehicleRegistration()
        {
            return View();
        }

        public ActionResult VehicleMaintenance()
        {
            return View();
        }



        [HttpPost]
        public JsonResult EditVechial(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Vechial = from opo in db.VehicleRegistrationDetails.Where(a => a.VehicleID == id)
                             //  join div in db.stp_BusinessDivision on opo.BusinessDivisionID equals div.BusinessDivisionID
                              // join ty in db.BACustomertypes on opo.Customer_type equals ty.ID
                               select new
                               {
                                   VID = opo.VehicleID,
                                   VNUMBER = opo.Vehicle_Number,
                                   VTYPE = opo.VehicleTypeID,
                                   VENGINE = opo.VehicleEngineNo,
                                   VCHASSIS = opo.VehicleChassisNO,
                                   VNAME = opo.VehicleName,
                                   VSTATUS = opo.IsActive

                               };


                return Json(new { result = Vechial.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }









        public ActionResult AddorEditVehicle(VehicleRegistrationDetail obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.VehicleID != 0)
                    {
                        
                        VehicleRegistrationDetail a = db.VehicleRegistrationDetails.First(i => i.VehicleID == obj.VehicleID);
                        
                        a.VehicleTypeID = obj.VehicleTypeID;
                        a.Vehicle_Number = obj.Vehicle_Number;
                        a.VehicleEngineNo = obj.VehicleEngineNo;
                        a.VehicleChassisNO = obj.VehicleChassisNO;
                        a.VehicleName = obj.VehicleName;
                        a.IsActive = obj.IsActive;
                        a.UpdateDate = obj.UpdateDate = DateTime.Now;
                        a.UpdateBy = obj.UpdateBy = Session["UserName"].ToString();
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.CreatedBy = Session["UserName"].ToString();
                        obj.CreateDate = DateTime.Now;
                        obj.UserID = Session["UserName"].ToString();
                        db.VehicleRegistrationDetails.Add(obj);
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








    }
}