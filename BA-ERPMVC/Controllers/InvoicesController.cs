using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.Reports;
using BA_ERPMVC.ViewModels;
using CrystalDecisions.CrystalReports.Engine;
using MasterLayer;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class InvoicesController : Controller
    {
        ERPMVCEntities db = null;
        ApplicationDbContext _applicationDbContext = null;
        OrderBookingServices _orderService;
        InvoiceServices _invoiceService;
        public InvoicesController()
        {
            _applicationDbContext = new ApplicationDbContext();
            _orderService = new OrderBookingServices();
            _invoiceService = new InvoiceServices();
            db = new ERPMVCEntities();

        }
        // GET: Invoices
        public ActionResult InvoiceGeneration()
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

        public ActionResult InvoiceGenerationLogistic()
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

        public ActionResult PrintReportLogistics()
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



        public ActionResult LogisticInvoice()
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

        public ActionResult LogisticInvoiceReport()
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


        [HttpPost]
        public ActionResult GetGenrateInvoiceGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Invoice = (from opo in db.tbl_Invoice
                               join VV in db.GenerateOrders on opo.OrderID equals VV.OrderID
                               join VX in db.stp_Status on opo.Status equals VX.StatusID
                               select new
                               {
                                   ID = opo.InvoiceID,
                                   Invoiceno = opo.InvoiceNumber,
                                   orderID = VV.OrderNo,
                                   INvoicedate = opo.InvoiceDate,
                                   INvoicefromdate = opo.InvoiceDataFromDate,
                                   INvoiceTodate = opo.InvoiceDataToDate,
                                   isActive = opo.isActive,
                                   status = VX.Status,

                               }).ToList();

                return Json(new { Invoice });
            }

        }


        public ActionResult GetInvoiceNo()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.tbl_Invoice.Select(x => new
                {
                    NID = x.InvoiceID,
                    INo = x.InvoiceNumber
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }



        public ActionResult GetCustomerName()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.BACustomerRegistrations.Select(x => new
                {
                    NID = x.CustomerID,
                    INo = x.Customer_Name
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }



        //public ActionResult LogisticInvoice()
        //{
        //    if (Session["UserName"] != null)
        //    {

        //        return View();
        //    }
        //    else
        //    {
        //        return Redirect("/Account/Login");
        //    }
        //}




        [HttpPost]
        public JsonResult GetOrderNoByBusinessID(int BusinessDevisionID)
        {
            dynamic result = null;
            try
            {

                result = _orderService.GetAll().Where(x => x.BusinessDivisionId == BusinessDevisionID).Select(x => new
                {
                    x.OrderID,
                    x.OrderNo,
                });


            }
            catch (Exception ex)
            {

            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult GetOrderDetailByOrderNo(int OrderID)
        {
            dynamic result = null;
            try
            {
                OrderGridViewModels orderGridServicesModel = _orderService.GetOrderServiceDetail();
                result = from e in orderGridServicesModel.OrderDetail
                         join d in orderGridServicesModel.DivisionList on e.BusinessDivisionId equals d.BusinessDivisionID into table1
                         from d in table1.ToList()
                         join i in orderGridServicesModel.CustomerList on e.CustomerID equals i.CustomerID into table2
                         from i in table2.ToList()
                         where e.OrderID == OrderID
                         select new
                         {
                             e.OrderID,
                             e.OrderNo,
                             e.OrderDate,
                             e.OrderType,
                             e.InBond_Number,
                             e.DeliveryNo,
                             e.CreatedBy,
                             e.CreatedDate,
                             d.BusinessDivisionName,
                             i.Customer_Name,
                             e.BL
                         };
            }
            catch (Exception ex)
            {

            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult GetInvoiceNumber()
        {
            string InvoiceNo = "";
            string code = "";
            Int64 maxValue = 0;

            InvoiceNo = db.tbl_Invoice.OrderByDescending(x => x.InvoiceNumber).Select(x => x.InvoiceNumber).FirstOrDefault();
            if (InvoiceNo != null || InvoiceNo == "")
            {
                Int64 invoicenumber = Convert.ToInt64(InvoiceNo);
                maxValue = invoicenumber;
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
        public JsonResult AddInvoiceDetail(GenerateInvoiceViewModel InvoiceVmodel)
        {
            string statusCode = "11";
            InvoiceVmodel.CreatedDate = DateTime.Now;
            InvoiceVmodel.CreatedBy = Session["UserName"].ToString();
            InvoiceVmodel.isActive = false;
            InvoiceVmodel.Status = 1;
            InvoiceVmodel.InvoiceDate = DateTime.Now;
            statusCode = _invoiceService.AddInvoice(InvoiceVmodel);
            return Json(statusCode);
        }


        public ActionResult PrintinvoiceByInvoiceNo(string invoiceNo)
        {
            InvoiceData applicationsList = new InvoiceData();
            string filename = "";
            string ids = string.Empty;
            try
            {
                CustomLogger.Debug("========PRINT E-PRC REPORT=============\n");
                var item = _invoiceService.PrintInvoiceDetail(invoiceNo);
                var bank = db.BA_Bank.ToList();
                DataTable dataTable = applicationsList.InvData;

                string userId = User.Identity.GetUserId();
                var user = _applicationDbContext.Users.Where(x => x.Id == userId).FirstOrDefault();

                DataRow row = dataTable.NewRow();
                //    row["S01_10TonConatiner"] = item.S01_10TonConatiner;
                //    row["S10_15TonConatiner"] = item.S10_15TonConatiner;



                row["InvoiceNumber"] = item.InvoiceNumber;
                row["InvoiceDate"] = item.InvoiceDate;
                row["CustomerName"] = item.Customer_Name;
                row["BL/CRO"] = item.BL_CRO;
                row["OrderType"] = item.OrderTYpe;
                row["CRO"] = item.CRO;
                row["OrderDate"] = item.OrderDate;
                row["OrderNo"] = item.OrderNo;
                row["BusinessName"] = item.BusinessDivisionName;
                row["S20Container"] = item.S20Container;
                row["D20Container"] = item.D20Container + item.D20Container;
                row["S20ContainerEmpty"] = item.S20ContainerEmpty;
                row["D20ContainerEmpty"] = item.D20ContainerEmpty + item.D20ContainerEmpty;
                row["WS20Container"] = item.WS20Container;
                row["WD20Container"] = item.WD20Container;

                if (item.WCPrice != null)
                {
                    row["WCPrice"] = item.WCPrice.WeightmentCharges;
                }
                else
                {
                    row["WCPrice"] = 0;
                }
                if (item.WC40Price != null)
                {
                    row["WC40Price"] = item.WC40Price.WeightmentCharges40;
                }
                else
                {
                    row["WC40Price"] = 0;
                }
                if (item.priceLolo != null)
                {
                    row["LoloCharges"] = item.priceLolo.price;
                }
                else
                {
                    row["LoloCharges"] = 0;
                }
                if (item.priceLoloEMPTY != null)
                {
                    row["LoloChargesEmpty"] = item.priceLoloEMPTY.priceEmpty;
                }
                else
                {
                    row["LoloChargesEmpty"] = 0;
                }
                if (item.Price20 != null)
                {
                    row["Price20C"] = item.Price20.ContainerSize20P;
                }
                else
                {
                    row["Price20C"] = 0;
                }
                if (item.Price40 != null)
                {
                    row["Price40C"] = item.Price40.ContainerSize40P;
                }
                else
                {
                    row["Price40C"] = 0;
                }
                if (item.Price20Empty != null)
                {
                    row["Price20Empty"] = item.Price20Empty.ContainerSize20PEmpty;
                }
                else
                {
                    row["Price20Empty"] = 0;
                }
                if (item.Price40Empty != null)
                {
                    row["Price40Empty"] = item.Price40Empty.ContainerSize40PEmpty;
                }
                else
                {
                    row["Price40Empty"] = 0;
                }
                row["Status"] = item.Status;
                row["BankName1"] = bank[0].BankName;
                row["BankName2"] = bank[1].BankName;
                row["AccountNo1"] = bank[0].AccNo;
                row["AccountNo2"] = bank[1].AccNo;
                row["AccountTitle1"] = bank[0].AccTitle;
                row["AccountTitle2"] = bank[1].AccTitle;
                row["BrachCode1"] = bank[0].BranchCode;
                row["BranchCode2"] = bank[1].BranchCode;
                //if (item.Qty40Container != null)
                //{
                //    row["Qty40C"] = item.Qty40Container;
                //}
                //else
                //{
                //    row["Qty40C"] = 0;
                //}
                row["Qty40C"] = item.Qty40Container;
                row["Qty40CLaden"] = item.Qty40ContainerLaden;
                row["Qty40CEmpty"] = item.Qty40ContainerEmpty;
                if (item.LoloQty != null)
                {
                    row["LoloQty"] = item.LoloQty;
                }
                else
                {
                    row["LoloQty"] = 0;
                }
                if (item.LOloQtyEmpty != null)
                {
                    row["LoloQtyEmpty"] = item.LOloQtyEmpty;
                }
                else
                {
                    row["LoloQtyEmpty"] = 0;
                }
                dataTable.Rows.Add(row);


                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

            return PrintReport(applicationsList, "OrderInvoice.rpt", invoiceNo, DateTime.Now, DateTime.Now, ids);
        }

        [NonAction]
        public ActionResult PrintReport(InvoiceData dataSet, string reportName, string filename, DateTime Fdate, DateTime Tdate, string ids = "")
        {
            CustomLogger.Debug("========PRINT FUNCTION STARTED=========\n");


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports/"), reportName));
            rd.SetDataSource(dataSet);
            //rd.DataDefinition.FormulaFields["FromDt"].Text = "\'" + Fdate.ToString("dd-MMM-yyyy") + "\'";
            //rd.DataDefinition.FormulaFields["ToDt"].Text = "\'" + Tdate.ToString("dd-MMM-yyyy") + "\'";
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //stream.Seek(0, SeekOrigin.Begin);
            string fileName = string.Format(filename + "-{0}.pdf", ids);


            //return File(stream, "application/pdf");
            return File(stream, "application/pdf", fileName);
        }








        public ActionResult PrintinvoiceReportByInvoiceNo(string CustomerName, DateTime? fromDate, DateTime? ToDate)
        {
            InvoiceData applicationsList = new InvoiceData();
            string filename = "";
            string ids = string.Empty;
            try
            {
                CustomLogger.Debug("========PRINT E-PRC REPORT=============\n");
                var item = _invoiceService.PrintInvoiceDetailReport(CustomerName, fromDate, ToDate).ToList();
                var bank = db.BA_Bank.ToList();
                DataTable dataTable = applicationsList.InvData;

                string userId = User.Identity.GetUserId();
                var user = _applicationDbContext.Users.Where(x => x.Id == userId).FirstOrDefault();


                DataRow row = dataTable.NewRow();


                for (int i = 0; i < item.Count; i++)
                {


                    row["InvoiceNumber"] = item[i].InvoiceNumber;
                    row["InvoiceDate"] = item[i].InvoiceDate;
                    row["CustomerName"] = item[i].Customer_Name;
                    row["BL/CRO"] = item[i].BL_CRO;
                    row["CRO"] = item[i].CRO;
                    row["OrderDate"] = item[i].OrderDate;
                    row["OrderNo"] = item[i].OrderNo;
                    row["BusinessName"] = item[i].BusinessDivisionName;
                    row["S20Container"] = item[i].S20Container;
                    row["D20Container"] = item[i].D20Container + item[i].D20Container;
                    row["S20ContainerEmpty"] = item[i].S20ContainerEmpty;
                    row["D20ContainerEmpty"] = item[i].D20ContainerEmpty + item[i].D20ContainerEmpty;
                    row["WS20Container"] = item[i].WS20Container;
                    row["WD20Container"] = item[i].WD20Container;
                    row["Qty40CLaden"] = item[i].Qty40ContainerLaden;
                    row["Qty40CEmpty"] = item[i].Qty40ContainerEmpty;
                    if (item[i].WCPrice != null)
                    {
                        row["WCPrice"] = item[i].WCPrice.WeightmentCharges;
                    }
                    else
                    {
                        row["WCPrice"] = 0;
                    }

                    if (item[i].WC40Price != null)
                    {
                        row["WC40Price"] = item[i].WC40Price.WeightmentCharges40;
                    }
                    else
                    {
                        row["WC40Price"] = 0;
                    }


                    if (item[i].priceLolo != null)
                    {
                        row["LoloCharges"] = item[i].priceLolo.price;
                    }
                    else
                    {
                        row["LoloCharges"] = 0;
                    }

                    if (item[i].priceLoloEMPTY != null)
                    {
                        row["LoloChargesEmpty"] = item[i].priceLoloEMPTY.priceEmpty;
                    }
                    else
                    {
                        row["LoloChargesEmpty"] = 0;
                    }

                    if (item[i].Price20 != null)
                    {
                        row["Price20C"] = item[i].Price20.ContainerSize20P;
                    }
                    else
                    {
                        row["Price20C"] = 0;
                    }

                    if (item[i].Price40 != null)
                    {
                        row["Price40C"] = item[i].Price40.ContainerSize40P;
                    }
                    else
                    {
                        row["Price40C"] = 0;
                    }
                    if (item[i].Price20Empty != null)
                    {
                        row["Price20Empty"] = item[i].Price20Empty.ContainerSize20PEmpty;
                    }
                    else
                    {
                        row["Price20Empty"] = 0;
                    }


                    if (item[i].Price40Empty != null)
                    {
                        row["Price40Empty"] = item[i].Price40Empty.ContainerSize40PEmpty;
                    }
                    else
                    {
                        row["Price40Empty"] = 0;
                    }



                    row["Status"] = item[i].Status;

                    row["Qty40C"] = item[i].Qty40Container;
                    if (item[i].LoloQty != null)
                    {
                        row["LoloQty"] = item[i].LoloQty;
                    }
                    else
                    {
                        row["LoloQty"] = 0;
                    }
                    if (item[i].LOloQtyEmpty != null)
                    {
                        row["LoloQtyEmpty"] = item[i].LOloQtyEmpty;
                    }
                    else
                    {
                        row["LoloQtyEmpty"] = 0;
                    }

                    dataTable.Rows.Add(row.ItemArray);
                }





                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

            return PrintInvoiceReport(applicationsList, "OrderInvoiceReport.rpt", CustomerName, DateTime.Now, DateTime.Now, ids);
        }

        [NonAction]
        public ActionResult PrintInvoiceReport(InvoiceData dataSet, string reportName, string filename, DateTime Fdate, DateTime Tdate, string ids = "")
        {
            CustomLogger.Debug("========PRINT FUNCTION STARTED=========\n");


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports/"), reportName));
            rd.SetDataSource(dataSet);
            //rd.DataDefinition.FormulaFields["FromDt"].Text = "\'" + Fdate.ToString("dd-MMM-yyyy") + "\'";
            //rd.DataDefinition.FormulaFields["ToDt"].Text = "\'" + Tdate.ToString("dd-MMM-yyyy") + "\'";
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //stream.Seek(0, SeekOrigin.Begin);
            string fileName = string.Format(filename + "-{0}.pdf", ids);


            //return File(stream, "application/pdf");
            return File(stream, "application/pdf", fileName);
        }








        public ActionResult PrintLogisticsReports(DateTime? FromDate, DateTime? ToDate)
        {
            InvoiceData applicationsList = new InvoiceData();
            string filename = "";
            string ids = string.Empty;
            try
            {
                CustomLogger.Debug("========PRINT E-PRC REPORT=============\n");

                DataTable dataTable = applicationsList.LocalLogitcisData;

                //string userId = User.Identity.GetUserId();
                //var user = _applicationDbContext.Users.Where(x => x.Id == userId).FirstOrDefault();


                var item = _invoiceService.PrintReportLogisticsContainer(FromDate, ToDate);

                DataRow row = dataTable.NewRow();
                //row["S01_10TonConatiner"] = item.S01_10TonConatiner;
                //row["S10_15TonConatiner"] = item.S10_15TonConatiner;

                for (int i = 0; i < item.Count; i++)
                {
                    row["OrderNo"] = item[i].OrderNo;
                    row["Customer_Name"] = item[i].Customer_Name;
                    row["JobType"] = item[i].JobType;
                    row["FacilityName"] = item[i].FacilityName;
                    row["ContainerNo"] = item[i].ContainerNo;
                    row["ContainerNo2"] = item[i].ContainerNo2;
                    row["ContainerWeight"] = item[i].ContainerWeight;
                    row["ContainerSize"] = item[i].ContainerSize;
                    row["FromLocation"] = item[i].FromLocation;
                    row["ToLocation"] = item[i].ToLocation;
                    row["IsActive"] = item[i].IsActive;
                    row["Qty"] = item[i].Qty;
                    dataTable.Rows.Add(row.ItemArray);
                }




                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

            return PrintReportLogitics(applicationsList, "LocalLogistics.rpt", "LogisticsReports", DateTime.Now, DateTime.Now, ids);
        }

        [NonAction]
        public ActionResult PrintReportLogitics(InvoiceData dataSet, string reportName, string filename, DateTime Fdate, DateTime Tdate, string ids = "")
        {
            CustomLogger.Debug("========PRINT FUNCTION STARTED=========\n");


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports/"), reportName));
            rd.SetDataSource(dataSet);
            //rd.DataDefinition.FormulaFields["FromDt"].Text = "\'" + Fdate.ToString("dd-MMM-yyyy") + "\'";
            //rd.DataDefinition.FormulaFields["ToDt"].Text = "\'" + Tdate.ToString("dd-MMM-yyyy") + "\'";
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //stream.Seek(0, SeekOrigin.Begin);
            string fileName = string.Format(filename + "-{0}.pdf", ids);


            //return File(stream, "application/pdf");
            return File(stream, "application/pdf", fileName);
        }




        /// ************Invoice Head************** ///
        public ActionResult InvoiceHead()
        {
            var invoicehead = _invoiceService.GetInvoiceHeadAsync();
            return View(invoicehead);
        }

        [HttpPost]
        public async Task<ActionResult> InvoiceHead(InvoiceHeadViewModel invoiceheadVM)
        {
            if (invoiceheadVM == null)
            {
                return Json(new { success = false, message = $"{nameof(invoiceheadVM)} should not be null or empty" });
            }

            if (db.InvoiceHeads.Any(x => x.HeadType == invoiceheadVM.HeadType && x.HeadName == invoiceheadVM.HeadName) && invoiceheadVM.ID == 0)
            {
                return Json(new { success = false, message = $" This {invoiceheadVM.HeadName} is already exists." });

            }

            try
            {
                if (invoiceheadVM.ID == 0)
                {
                    await _invoiceService.SaveInvoiceHeadAsync(invoiceheadVM);

                    return Json(new { success = true, Id = invoiceheadVM.ID });
                }

                await _invoiceService.UpdateInvoiceHeadAsync(invoiceheadVM);

                return Json(new { success = true, Id = invoiceheadVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult> DeleteInvoiceHead(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = $"{nameof(Id)} should be a valid id" });
            }

            try
            {
                if (_invoiceService.DeleteInvoiceHead(Id))
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


        ////// ********** Expense Invoice ***************///////////


        public ActionResult ExpenseInvoice()
        {
            this.ViewBag.ImportOrderNo = _invoiceService.GetImportOrderNo();
            this.ViewBag.ExportOrderNo = _invoiceService.GetExportOrderNo();
            this.ViewBag.InvoiceHeadName = _invoiceService.GetHeadName();
            this.ViewBag.UserList = _invoiceService.GetUserList();
            return View();
        }


        [HttpGet]
        public JsonResult GetExpenseInvoice(string orderNo, string containerNo)
        {
            var expenseinvoice = _invoiceService.GetExpenseInvoiceAsync(orderNo, containerNo);
            return Json(expenseinvoice, JsonRequestBehavior.AllowGet);
        }



        [HttpGet]
        public JsonResult GetImportContainer(string orderType)
        {
            var data = Json(from order in db.GenerateOrders
                            join oc in db.OrderContainers on order.OrderID equals oc.OrderID
                            where order.OrderType == orderType
                            select new
                            {
                                ContainerNoAndOrderNo = oc.ContainerNo + " | " + order.OrderNo,
                                ContainerNo = oc.ContainerNo,
                                OrderNo = order.OrderNo
                            });
            return Json(data, JsonRequestBehavior.AllowGet);
        }



        [HttpGet]
        public JsonResult GetExportContainer(int orderID)
        {
            var data = Json(db.ExportLogistics.Where(x => x.OrderId == orderID).Select(x => new
            {
                ContainerNo = x.ContainerNo
            }
            ).ToList(), JsonRequestBehavior.AllowGet);

            return data;
        }

        [HttpPost]
        public async Task<ActionResult> ExpenseInvoice(ExpenseInvoiceViewModel expenseinvoiceVM)
        {
            if (expenseinvoiceVM == null)
            {
                return Json(new { success = false, message = $"{nameof(expenseinvoiceVM)} should not be null or empty" });
            }

            try
            {
                if (expenseinvoiceVM.ID == 0)
                {
                    await _invoiceService.SaveExpenseInvoiceAsync(expenseinvoiceVM);

                    return Json(new { success = true, Id = expenseinvoiceVM.ID });
                }

                await _invoiceService.UpdateExpenseInvoiceAsync(expenseinvoiceVM);

                return Json(new { success = true, Id = expenseinvoiceVM.ID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }



        [HttpPost]
        public async Task<ActionResult> DeleteExpenseInvoice(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = $"{nameof(Id)} should be a valid id" });
            }

            try
            {
                if (_invoiceService.DeleteExpenseInvoice(Id))
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