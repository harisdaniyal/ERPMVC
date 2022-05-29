using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using MasterLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.BusinessLayer
{
    public class InvoiceServices : Controller
    {
        ERPMVCEntities _dbContext = null;
        ERPMVCEntities db = null;
        IInvoiceRepository _invoiceRepository = null;
        IInvoiceHeadRepository _invoiceheadRepository = null;
        IExpenseInvoiceRepository _expenseinvoiceRepository = null;

        public InvoiceServices()
        {
            _dbContext = new ERPMVCEntities();
            _invoiceRepository = new InvoiceRepository(_dbContext);
            _invoiceheadRepository = new InvoiceHeadRepository(_dbContext);
            _expenseinvoiceRepository = new ExpenseInvoiceRepository(_dbContext);
            db = new ERPMVCEntities();

        }

        public string AddInvoice(GenerateInvoiceViewModel invoiceDetail)
        {
            string statusCode = "11";

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<GenerateInvoiceViewModel, tbl_Invoice>();
            });

            var order = Mapper.Map<GenerateInvoiceViewModel, tbl_Invoice>(invoiceDetail);
            order.VerifiedDate = null;
            order.UpdatedDate = null;
            order.InvoiceDataToDate = DateTime.Now;
            order.InvoiceDataFromDate = DateTime.Now;
            _invoiceRepository.Add(order);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }
        //  List<string> terms = new List<string>();
        // IList<Report.Business.ViewModels.InvoiceMaster>

        //public InvoiceViewModel PrintInvoiceDetail(string invoiceNo)
        //{
        //     return (from inv in _dbContext.tbl_Invoice
        //                  join genOrd in _dbContext.GenerateOrders on inv.OrderID equals genOrd.OrderID
        //                  join cust in _dbContext.BACustomerRegistrations on genOrd.CustomerID equals cust.CustomerID
        //                  join bd in _dbContext.stp_BusinessDivision on genOrd.BusinessDevisionID equals bd.BusinessDivisionID
        //                  join st in _dbContext.stp_Status on inv.Status equals st.StatusID
        //                  where inv.InvoiceNumber == invoiceNo
        //                //  where cust.Customer_Name == invoiceNo
        //                  select new InvoiceViewModel
        //                  {
        //                      OrderNo = genOrd.OrderNo,
        //                      InvoiceNumber = inv.InvoiceNumber,
        //                      OrderTYpe = genOrd.OrderType,
        //                      InvoiceDate = inv.InvoiceDate,
        //                      VerifiedBy = inv.VerifiedBy,
        //                      VerifiedDate = inv.VerifiedDate,
        //                      Customer_Name = cust.Customer_Name,
        //                      BL_CRO = genOrd.BL,
        //                      CRO = genOrd.CRO,
        //                      DeliveryNo = genOrd.DeliveryNo,
        //                      OrderDate = genOrd.OrderDate,
        //                      BusinessDivisionName = bd.BusinessDivisionName,
        //                      Status = st.Status,
        //                      S20Container = (from logis in _dbContext.Logistics
        //                                      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
        //                                      // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
        //                                      select new
        //                                      {
        //                                          logis.logisticsid
        //                                      }).Count(),
        //                      D20Container = (from logis in _dbContext.Logistics
        //                                      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN")  && logis.OrderServiceId == 1
        //                                      //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
        //                                      select new
        //                                      {
        //                                          logis.logisticsid

        //                                      }).Count(),

        //                      S20ContainerEmpty = (from logis in _dbContext.Logistics
        //                                           where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
        //                                           // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
        //                                           select new
        //                                           {
        //                                               logis.logisticsid
        //                                           }).Count(),
        //                      D20ContainerEmpty = (from logis in _dbContext.Logistics
        //                                           where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
        //                                           //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
        //                                           select new
        //                                           {
        //                                               logis.logisticsid

        //                                           }).Count(),




        //                      WS20Container = (from logis in _dbContext.Logistics
        //                                       where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
        //                                       // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
        //                                       select new
        //                                       {
        //                                           logis.logisticsid
        //                                       }).Count(),
        //                      WD20Container = (from logis in _dbContext.Logistics
        //                                       where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
        //                                       //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
        //                                       select new
        //                                       {
        //                                           logis.logisticsid

        //                                       }).Count(),

        //                      LoloQty = (from logis in _dbContext.Logistics
        //                                     //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
        //                                 where logis.OrderId == inv.OrderID && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 2
        //                                 select new
        //                                 {
        //                                     logis.Qty
        //                                 }).FirstOrDefault(),
        //                      LOloQtyEmpty = (from logis in _dbContext.Logistics
        //                                          //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
        //                                      where logis.OrderId == inv.OrderID && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 2
        //                                      select new
        //                                      {
        //                                          logis.Qty
        //                                      }).FirstOrDefault(),
        //                      Qty40Container = (from logis in _dbContext.Logistics
        //                                            //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
        //                                        where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40")
        //                                        select new
        //                                        {
        //                                            logis.logisticsid
        //                                        }).Count(),
        //                      Qty40ContainerLaden = (from logis in _dbContext.Logistics
        //                                            //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
        //                                        where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("LADEN")
        //                                        select new
        //                                        {
        //                                            logis.logisticsid
        //                                        }).Count(),
        //                      Qty40ContainerEmpty = (from logis in _dbContext.Logistics
        //                                                 //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
        //                                             where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("EMPTY")
        //                                             select new
        //                                             {
        //                                                 logis.logisticsid
        //                                             }).Count(),

        //                      Price20 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                 where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
        //                                 select new
        //                                 {
        //                                     CustPrice.ContainerSize20P
        //                                 }).FirstOrDefault(),

        //                      Price40 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                 where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
        //                                 select new
        //                                 {
        //                                     CustPrice.ContainerSize40P
        //                                 }).FirstOrDefault(),

        //                      Price20Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                      where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
        //                                      select new
        //                                      {
        //                                          CustPrice.ContainerSize20PEmpty
        //                                      }).FirstOrDefault(),

        //                      Price40Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                      where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
        //                                      select new
        //                                      {
        //                                          CustPrice.ContainerSize40PEmpty
        //                                      }).FirstOrDefault(),


        //                      priceLolo = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
        //                                   select new
        //                                   {
        //                                       CustPrice.price
        //                                   }).FirstOrDefault(),
        //                      priceLoloEMPTY = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                        where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
        //                                        select new
        //                                        {
        //                                            CustPrice.priceEmpty
        //                                        }).FirstOrDefault(),



        //                      WCPrice = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                 where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
        //                                 select new
        //                                 {
        //                                     CustPrice.WeightmentCharges
        //                                 }).FirstOrDefault(),
        //                      WC40Price = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
        //                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
        //                                   select new
        //                                   {
        //                                       CustPrice.WeightmentCharges40
        //                                   }).FirstOrDefault(),
        //                  }).FirstOrDefault();

        //}







        public List<LogisticsReportViewModel> PrintReportLogisticsContainer(DateTime? FromDate, DateTime? ToDate)
        {
            return (from opo in db.Logistics
                    join go in db.GenerateOrders on opo.OrderId equals go.OrderID into table1
                    from Orders in table1.ToList()
                    join bd in db.stp_BusinessDivision on Orders.BusinessDivisionId equals bd.BusinessDivisionID into table2
                    from Business in table2.ToList()
                    join c in db.BACustomerRegistrations on Orders.CustomerID equals c.CustomerID into table3
                    from Cust in table3.ToList()
                    join fl in db.stp_Facility on opo.OrderServiceId equals fl.facilityID into table5
                    from faciltyLst in table5.ToList()
                    where Orders.OrderDate >= FromDate && Orders.OrderDate <= ToDate
                    select new LogisticsReportViewModel
                    {
                        //  OrderNo = genOrd.OrderNo,
                        logisticsid = opo.logisticsid,
                        OrderNo = Orders.OrderNo,
                        Customer_Name = Cust.Customer_Name,
                        JobType = opo.JobType,
                        FacilityName = faciltyLst.FacilityName,
                        ContainerNo = opo.ContainerNo,
                        ContainerNo2 = opo.ContainerNo2,
                        ContainerWeight = opo.ContainerWeight,
                        //    opo.SingleDouble,
                        ContainerSize = opo.ContainerSize,
                        FromLocation = opo.FromLocation,
                        ToLocation = opo.ToLocation,
                        IsActive = opo.IsActive,
                        Qty = opo.Qty,
                        ContainerStatusTrip = opo.tbl_Container_logistics_Status.Name

                    }).ToList();

        }




        public List<InvoiceViewModel> PrintInvoiceDetailReport(string CustomerName, DateTime? fromDate, DateTime? ToDate)
        {
            return (from inv in _dbContext.tbl_Invoice
                    join genOrd in _dbContext.GenerateOrders on inv.OrderID equals genOrd.OrderID
                    join cust in _dbContext.BACustomerRegistrations on genOrd.CustomerID equals cust.CustomerID
                    join bd in _dbContext.stp_BusinessDivision on genOrd.BusinessDivisionId equals bd.BusinessDivisionID
                    join st in _dbContext.stp_Status on inv.Status equals st.StatusID
                    where inv.InvoiceDate >= fromDate && inv.InvoiceDate <= ToDate
                    //    where x => x.ExpenseDate >= fromDate && x.ExpenseDate <= ToDate
                    where cust.Customer_Name == CustomerName
                    //  where inv.InvoiceDataFromDate == fromDate
                    // where inv.InvoiceDataToDate == ToDate
                    select new InvoiceViewModel
                    {
                        OrderNo = genOrd.OrderNo,
                        InvoiceNumber = inv.InvoiceNumber,
                        InvoiceDate = inv.InvoiceDate,
                        VerifiedBy = inv.VerifiedBy,
                        VerifiedDate = inv.VerifiedDate,
                        Customer_Name = cust.Customer_Name,
                        BL_CRO = genOrd.BL,
                        CRO = genOrd.CRO,
                        DeliveryNo = genOrd.DeliveryNo,
                        OrderDate = genOrd.OrderDate,
                        BusinessDivisionName = bd.BusinessDivisionName,
                        Status = st.Status,
                        S20Container = (from logis in _dbContext.Logistics
                                        where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                        // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                        select new
                                        {
                                            logis.logisticsid
                                        }).Count(),
                        D20Container = (from logis in _dbContext.Logistics
                                        where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                        //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                        select new
                                        {
                                            logis.logisticsid

                                        }).Count(),

                        S20ContainerEmpty = (from logis in _dbContext.Logistics
                                             where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                                             // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                             select new
                                             {
                                                 logis.logisticsid
                                             }).Count(),
                        D20ContainerEmpty = (from logis in _dbContext.Logistics
                                             where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                                             //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                             select new
                                             {
                                                 logis.logisticsid

                                             }).Count(),

                        WS20Container = (from logis in _dbContext.Logistics
                                         where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                         select new
                                         {
                                             logis.logisticsid
                                         }).Count(),
                        WD20Container = (from logis in _dbContext.Logistics
                                         where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         select new
                                         {
                                             logis.logisticsid

                                         }).Count(),

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
                        Qty40Container = (from logis in _dbContext.Logistics
                                              //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                          where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40")
                                          select new
                                          {
                                              logis.logisticsid
                                          }).Count(),
                        Qty40ContainerLaden = (from logis in _dbContext.Logistics
                                                   //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                               where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("LADEN")
                                               select new
                                               {
                                                   logis.logisticsid
                                               }).Count(),
                        Qty40ContainerEmpty = (from logis in _dbContext.Logistics
                                                   //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                               where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("EMPTY")
                                               select new
                                               {
                                                   logis.logisticsid
                                               }).Count(),

                        Price20 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                   select new
                                   {
                                       CustPrice.ContainerSize20P
                                   }).FirstOrDefault(),

                        Price40 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                   select new
                                   {
                                       CustPrice.ContainerSize40P
                                   }).FirstOrDefault(),

                        Price20Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                        where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                        select new
                                        {
                                            CustPrice.ContainerSize20PEmpty
                                        }).FirstOrDefault(),

                        Price40Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                        where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                        select new
                                        {
                                            CustPrice.ContainerSize40PEmpty
                                        }).FirstOrDefault(),


                        priceLolo = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                     where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                                     select new
                                     {
                                         CustPrice.price
                                     }).FirstOrDefault(),
                        priceLoloEMPTY = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                          where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                                          select new
                                          {
                                              CustPrice.priceEmpty
                                          }).FirstOrDefault(),



                        WCPrice = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                                   select new
                                   {
                                       CustPrice.WeightmentCharges
                                   }).FirstOrDefault(),
                        WC40Price = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                     where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                                     select new
                                     {
                                         CustPrice.WeightmentCharges40
                                     }).FirstOrDefault(),
                    }).ToList();

        }







        public InvoiceViewModel PrintInvoiceDetail(string invoiceNo)
        {
            return (from inv in _dbContext.tbl_Invoice
                    join genOrd in _dbContext.GenerateOrders on inv.OrderID equals genOrd.OrderID
                    join cust in _dbContext.BACustomerRegistrations on genOrd.CustomerID equals cust.CustomerID
                    join bd in _dbContext.stp_BusinessDivision on genOrd.BusinessDivisionId equals bd.BusinessDivisionID
                    join st in _dbContext.stp_Status on inv.Status equals st.StatusID
                    where inv.InvoiceNumber == invoiceNo
                    //  where cust.Customer_Name == invoiceNo
                    select new InvoiceViewModel
                    {
                        OrderNo = genOrd.OrderNo,
                        InvoiceNumber = inv.InvoiceNumber,
                        OrderTYpe = genOrd.OrderType,
                        InvoiceDate = inv.InvoiceDate,
                        VerifiedBy = inv.VerifiedBy,
                        VerifiedDate = inv.VerifiedDate,
                        Customer_Name = cust.Customer_Name,
                        BL_CRO = genOrd.BL,
                        CRO = genOrd.CRO,
                        DeliveryNo = genOrd.DeliveryNo,
                        OrderDate = genOrd.OrderDate,
                        BusinessDivisionName = bd.BusinessDivisionName,
                        Status = st.Status,
                        S01_10TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1 //&& logis.ContainerWeight.Contains("01-10")
                                                                                                                                                                                                                                                  // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid
                                              }).Count(),

                        S15_20TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1 //&& logis.ContainerWeight.Contains("10-15")
                                                                                                                                                                                                                                                  // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid
                                              }).Count(),


                        S20_25TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid
                                              }).Count(),
                        S25_30TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid
                                              }).Count(),


                        D20_25TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),
                        D30_35TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),
                        D35_40TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),
                        D40_45TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),
                        D45_50TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),

                        D50_55TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),

                        D55_60TonConatiner = (from logis in _dbContext.Logistics
                                              where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 1
                                              //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                              select new
                                              {
                                                  logis.logisticsid

                                              }).Count(),





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

                        S20ContainerEmpty = (from logis in _dbContext.Logistics
                                             where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                                             // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                             select new
                                             {
                                                 logis.logisticsid
                                             }).Count(),
                        D20ContainerEmpty = (from logis in _dbContext.Logistics
                                             where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 1
                                             //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                             select new
                                             {
                                                 logis.logisticsid

                                             }).Count(),




                        WS20Container = (from logis in _dbContext.Logistics
                                         where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         // where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20")   && logis.OrderServiceId == 1
                                         select new
                                         {
                                             logis.logisticsid
                                         }).Count(),
                        WD20Container = (from logis in _dbContext.Logistics
                                         where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 != null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         //      where logis.OrderId == inv.OrderID && logis.ContainerNo != null && logis.ContainerNo2 == null && logis.ContainerSize.Contains("20") && logis.OrderServiceId == 1
                                         select new
                                         {
                                             logis.logisticsid

                                         }).Count(),

                        LoloQty = (from logis in _dbContext.Logistics
                                       //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
                                   where logis.OrderId == inv.OrderID && logis.JobType.Contains("LADEN") && logis.OrderServiceId == 2
                                   select new
                                   {
                                       logis.Qty
                                   }).Sum(e => e.Qty),
                        LOloQtyEmpty = (from logis in _dbContext.Logistics
                                            //         where logis.OrderId == inv.OrderID && logis.ContainerNo == null && logis.ContainerNo2 == null && logis.ContainerSize == null && logis.FromLocation == null && logis.ToLocation == null   && logis.OrderServiceId == 2
                                        where logis.OrderId == inv.OrderID && logis.JobType.Contains("EMPTY") && logis.OrderServiceId == 2

                                        select new
                                        {
                                            logis.Qty
                                        }).Sum(e => e.Qty),
                        Qty40Container = (from logis in _dbContext.Logistics
                                              //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                          where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40")
                                          select new
                                          {
                                              logis.logisticsid
                                          }).Count(),
                        Qty40ContainerLaden = (from logis in _dbContext.Logistics
                                                   //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                               where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("LADEN")
                                               select new
                                               {
                                                   logis.logisticsid
                                               }).Count(),
                        Qty40ContainerEmpty = (from logis in _dbContext.Logistics
                                                   //   where logis.OrderId == inv.OrderID && logis.SingleDouble.Contains("DOUBLE") == logis.SingleDouble.Contains("SINGLE") && logis.ContainerSize.Contains("40")
                                               where logis.OrderId == inv.OrderID && logis.ContainerSize.Contains("40") && logis.JobType.Contains("EMPTY")
                                               select new
                                               {
                                                   logis.logisticsid
                                               }).Count(),

                        Price20 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                   select new
                                   {
                                       CustPrice.ContainerSize20P
                                   }).FirstOrDefault(),

                        Price40 = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                   select new
                                   {
                                       CustPrice.ContainerSize40P
                                   }).FirstOrDefault(),

                        Price20Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                        where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                        select new
                                        {
                                            CustPrice.ContainerSize20PEmpty
                                        }).FirstOrDefault(),

                        Price40Empty = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                        where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 1
                                        select new
                                        {
                                            CustPrice.ContainerSize40PEmpty
                                        }).FirstOrDefault(),


                        priceLolo = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                     where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                                     select new
                                     {
                                         CustPrice.price
                                     }).FirstOrDefault(),
                        priceLoloEMPTY = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                          where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 2
                                          select new
                                          {
                                              CustPrice.priceEmpty
                                          }).FirstOrDefault(),



                        WCPrice = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                   where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                                   select new
                                   {
                                       CustPrice.WeightmentCharges
                                   }).FirstOrDefault(),
                        WC40Price = (from CustPrice in _dbContext.BACustomerFacilityDetails.Where(a => a.IsActive == true)
                                     where CustPrice.CustomerID == genOrd.CustomerID && CustPrice.FacilityID == 3
                                     select new
                                     {
                                         CustPrice.WeightmentCharges40
                                     }).FirstOrDefault(),
                    }).FirstOrDefault();

        }
        // Invoice Head //
        public IEnumerable<InvoiceHeadViewModel> GetInvoiceHeadAsync()
        {
            return (from invoicehead in _dbContext.InvoiceHeads.Where(x => x.IsDeleted == false)
                    select new InvoiceHeadViewModel()
                    {
                        ID = invoicehead.ID,
                        HeadType = invoicehead.HeadType,
                        HeadName = invoicehead.HeadName,

                    });
        }

        public async Task SaveInvoiceHeadAsync(InvoiceHeadViewModel invoiceheadVM)
        {

            var invoicehead = Mapper.Map<InvoiceHeadViewModel, InvoiceHead>(invoiceheadVM);
            if (invoicehead == null)
            {
                throw new ArgumentNullException(nameof(invoiceheadVM));
            }
            //invoicehead.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            //invoicehead.CreatedDate = DateTime.Now;
            //invoicehead.CreatedBy = Session["UserName"].ToString();
            invoicehead.CreatedDate = DateTime.Now;
            invoicehead.IsDeleted = false;
            _invoiceheadRepository.Add(invoicehead);

            await _dbContext.SaveChangesAsync();
            invoiceheadVM.ID = invoicehead.ID;
        }

        public async Task UpdateInvoiceHeadAsync(InvoiceHeadViewModel invoiceheadVM)
        {

            if (invoiceheadVM == null)
            {
                throw new ArgumentNullException(nameof(invoiceheadVM));
            }

            var invoicehead = await _invoiceheadRepository.GetAsync(Convert.ToInt32(invoiceheadVM.ID));

            if (invoicehead == null)
            {
                throw new InvalidOperationException($"Invoice :{invoiceheadVM.ID}  not found.");
            }

            invoicehead.HeadType = invoiceheadVM.HeadType;
            invoicehead.HeadName = invoiceheadVM.HeadName;

            _invoiceheadRepository.Update(invoicehead);


            await _dbContext.SaveChangesAsync();
            invoiceheadVM.ID = invoicehead.ID;
        }

        ///////////************* Expenses Invoice **************/////////////

        public IEnumerable<ExpenseInvoiceViewModel> GetExpenseInvoiceAsync()
        {
            return (from expenseinvoice in _dbContext.ExpenseInvoices
                    join order in _dbContext.GenerateOrders
                         on new { OrderNo = expenseinvoice.OrderNo } equals new { OrderNo = order.OrderNo }
                         // join exportorder in _dbContext.ExportBookingOrders
                         //on new { OrderNo = expenseinvoice.OrderNo } equals new { OrderNo = exportorder.OrderNo }
                    join ordercontainer in _dbContext.OrderContainers
                         on new { ContainerNo = expenseinvoice.ContainerNo } equals new { ContainerNo = ordercontainer.ContainerNo }
                    join HI in _dbContext.InvoiceHeads
                         on new { HeadType = expenseinvoice.HeadType, HeadName = expenseinvoice.HeadName } equals new { HeadType = HI.HeadType, HeadName = HI.HeadName } into HIGroup
                    from InvoiceHeads in HIGroup.DefaultIfEmpty()

                    select new ExpenseInvoiceViewModel()
                    {
                        OrderNo = order.OrderNo,
                        //OrderNo = exportorder.OrderNo,
                        ContainerNo = ordercontainer.ContainerNo,
                        HeadType = InvoiceHeads.HeadType,
                        HeadID = InvoiceHeads.ID,
                        HeadName = InvoiceHeads.HeadName,
                        Amount = expenseinvoice.Amount,
                        OrderType = expenseinvoice.OrderType,
                        ID = expenseinvoice.ID,
                    }).OrderByDescending(x => x.ID);
        }

        public async Task SaveExpenseInvoiceAsync(ExpenseInvoiceViewModel expenseinvoiceVM)
        {

            var expenseinvoice = Mapper.Map<ExpenseInvoiceViewModel, ExpenseInvoice>(expenseinvoiceVM);
            if (expenseinvoice == null)
            {
                throw new ArgumentNullException(nameof(expenseinvoiceVM));
            }

            //expenseinvoice.CreatedBy = Session["UserName"].ToString();
            expenseinvoice.CreatedDate = DateTime.Now;

            _expenseinvoiceRepository.Add(expenseinvoice);

            await _dbContext.SaveChangesAsync();
            expenseinvoiceVM.ID = expenseinvoice.ID;
        }

        public async Task UpdateExpenseInvoiceAsync(ExpenseInvoiceViewModel expenseinvoiceVM)
        {

            if (expenseinvoiceVM == null)
            {
                throw new ArgumentNullException(nameof(expenseinvoiceVM));
            }

            var expenseinvoice = await _expenseinvoiceRepository.GetAsync(Convert.ToInt32(expenseinvoiceVM.ID));

            if (expenseinvoice == null)
            {
                throw new InvalidOperationException($"Data :{expenseinvoiceVM.ID}  not found.");
            }

            expenseinvoice.OrderNo = expenseinvoiceVM.OrderNo;
            expenseinvoice.OrderType = expenseinvoiceVM.OrderType;
            expenseinvoice.ContainerNo = expenseinvoiceVM.ContainerNo;
            expenseinvoice.HeadType = expenseinvoiceVM.HeadType;
            expenseinvoice.HeadName = expenseinvoiceVM.HeadName;
            expenseinvoice.HeadID = expenseinvoiceVM.HeadID;
            expenseinvoice.Amount = expenseinvoiceVM.Amount;

            _expenseinvoiceRepository.Update(expenseinvoice);


            await _dbContext.SaveChangesAsync();
            expenseinvoiceVM.ID = expenseinvoice.ID;
        }

        public IEnumerable<GenerateOrder> GetImportOrderNo()
        {
            return _dbContext.GenerateOrders.ToList();
        }
        public IEnumerable<ExportBookingOrder> GetExportOrderNo()
        {
            return _dbContext.ExportBookingOrders.ToList();
        }

        public IEnumerable<InvoiceHeadViewModel> GetHeadName()
        {
            return (from HeadName in _dbContext.InvoiceHeads.Where(x => x.IsDeleted == false)
                    select new InvoiceHeadViewModel()
                    {
                        HeadName = HeadName.HeadName,
                        ID = HeadName.ID
                    });
        }

    }
}