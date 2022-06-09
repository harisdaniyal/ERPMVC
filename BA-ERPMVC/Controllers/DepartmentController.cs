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
    public class DepartmentController : Controller
    {
        // GET: Department
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public JsonResult EditDepartment(int id)
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var Department = from opo in db.Departments.Where(a => a.DeptId == id)
                              select new
                              {
                                  ID = opo.DeptId,
                                  DeptName = opo.Dept_Name
                              };
                return Json(new { result = Department.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }




        public ActionResult AddOrEditeDepartment(Department obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.DeptId != 0)
                    {
                        Department a = db.Departments.First(i => i.DeptId == obj.DeptId);

                        a.Dept_Name = obj.Dept_Name;

                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        db.Departments.Add(obj);
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
        public ActionResult GetDepartmentGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var Department = (from opo in db.Departments
                                   //join VV in db.stp_Country on opo.CountryID equals VV.CountryID
                               select new
                               {
                                   ID = opo.DeptId,
                                   DeptName = opo.Dept_Name
                               }).ToList();
                return Json(new { Department });
            }

        }








    }
}