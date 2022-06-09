using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Filter;
//using InfiSolMVC.Models;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using MasterLayer;
using Microsoft.AspNet.Identity;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class CustomerController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        ApiResponse _apiResponse = new ApiResponse();
        CustomerPriceService _customerPriceService = null;

        public CustomerController()
        {
            _customerPriceService = new CustomerPriceService();
        }

        // GET: Customer
        public ActionResult CustomerRegistration()
        {
            return View();
        }



        // Customer Priceing START
        public ActionResult CustomerPrice()
        {
            return View();
        }



        [HttpPost]
        public JsonResult GetCustomerName()
        {
            CustomLogger.Debug("======= START CUSTOMERNAMELIST() ========");
            dynamic result = null;
            try
            {
                result = _customerPriceService.GETCUSTOMERALL().Select(x => new { x.CustomerID, x.Customer_Name, x.Customer_Status });//.Where(x => x.ItemTypeId == 1);
            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }
            return Json(result);

        }



        [HttpPost]
        public JsonResult GetFacilityList()
        {
            CustomLogger.Debug("======= START Facility() ========");
            dynamic result = null;
            try
            {
                result = _customerPriceService.GetFacilitylist().Select(x => new { x.facilityID, x.FacilityName, x.isActive });//.Where(x => x.ItemTypeId == 1);
            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }
            return Json(result);

        }



        [HttpPost]
        public JsonResult GetContainerWeightCategory()
        {
            CustomLogger.Debug("======= START Facility() ========");
            dynamic result = null;
            try
            {
                result = _customerPriceService.GetContainerWeightCatgory().Select(x => new { x.ID, x.ContainerWeight });//.Where(x => x.ItemTypeId == 1);
            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }
            return Json(result);

        }




        [HttpPost]
        public JsonResult AddCustomerPrice(CustomerPriceViewModel customerPriceViewModel)
        {
            if (customerPriceViewModel.ID > 0)
            {
                //_apiResponse.statusCode = _purchaseService.UpdatePurchaseMaster(purchaseMasterViewModel);
                //if (_apiResponse.statusCode == StatusCode.UPDATED_CODE)
                //{
                //    _apiResponse.message = StatusCode.UPDATED_DESCRIPTION;
                //    _apiResponse.statusCode = _purchaseService.UpdatePurchaseDetail(purchaseMasterViewModel.purchaseDetailViewModels);
                //}
                //else
                //{
                //    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                //}
            }
            else
            {
                string UserID = User.Identity.GetUserId();
                int CustomerID = _customerPriceService.AddCustomerPrice(customerPriceViewModel, UserID);
                if (CustomerID > 0)
                {
                    for (int i = 0; i < customerPriceViewModel.customerFacilityDetailsViewModels.Count; i++)
                    {
                        customerPriceViewModel.customerFacilityDetailsViewModels[i].CustomerID = CustomerID;
                    }
                    _apiResponse.statusCode = _customerPriceService.AddCustomerFaciltyDetails(customerPriceViewModel.customerFacilityDetailsViewModels);
                    _apiResponse.message = StatusCode.SUCCESS_DESCRIPTION;
                    //AccountLedgerViewModel accountLedgerViewModel = new AccountLedgerViewModel();
                    //accountLedgerViewModel.PurchaseId = PurchaseId;
                    //accountLedgerViewModel.VoucherNo = "PR " + purchaseMasterViewModel.PurchaseNo;
                    //accountLedgerViewModel.Date = purchaseMasterViewModel.Date;
                    //accountLedgerViewModel.Credit = purchaseMasterViewModel.TotalAmount;
                    //accountLedgerViewModel.PartyId = purchaseMasterViewModel.PartyId;
                    //_accountLedgerService.AddAccountLedger(accountLedgerViewModel);
                }
                else
                {
                    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                }

            }


            return Json(_apiResponse);
        }


        //Customer Priceing END












        // Customer Registration Start


        public ActionResult GetCustoemrID()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.BACustomerRegistrations.Select(x => new
                {
                    CID = x.CustomerID,
                    CNAme = x.Customer_Name
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetFacilityID()
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

        public ActionResult GetBusinessDivision()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_BusinessDivision.Select(x => new
                {
                    BusinessDivisionID = x.BusinessDivisionID,
                    BusinessDivisionName = x.BusinessDivisionName
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetCustomerType()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.BACustomertypes.Select(x => new
                {
                    CustomerID = x.ID,
                    CustomerType = x.CustomerType
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult EditCustomer(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Customer = from opo in db.BACustomerRegistrations.Where(a => a.CustomerID == id)
                               join div in db.stp_BusinessDivision on opo.BusinessDivisionID equals div.BusinessDivisionID
                               join ty in db.BACustomertypes on opo.Customer_type equals ty.ID
                               select new
                               {
                                   CID = opo.CustomerID,
                                   CBusinessDivision = opo.BusinessDivisionID,
                                   COrder = opo.CustomerCode,
                                   CName = opo.Customer_Name,
                                   CAddress = opo.Customer_Address,
                                   CEmail = opo.Customer_Eamil,
                                   CType = opo.Customer_type,
                                   CPhoneNo = opo.Customer_Phone_Number,
                                   CCountry = opo.Customer_Country,
                                   CCity = opo.Customer_City,
                                   CStatus = opo.Customer_Status

                               };


                return Json(new { result = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }

        [HttpPost]
        public JsonResult CustomerOrderNo()
        {
            string Orderno = "";
            string code = "";
            Int64 maxValue = 0;
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                Orderno = db.BACustomerRegistrations.OrderByDescending(x => x.CustomerCode).Select(x => x.CustomerCode).FirstOrDefault();
                if (Orderno != null || Orderno == "")
                {
                    Int64 ordernumber = Convert.ToInt64(Orderno);
                    maxValue = ordernumber;
                    maxValue++;
                }
                else
                {
                    maxValue = 1;

                }
                code = maxValue.ToString("000000");

            }

            return Json(code);
        }
        
        public ActionResult AddorEditCustomer(BACustomerRegistration obj)
        {
            var done = 0;
            var responseText = "";
            _apiResponse.statusCode = "11";
            BACustomerRegistration isExistOrderNo = db.BACustomerRegistrations.Where(i => i.CustomerCode == obj.CustomerCode).FirstOrDefault();
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.CustomerID != 0)
                    {


                        BACustomerRegistration a = db.BACustomerRegistrations.First(i => i.CustomerID == obj.CustomerID);

                        a.Customer_Name = obj.Customer_Name;
                        a.Customer_Address = obj.Customer_Address;
                        a.Customer_Eamil = obj.Customer_Eamil;
                        a.Customer_type = obj.Customer_type;
                        a.Customer_Phone_Number = obj.Customer_Phone_Number;
                        a.Customer_Country = obj.Customer_Country;
                        a.Customer_City = obj.Customer_City;
                        a.BusinessDivisionID = obj.BusinessDivisionID;
                        a.Customer_Status = obj.Customer_Status;


                        a.UpdateDate = obj.UpdateDate = DateTime.Now.ToString();
                        a.UpdateBy = obj.UpdateBy = Session["UserName"].ToString();
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        if (isExistOrderNo == null)
                        {
                            if (obj.Customer_Name != null && obj.BusinessDivisionID != null)
                            {
                                BACustomerRegistration isExistCustomeName = db.BACustomerRegistrations.Where(i => i.Customer_Name == obj.Customer_Name && i.BusinessDivisionID == obj.BusinessDivisionID).FirstOrDefault();
                                if (isExistCustomeName != null)
                                {
                                
                                    responseText = "BL/CRO no already exist.";
                                }
                                else
                                {
                                  //  _apiResponse.statusCode = "00";
                                    obj.CreateDate = DateTime.Now.ToString();
                                    obj.UserID = Session["UserName"].ToString();
                                    db.BACustomerRegistrations.Add(obj);
                                    done = db.SaveChanges();
                                    responseText = "Data Inserted Successfully.";
    
                                }
                            }
                            else
                            {
                                obj.CreateDate = DateTime.Now.ToString();
                                obj.UserID = Session["UserName"].ToString();
                                db.BACustomerRegistrations.Add(obj);
                                done = db.SaveChanges();
                                responseText = "Data Inserted Successfully.";

                            }
                        }
                        else {

                            _apiResponse.message = "Order No already exist";
                        }

                          
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

        // Customer Registration End









    }
}