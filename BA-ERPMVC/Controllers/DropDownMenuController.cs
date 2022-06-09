using AutoMapper;
using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.BusinessLayer.OrderBooking;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using MasterLayer;
//using InfiSolMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class DropDownMenuController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        private readonly ShippingService shippingService;
        private readonly ContainerTypeService containerTypeService;
        private readonly OrderBookingService orderBookingService; 

        public DropDownMenuController()
        {
            shippingService = new ShippingService();
            containerTypeService = new ContainerTypeService();
            orderBookingService = new OrderBookingService();
        }
        // GET: DropDownMenu
        public ActionResult Expenses()
        {
            return View();
        }

        public ActionResult Location()
        {
            return View();
        }

        public ActionResult EmptyDropOffLoc()
        {
            return View();
        }

        public ActionResult ShippingAgent()
        {
            CustomLogger.Info("Get ShippingAgent started");
            var shippingagent = shippingService.GetShippingAgentAsync();
            CustomLogger.Info("Get ShippingAgent Ended");
            return View(shippingagent);
        }

        public ActionResult ShippingLine()
        {
            var shippingline = shippingService.GetShippingLineAsync();
            return View(shippingline);
        }

        public async  Task<ActionResult> BLShippingContainer()
        {
            var blshippingcontainer = shippingService.GetBLShippingContainerAsync();
            this.ViewBag.ContainerTypes = await containerTypeService.GetAllContainerTypesAsync();
            this.ViewBag.ContainerSizes = await orderBookingService.GetContainerSizesAsync();
            return View(blshippingcontainer);
        }

        [HttpPost]
        public async Task<ActionResult> ShippingAgent(ShippingAgentViewModel shippingagentVM)
        {
            if (shippingagentVM == null)
            {
                return Json(new { success = false, message = $"{nameof(shippingagentVM)} should not be null or empty" });
            }

            try
            {
                if (shippingagentVM.ShippingAgentId == 0)
                {
                    await shippingService.SaveShippingAgentAsync(shippingagentVM);

                    return Json(new { success = true, Id = shippingagentVM.ShippingAgentId });
                }

                await shippingService.UpdateShippingAgentAsync(shippingagentVM);

                return Json(new { success = true, Id = shippingagentVM.ShippingAgentId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

                     ///////********** BLShipping Container**********//////////
                     
        [HttpPost]
        public async Task<ActionResult> BLShippingContainer(BLShippingContainerViewModel blshippingcontainerVM)
        {
            if (blshippingcontainerVM == null)
            {
                return Json(new { success = false, message = $"{nameof(blshippingcontainerVM)} should not be null or empty" });
            }

            if (db.BLShippingContainers.Any(x=> x.ContainerNo == blshippingcontainerVM.ContainerNo) && blshippingcontainerVM.ID == 0)
            {
                return Json(new { success = false, message = $" This {blshippingcontainerVM.ContainerNo} Container No is already exists." });

            }

            try
            {
                if (blshippingcontainerVM.ID == 0)
                {
                    await shippingService.SaveBLShippingContainerAsync(blshippingcontainerVM);

                    return Json(new { success = true, Id = blshippingcontainerVM.ID});
                }

                await shippingService.UpdateBLShippingContainerAsync(blshippingcontainerVM);

                return Json(new { success = true, Id = blshippingcontainerVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }



        [HttpPost]
        public async Task<ActionResult> ShippingLine(ShippingLineViewModel shippinglineVM)
        {
            if (shippinglineVM == null)
            {
                return Json(new { success = false, message = $"{nameof(shippinglineVM)} should not be null or empty" });
            }

            try
            {
                if (shippinglineVM.ShippingLineId == 0)
                {
                    await shippingService.SaveShippingLineAsync(shippinglineVM);

                    return Json(new { success = true, Id = shippinglineVM.ShippingLineId });
                }

                await shippingService.UpdateShippingLineAsync(shippinglineVM);

                return Json(new { success = true, Id = shippinglineVM.ShippingLineId });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


        public ActionResult Facility()
        {
            return View();
        }

        // Facility Menu Start

        public ActionResult AddOrEditeFacilityDropDown(stp_Facility obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.facilityID != 0)
                    {
                        stp_Facility a = db.stp_Facility.First(i => i.facilityID == obj.facilityID);

                        a.FacilityName = obj.FacilityName;
                        a.isActive = obj.isActive;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.CreatedBy = Session["UserName"].ToString();
                        obj.CreatedDate = DateTime.Now;
                        db.stp_Facility.Add(obj);
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
        public JsonResult EditFacilityDrop(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var FacDrop = from opo in db.stp_Facility.Where(a => a.facilityID == id)
                              select new
                              {
                                  //  ID = opo.ID,
                                  FNAME = opo.FacilityName,
                                  FActive = opo.isActive,
                              };


                return Json(new { result = FacDrop.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        [HttpPost]
        public ActionResult GetFacilityDropGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var FacDrop = (from opo in db.stp_Facility
                               select new
                               {
                                   ID = opo.facilityID,
                                   FNAME = opo.FacilityName,
                                   FActive = opo.isActive,

                               }).ToList();

                return Json(new { FacDrop });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        // Facility Menu End




        // Location Menu Start



        public ActionResult GetCustomerName()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Company.Select(x => new
                {
                    CID = x.CompanyID,
                    CName = x.CompanyName
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }


        public ActionResult AddOrEditeLocationDropDown(Location obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.ID != 0)
                    {
                        var a = db.Locations.First(i => i.ID == obj.ID);

                        a.LocationName = obj.LocationName;
                        a.CompanyID = obj.CompanyID;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.CreatedBy = Session["UserName"].ToString();
                        obj.CreatedDate = DateTime.Now;
                        db.Locations.Add(obj);
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
        public JsonResult EditLocationDrop(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var LocationDrop = from opo in db.Locations.Where(a => a.ID == id)
                                       //join div in db.stp_Company on opo.CompanyID equals div.CompanyID
                                   select new
                                   {
                                       //  ID = opo.ID,
                                       //  ID = opo.ID,
                                       FromLoc = opo.LocationName,
                                       CompanyID = opo.CompanyID,
                                   };


                return Json(new { result = LocationDrop.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        [HttpPost]
        public ActionResult GetLocationDropGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var LocDrop = (from opo in db.Locations
                                   //join div in db.stp_Company on opo.CompanyID equals div.CompanyID
                               select new
                               {
                                   ID = opo.ID,
                                   FromLoc = opo.LocationName,
                                   // CompanyID = div.CompanyName,
                               }).ToList();

                return Json(new { LocDrop });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }
        ///********* Empty DropOff Location setup******////


        public ActionResult AddOrEditEmptyDropOffLocation(EmptyDropOffLoc obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.ID != 0)
                    {
                        var a = db.EmptyDropOffLocs.First(i => i.ID == obj.ID);

                        a.LocationName = obj.LocationName;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.CreatedBy = Session["UserName"].ToString();
                        obj.CreatedDate = DateTime.Now;
                        db.EmptyDropOffLocs.Add(obj);
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









        // Location Menu End 










        // Expense Menu Start


        public ActionResult AddOrEditeExpensesDropDown(BAExpensesDropDown obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.id != 0)
                    {
                        BAExpensesDropDown a = db.BAExpensesDropDowns.First(i => i.id == obj.id);

                        a.ExpenseName = obj.ExpenseName;
                        a.ExpensePrice = obj.ExpensePrice;
                        a.IsActive = obj.IsActive;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        db.BAExpensesDropDowns.Add(obj);
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
        public ActionResult GetEmptyDropOffLoc()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var LocDrop = (from opo in db.EmptyDropOffLocs
                                   //join div in db.stp_Company on opo.CompanyID equals div.CompanyID
                               select new
                               {
                                   ID = opo.ID,
                                   FromLoc = opo.LocationName,
                                   // CompanyID = div.CompanyName,
                               }).ToList();

                return Json(new { LocDrop });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult EditEmptyDropOffLoc(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var LocationDrop = from opo in db.EmptyDropOffLocs.Where(a => a.ID == id)
                                       //join div in db.stp_Company on opo.CompanyID equals div.CompanyID
                                   select new
                                   {
                                       //  ID = opo.ID,
                                       //  ID = opo.ID,
                                       FromLoc = opo.LocationName,
                                       CompanyID = opo.CompanyID,
                                   };


                return Json(new { result = LocationDrop.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }


        [HttpPost]
        public JsonResult EditExpneseDrop(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var ExpenseDrop = from opo in db.BAExpensesDropDowns.Where(a => a.id == id)
                                  select new
                                  {
                                      //  ID = opo.ID,
                                      Expense = opo.ExpenseName,
                                      price = opo.ExpensePrice,
                                  };


                return Json(new { result = ExpenseDrop.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        [HttpPost]
        public ActionResult GetExpenseDropGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var ExpenseDrop = (from opo in db.BAExpensesDropDowns
                                   select new
                                   {
                                       ID = opo.id,
                                       Expense = opo.ExpenseName,
                                       price = opo.ExpensePrice,


                                   }).ToList();

                return Json(new { ExpenseDrop });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }


        // Expense Menu End 



    }
}