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
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class ReportLogisticsController : Controller
    {
        ERPMVCEntities db = null;
        InvoiceLogisticsServices _invoiceLogisticsServices = null;
        TripServices _tripServices = null;
        ApplicationDbContext _applicationDbContext = null;
      ///  InvoiceLogisticsServices _invoiceLogisticsServices = null;


        public ReportLogisticsController()
        {
            db = new ERPMVCEntities();
            _invoiceLogisticsServices = new InvoiceLogisticsServices();
            _tripServices = new TripServices();
            _applicationDbContext = new ApplicationDbContext();
        }


        // GET: ReportLogistics
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetOrderNo()
        {

            var result = db.GenerateOrders.Select(x => new
            {
                orderID = x.OrderID,
                orderNo = x.OrderNo
            }).ToList();
            return Json(new { result });

        }



        public ActionResult GetInvoiceNumber()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.BAtrips.Select(x => new
                {
                    NID = x.ID,
                    INo = x.Trip_ID
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }


     


        [HttpPost]
        public JsonResult GetOrderNoBytripID(int Order_ID)
        {
            dynamic result = null;
            try
            {

                result = _invoiceLogisticsServices.GetAll().Where(x => x.Logistics_ID == Order_ID && x.IsActive == true).Select(x => new
                {
                    x.ID,
                    x.Trip_ID,
                });


            }
            catch (Exception ex)
            {

            }
            return Json(result);
        }




        [HttpPost]
        public JsonResult GetInvoiceLogistic()
        {
            string InvoiceNo = "";
            string code = "";
            Int64 maxValue = 0;

            InvoiceNo = db.tbl_Invoice_logistics.OrderByDescending(x => x.InvoiceNumber).Select(x => x.InvoiceNumber).FirstOrDefault();
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
        public JsonResult getReportBYiD(int id)
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                var result = (from opo in db.BAtrips.Where(a => a.ID == id && a.IsActive == true)
                             join VX in db.Employees on opo.Drive_ID equals VX.EmployeeID
                             join logi in db.Logistics on opo.Logistics_ID equals logi.logisticsid
                             join DS in db.GenerateOrders on logi.OrderId equals DS.OrderID
                             join XS in db.BACustomerRegistrations on DS.CustomerID equals XS.CustomerID
                             join S in db.VehicleRegistrationDetails on opo.Vechial_ID equals S.VehicleID
                             join X in db.Logistics on logi.OrderId equals X.OrderId
                              select new
                              {
                                  DNo = logi.ContainerNo,
                                  Cno2 = logi.ContainerNo2,
                                  OTID = VX.Employee_FirstName +VX.Employee_LastName,
                                  oID = XS.Customer_Name,
                                  VechelID = S.Vehicle_Number,
                                  OrderDate = opo.Operation_Date,
                                  fromLocation = X.FromLocation,
                                  toLocation = X.ToLocation

                              }).ToList();
                return Json(result);
            }
        }





        [HttpPost]
        public JsonResult AddInvoiceDetailLogictis(InvoiceLogisticsViewModel InvoiceVmodel)
        {
            string statusCode = "11";
            InvoiceVmodel.CreatedDate = DateTime.Now;
            InvoiceVmodel.CreatedBy = Session["UserName"].ToString();
            InvoiceVmodel.isActive = false;
            InvoiceVmodel.Status = 1;
            InvoiceVmodel.InvoiceDate = DateTime.Now;
            statusCode = _invoiceLogisticsServices.AddInvoiceLogistics(InvoiceVmodel);
            return Json(statusCode);
        }



        [HttpPost]
        public ActionResult GetGenrateReportGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Invoice = (from opo in db.tbl_Invoice_logistics
                               join VV in db.GenerateOrders on opo.OrderID equals VV.OrderID
                               join VX in db.stp_Status on opo.Status equals VX.StatusID
                               join CS in db.BAtrips.Where(x=> x.IsActive == true) on opo.TripID equals CS.ID
                               select new
                               {
                                   ID = opo.InvoiceID,
                                   Invoiceno = opo.InvoiceNumber,
                                   orderID = VV.OrderNo,
                                   tripId = CS.Trip_ID,
                                   INvoicedate = opo.InvoiceDate,
                                   INvoicefromdate = opo.InvoiceDataFromDate,
                                   INvoiceTodate = opo.InvoiceDataToDate,
                                   isActive = opo.isActive,
                                   status = VX.Status,

                               }).ToList();

                return Json(new { Invoice });
            }

        }


        //TripSheet START
        public ActionResult PrintReportByInvoiceNo(string invoiceNo)
        {
            InvoiceData applicationsList = new InvoiceData();
            string filename = "";
            string ids = string.Empty;
            try
            {
                CustomLogger.Debug("========PRINT E-PRC REPORT=============\n");
                var item = _invoiceLogisticsServices.PrintReportDetail(invoiceNo);
               // var bank = db.BA_Bank.ToList();
                DataTable dataTable = applicationsList.ReptData;

                string userId = User.Identity.GetUserId();
                var user = _applicationDbContext.Users.Where(x => x.Id == userId).FirstOrDefault();

                DataRow row = dataTable.NewRow();

                row["InvoiceNumber"] = item.InvoiceNo;
                row["InvoiceDate"] = item.InvoiceDate;
                row["OrderDate"] = item.OrderDate;
                row["OperationDate"] = item.OperationDate;
                row["Triptype"] = item.VechicleType;
                row["CellNo"] = item.CellNo;
                row["CNIC"] = item.CNIC;
                row["CustomerName"] = item.CustomerName;
                row["BL/CRO"] = item.BL;
                row["TripNo"] = item.TripNo;
                row["OrderNo"] = item.OrderNO;
                row["ContainerNo1"] = item.ContainerNo;
                row["ContainerNo2"] = item.ContainerNo2;
                row["fromLocation"] = item.fromLocation;
                row["Tolocation"] = item.tolocation;
                row["CurrentFromLocation"] = item.CurrenFromLocation;
                row["CurrentTolocation"] = item.CurrentTolocation;
                row["VechicleNo"] = item.VechileNo;
                row["DriverName"] = item.DriveNo;
                row["Status"] = item.status;
                row["Driver2ndName"] = item.Driver2ndName;
                row["Cell2ndDriver"] = item.Cell2ndDriver;
                row["CNIC2nddriver"] = item.CNIC2nddriver;
                row["VechicleName"] = item.VechicleName;
                row["RecivedDate"] = item.RecivedDate;
                row["EntriedBy"] = item.EntriedBy;
                row["Jobtype"] = item.Jobtype;
                row["ContainerSize"] = item.ContainerSize;
                row["jobtype2"] = item.jobyType2;
                if (item.ExcisePolice != null)
                {
                    row["ExcisePolice"] = item.ExcisePolice.price;
                }
                else
                {
                    row["ExcisePolice"] = 0;
                }


                if (item.Meal != null)
                {
                    row["Meal"] = item.Meal.price;
                }
                else
                {
                    row["Meal"] = 0;
                }

                if (item.Challan != null)
                {
                    row["Challan"] = item.Challan.price;
                }
                else
                {
                    row["Challan"] = 0;
                }

                if (item.MobileCard != null)
                {
                    row["MobileCard"] = item.MobileCard.price;
                }
                else
                {
                    row["MobileCard"] = 0;
                }
                
                if (item.Loading != null)
                {
                    row["Loading"] = item.Loading.price;
                }
                else
                {
                    row["Loading"] = 0;
                }

                if (item.AddaComission != null)
                {
                    row["AddaComission"] = item.AddaComission.price;
                }
                else
                {
                    row["AddaComission"] = 0;
                }
                if (item.MicsRemarks != null)
                {
                    row["MicsRemarks"] = item.MicsRemarks.Remarks;
                }
                else
                {
                    row["MicsRemarks"] = "";
                }

                if (item.TollTax != null)
                {
                    row["TollTax"] = item.TollTax.price;
                }
                else
                {
                    row["TollTax"] = 0;
                }

                if (item.TyreRepair != null)
                {
                    row["TyreRepair"] = item.TyreRepair.price;
                }
                else
                {
                    row["TyreRepair"] = 0;
                }
                
                if (item.ServicingAndGressing != null)
                {
                    row["ServicingAndGressing"] = item.ServicingAndGressing.price;
                }
                else
                {
                    row["ServicingAndGressing"] = 0;
                }
                
                if (item.CustomsGate != null)
                {
                    row["CustomsGate"] = item.CustomsGate.price;
                }
                else
                {
                    row["CustomsGate"] = 0;
                }

                if (item.KPTGate != null)
                {
                    row["KPTGate"] = item.KPTGate.price;
                }
                else
                {
                    row["KPTGate"] = 0;
                }

                if (item.Misc != null)
                {
                    row["Misc"] = item.Misc.price;
                }
                else
                {
                    row["Misc"] = 0;
                }

                if (item.Fuel != null)
                {
                    row["Fuel"] = item.Fuel.price;
                }
                else
                {
                    row["Fuel"] = 0;
                }
                
                if (item.WEIGHTCHARGES != null)
                {
                    row["WEIGHTCHARGES"] = item.WEIGHTCHARGES.price;
                }
                else
                {
                    row["WEIGHTCHARGES"] = 0;
                }


                //Ho rates


                if (item.ExcisePolice1 != null)
                {
                    row["ExcisePolice1"] = item.ExcisePolice1.Rates;
                }
                else
                {
                    row["ExcisePolice1"] = 0;
                }


                if (item.Meal1 != null)
                {
                    row["Meal1"] = item.Meal1.Rates;
                }
                else
                {
                    row["Meal1"] = 0;
                }

                if (item.Challan1 != null)
                {
                    row["Challan1"] = item.Challan1.Rates;
                }
                else
                {
                    row["Challan1"] = 0;
                }

                if (item.MobileCard1 != null)
                {
                    row["MobileCard1"] = item.MobileCard1.Rates;
                }
                else
                {
                    row["MobileCard1"] = 0;
                }

                if (item.Loading1 != null)
                {
                    row["Loading1"] = item.Loading1.Rates;
                }
                else
                {
                    row["Loading1"] = 0;
                }

                if (item.AddaComission1 != null)
                {
                    row["AddaComission1"] = item.AddaComission1.Rates;
                }
                else
                {
                    row["AddaComission1"] = 0;
                }
                //if (item.MicsRemarks != null)
                //{
                //    row["MicsRemarks"] = item.MicsRemarks.Remarks;
                //}
                //else
                //{
                //    row["MicsRemarks"] = "";
                //}

                if (item.TollTax1 != null)
                {
                    row["TollTax1"] = item.TollTax1.Rates;
                }
                else
                {
                    row["TollTax1"] = 0;
                }

                if (item.TyreRepair1 != null)
                {
                    row["TyreRepair1"] = item.TyreRepair1.Rates;
                }
                else
                {
                    row["TyreRepair1"] = 0;
                }

                if (item.ServicingAndGressing1 != null)
                {
                    row["ServicingAndGressing1"] = item.ServicingAndGressing1.Rates;
                }
                else
                {
                    row["ServicingAndGressing1"] = 0;
                }

                if (item.CustomsGate1 != null)
                {
                    row["CustomsGate1"] = item.CustomsGate1.Rates;
                }
                else
                {
                    row["CustomsGate1"] = 0;
                }

                if (item.KPTGate1 != null)
                {
                    row["KPTGate1"] = item.KPTGate1.Rates;
                }
                else
                {
                    row["KPTGate1"] = 0;
                }

                if (item.Misc1 != null)
                {
                    row["Misc1"] = item.Misc1.Rates;
                }
                else
                {
                    row["Misc1"] = 0;
                }

                if (item.Fuel1 != null)
                {
                    row["Fuel1"] = item.Fuel1.Rates;
                }
                else
                {
                    row["Fuel1"] = 0;
                }

                if (item.WEIGHTCHARGES1 != null)
                {
                    row["WEIGHTCHARGES1"] = item.WEIGHTCHARGES1.Rates;
                }
                else
                {
                    row["WEIGHTCHARGES1"] = 0;
                }

                //Ho rates


                dataTable.Rows.Add(row);


                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

            return PrintReport(applicationsList, "LocalLogisticsSingleReport.rpt", invoiceNo, DateTime.Now, DateTime.Now, ids);
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
        //TripSheet END




        //DriverSlipReport START


        public ActionResult PrintSlipReportByNo(string invoiceNo)
        {
            InvoiceData applicationsList = new InvoiceData();
            string filename = "";
            string ids = string.Empty;
            try
            {
                CustomLogger.Debug("========PRINT E-PRC REPORT=============\n");
                var item = _invoiceLogisticsServices.PrintReportDetail(invoiceNo);
                // var bank = db.BA_Bank.ToList();
                DataTable dataTable = applicationsList.DriverSlipData;
                string userId = User.Identity.GetUserId();
                var user = _applicationDbContext.Users.Where(x => x.Id == userId).FirstOrDefault();

                DataRow row = dataTable.NewRow();


             

                row["SlipNo"] = item.SlipNo;
                row["VechicleNo"] = item.VechileNo;
                row["TripNo"] = item.TripNo;
                row["FisrtDriverName"] = item.DriveNo;
                row["FirstDriverCNIC"] = item.CNIC;
                row["JobType2"] = item.jobyType2;
                row["ContainerSize"] = item.ContainerSize;



              //  row["SecondDriverName"] = item.Driver2ndName;
              //  row["SeconeDriverCNIC"] = item.CNIC2nddriver;


                if (item.Driver2ndName != null)
                {
                    row["SecondDriverName"] = item.Driver2ndName;
                }
                else
                {
                    row["SecondDriverName"] = null;
                }
                if (item.CNIC2nddriver != null)
                {
                    row["SeconeDriverCNIC"] = item.CNIC2nddriver;
                }
                else
                {
                    row["SeconeDriverCNIC"] = null;
                }




                if (item.Fuel != null)
                {
                    row["Diesel"] = item.Fuel.price;
                }
                else
                {
                    row["Diesel"] = 0;
                }
                
                row["fromLocation"] = item.fromLocation;
                row["tolocation"] = item.tolocation;
                row["Jobtype"] = item.Jobtype;
                row["ContainerNo"] = item.ContainerNo;
                row["ContainerNo2"] = item.ContainerNo2;
                row["TotalExpense"] = item.TotalExpense;
                row["PrintBy"] = Session["UserName"].ToString();





                ////Rates Starts


                if (item.ExcisePolice != null)
                {
                    row["ExcisePolice"] = item.ExcisePolice.price;
                }
                else
                {
                    row["ExcisePolice"] = 0;
                }


                if (item.Meal != null)
                {
                    row["Meal"] = item.Meal.price;
                }
                else
                {
                    row["Meal"] = 0;
                }

                if (item.Challan != null)
                {
                    row["Challan"] = item.Challan.price;
                }
                else
                {
                    row["Challan"] = 0;
                }

                if (item.MobileCard != null)
                {
                    row["MobileCard"] = item.MobileCard.price;
                }
                else
                {
                    row["MobileCard"] = 0;
                }

                if (item.Loading != null)
                {
                    row["Loading"] = item.Loading.price;
                }
                else
                {
                    row["Loading"] = 0;
                }

                if (item.AddaComission != null)
                {
                    row["AddaComission"] = item.AddaComission.price;
                }
                else
                {
                    row["AddaComission"] = 0;
                }
                //if (item.MicsRemarks != null)
                //{
                //    row["MicsRemarks"] = item.MicsRemarks.Remarks;
                //}
                //else
                //{
                //    row["MicsRemarks"] = "";
                //}

                if (item.TollTax != null)
                {
                    row["TollTax"] = item.TollTax.price;
                }
                else
                {
                    row["TollTax"] = 0;
                }

                if (item.TyreRepair != null)
                {
                    row["TyreRepair"] = item.TyreRepair.price;
                }
                else
                {
                    row["TyreRepair"] = 0;
                }

                if (item.ServicingAndGressing != null)
                {
                    row["ServicingAndGressing"] = item.ServicingAndGressing.price;
                }
                else
                {
                    row["ServicingAndGressing"] = 0;
                }

                if (item.CustomsGate != null)
                {
                    row["CustomsGate"] = item.CustomsGate.price;
                }
                else
                {
                    row["CustomsGate"] = 0;
                }

                if (item.KPTGate != null)
                {
                    row["KPTGate"] = item.KPTGate.price;
                }
                else
                {
                    row["KPTGate"] = 0;
                }

                if (item.Misc != null)
                {
                    row["Misc"] = item.Misc.price;
                }
                else
                {
                    row["Misc"] = 0;
                }

                if (item.Fuel != null)
                {
                    row["Fuel"] = item.Fuel.price;
                }
                else
                {
                    row["Fuel"] = 0;
                }

                if (item.WEIGHTCHARGES != null)
                {
                    row["WEIGHTCHARGES"] = item.WEIGHTCHARGES.price;
                }
                else
                {
                    row["WEIGHTCHARGES"] = 0;
                }

                ////Rates End





                //Ho rates


                if (item.ExcisePolice1 != null)
                {
                    row["ExcisePolice1"] = item.ExcisePolice1.Rates;
                }
                else
                {
                    row["ExcisePolice1"] = 0;
                }


                if (item.Meal1 != null)
                {
                    row["Meal1"] = item.Meal1.Rates;
                }
                else
                {
                    row["Meal1"] = 0;
                }

                if (item.Challan1 != null)
                {
                    row["Challan1"] = item.Challan1.Rates;
                }
                else
                {
                    row["Challan1"] = 0;
                }

                if (item.MobileCard1 != null)
                {
                    row["MobileCard1"] = item.MobileCard1.Rates;
                }
                else
                {
                    row["MobileCard1"] = 0;
                }

                if (item.Loading1 != null)
                {
                    row["Loading1"] = item.Loading1.Rates;
                }
                else
                {
                    row["Loading1"] = 0;
                }

                if (item.AddaComission1 != null)
                {
                    row["AddaComission1"] = item.AddaComission1.Rates;
                }
                else
                {
                    row["AddaComission1"] = 0;
                }
                //if (item.MicsRemarks != null)
                //{
                //    row["MicsRemarks"] = item.MicsRemarks.Remarks;
                //}
                //else
                //{
                //    row["MicsRemarks"] = "";
                //}

                if (item.TollTax1 != null)
                {
                    row["TollTax1"] = item.TollTax1.Rates;
                }
                else
                {
                    row["TollTax1"] = 0;
                }

                if (item.TyreRepair1 != null)
                {
                    row["TyreRepair1"] = item.TyreRepair1.Rates;
                }
                else
                {
                    row["TyreRepair1"] = 0;
                }

                if (item.ServicingAndGressing1 != null)
                {
                    row["ServicingAndGressing1"] = item.ServicingAndGressing1.Rates;
                }
                else
                {
                    row["ServicingAndGressing1"] = 0;
                }

                if (item.CustomsGate1 != null)
                {
                    row["CustomsGate1"] = item.CustomsGate1.Rates;
                }
                else
                {
                    row["CustomsGate1"] = 0;
                }

                if (item.KPTGate1 != null)
                {
                    row["KPTGate1"] = item.KPTGate1.Rates;
                }
                else
                {
                    row["KPTGate1"] = 0;
                }

                if (item.Misc1 != null)
                {
                    row["Misc1"] = item.Misc1.Rates;
                }
                else
                {
                    row["Misc1"] = 0;
                }

                if (item.Fuel1 != null)
                {
                    row["Fuel1"] = item.Fuel1.Rates;
                }
                else
                {
                    row["Fuel1"] = 0;
                }

                if (item.WEIGHTCHARGES1 != null)
                {
                    row["WEIGHTCHARGES1"] = item.WEIGHTCHARGES1.Rates;
                }
                else
                {
                    row["WEIGHTCHARGES1"] = 0;
                }

                //Ho rates





                dataTable.Rows.Add(row);


                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

            return PrintReportSlip(applicationsList, "DriverSlip.rpt", invoiceNo, DateTime.Now, DateTime.Now, ids);
        }

        [NonAction]
        public ActionResult PrintReportSlip(InvoiceData dataSet, string reportName, string filename, DateTime Fdate, DateTime Tdate, string ids = "")
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





        //DriverSlipReport END
















    }
}