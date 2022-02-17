using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;

namespace BA_ERPMVC.BusinessLayer
{
    public class OrderBookingServices
    {
        ERPMVCEntities _dbContext = null;
        ICustomerRepository _customerRepository = null;
        IBusinessDivisionRepository _divisionRepository = null;
        IServiceRepository _serviceRepository = null;
        IFacilityRepository _facilityRepository = null;
        IOrderRepository _orderRepository = null;
        IOrderFacilityMapping _orderFacilityMapping = null;
        IOrderExpenseMapping _OrderExpenseMapping = null;
        public OrderBookingServices()
        {
            _dbContext = new ERPMVCEntities();
            _customerRepository =  new CustomerRepository(_dbContext);
            _divisionRepository = new BusinessDivisionRepository(_dbContext);
            _serviceRepository = new ServiceRepository(_dbContext);
            _facilityRepository = new FacilityRepository(_dbContext);
            _orderRepository = new OrderRepository(_dbContext);
            _orderFacilityMapping = new OrderFacilityMapping(_dbContext);
            _OrderExpenseMapping = new OrderExpenseMapping(_dbContext);
            
        }


        public IEnumerable<Order_FacilityMapping> GetAllExpenseMapping()
        {
            IEnumerable<Order_FacilityMapping> list = _orderFacilityMapping.GetAll().ToList();

            return list;
        }



