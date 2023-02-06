using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{
    public class PurchaseServices
    {

        ERPMVCEntities _dbContext = null;
        ApplicationDbContext _applicationDbContext = null;
        IPurchaseMasterRepository _purchaseMasterRepository = null;
        IPurchaseDetailRepository _purchaseDetailRepository = null;
        IPartyRepository _partyRepository = null;
        IItemRepository _itemRepository = null;

        public PurchaseServices()
        {
            _dbContext = new ERPMVCEntities();
            _applicationDbContext = new ApplicationDbContext();
            _purchaseMasterRepository = new PurchaseMasterRepository(_dbContext);
            _purchaseDetailRepository = new PurchaseDetailRepository(_dbContext);
            _partyRepository = new PartyRepository(_dbContext);
            _itemRepository = new ItemRepository(_dbContext);

        }

        public IEnumerable<tbl_Item> GetAllItem()
        {
            IEnumerable<tbl_Item> list = _itemRepository.GetAll().Where(x => x.isActive == true).ToList();
            return list;
        }


        public IEnumerable<tbl_Party> GetAllParty()
        {

            IEnumerable<tbl_Party> list = _partyRepository.GetAll().Where(x => x.isActive == true).ToList();

            return list;
        }
        public IEnumerable<PurchaseMaster> GetAllPurchase()
        {
            IEnumerable<PurchaseMaster> list = _purchaseMasterRepository.GetAll().Where(x => x.isActive == true).ToList();
            return list;
        }

        public IEnumerable<PurchaseDetail> GetAllPurchaseDetail()
        {
            IEnumerable<PurchaseDetail> list = _purchaseDetailRepository.GetAll().Where(x => x.isActive == true).ToList();
            return list;
        }


        public int AddPurchaseMaster(PurchaseMasterViewModel purchaseMasterViewModel)
        {
            int PurchaseID = 0;

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<PurchaseMasterViewModel, PurchaseMaster>();
            });
            var order = Mapper.Map<PurchaseMasterViewModel, PurchaseMaster>(purchaseMasterViewModel);

            //if (UserId != null)
            //{
            //    var User1 = _applicationDbContext.Users.Where(x => x.Id == UserId).FirstOrDefault();
            //    order.CreatedBy = User1.UserName;
            //}
            order.CreatedDate = DateTime.Now;
            order.isActive = true;
            _purchaseMasterRepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                PurchaseID = order.PurchaseId;
            }
            return PurchaseID;
        }

        public string AddPurchaseDetail(List<PurchaseDetailViewModel> purchaseDetailViewModel)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<PurchaseDetailViewModel, PurchaseDetail>();
            });
            var order = Mapper.Map<List<PurchaseDetailViewModel>, List<PurchaseDetail>>(purchaseDetailViewModel);
            for (int i = 0; i < order.Count; i++)
            {
                order[i].isActive = true;
            }
            _purchaseDetailRepository.AddRange(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }

        public string AddSinglePurchaseDetail(PurchaseDetailViewModel purchaseDetailViewModel)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<PurchaseDetailViewModel, PurchaseDetail>();
            });
            var order = Mapper.Map<PurchaseDetailViewModel, PurchaseDetail>(purchaseDetailViewModel);
            order.isActive = true;
            _purchaseDetailRepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }

        public string UpdatePurchaseDetail(List<PurchaseDetailViewModel> purchaseDetailViewModel)
        {
            string statusCode = "11";
            foreach (var item in purchaseDetailViewModel)
            {
                if (item.PurchaseDetailId > 0)
                {
                    var purchaseDetail = _purchaseDetailRepository.Find(x => x.PurchaseDetailId == item.PurchaseDetailId).FirstOrDefault();

                    if (purchaseDetail != null)
                    {
                        purchaseDetail.UnitIn = item.UnitIn;
                        purchaseDetail.Amount = item.Amount;
                        purchaseDetail.ItemId = item.ItemId;
                        purchaseDetail.Quantity = item.Quantity;
                        purchaseDetail.Rate = item.Rate;
                        purchaseDetail.Remarks = item.Remarks;
                        purchaseDetail.PurchaseId = item.PurchaseId;
                    }

                    _purchaseDetailRepository.Update(purchaseDetail);
                }
                else
                {
                    AddSinglePurchaseDetail(item);
                }
            }

            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "000";
            }
            return statusCode;
        }

        public string UpdatePurchaseMaster(PurchaseMasterViewModel purchaseMasterViewModel)
        {
            string statusCode = "11";
            var purchaseDetail = _purchaseMasterRepository.Find(x => x.PurchaseId == purchaseMasterViewModel.PurchaseId).FirstOrDefault();

            if (purchaseDetail != null)
            {
                purchaseDetail.PartyId = purchaseMasterViewModel.PartyId;
                purchaseDetail.PurchaseNo = purchaseMasterViewModel.PurchaseNo;
                purchaseDetail.DueDate = purchaseMasterViewModel.DueDate;
                purchaseDetail.Date = purchaseMasterViewModel.Date;
                purchaseDetail.CreditDay = purchaseMasterViewModel.CreditDay;
                purchaseDetail.BillNo = purchaseMasterViewModel.BillNo;

            }

            _purchaseMasterRepository.Update(purchaseDetail);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "000";
            }
            return statusCode;
        }
        public string DeletePurchaseDetail(int PurchaseDetailId)
        {
            string statusCode = "11";
            PurchaseDetail obj = _purchaseDetailRepository.Find(x => x.PurchaseDetailId == PurchaseDetailId).FirstOrDefault();
            obj.isActive = false;
            _dbContext.PurchaseDetails.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            int isDeleted = _dbContext.SaveChanges();
            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }

        public string DeletePurchaseMaster(int PurchaseId)
        {
            string statusCode = "11";
            PurchaseMaster obj = _purchaseMasterRepository.Find(x => x.PurchaseId == PurchaseId).FirstOrDefault();
            obj.isActive = false;

            _dbContext.PurchaseMasters.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            int isDeleted = _dbContext.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }

        public string UpdateSinglePurchaseDetail(PurchaseDetailViewModel purchaseDetailViewModel)
        {
            string statusCode = "11";

            var purchaseDetail = _purchaseDetailRepository.Find(x => x.PurchaseDetailId == purchaseDetailViewModel.PurchaseDetailId).FirstOrDefault();


            if (purchaseDetail != null)
            {
                purchaseDetail.Amount = purchaseDetailViewModel.Amount;
                purchaseDetail.ItemId = purchaseDetailViewModel.ItemId;
                purchaseDetail.Remarks = purchaseDetailViewModel.Remarks;
                purchaseDetail.Quantity = purchaseDetailViewModel.Quantity;
                purchaseDetail.Rate = purchaseDetailViewModel.Rate;
                purchaseDetail.PurchaseId = purchaseDetailViewModel.PurchaseId;
            }

            _purchaseDetailRepository.Update(purchaseDetail);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "000";
            }
            return statusCode;
        }
    }
}