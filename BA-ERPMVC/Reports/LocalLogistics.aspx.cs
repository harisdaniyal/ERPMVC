using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Models;
using CrystalDecisions.CrystalReports.Engine;
using MasterLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BA_ERPMVC.Reports
{
    public partial class LocalLogistics1 : System.Web.UI.Page
    {
        ReportDocument report = new ReportDocument();
        DataTable dt = new DataTable();
        ApplicationDbContext _applicationDbContext = null;
        InvoiceServices _invoiceService = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _applicationDbContext = new ApplicationDbContext();
            _invoiceService = new InvoiceServices();

           // if (Request.QueryString["ReportType"] == "PartyWise")
           // {
                PrintLogisticsReports( Convert.ToDateTime(Request.QueryString["FromDate"]), Convert.ToDateTime(Request.QueryString["ToDate"]));

          //  }

        }

    


        //START




        public void PrintLogisticsReports(DateTime? FromDate, DateTime? ToDate)
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
                    row["ContainerStatusTrip"] = item[i].ContainerStatusTrip;
                    dataTable.Rows.Add(row.ItemArray);
                }




                CustomLogger.Debug("Ready To Print E-PRC Report\n");
            }
            catch (Exception ex)
            {

            }

             PrintReportLogitics(applicationsList, "LocalLogistics.rpt", "LogisticsReports", DateTime.Now, DateTime.Now, ids);
        }

        //[NonAction]
        public void PrintReportLogitics(InvoiceData dataSet, string reportName, string filename, DateTime Fdate, DateTime Tdate, string ids = "")
        {
            report.Load(Path.Combine(Server.MapPath("~/Reports/"), reportName));
            report.SetDataSource(dataSet);

            Crv.ReportSource = report;
            Crv.DataBind();
            Crv.RefreshReport();
        }





        //END










    }
}