        public OrderBookingDropdownViewModels GetOrderFormDropdowns()
        {
            OrderBookingDropdownViewModels orderFormDropdownViewModels = new OrderBookingDropdownViewModels()
            {
                CustomerList = _customerRepository.GetAll().ToList(),
                DivisionList = _divisionRepository.GetAll().ToList(),
                OrderList = _serviceRepository.GetAll().ToList(),
                FacilityList = _facilityRepository.GetAll().ToList(),
            };
            
            return orderFormDropdownViewModels;
        }
        public int AddOrder(OrderBookingViewModel orderViewModel)
        {
            string statusCode = "11";

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<OrderBookingViewModel, GenerateOrder>();
            });

           
            var order = Mapper.Map<OrderBookingViewModel, GenerateOrder>(orderViewModel);
            order.CreatedDate =  DateTime.Now;
           // order.CreatedBy = Session["UserName"].ToString();
            order.isActive = true;
            _orderRepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            int OrderId = order.OrderID;
            return OrderId;
        }
        public string AddFacility(int FacilityID, int OrderId)
        {
            string statusCode = "11";

            Order_FacilityMapping ofm = new Order_FacilityMapping();
            ofm.FacilityID = FacilityID;
            ofm.OrderID = OrderId;
            _orderFacilityMapping.Add(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            
            return statusCode;
        }



        public string AddFacilityExpense(int ExpenseID, string Rates, int OrderId)
        {
            string statusCode = "11";

            Order_Expense_Mapping ofm = new Order_Expense_Mapping();
            ofm.ExpenseId = ExpenseID;
            ofm.Rates = Rates;
            ofm.OrderId = OrderId;
            _OrderExpenseMapping.Add(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }




        public string UpdateFacilityType(Order_FacilityMapping orderFacilityMapping)
        {
            string statusCode = "11";

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<Order_FacilityMapping, Order_FacilityMapping>();
            });

            var order = Mapper.Map<Order_FacilityMapping, Order_FacilityMapping>(orderFacilityMapping);
            // order.isActive = true;
           // order.FacilityID = FacilityID;
            //order.OrderID = OrderId;
            _orderFacilityMapping.Update(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }


        public string UpdateFacility(int FacilityID, int OrderId)
        {
            string statusCode = "11";

            Order_FacilityMapping ofm = new Order_FacilityMapping();
            ofm.FacilityID = FacilityID;
            ofm.OrderID = OrderId;
            _orderFacilityMapping.Update(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }
        public IEnumerable<GenerateOrder> GetAll()
        {
            return _orderRepository.GetAll();
        }
        //public List<LogisticInvoiceViewModel> PrintInvoiceDetail(DateTime fromDate, DateTime toDate, string InvoiceNumber)
        //{


        //    //var count = _ePRCRepository.GetAll().Where(x => x.T_Date_of_ROP >= fromDate && x.T_Date_of_ROP <= toDate && x.B_IBAN_AccNo.Contains(user.AccountNumber) && x.ePRC == null).Count();
        //    //if(count == 0)
        //    //{
           
        //    var inoiceDetail = _invoiceDetailRepository.GetAll();
        //    var invoiceMST = _invoiceMstRepository.GetAll();
        //    var Result = (from invMST in invoiceMST
        //                  join invDetail in inoiceDetail on invMST.LocalLogisticsInvoiceMstID equals invDetail.LocalLogisticsInvoiceMstID into LEFTJOIN
        //                  from remain in LEFTJOIN.DefaultIfEmpty()
        //                  join cust in _dbContext.stp_Customer on invMST.CustomerID equals cust.CustomerID into LEFTJOIN1
        //                  from cusDetail in LEFTJOIN1.DefaultIfEmpty()
        //                  join serType in _dbContext.stp_ServiceType on remain.ServiecTypeID equals serType.ServiecTypeID into LEFTJOIN2
        //                  from serDetail in LEFTJOIN2.DefaultIfEmpty()
        //                  join prodCat in _dbContext.stp_ProductCategory on remain.ProductID equals prodCat.ProductCatID into LEFTJOIN3
        //                  from prodDetail in LEFTJOIN3.DefaultIfEmpty()
        //                  join jobType in _dbContext.JobProcessTypes on remain.JobType equals jobType.JobProcessID into LEFTJOIN4
        //                  from jobDetail in LEFTJOIN4.DefaultIfEmpty() where jobDetail.JobProcessID == 2
        //                  where invMST.InvoiceNumber == InvoiceNumber
        //                  select new LogisticInvoiceViewModel
        //                  {
        //                      LocalLogisticsInvoiceMstID = remain.LocalLogisticsInvoiceMstID,
        //                      InvoiceNumber = invMST.InvoiceNumber,
        //                      CustomerName = cusDetail.CustomerName,
        //                      FromDate = invMST.InvoiceDataFromDate,
        //                      ToDate = invMST.InvoiceDataToDate,
        //                      InvoiceDate = invMST.InvoiceDate,
        //                      ServiecType = serDetail.ServiceTypeDesc,
        //                      ProductCaTName = prodDetail.ProductCatName,
        //                      FromLocation = remain.FromLocation,
        //                      ToLocation = remain.ToLocation,
        //                      OperationDate = remain.OperationDate,
        //                      JobType = jobDetail.Description,
        //                      ContainerNo = remain.ContainerNo,                        
        //                  }).ToList();

                          
        //    return Result;
        //    //}
        //    //else
        //    //{
        //    //    return null;
        //    //}
        //}

        public OrderGridViewModels GetOrderServiceDetail()
        {
            OrderGridViewModels orderGridViewModel = new OrderGridViewModels()
            {
                OrderDetail = _orderRepository.GetAll().ToList(),
                DivisionList = _divisionRepository.GetAll().ToList(),
                CustomerList = _customerRepository.GetAll().ToList(),
            };
            return orderGridViewModel;
        }

        public string UpdateFacilityById(Order_FacilityMapping order_FacilityMapping)
        {

            string statusCode = "11";

            var isExist = _dbContext.Order_FacilityMapping.Where(x => x.OrderID == order_FacilityMapping.OrderID && x.FacilityID == order_FacilityMapping.FacilityID).FirstOrDefault();
            if (isExist == null)
            {
                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<Order_FacilityMapping, Order_FacilityMapping>();
                });

                var order = Mapper.Map<Order_FacilityMapping, Order_FacilityMapping>(order_FacilityMapping);
                _orderFacilityMapping.Add(order);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded > 0)
                {
                    statusCode = "00";
                }
            }

            return statusCode;
        }



        public string DeleteExpenses(int OrderId)
        {
            Order_FacilityMapping _FacilityMapping = new Order_FacilityMapping();
            _FacilityMapping.OrderID = OrderId;
            string statusCode = "11";
            var isExist = _dbContext.Order_FacilityMapping.Where(x => x.OrderID == OrderId).ToList();
            if (isExist != null)
            {

                _orderFacilityMapping.RemoveRange(isExist);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded > 0)
                {
                    statusCode = "00";
                }
            }

            return statusCode;
        }





    }
}