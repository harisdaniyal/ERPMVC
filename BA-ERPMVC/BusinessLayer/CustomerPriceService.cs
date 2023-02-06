using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;
using System.Web.Mvc;
using BA_ERPMVC.Extensions;
using System.Data.Entity;

namespace BA_ERPMVC.BusinessLayer
{
    public class CustomerPriceService
    {
        ERPMVCEntities _dbContext = null;
        ICustomerPriceRepository _customerPricerepository = null;
        ICustomerPriceFacilityMapping _customerfacilityMapping = null;
        ICustomerRepository _customerRepository = null;
        IstpFacilityRepository _IstpFacilityRepository = null;
        IContainerWeightRepositroy _containerWeightRepositroy = null;
        ApiResponse _apiResponse = null;
        ApplicationDbContext _applicationDbContext = null;
        ILadenEmptyRepository _ladenEmptyRepository = null;


        public CustomerPriceService()
        {
            _dbContext = new ERPMVCEntities();
            _customerPricerepository = new CustomerPriceRepository(_dbContext);
            _customerfacilityMapping = new CustomerPriceFacilityMapping(_dbContext);
            _customerRepository = new CustomerRepository(_dbContext);
            _IstpFacilityRepository = new stpFacilityRepository(_dbContext);
            _containerWeightRepositroy = new ContainerWeightRepository(_dbContext);
            _ladenEmptyRepository = new LadenEmptyRepository(_dbContext);
            _apiResponse = new ApiResponse();
            _applicationDbContext = new ApplicationDbContext();
        }

        //public IEnumerable<BAExpensesDropDown> GetAllType()
        //{
        //    IEnumerable<BAExpensesDropDown> list = _expenseTypeRepository.GetAll().Where(x => x.isActive == true).OrderBy(x => x.ExpenseNature).ToList();

        //    return list;
        //}


        public IEnumerable<tbl_Laden_Empty> GetLadenEmptyall()
        {
            IEnumerable<tbl_Laden_Empty> list = _ladenEmptyRepository.GetAll().ToList();

            return list;
        }



        public IEnumerable<BACustomerRegistration> GETCUSTOMERALL()
        {

            IEnumerable<BACustomerRegistration> list = _customerRepository.GetAll().Where(x => x.Customer_Status == true).ToList();

            return list;
        }

        public IEnumerable<stp_Facility> GetFacilitylist()
        {
            IEnumerable<stp_Facility> list = _IstpFacilityRepository.GetAll().ToList();

            return list;
        }


        public IEnumerable<tbl_ContainerWeightCategory> GetContainerWeightCatgory()
        {
            IEnumerable<tbl_ContainerWeightCategory> list = _containerWeightRepositroy.GetAll().ToList();

            return list;
        }



        public IEnumerable<BACustomerFacilityDetail> GetAllExpenseMapping()
        {
            IEnumerable<BACustomerFacilityDetail> list = _customerfacilityMapping.GetAll().ToList();

            return list;
        }

        public string DeleteItem(int itemId)
        {
            string statusCode = "11";
            BACustomerFacilityDetail obj = _customerfacilityMapping.Find(x => x.Customer_Facilityid == itemId).FirstOrDefault();
            obj.IsActive = false;

            _dbContext.BACustomerFacilityDetails.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            int isDeleted = _dbContext.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }


