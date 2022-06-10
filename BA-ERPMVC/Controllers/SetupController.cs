using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.BusinessLayer.OrderBooking;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.ViewModels.ExportOrderBooking;
using BA_ERPMVC.ViewModels.OrderBooking;
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
    public class SetupController : Controller
    {
        ApiResponse _apiResponse = null;
        IItemUnitRepository _itemUnitRepository = null;
        ItemUnitService _itemUnitService = null;
        UserService _userService = null;
        OrderBookingService _orderBookingService = null;
        ERPMVCEntities _dbContext = null;
        public SetupController()
        {
            _dbContext = new ERPMVCEntities();
            _apiResponse = new ApiResponse();
            _itemUnitRepository = new ItemUnitRepository(_dbContext);
            _itemUnitService = new ItemUnitService();
            _userService = new UserService();
            _orderBookingService = new OrderBookingService();

        }


        // GET: Setup
        public ActionResult Oil()
        {
            return View();
        }

        public ActionResult OilInvoiceDetail()
        {
            return View();
        }


        public ActionResult ItemUnit()
        {
            return View();

        }

        //Setup Unit START



        [HttpPost]
        public JsonResult addUnitItems(ItemUnitViewModel itemUnitViewModel)
        {
            if (itemUnitViewModel.ID > 0)
            {
                //_apiResponse.statusCode = _itemUnitService.UpdateCategory(itemUnitViewModel);
                //if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
                //{
                //    _apiResponse.message = StatusCode.UPDATED_DESCRIPTION;
                //}
                //else
                //{
                //    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;
                //}
            }
            else
            {
                _apiResponse.statusCode = _itemUnitService.addItemUnit(itemUnitViewModel);
                if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
                {
                    _apiResponse.message = StatusCode.SUCCESS_DESCRIPTION;
                }
                else
                {
                    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                }

            }


            return Json(_apiResponse);
        }


        //Setup Unit END









        //Oil Invoice Details


        public ActionResult GetDeliveryNo()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Oil.Select(x => new
                {
                    OilID = x.OilID,
                    DNo = x.DeliveryNo
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }


        public ActionResult GetStpModel()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_PaymentMode.Select(x => new
                {
                    PMID = x.PaymentModeID,
                    PMode = x.PaymentMode
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }



        [HttpPost]
        public JsonResult getoilInvoicebyid(int id)
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var result = (from opo in db.stp_Oil.Where(a => a.OilID == id)
                              join VX in db.OilCompanies on opo.OilCompany equals VX.OCID
                              select new
                              {
                                  DNo = opo.Quantity,
                                  OTID = VX.OilCompany1,

                              }).ToList();
                return Json(result);
            }
        }





        public ActionResult AddOrEditeOilInvoice(stp_Oil obj, OilBalance oil)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.OilID != 0)
                    {
                        stp_Oil a = db.stp_Oil.First(i => i.OilID == obj.OilID);

                        a.OilTypeID = obj.OilTypeID;
                        a.OilCompany = obj.OilCompany;
                        a.Quantity = obj.Quantity;
                        a.Remarks = obj.Remarks;
                        a.CompanyID = obj.CompanyID;
                        a.DeliveryNo = obj.DeliveryNo;
                        a.ReceivedDate = obj.ReceivedDate;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        //    db.sp_InsertOilStock.Add(obj1);
                        db.stp_Oil.Add(obj);
                        // db.sp_InsertOilStock.AddOrEditeOilInvoice(oil);
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
        public ActionResult GetOilInvoiceGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var OILInvoice = (from opo in db.stp_Oil
                                      // join div in db.stp_OilMaster on opo.OilTypeID equals div.OMID
                                  join VX in db.OilCompanies on opo.OilCompany equals VX.OCID
                                  //join MX in db.stp_Company on opo.CompanyID equals MX.CompanyID 
                                  select new
                                  {
                                      oilID = opo.OilID,
                                      OIlRecD = opo.ReceivedDate,
                                      OilName = VX.OilCompany1,
                                      DeliverNo = opo.DeliveryNo,
                                      Quantity = opo.Quantity,
                                      INvoiceNo = opo.InvoiceNumber,
                                      InvoiceDate = opo.InvoiceDate,
                                      OilRate = opo.Rate,
                                      OilPaymentMode = opo.PaymentModeID,
                                      total = opo.TotalAmount,
                                      POREf = opo.PO_Ref_No,
                                      POAmount = opo.POAmount,
                                      Remake = opo.Remarks,


                                  }).ToList();
                return Json(new { OILInvoice });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }
















        //Oil Invoice Details End 






        // Oil Start


        public ActionResult GetOilType()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_OilMaster.Select(x => new
                {
                    OID = x.OMID,
                    OName = x.Oil_Name
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }


        public ActionResult GetCompany()
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


        public ActionResult GetCompanyOil()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.OilCompanies.Select(x => new
                {
                    CID = x.OCID,
                    OCOMP = x.OilCompany1
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult AddOrEditeOil(stp_Oil obj)
        {
            var done = 0;
            var responseText = "";
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.OilID != 0)
                    {
                        stp_Oil a = db.stp_Oil.First(i => i.OilID == obj.OilID);

                        a.OilTypeID = obj.OilTypeID;
                        a.OilCompany = obj.OilCompany;
                        a.Quantity = obj.Quantity;
                        a.Remarks = obj.Remarks;
                        a.CompanyID = obj.CompanyID;
                        a.DeliveryNo = obj.DeliveryNo;
                        a.ReceivedDate = obj.ReceivedDate;
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        db.stp_Oil.Add(obj);
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
        public JsonResult EditOil(int id)
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var oil = from opo in db.stp_Oil.Where(a => a.OilID == id)
                          join div in db.stp_OilMaster on opo.OilTypeID equals div.OMID
                          join VX in db.OilCompanies on opo.OilCompany equals VX.OCID
                          select new
                          {
                              //  ID = opo.ID,
                              OID = div.Oil_Name,
                              OTID = VX.OilCompany1,
                              QUANTITY = opo.Quantity,
                              REMARKS = opo.Remarks,
                              DeliveryNo = opo.DeliveryNo,
                              Rec = opo.ReceivedDate,
                          };
                return Json(new { result = oil.ToList() }, JsonRequestBehavior.AllowGet);
            }
        }





        [HttpPost]
        public ActionResult GetOilGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var OIL = (from opo in db.stp_Oil
                           join div in db.stp_OilMaster on opo.OilTypeID equals div.OMID
                           join VX in db.OilCompanies on opo.OilCompany equals VX.OCID
                           //join MX in db.stp_Company on opo.CompanyID equals MX.CompanyID 
                           select new
                           {
                               oilID = opo.OilID,
                               OID = div.Oil_Name,
                               OTID = VX.OilCompany1,
                               QUANTITY = opo.Quantity,
                               REMARKS = opo.Remarks,
                               DeliveryNo = opo.DeliveryNo,
                               Rec = opo.ReceivedDate,

                           }).ToList();
                return Json(new { OIL });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }


        // Oil End 


        // Setup UserList For Expense Invoice //

        [HttpGet]
        public ActionResult GetUsers()
        {
            var setupUser = _userService.GetUserAsync();
            return View(setupUser);
        }

        [HttpPost]
        public async Task<ActionResult>UserAsync(UserViewModel setupuserVM)
        {
            if (setupuserVM == null)
            {
                return Json(new { success = false, message = $"{nameof(setupuserVM)} should not be null or empty" });
            }

            if (_dbContext.tbl_User.Any(x => x.UserName == setupuserVM.UserName && x.CNIC == setupuserVM.CNIC) && setupuserVM.ID == 0)
            {
                return Json(new { success = false, message = $" This {setupuserVM.UserName} / {setupuserVM.CNIC} is already exists." });

            }

            try
            {
                if (setupuserVM.ID == 0)
                {
                    await _userService.SaveUserAsync(setupuserVM);

                    return Json(new { success = true, Id = setupuserVM.ID });
                }

                await _userService.UpdateUsertAsync(setupuserVM);

                return Json(new { success = true, Id = setupuserVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult> DeleteUser(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = $"{nameof(Id)} should be a valid id" });
            }

            try
            {
                if (_userService.DeleteUser(Id))
                {
                    return Json(new { success = true, message = $"Deleted Successfully." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });

            }
            return null;
        }
        // Setup TrainId For Import //

        [HttpGet]
        public ActionResult GetTrainId()
        {
            var setuptrainId = _orderBookingService.GetTrainIdAsync();
            return View(setuptrainId);
        }

        [HttpPost]
        public async Task<ActionResult>TrainIdAsync(SetupTrainIDViewModel setuptrainVM)
        {
            if (setuptrainVM == null)
            {
                return Json(new { success = false, message = $"{nameof(setuptrainVM)} should not be null or empty" });
            }

            if (_dbContext.tbl_TrainId.Any(x => x.TrainID == setuptrainVM.TrainID) && setuptrainVM.ID == 0)
            {
                return Json(new { success = false, message = $" This {setuptrainVM.TrainID}  is already exists." });

            }

            try
            {
                if (setuptrainVM.ID == 0)
                {
                    await _orderBookingService.SaveTrainIdAsync(setuptrainVM);

                    return Json(new { success = true, Id = setuptrainVM.ID });
                }

                await _orderBookingService.UpdateTrainIdAsync(setuptrainVM);

                return Json(new { success = true, Id = setuptrainVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult> DeleteTrainID(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = $"{nameof(Id)} should be a valid id" });
            }

            try
            {
                if (_orderBookingService.DeleteTrainId(Id))
                {
                    return Json(new { success = true, message = $"Deleted Successfully." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });

            }
            return null;
        }

        [HttpGet]
        public ActionResult GetExportTrainId()
        {
            var setupexptrainId = _orderBookingService.GetExportTrainIdAsync();
            return View(setupexptrainId);
        }

        [HttpPost]
        public async Task<ActionResult> ExportTrainIdAsync(SetupExportTrainViewModel setupexptrainVM)
        {
            if (setupexptrainVM == null)
            {
                return Json(new { success = false, message = $"{nameof(setupexptrainVM)} should not be null or empty" });
            }

            if (_dbContext.tbl_ExportTrain.Any(x => x.TrainID == setupexptrainVM.TrainID) && setupexptrainVM.ID == 0)
            {
                return Json(new { success = false, message = $" This {setupexptrainVM.TrainID}  is already exists." });

            }

            try
            {
                if (setupexptrainVM.ID == 0)
                {
                    await _orderBookingService.SaveExportTrainIdAsync(setupexptrainVM);

                    return Json(new { success = true, Id = setupexptrainVM.ID });
                }

                await _orderBookingService.UpdateExportTrainIdAsync(setupexptrainVM);

                return Json(new { success = true, Id = setupexptrainVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult> ExportDeleteTrainID(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = $"{nameof(Id)} should be a valid id" });
            }

            try
            {
                if (_orderBookingService.DeleteExportTrainId(Id))
                {
                    return Json(new { success = true, message = $"Deleted Successfully." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });

            }
            return null;
        }


    }
}