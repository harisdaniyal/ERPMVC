using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.BusinessLayer.OrderBooking;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.Reports;
using BA_ERPMVC.ViewModels;
using CrystalDecisions.CrystalReports.Engine;
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
    public class BLShippingLineController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        ApiResponse _apiResponse = new ApiResponse();
        private readonly OrderBookingService orderBookingService;
        private readonly ShippingService shippingService;


        public BLShippingLineController()
        {
            orderBookingService = new OrderBookingService();
            shippingService = new ShippingService();

        }
        // GET: BLShippingLine
        public ActionResult Index()
        {
            var blshippingcontainerdetail = shippingService.GetBLShippingContainerDetailAsync();
            this.ViewBag.BLShippingContainers = shippingService.GetBLShippingContainerAsync();
            return View(blshippingcontainerdetail);

        }

        public ActionResult GetContainerNo()
        {
            var data = Json(db.BLShippingContainers.Where(x => x.IsDeleted == false).Select(x => new
            {
                ContainerNo = x.ContainerNo
            }).ToList(), JsonRequestBehavior.AllowGet);
            return data;
        }

        public ActionResult GetBLNumber()
        {
            var newBLNumber = "OCL";
            var oldBL = db.BAShippingLines.OrderByDescending(x => x.BLShippingID).FirstOrDefault();
            if (oldBL != null)
            {
                int oldSerialNo = Convert.ToInt32(oldBL.BL.Split('/')[1]);
                oldSerialNo++;
                int oldBLYear = Convert.ToInt32(oldBL.BL.Split('/')[2]);

                if (oldBLYear == DateTime.Now.Year)
                {
                    newBLNumber = $"{newBLNumber}/{oldSerialNo.ToString("000000")}/{DateTime.Now.Year}";
                }
                else
                {
                    newBLNumber = $"{newBLNumber}/000001/{DateTime.Now.Year}";
                }

            }
            else
            {
                newBLNumber = $"{newBLNumber}/000001/{DateTime.Now.Year}";
            }
            var data = Json(newBLNumber, JsonRequestBehavior.AllowGet);
            return data;
        }

        public ActionResult GetBlAgent()
        {
            return Json(db.BLAgentDetails.Where(x => x.IsDeleted == false).Select(x => new
            {
                BLAgent = x.BLAgent


            }).ToList(), JsonRequestBehavior.AllowGet);
        }





        public ActionResult GetApproval()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_Status.Select(x => new
                {
                    SID = x.StatusID,
                    SStatus = x.Status
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }



        public ActionResult AddOrEditeBLShippingLine(BAShippingLine obj)
        {
            var done = 0;
            var responseText = "";
            _apiResponse.statusCode = "11";
            BAShippingLine isExistOrderNo = db.BAShippingLines.Where(i => i.BLShippingID == obj.BLShippingID).FirstOrDefault();
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                try
                {
                    if (obj.BLShippingID != 0)
                    {
                        BAShippingLine a = db.BAShippingLines.First(i => i.BLShippingID == obj.BLShippingID);

                        a.BL = obj.BL;
                        //a.Approval = obj.Approval;
                        a.Shipper = obj.Shipper;
                        a.BLShippingID = obj.BLShippingID;
                        a.IsCompleted = obj.IsCompleted;
                        a.Consignee = obj.Consignee;
                        a.NotifyParty = obj.NotifyParty;
                        a.precarriageby = obj.precarriageby;
                        a.Collect = obj.Collect;
                        a.placeofreceipt = obj.placeofreceipt;
                        a.OceanVessel = obj.OceanVessel;
                        a.VoyNo = obj.VoyNo;
                        a.Portoflanding = obj.Portoflanding;
                        a.PortofDischarge = obj.PortofDischarge;
                        a.PlaceOfDelivery = obj.PlaceOfDelivery;
                        a.NumberOfConatinerPack = obj.NumberOfConatinerPack;
                        a.Frightandcharges = obj.Frightandcharges;
                        a.BLAgent = obj.BLAgent;
                        a.TypeOfService = obj.TypeOfService;
                        a.NumberOfOrignalBL = obj.NumberOfOrignalBL;
                        a.ForwardingAgent = obj.ForwardingAgent;
                        a.FinalDestination = obj.FinalDestination;
                        a.FrightPayable = obj.FrightPayable;
                        a.PlaceOfIssue = obj.PlaceOfIssue;
                        a.DateOfIssue = obj.DateOfIssue;
                        a.UpdateDate = obj.UpdateDate = DateTime.Now.ToString();
                        a.UpdateBy = obj.UpdateBy = Session["UserName"].ToString();
                        done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {

                        if (isExistOrderNo == null)
                        {
                            if (obj.BL != null)
                            {
                                BAShippingLine isExistCustomeName = db.BAShippingLines.Where(i => i.BL == obj.BL).FirstOrDefault();
                                if (isExistCustomeName != null)
                                {

                                    responseText = "BLNo already exist.";
                                }
                                else
                                {
                                    //  _apiResponse.statusCode = "00";
                                    //    obj.CreateDate = DateTime.Now.ToString();
                                    //  obj.UserID = Session["UserName"].ToString();
                                    obj.CreateDate = DateTime.Now.ToString();
                                    obj.UserID = Session["UserName"].ToString();
                                    obj.CreatedBy = Session["UserName"].ToString();
                                    //obj.Approval = 1;
                                    db.BAShippingLines.Add(obj);
                                    done = db.SaveChanges();
                                    responseText = "Data Inserted Successfully.";

                                }
                            }
                            else
                            {
                                obj.CreateDate = DateTime.Now.ToString();
                                obj.UserID = Session["UserName"].ToString();
                                obj.CreatedBy = Session["UserName"].ToString();
                                //  obj.CreateDate = DateTime.Now.ToString();
                                //obj.UserID = Session["UserName"].ToString();
                                //obj.Approval = "1";
                                db.BAShippingLines.Add(obj);
                                done = db.SaveChanges();
                                responseText = "Data Inserted Successfully.";

                            }
                        }
                        else
                        {

                            _apiResponse.message = "Order No already exist";
                        }




                        //db.BAShippingLines.Add(obj);
                        //done = db.SaveChanges();
                        //responseText = "Data Inserted Successfully.";

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
        public JsonResult EditBLshippingline(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var BL = (from opo in db.BAShippingLines.Where(a => a.BLShippingID == id)

                              //on new { BLShippingID = opo.BLShippingID } equals new { Id = Shippingcontainerdetail.Id } into ShippingcontainerdetailGroup
                              // 
                              // join VV in db.stp_Status on opo.Approval equals VV.StatusID
                          select new
                          {
                              ID = opo.BLShippingID,
                              bl = opo.BL,
                              IsCompleted = opo.IsCompleted,
                              //Approv = opo.Approval,
                              shipper = opo.Shipper,
                              consignee = opo.Consignee,
                              notifyParty = opo.NotifyParty,
                              precarriageby = opo.precarriageby,
                              Collect = opo.Collect,
                              placeofreceipt = opo.placeofreceipt,
                              oceanVessel = opo.OceanVessel,
                              voyNo = opo.VoyNo,
                              portoflanding = opo.Portoflanding,
                              portofDischarge = opo.PortofDischarge,
                              placeOfDelivery = opo.PlaceOfDelivery,
                              numberOfConatinerPack = opo.NumberOfConatinerPack,
                              //kindOfPackagesDescriptionOfGoods = opo.KindOfPackagesDescriptionOfGoods,
                              //grossWeight = opo.GrossWeight,
                              //netWeight = opo.NetWeight,
                              Frightandcharges = opo.Frightandcharges,
                              BLAgent = opo.BLAgent,
                              TypeOfService = opo.TypeOfService,
                              NumberOfOrignalBL = opo.NumberOfOrignalBL,
                              ForwardingAgent = opo.ForwardingAgent,
                              FinalDestination = opo.FinalDestination,
                              FrightPayable = opo.FrightPayable,
                              PlaceOfIssue = opo.PlaceOfIssue,
                              DateOfIssue = opo.DateOfIssue,

                          });


                return Json(new { result = BL.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }


        [HttpPost]
        public ActionResult GetBLShippingGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var BL = (from opo in db.BAShippingLines
                          join Shippingcontainerdetail in db.BLShippingContainerDetails
                         on opo.BLShippingID equals Shippingcontainerdetail.Id into ShippingcontainerdetailGroup
                          from BLShippingContainerDetails in ShippingcontainerdetailGroup.DefaultIfEmpty()
                              //join status in db.stp_Status on opo.Approval equals VV.StatusID
                          select new
                          {
                              ID = opo.BLShippingID,
                              bl = opo.BL,
                              Approval = opo.Approval,
                              shipper = opo.Shipper,
                              consignee = opo.Consignee,
                              notifyParty = opo.NotifyParty,
                              precarriageby = opo.precarriageby,
                              Collect = opo.Collect,
                              placeofreceipt = opo.placeofreceipt,
                              oceanVessel = opo.OceanVessel,
                              voyNo = opo.VoyNo,
                              portoflanding = opo.Portoflanding,
                              portofDischarge = opo.PortofDischarge,
                              placeOfDelivery = opo.PlaceOfDelivery,
                              ContainerNo = BLShippingContainerDetails.ContainerNo,
                              SealNo = BLShippingContainerDetails.SealNo,
                              numberOfConatinerPack = opo.NumberOfConatinerPack,
                              kindOfPackagesDescriptionOfGoods = opo.KindOfPackagesDescriptionOfGoods,
                              grossWeight = opo.GrossWeight,
                              netWeight = opo.NetWeight,
                              Frightandcharges = opo.Frightandcharges,
                              BLAgent = opo.BLAgent,
                              TypeOfService = opo.TypeOfService,
                              NumberOfOrignalBL = opo.NumberOfOrignalBL,
                              ForwardingAgent = opo.ForwardingAgent,
                              FinalDestination = opo.FinalDestination,
                              FrightPayable = opo.FrightPayable,
                              PlaceOfIssue = opo.PlaceOfIssue,
                              DateOfIssue = opo.DateOfIssue,
                              IsCompleted = opo.IsCompleted

                          }).ToList().OrderByDescending(x => x.ID);

                return Json(new { BL });
            }

        }

        public ActionResult PrintGDReport(int id)
        {
            try
            {
                ERPMVCEntities context = new ERPMVCEntities();
                ReportDocument rd = new ReportDocument();
                InvoiceData invoiceDataDataSet = new InvoiceData();
                DataTable orderMainDataTable = invoiceDataDataSet.BLShippingLine;
                DataRow headerRow = orderMainDataTable.NewRow();

                var data = context.BAShippingLines.Where(x => x.BLShippingID == id).Select(c =>
                new BLShippingLineViewModel()
                {
                    BL = c.BL,
                    Shipper = c.Shipper,
                    Consignee = c.Consignee,
                    NotifyParty = c.NotifyParty,
                    precarriageby = c.precarriageby,
                    placeofreceipt = c.placeofreceipt,
                    OceanVessel = c.OceanVessel,
                    VoyNo = c.VoyNo,
                    Portoflanding = c.Portoflanding,
                    PortofDischarge = c.PortofDischarge,
                    PlaceOfDelivery = c.PlaceOfDelivery,
                    ForwardingAgent = c.ForwardingAgent,
                    FinalDestination = c.FinalDestination,
                    // ContainerNo = c.ContainerNo,
                    ////SealNo = c.SealNo,
                   // NumberOfConatinerPack = c.NumberOfConatinerPack,
                    //KindOfPackagesDescriptionOfGoods = c.KindOfPackagesDescriptionOfGoods,
                    //GrossWeight = c.GrossWeight,
                    //NetWeight = c.NetWeight,
                    Frightandcharges = c.Frightandcharges,
                    FrightPayable = c.FrightPayable,
                    TypeOfService = c.TypeOfService,
                    NumberOfOrignalBL = c.NumberOfOrignalBL,
                    PlaceOfIssue = c.PlaceOfIssue,
                    Collect = c.Collect,
                    DateOfIssue = c.DateOfIssue,
                    BLAgent = c.BLAgent,
                    BLAgentDetail = context.BLAgentDetails.Where(x => x.BLAgent == c.BLAgent).Select(x => x.BLAgentDetail1).FirstOrDefault()
                }).ToList();

                foreach (var item in data)
                {
                    headerRow["BL"] = item.BL;
                    headerRow["Shipper"] = item.Shipper;
                    headerRow["Consignee"] = item.Consignee;
                    headerRow["NotifyParty"] = item.NotifyParty;
                    headerRow["precarriageby"] = item.precarriageby;
                    headerRow["placeofreceipt"] = item.placeofreceipt;
                    headerRow["OceanVessel"] = item.OceanVessel;
                    headerRow["Portofloading"] = item.Portoflanding;
                    headerRow["VoyNo"] = item.VoyNo;
                    headerRow["PortofDischarge"] = item.PortofDischarge;
                    headerRow["PlaceOfDelivery"] = item.PlaceOfDelivery;
                    headerRow["ForwardingAgent"] = item.ForwardingAgent;
                    headerRow["FinalDestination"] = item.FinalDestination;
                    //headerRow["ContainerNo"] = item.ContainerNo;
                    headerRow["Frightandcharges"] = item.Frightandcharges;
                    headerRow["FrightPayable"] = item.FrightPayable;
                    headerRow["TypeOfService"] = item.TypeOfService;
                    headerRow["NumberOfOriginalBL"] = item.NumberOfOrignalBL;
                    headerRow["PlaceOfIssue"] = item.PlaceOfIssue;
                    headerRow["Collect"] = item.Collect;
                    headerRow["DateOfIssue"] = item.DateOfIssue;
                    headerRow["BLAgent"] = item.BLAgent;
                    headerRow["BLAgentDetail"] = item.BLAgentDetail;
                    orderMainDataTable.Rows.Add(headerRow);
                }
                string BL_Number = data[0].BL;

                var detailData = context.BLShippingContainerDetails.Where(x => x.Bl == BL_Number).ToList();
                DataTable orderDetailDataTable = invoiceDataDataSet.BLShippingLineDetail;
               

                foreach (var item in detailData)
                {
                    DataRow DetailRow = orderDetailDataTable.NewRow();
                    DetailRow["ContainerNo"] = item.ContainerNo;
                    DetailRow["SealNo"] = item.SealNo;
                    //DetailRow["NoOfContainersOrPackages"] = data[0].NumberOfConatinerPack;
                    DetailRow["KindOfPackagesDescriptionOfGoods"] = item.KindOfPackagesDescriptionOfGoods;
                    DetailRow["GrossWeight"] = item.GrossWeight;
                    DetailRow["NetWeight"] = item.NetWeight;
                    orderDetailDataTable.Rows.Add(DetailRow);
                }

                if (context.BAShippingLines.Where(x => x.BLShippingID == id).Select(x => x.IsCompleted).FirstOrDefault().GetValueOrDefault())
                {
                    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BLReport.rpt"));
                }
                else
                {
                    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BLReportWithoutmark.rpt"));
                    //rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BLReportWithoutMark.rpt"));
                }

                rd.SetDataSource(invoiceDataDataSet);
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();


                //rd.PrintOptions.PaperOrientation = CrystalDecisions.Shared.PaperOrientation.Landscape;
                //rd.PrintOptions.ApplyPageMargins(new CrystalDecisions.Shared.PageMargins(4, 4, 4, 4));
                //rd.PrintOptions.PaperSize = CrystalDecisions.Shared.PaperSize.PaperA5;

                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", $"BL_{data.Select(x => x.BL).FirstOrDefault()}.pdf");
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }



        //***** BL Approval*****//

        [HttpGet]
        public ActionResult BLApproval()
        {
            var Blapproval = orderBookingService.GetBLApprovalAsync();

            return View(Blapproval);
        }

        [HttpPost]
        public async Task<ActionResult> BLApproval(BLShippingLineViewModel BlshippinglineVM)
        {
            if (BlshippinglineVM.BLShippingID == 0)
            {
                return Json(new { success = false, message = $"{nameof(BlshippinglineVM)} should not be null or empty" });
            }

            try
            {
                await orderBookingService.UpdateBLApprovalAsync(BlshippinglineVM);
                return Json(new { success = true, Id = BlshippinglineVM.BLShippingID });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
        // BLShippingContainerDetail////
        //public ActionResult BlShippingContainerDetail()
        //{
        //    var blshippingcontainerdetail = shippingService.GetBLShippingContainerDetailAsync();
        //    this.ViewBag.BLShippingContainers = shippingService.GetBLShippingContainerAsync();
        //    return View(blshippingcontainerdetail);
        //}

        [HttpGet]
        public ActionResult GetBlShippingContainerDetails(string blNumber)
        {
            var _data = db.BLShippingContainerDetails.Where(x => x.Bl == blNumber && x.IsDeleted == false).Select(x => new
            {
                Id = x.Id,
                BL = x.Bl,
                ContainerNo = x.ContainerNo,
                SealNo = x.SealNo,
                KindOfPackagesDescriptionOfGoods = x.KindOfPackagesDescriptionOfGoods,
                NetWeight = x.NetWeight,
                GrossWeight = x.GrossWeight

            }).ToList();
            return Json(_data.Count > 0 ?
                new { success = true, data = _data } :
                new { success = false, data = _data }, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public async Task<ActionResult> BlShippingContainerDetail(List<BLShippingContainerDetailViewModel> blshippingcontainerdetailVM, string blNumber)
        {
            if (blshippingcontainerdetailVM == null)
            {
                return Json(new { success = false, message = $"{nameof(blshippingcontainerdetailVM)} should not be null or empty" });
            }
            else if (string.IsNullOrEmpty(blNumber))
            {
                return Json(new { success = false, message = $"BL Number should not be null or empty." });
            }

            try
            {
                await shippingService.UpdateBLShippingContainerDetailAsync(blshippingcontainerdetailVM, blNumber);
                return Json(new { success = true, message = "Saved Successfully" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


    }
}