        public int AddCustPriceUpdate(CustomerPriceViewModel Tvm)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<CustomerPriceViewModel, BACustomerPrice>();
            });

            var CustPrice = Mapper.Map<CustomerPriceViewModel, BACustomerPrice>(Tvm);
            _customerPricerepository.Update(CustPrice);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            int Customerid = CustPrice.CustomerID;
            return Customerid;

        }


        public int AddCustPrice(CustomerPriceViewModel Tvm)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<CustomerPriceViewModel, BACustomerPrice>();
            });

            var CustPrice = Mapper.Map<CustomerPriceViewModel, BACustomerPrice>(Tvm);
            _customerPricerepository.Add(CustPrice);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            int Customerid = CustPrice.CustomerID;
            return Customerid;

        }



        public string AddFacility(int Facilityid, string price, string priceEmpty, string ContainerSize20P, string ContainerSize40P, string ContainerSize20PEmpty, string ContainerSize40PEmpty, string WeightmentCharges, string WeightmentCharges40, int Customerid)
        {
            string statusCode = "11";

            BACustomerFacilityDetail ofm = new BACustomerFacilityDetail();
            ofm.CustomerID = Customerid;
            ofm.FacilityID = Facilityid;
          //  ofm.ContainerWeightID = ContainerWeightid;
            
            if (price != "")
            {
                ofm.price = price;
            }
            else {

                ofm.price = "0";
                    
                }
          
           // ofm.priceEmpty = priceEmpty;
            if (priceEmpty != "")
            {
                ofm.priceEmpty = priceEmpty;
            }
            else {
                ofm.priceEmpty = "0";
            }
            //ofm.ContainerSize20P = ContainerSize20P;
            //ofm.ContainerSize40P = ContainerSize40P;
            // ofm.WeightmentCharges = WeightmentCharges;


            if (ContainerSize20P != "")
            {
                ofm.ContainerSize20P = ContainerSize20P;
            }
            else
            {
                ofm.ContainerSize20P = "0";
            }

            if (ContainerSize40P != "")
            {
                ofm.ContainerSize40P = ContainerSize40P;
            }
            else
            {
                ofm.ContainerSize40P = "0";
            }

            if (ContainerSize20PEmpty != "")
            {
                ofm.ContainerSize20PEmpty = ContainerSize20PEmpty;
            }
            else {

                ofm.ContainerSize20PEmpty = "0";
            }

            if (ContainerSize40PEmpty != "")
            {
                ofm.ContainerSize40PEmpty = ContainerSize40PEmpty;
            }else
            {
                ofm.ContainerSize40PEmpty = "0";
            }

            if (WeightmentCharges != "")
            {
                ofm.WeightmentCharges = WeightmentCharges;
            }
            else
            {
                ofm.WeightmentCharges = "0";
            }

            if (WeightmentCharges40 != "")
            {
                ofm.WeightmentCharges40 = WeightmentCharges40;
            }
            else {
                ofm.WeightmentCharges40 = "0";
            }
            ofm.IsActive = true;
            _customerfacilityMapping.Add(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }






        public string UpdateFacility(int Facilityid, string price, string priceEmpty, string ContainerSize20P, string ContainerSize40P, string ContainerSize20PEmpty, string ContainerSize40PEmpty, string WeightmentCharges, string WeightmentCharges40, int Customerid)
        {
            string statusCode = "11";

            BACustomerFacilityDetail ofm = new BACustomerFacilityDetail();
            ofm.CustomerID = Customerid;
            ofm.FacilityID = Facilityid;
            if (price != "")
            {
                ofm.price = price;
            }
            else
            {

                ofm.price = "0";

            }

            // ofm.priceEmpty = priceEmpty;
            if (priceEmpty != "")
            {
                ofm.priceEmpty = priceEmpty;
            }
            else
            {
                ofm.priceEmpty = "0";
            }
            //ofm.ContainerSize20P = ContainerSize20P;
            //ofm.ContainerSize40P = ContainerSize40P;
            // ofm.WeightmentCharges = WeightmentCharges;


            if (ContainerSize20P != "")
            {
                ofm.ContainerSize20P = ContainerSize20P;
            }
            else
            {
                ofm.ContainerSize20P = "0";
            }

            if (ContainerSize40P != "")
            {
                ofm.ContainerSize40P = ContainerSize40P;
            }
            else
            {
                ofm.ContainerSize40P = "0";
            }

            if (ContainerSize20PEmpty != "")
            {
                ofm.ContainerSize20PEmpty = ContainerSize20PEmpty;
            }
            else
            {

                ofm.ContainerSize20PEmpty = "0";
            }

            if (ContainerSize40PEmpty != "")
            {
                ofm.ContainerSize40PEmpty = ContainerSize40PEmpty;
            }
            else
            {
                ofm.ContainerSize40PEmpty = "0";
            }

            if (WeightmentCharges != "")
            {
                ofm.WeightmentCharges = WeightmentCharges;
            }
            else
            {
                ofm.WeightmentCharges = "0";
            }

            if (WeightmentCharges40 != "")
            {
                ofm.WeightmentCharges40 = WeightmentCharges40;
            }
            else
            {
                ofm.WeightmentCharges40 = "0";
            }

            _customerfacilityMapping.Update(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }




        public int AddCustomerPrice(CustomerPriceViewModel customerPriceViewModel, string UserId)
        {
            int CustomerID = 0;

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<CustomerPriceViewModel, BACustomerPrice>();
            });
            var order = Mapper.Map<CustomerPriceViewModel, BACustomerPrice>(customerPriceViewModel);

            if (UserId != null)
            {
                var User1 = _applicationDbContext.Users.Where(x => x.Id == UserId).FirstOrDefault();
                order.CreatedBy = User1.UserName;
            }
            order.CreatedDate = DateTime.Now;
            order.isActive = true;
            _customerPricerepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                CustomerID = order.ID;
            }
            return CustomerID;
        }






        public string AddCustomerFaciltyDetails(List<CustomerFacilityDetailsViewModel> customerFacilityDetailsViewModels)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<CustomerFacilityDetailsViewModel, BACustomerFacilityDetail>();
            });
            var order = Mapper.Map<List<CustomerFacilityDetailsViewModel>, List<BACustomerFacilityDetail>>(customerFacilityDetailsViewModels);
            for (int i = 0; i < order.Count; i++)
            {
                order[i].IsActive = true;
            }
            _customerfacilityMapping.AddRange(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }











    }
}