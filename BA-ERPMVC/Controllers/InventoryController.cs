
using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using MasterLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class InventoryController : Controller
    {
        ERPMVCEntities _dbContext = null;
        PurchaseServices _purchaseServices = null;
        ApiResponse _apiResponse = null;

        public InventoryController()
        {

            _dbContext = new ERPMVCEntities();
            _purchaseServices = new PurchaseServices();
            _apiResponse = new ApiResponse();


        }
        // GET: Inventory
        public ActionResult Purchase()
        {
            return View();
        }


        [HttpPost]
        public JsonResult PurchaseNumber()
        {
            string JobNo = "";
            string code = "";
            Int64 maxValue = 0;

            JobNo = _purchaseServices.GetAllPurchase().OrderByDescending(x => x.PurchaseNo).Select(x => x.PurchaseNo).FirstOrDefault();
            if (JobNo != null || JobNo == "")
            {
                Int64 salesNumber = Convert.ToInt64(JobNo);
                maxValue = salesNumber;
                maxValue++;
            }
            else
            {
                maxValue = 1;

            }
            code = maxValue.ToString("000000");



            return Json(code);
        }




        [HttpPost]
        public JsonResult GetPartyById(int PartyId)
        {
            dynamic result = null;
            if (PartyId != 0)
            {
                result = _purchaseServices.GetAllParty().Where(x => x.PartyId == PartyId && x.isActive == true).Select(x => new { x.PartyId, x.PartyName, x.StateId, x.CityId, x.tbl_City.CityName, x.Address, x.Email, x.Phone, x.Receiveable, x.Payable, x.isActive }).FirstOrDefault();
            }
            else
            {
                result = _purchaseServices.GetAllParty().Where(x => x.isActive == true).Select(x => new { x.PartyId, x.PartyName, x.StateId, x.CityId, x.tbl_City.CityName, x.Phone, x.Address, x.Email, x.Payable, x.Receiveable, x.isActive }).ToList();

            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult ItemList()
        {
            CustomLogger.Debug("======= START ITEMLIST() ========");
            dynamic result = null;
            try
            {
                result = _purchaseServices.GetAllItem().Select(x => new { x.ItemId, x.ItemName, x.isActive, x.QtyLimit, x.ItemTypeId, x.tbl_ItemType.ItemTypeName, x.Unit }).Where(x => x.ItemTypeId == 1);
            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }
            return Json(result);

        }


        [HttpPost]
        public JsonResult GetPurchaseMaster()
        {
            var result = _purchaseServices.GetAllPurchase().Select(x => new { x.PurchaseId, x.BillNo, x.PurchaseNo, x.tbl_Party.PartyName, x.Date, x.CreditDay, x.CreatedBy, x.CreatedDate, x.DueDate });

            return Json(result);
        }


        [HttpPost]
        public JsonResult GetPurchaseDetailById(int PurchaseId)
        {
            var result = _purchaseServices.GetAllPurchaseDetail().Select(x => new { x.PurchaseId, x.PurchaseDetailId, x.Amount, x.Rate, x.Quantity, x.Remarks, x.tbl_Item.ItemName, x.UnitIn }).Where(x => x.PurchaseId == PurchaseId);

            return Json(result);
        }

        [HttpPost]
        public JsonResult AddPurchaseMasterDetail(PurchaseMasterViewModel purchaseMasterViewModel)
        {
            if (purchaseMasterViewModel.PurchaseId > 0)
            {
                _apiResponse.statusCode = _purchaseServices.UpdatePurchaseMaster(purchaseMasterViewModel);
                if (_apiResponse.statusCode == StatusCode.UPDATED_CODE)
                {
                    _apiResponse.message = StatusCode.UPDATED_DESCRIPTION;
                    _apiResponse.statusCode = _purchaseServices.UpdatePurchaseDetail(purchaseMasterViewModel.purchaseDetailViewModels);
                }
                else
                {
                    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                }
            }
            else
            {
                //   string UserID = User.Identity.GetUserId();
                int PurchaseId = _purchaseServices.AddPurchaseMaster(purchaseMasterViewModel);
                if
                    (PurchaseId > 0)
                {
                    for (int i = 0; i < purchaseMasterViewModel.purchaseDetailViewModels.Count; i++)
                    {
                        purchaseMasterViewModel.purchaseDetailViewModels[i].PurchaseId = PurchaseId;
                    }
                    _apiResponse.statusCode = _purchaseServices.AddPurchaseDetail(purchaseMasterViewModel.purchaseDetailViewModels);
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
    }
}