using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{

    public class InvoiceLogisticsServices
    {
        ERPMVCEntities _dbContext = null;
        ICustomerRepository _customerRepository = null;
        IBusinessDivisionRepository _divisionRepository = null;
        IServiceRepository _serviceRepository = null;
        IFacilityRepository _facilityRepository = null;
        IOrderRepository _orderRepository = null;
        IOrderFacilityMapping _orderFacilityMapping = null;
        ITripRepository _tripRepository = null;
        ITripExpenseMapping _tripExpenseMapping = null;
        IInvoiceLogisticsRepository _invoiceLogisticsRepository = null;


        public InvoiceLogisticsServices()
        {
            _dbContext = new ERPMVCEntities();
            _customerRepository = new CustomerRepository(_dbContext);
            _divisionRepository = new BusinessDivisionRepository(_dbContext);
            _serviceRepository = new ServiceRepository(_dbContext);
            _facilityRepository = new FacilityRepository(_dbContext);
            _orderRepository = new OrderRepository(_dbContext);
            _orderFacilityMapping = new OrderFacilityMapping(_dbContext);
            _tripRepository = new TripRepository(_dbContext);
            _tripExpenseMapping = new TripExpenseMapping(_dbContext);
            _invoiceLogisticsRepository = new InvoiceLogisticsRepository(_dbContext);
        }


        public string AddInvoiceLogistics(InvoiceLogisticsViewModel invoiceDetailLogistics)
        {
            string statusCode = "11";

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<InvoiceLogisticsViewModel, tbl_Invoice_logistics>();
            });

            var order = Mapper.Map<InvoiceLogisticsViewModel, tbl_Invoice_logistics>(invoiceDetailLogistics);
            order.VerifiedDate = null;
            order.UpdatedDate = null;
            order.InvoiceDataToDate = DateTime.Now;
            order.InvoiceDataFromDate = DateTime.Now;
            _invoiceLogisticsRepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }




        public IEnumerable<BAtrip> GetAll()
        {
            return _tripRepository.GetAll();
        }






        public InvoiceGrideViewModel GetLogisticInvoiceViewModel()
        {
            InvoiceGrideViewModel logisticInvoiceView = new InvoiceGrideViewModel()
            {
                OrderDetail = _orderRepository.GetAll().ToList(),
                DivisionList = _divisionRepository.GetAll().ToList(),
                CustomerList = _customerRepository.GetAll().ToList(),
                TripDetails = _tripRepository.GetAll().ToList(),
            };
            return logisticInvoiceView;
        }



        public ReportLogistics PrintReportDetail(string invoiceNo)
        {
            return (from inv in _dbContext.BAtrips
                   

                    join logis in _dbContext.Logistics on inv.Logistics_ID equals logis.logisticsid
                    join genOrd in _dbContext.GenerateOrders on logis.OrderId equals genOrd.OrderID
                    join logi in _dbContext.Logistics on genOrd.OrderID equals logi.OrderId
                    join cust in _dbContext.BACustomerRegistrations on genOrd.CustomerID equals cust.CustomerID
                    join st in _dbContext.stp_ContainerStatus on inv.ContainerStatus equals st.ID
                    join Vec in _dbContext.VehicleRegistrationDetails on inv.Vechial_ID equals Vec.VehicleID
                    join Dno in _dbContext.Employees on inv.Drive_ID equals Dno.EmployeeID
                   // join Dno2 in _dbContext.Employees on inv.Driver2_ID equals Dno2.EmployeeID
                    join Dno2 in _dbContext.Employees on inv.Driver2_ID equals Dno2.EmployeeID  into vlist from v in vlist.DefaultIfEmpty()  
                    join St in _dbContext.ContainerStatus on inv.ContainerStatus equals St.id
                    join VecType in _dbContext.VehicleTypes on Vec.VehicleTypeID equals VecType.VehicleTypeID
                    where inv.Trip_ID == invoiceNo && genOrd.OrderID == genOrd.OrderID
                    select new ReportLogistics
                    {
                      Jobtype = logi.JobType,
                      jobyType2 = logi.JobType2,
                      TotalExpense = inv.TotalExpense,
                      ContainerSize = logi.ContainerSize,
                      EntriedBy = inv.CreatedBy,
                      SlipNo = inv.ID,
                      Driver2ndName = v.Employee_FirstName + v.Employee_LastName,
                      Cell2ndDriver = v.EmpPhoneno,
                      CNIC2nddriver = v.Cnic,
                      RecivedDate = inv.RecivedDate,
                      VechicleName = Vec.VehicleName,
                      TripNo = inv.Trip_ID,  
                      OrderNO = genOrd.OrderNo,
                      CellNo = Dno.EmpPhoneno,
                      CNIC = Dno.Cnic,
                      OrderDate = genOrd.OrderDate,
                      OperationDate = inv.Operation_Date,
                      VechicleType = VecType.VehicleTypeDesc,
                      CustomerName = cust.Customer_Name,
                      ContainerNo = logis.ContainerNo,
                      ContainerNo2 =logis.ContainerNo2,
                      fromLocation = logis.FromLocation,
                      tolocation = logis.ToLocation,
                     // CurrenFromLocation = inv.CurrentFromLocation,
                      //CurrentTolocation =  inv.CurrentToLocation,
                      VechileNo = Vec.Vehicle_Number,
                      DriveNo = Dno.Employee_FirstName + Dno.Employee_LastName,
                      BL = genOrd.BL,
                     // BusinessDivisionName = bd.BusinessDivisionName,
                      status = St.ContainerStatus,
                      ExcisePolice = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 1
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      Meal = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 2
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      Challan = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 3
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      MobileCard = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 4
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      Loading = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 5
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      AddaComission = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 6
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      TollTax = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 7
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      TyreRepair = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 8
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      ServicingAndGressing = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 9
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),

                      CustomsGate = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 10
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      KPTGate = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 11
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      Misc = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 12
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      Fuel = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 13
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                      WEIGHTCHARGES = (from TripPrice in _dbContext.BAExpensesDetails
                                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 23
                                select new
                                {
                                    TripPrice.price
                                }).FirstOrDefault(),
                        MicsRemarks = (from TripPrice in _dbContext.BAExpensesDetails
                                      where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 12
                                      select new
                                      {
                                          TripPrice.Remarks
                                      }).FirstOrDefault(),

                        //HORates

                        ExcisePolice1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                        where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 1
                                        select new
                                        {
                                            TripPrice.Rates
                                        }).FirstOrDefault(),
                        Meal1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                 where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 2
                                select new
                                {
                                    TripPrice.Rates
                                }).FirstOrDefault(),
                        Challan1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                    where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 3
                                   select new
                                   {
                                       TripPrice.Rates
                                   }).FirstOrDefault(),
                        MobileCard1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                       where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 4
                                      select new
                                      {
                                          TripPrice.Rates
                                      }).FirstOrDefault(),
                        Loading1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                    where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 5
                                   select new
                                   {
                                       TripPrice.Rates
                                   }).FirstOrDefault(),
                        AddaComission1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                          where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 6
                                         select new
                                         {
                                             TripPrice.Rates
                                         }).FirstOrDefault(),
                        TollTax1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                    where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 7
                                   select new
                                   {
                                       TripPrice.Rates
                                   }).FirstOrDefault(),
                        TyreRepair1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                       where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 8
                                      select new
                                      {
                                          TripPrice.Rates
                                      }).FirstOrDefault(),
                        ServicingAndGressing1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                                 where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 9
                                                select new
                                                {
                                                    TripPrice.Rates
                                                }).FirstOrDefault(),

                        CustomsGate1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                        where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 10
                                       select new
                                       {
                                           TripPrice.Rates
                                       }).FirstOrDefault(),
                        KPTGate1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                    where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 11
                                   select new
                                   {
                                       TripPrice.Rates
                                   }).FirstOrDefault(),
                        Misc1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                 where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 12
                                select new
                                {
                                    TripPrice.Rates
                                }).FirstOrDefault(),
                        Fuel1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                 where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 13
                                select new
                                {
                                    TripPrice.Rates
                                }).FirstOrDefault(),
                        WEIGHTCHARGES1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                                          where TripPrice.OrderId == genOrd.OrderID && TripPrice.ExpenseId == 23
                                         select new
                                         {
                                             TripPrice.Rates
                                         }).FirstOrDefault(),
                        //MicsRemarks1 = (from TripPrice in _dbContext.Order_Expense_Mapping
                        //                where TripPrice.TripId == inv.ID && TripPrice.ExpenseId == 12
                        //               select new
                        //               {
                        //                   TripPrice.Remarks
                        //               }).FirstOrDefault(),

                        //HoRates


                        // END
                        //OrderNo = genOrd.OrderNo,
                        //InvoiceNumber = inv.InvoiceNumber,
                        //InvoiceDate = inv.InvoiceDate,
                        //VerifiedBy = inv.VerifiedBy,
                        //VerifiedDate = inv.VerifiedDate,
                        //Customer_Name = cust.Customer_Name,
                        //BL_CRO = genOrd.BL,
                        //CRO = genOrd.CRO,
                        //DeliveryNo = genOrd.DeliveryNo,
                        //OrderDate = genOrd.OrderDate,
                        //BusinessDivisionName = bd.BusinessDivisionName,
                        //Status = st.Status,
                        //S20Container = (from logis in _dbContext.Logistics
                        //                where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                        //                // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                        //                select new
                        //                {
                        //                    logis.logisticsid
                        //                }).Count(),
                        //D20Container = (from logis in _dbContext.Logistics
                        //                where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                        //                //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                        //                select new
                        //                {
                        //                    logis.logisticsid

                        //                }).Count(),

                        //S20ContainerEmpty = (from logis in _dbContext.Logistics
                        //                     where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                        //                     // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                        //                     select new
                        //                     {
                        //                         logis.logisticsid
                        //                     }).Count(),
                        //D20ContainerEmpty = (from logis in _dbContext.Logistics
                        //                     where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                        //                     //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                        //                     select new
                        //                     {
                        //                         logis.logisticsid

                        //                     }).Count(),




                        //WS20Container = (from logis in _dbContext.Logistics
                        //                 where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                        //                 // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                        //                 select new
                        //                 {
                        //                     logis.logisticsid
                        //                 }).Count(),
                        //WD20Container = (from logis in _dbContext.Logistics
                        //                 where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                        //                 //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                        //                 select new
                        //                 {
                        //                     logis.logisticsid

                        //                 }).Count(),

                        //LoloQty = (from logis in _dbContext.Logistics
                        //               //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
                        //           where logis.OrderId == inv.OrderID && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 2
                        //           select new
                        //           {
                        //               logis.Qty
                        //           }).FirstOrDefault(),
                        //LOloQtyEmpty = (from logis in _dbContext.Logistics
                        //                    //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
                        //                where logis.OrderId == inv.OrderID && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 2
                        //                select new
                        //                {
                        //                    logis.Qty
                        //                }).FirstOrDefault(),
                        //Qty40Container = (from logis in _dbContext.Logistics
                        //                      //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                        //                  where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40")
                        //                  select new
                        //                  {
                        //                      logis.logisticsid
                        //                  }).Count(),
                        //Qty40ContainerLaden = (from logis in _dbContext.Logistics
                        //                           //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                        //                       where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("LADEN")
                        //                       select new
                        //                       {
                        //                           logis.logisticsid
                        //                       }).Count(),
                        //Qty40ContainerEmpty = (from logis in _dbContext.Logistics
                        //                           //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                        //                       where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("EMPTY")
                        //                       select new
                        //                       {
                        //                           logis.logisticsid
                        //                       }).Count(),

                        //Price20 = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //           where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                        //           select new
                        //           {
                        //               CustPrice.ContainerSize20P
                        //           }).FirstOrDefault(),

                        //Price40 = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //           where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                        //           select new
                        //           {
                        //               CustPrice.ContainerSize40P
                        //           }).FirstOrDefault(),

                        //Price20Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //                where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                        //                select new
                        //                {
                        //                    CustPrice.ContainerSize20PEmpty
                        //                }).FirstOrDefault(),

                        //Price40Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //                where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                        //                select new
                        //                {
                        //                    CustPrice.ContainerSize40PEmpty
                        //                }).FirstOrDefault(),


                        //priceLolo = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //             where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                        //             select new
                        //             {
                        //                 CustPrice.price
                        //             }).FirstOrDefault(),
                        //priceLoloEMPTY = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //                  where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                        //                  select new
                        //                  {
                        //                      CustPrice.priceEmpty
                        //                  }).FirstOrDefault(),



                        //WCPrice = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //           where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                        //           select new
                        //           {
                        //               CustPrice.WeightmentCharges
                        //           }).FirstOrDefault(),
                        //WC40Price = (from CustPrice in _dbContext.BACustomerFacilityDetails
                        //             where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                        //             select new
                        //             {
                        //                 CustPrice.WeightmentCharges40
                        //             }).FirstOrDefault(),
                    }).FirstOrDefault();

        }













    }
}