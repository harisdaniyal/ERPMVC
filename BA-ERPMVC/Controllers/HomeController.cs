using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class HomeController : Controller
    {
        public ActionResult Dashboard()
        {
                return View();
            //if (Session["UserName"] != null)
            //{
                
            //}
            //else
            //{
            //    return RedirectToAction("/Account/Login");
            //}

        }

        
        public ActionResult getDepartment()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Customer.Select(x => new
                {
                    CustomerID = x.CustomerID,
                    CustomerName = x.CustomerName
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }
       

       
       
        public ActionResult GetLogisticChart()
        {
            LocalLogisticChart llc = new LocalLogisticChart();
            DateTime date = DateTime.Now;
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var mindate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                var maxdate = mindate.AddMonths(1).AddDays(-1);
                llc.Transportation = db.Logistics.Where(x => x.CreatedDate >= mindate && x.CreatedDate <= maxdate && x.OrderServiceId==1).Count();
                llc.LOLO = db.Logistics.Where(x => x.CreatedDate >= mindate && x.CreatedDate <= maxdate && x.OrderServiceId ==2).Count();

            }
            return Json(llc, JsonRequestBehavior.AllowGet);
        }
        
        
   
        public ActionResult GetQuantityDetail()
        {
            SideBarQuantity sbq = new SideBarQuantity();
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                sbq.UserQuantity = db.AspNetUsers.Count();
                sbq.DriverQuantity = db.Employees.Count();
                sbq.CustomerQuantity = db.stp_Customer.Count();
             
            }
            return Json(sbq, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult GetUserDetail()
        {
            dynamic usersInfo = null;
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                usersInfo = db.AspNetUsers.OrderByDescending(s => s.Id).Select(x => new { 
                    x.UserName
                }).ToList();
            }
            return Json(usersInfo);
        }
    }
}