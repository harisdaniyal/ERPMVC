using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Extensions;
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
    public class CustomerPriceController : Controller
    {
 

        ERPMVCEntities db = null;
        CustomerPriceService ts = null;
        ApiResponse _apiResponse = null;

        public CustomerPriceController()
        {
            db = new ERPMVCEntities();
            ts = new CustomerPriceService();
            _apiResponse = new ApiResponse();
        }

        // GET: CustomerPrice
        public ActionResult Customer()
        {
            return View();
        }

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




        //start
        [HttpPost]
        public JsonResult GetCustPriceGrideRecnt(int id, int ids2)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var CustPrice = from opo in db.BACustomerFacilityDetailsHistoryMappings
                                join div in db.stp_Facility on opo.FacilityID equals div.facilityID
                                join ty in db.BACustomerRegistrations on opo.CustomerID equals ty.CustomerID
                                where opo.CustomerID == id  && opo.FacilityID == ids2 
                                select new
                                {

                                    CID = opo.Customer_Facilityid,
                                    CCustomer = ty.CustomerID,
                                    FID = div.facilityID,
                                    FPrice = opo.price,
                                    FPriceEmpty = opo.priceEmpty,
                                    container1 = opo.ContainerSize20P,
                                    container2 = opo.ContainerSize40P,
                                    container3 = opo.ContainerSize20PEmpty,
                                    container4 = opo.ContainerSize40PEmpty,
                                    FWeightmentCharges20 = opo.WeightmentCharges,
                                    FWeightmentCharges40 = opo.WeightmentCharges40,
                                    UpdateDate = opo.UpdateDate,
                                    updateby = opo.UpdateBy,

                                };


                return Json(new { result = CustPrice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        //start
        [HttpPost]
        public JsonResult GetCustPriceGrideRecntLolo(int id, int ids2)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var CustPrice = from opo in db.BACustomerFacilityDetailsHistoryMappings
                                join div in db.stp_Facility on opo.FacilityID equals div.facilityID
                                join ty in db.BACustomerRegistrations on opo.CustomerID equals ty.CustomerID
                                where opo.CustomerID == id && opo.FacilityID == ids2
                                select new
                                {

                                    CID = opo.Customer_Facilityid,
                                    CCustomer = ty.CustomerID,
                                    FID = div.facilityID,
                                    FPrice = opo.price,
                                    FPriceEmpty = opo.priceEmpty,
                                    container1 = opo.ContainerSize20P,
                                    container2 = opo.ContainerSize40P,
                                    container3 = opo.ContainerSize20PEmpty,
                                    container4 = opo.ContainerSize40PEmpty,
                                    FWeightmentCharges20 = opo.WeightmentCharges,
                                    FWeightmentCharges40 = opo.WeightmentCharges40,
                                    UpdateDate = opo.UpdateDate,
                                    updateby = opo.UpdateBy,

                                };


                return Json(new { result = CustPrice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }







        public ActionResult GetFacilitylist()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Facility.Select(x => new
                {
                    FID = x.facilityID,
                    FName = x.FacilityName
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetCustomerNo()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.BACustomerRegistrations.Select(x => new
                {
                    CID = x.CustomerID,
                    CName = x.Customer_Name
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }



        //


        [HttpPost]
        public JsonResult EditeCustPrice(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var CustPrice = from opo in db.BACustomerFacilityDetails.Where(a => a.Customer_Facilityid == id)
                            
                               join div in db.stp_Facility on opo.FacilityID equals div.facilityID
                               join ty in db.BACustomerRegistrations on opo.CustomerID equals ty.CustomerID
                               select new
                               {
                                   CID  = opo.Customer_Facilityid,
                                   CCustomer = ty.CustomerID,
                                   FID = div.facilityID,
                                   FPrice = opo.price,
                                   FPriceEmpty = opo.priceEmpty,
                                   FContainerLaden20 = opo.ContainerSize20P,
                                   FContainerLaden40 = opo.ContainerSize40P,
                                   FContainerEmpty20 = opo.ContainerSize20PEmpty,
                                   FContainerEmpty40 = opo.ContainerSize40PEmpty,
                                   FWeightmentCharges20 = opo.WeightmentCharges,
                                   FWeightmentCharges40 = opo.WeightmentCharges40,

                               };


                return Json(new { result = CustPrice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }

        //




        [HttpPost]
        public JsonResult GetExpenseListById(int CustId)
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var result = (from opo in db.BACustomerFacilityDetails.Where(a => a.CustomerID == CustId)
                              join VX in db.stp_Facility on opo.FacilityID equals VX.facilityID
                              select new
                              {
                                  custID = opo.CustomerID,
                                  faciltyid = VX.facilityID,
                                  facilityPrice = opo.price,
                                  facilityName = VX.FacilityName

                              }).ToList();
                return Json(result);
            }
        }


        //[HttpPost]
        //public JsonResult GetExpenseListById(int CustId)
        //{
        //    var result = ts.GetAllExpenseMapping().Where(x => x.CustomerID == CustId).Select(x => 
        //    new {
        //        x.CustomerID,
        //        x.FacilityID,
        //     //   x.tbl_ExpensesDropDown.FacilityName
        //    });
        //    return Json(result);
        //}



        //update start

        public JsonResult UpdateCustomerPrice(BACustomerPrice tvm)
        {
            //int Customerid = 0;
            //tvm.CreatedBy = Session["UserName"].ToString();
            //tvm.CreateDate = DateTime.Today.Date;
            //Customerid = ts.AddCustPrice(tvm);

            var responseText = "";
            var done = 0;
            try
            {
                BACustomerPrice a = db.BACustomerPrices.First(i => i.ID == tvm.ID);

                a.CustomerID = tvm.CustomerID;
                a.UpdatedBy = Session["UserName"].ToString();
                a.CreatedDate = tvm.CreatedDate;
                done = db.SaveChanges();
                responseText = "Data Updated Successfully.";

                return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception E)
            {

                return Json(new { success = false, E }, JsonRequestBehavior.AllowGet);
            }

        }




        public JsonResult UpdateCustomerPriceFacilty(BACustomerFacilityDetail tvm)
        {
            //int Customerid = 0;
            //tvm.CreatedBy = Session["UserName"].ToString();
            //tvm.CreateDate = DateTime.Today.Date;
            //Customerid = ts.AddCustPrice(tvm);

            var responseText = "";
            var done = 0;
            try
            {
                BACustomerFacilityDetail a = db.BACustomerFacilityDetails.First(i => i.Customer_Facilityid == tvm.Customer_Facilityid);

                
                a.price = tvm.price;
                a.priceEmpty = tvm.priceEmpty;
                a.FacilityID = tvm.FacilityID;
              //  a.CustomerID = tvm.CustomerID;
                a.ContainerSize20P = tvm.ContainerSize20P;
                a.ContainerSize40P = tvm.ContainerSize40P;
                a.ContainerSize20PEmpty = tvm.ContainerSize20PEmpty;
                a.ContainerSize40PEmpty = tvm.ContainerSize40PEmpty;
                a.WeightmentCharges = tvm.WeightmentCharges;
                a.WeightmentCharges40 = tvm.WeightmentCharges40;
                a.IsActive = true;
               // a. = Session["UserName"].ToString();
                //a.CreatedDate = tvm.CreateDate;
                done = db.SaveChanges();
                responseText = "Data Updated Successfully.";

                return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception E)
            {

                return Json(new { success = false, E }, JsonRequestBehavior.AllowGet);
            }

        }




        //test


        public ActionResult addHistoryCustomerPrice(BACustomerFacilityDetailsHistoryMapping obj)
        {
            var done = 0;
            var responseText = "";

            try
            {
            
                    obj.UpdateDate = DateTime.Now;
                    obj.UpdateBy = Session["Username"].ToString();

                    db.BACustomerFacilityDetailsHistoryMappings.Add(obj);
                    done = db.SaveChanges();
                    responseText = "Data Inserted Successfully.";
               

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








        //update end 




   



        //New Update Query END FACILITY


        [HttpPost]
        public JsonResult AddCustomerPrice(CustomerPriceViewModel tvm)
        {

            int Customerid = 0;
            tvm.CreatedBy = Session["UserName"].ToString();
            tvm.CreateDate = DateTime.Today.Date;
            Customerid = ts.AddCustPrice(tvm);

            return Json(Customerid);
        }



        public JsonResult AddCustomerPriceFaciltyName(int FacilityID, string price, string priceEmpty, string ContainerSize20P, string ContainerSize40P, string ContainerSize20PEmpty, string ContainerSize40PEmpty, string WeightmentCharges, string WeightmentCharges40, int Customerid)
        {
            string statusCode = "11";
            statusCode = ts.AddFacility(FacilityID, price, priceEmpty, ContainerSize20P, ContainerSize40P, ContainerSize20PEmpty, ContainerSize40PEmpty, WeightmentCharges, WeightmentCharges40, Customerid);
            BACustomerPrice b = db.BACustomerPrices.First(a => a.CustomerID == Customerid);
            BACustomerRegistration lg = db.BACustomerRegistrations.First(a => a.CustomerID == b.CustomerID);
            db.SaveChanges();

            return Json(statusCode);
        }









        //start pending
        //[HttpPost]
        //public JsonResult AddCustomerPrice(CustomerPriceViewModel tvm)
        //{

        //    int Customerid = 0;
        //    tvm.CreatedBy = Session["UserName"].ToString();
        //    tvm.CreateDate = DateTime.Today.Date;
        //    Customerid = ts.AddCustPrice(tvm);

        //    return Json(Customerid);
        //}



        //public JsonResult AddCustomerPriceFaciltyName(int FacilityID, string price, string priceEmpty, string ContainerSize20P, string ContainerSize40P, string ContainerSize20PEmpty, string ContainerSize40PEmpty, string WeightmentCharges, string WeightmentCharges40, int Customerid)
        //{
        //    string statusCode = "11";
        //    statusCode = ts.AddFacility(FacilityID, price, priceEmpty, ContainerSize20P, ContainerSize40P, ContainerSize20PEmpty, ContainerSize40PEmpty, WeightmentCharges, WeightmentCharges40, Customerid);
        //    BACustomerPrice b = db.BACustomerPrices.First(a => a.CustomerID == Customerid);
        //    BACustomerRegistration lg = db.BACustomerRegistrations.First(a => a.CustomerID == b.CustomerID);
        //    db.SaveChanges();

        //    return Json(statusCode);
        //}
        //End pending





        //public JsonResult AddCustomerPriceFacilty(int[] FacilityID, int[] price, int[] priceEmpty , string[] ContainerSize20P, string[] ContainerSize40P, string[] ContainerSize20PEmpty, string[] ContainerSize40PEmpty, string[] WeightmentCharges, string[] WeightmentCharges40, int customerid)
        //{
        //    string statusCode = "11";
        //    int prc = 0;
        //    for (int i = 0; i < FacilityID.Length; i++)
        //    {
        //        prc = prc + price[i];
        //        statusCode = ts.AddFacility(FacilityID[i], price[i], priceEmpty[i], ContainerSize20P[i], ContainerSize40P[i], ContainerSize20PEmpty[i], ContainerSize40PEmpty[i] , WeightmentCharges[i], WeightmentCharges40[i], customerid);
        //    }


        //    BACustomerPrice b = db.BACustomerPrices.First(a => a.CustomerID == customerid);

        //    b.TotalFacility = prc;
        //   // BACustomerRegistration lg = db.BACustomerRegistrations.First(a => a.CustomerID == b.CustomerID && a.CustomerCode == b.CUstomer);
        //    BACustomerRegistration lg = db.BACustomerRegistrations.First(a => a.CustomerID == b.CustomerID);
        //  //  lg.IsActive = 0;
        //    db.SaveChanges();



        //    return Json(statusCode);
        //}


        [HttpPost]
        public JsonResult GetCustPriceGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  

            var CustPrice = (from opo in db.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                             join CN in db.BACustomerRegistrations on opo.CustomerID equals CN.CustomerID into table1
                             from Cust in table1.ToList()
                             join XS in db.stp_Facility on opo.FacilityID equals XS.facilityID into table2
                             from DS in table2.ToList()
                             select new
                             {
                                 // id = opo.Customer_Facilityid,
                                 id = opo.Customer_Facilityid + "&ids=" + opo.CustomerID + "&ids2=" + opo.FacilityID,
                                 ids = opo.CustomerID,
                                 CustomerName = Cust.Customer_Name,
                                 faciltyName  = DS.FacilityName,
                                // total = opo.TotalFacility


                             }).ToList();



            return Json(new { CustPrice });


        }


        [HttpPost]
        public JsonResult DeleteItem(int itemId)
        {
            _apiResponse.statusCode = ts.DeleteItem(itemId);
            if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
            {
                _apiResponse.message = StatusCode.DELETE_DESCRIPTION;
            }
            else
            {
                _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

            }
            return Json(_apiResponse);
        }






        [HttpPost]
        public JsonResult CustomerPriceGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  

            var CustPrice = (from opo in db.BACustomerPrices
                        join CN in db.BACustomerRegistrations on opo.CustomerID equals CN.CustomerID into table1
                        from Cust in table1.ToList()
                        select new
                        {
                            id = opo.ID,
                            CustomerName = Cust.Customer_Name,
                            total = opo.TotalFacility


                        }).ToList();



            return Json(new { CustPrice });


        }





        [HttpPost]
        public JsonResult EditCustomerPrice(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var CPrice = from opo in db.BACustomerFacilityDetails.Where(a => a.Customer_Facilityid == id)
                               join div in db.BACustomerPrices on opo.CustomerID equals div.ID
                               select new
                               {
                                   CID = opo.CustomerID,
                                   FDetails = opo.price,
                                   FID = opo.FacilityID

                               };


                return Json(new { result = CPrice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }






    }
}