using BA_ERPMVC.BusinessLayer.OrderBooking;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    public class BLShippingLineController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        ApiResponse _apiResponse = new ApiResponse();
        private readonly OrderBookingService orderBookingService;

        public BLShippingLineController()
        {
            orderBookingService = new OrderBookingService();
        }
        // GET: BLShippingLine
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult GetContainerNo()
        {
            var data =  Json(db.BLShippingContainers.Where(x => x.IsDeleted == false).Select(x => new
            {
                ContainerNo = x.ContainerNo
            }).ToList(), JsonRequestBehavior.AllowGet);
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
                        a.ContainerNo = obj.ContainerNo;
                        a.SealNo = obj.SealNo;
                        a.NumberOfConatinerPack = obj.NumberOfConatinerPack;
                        a.KindOfPackagesDescriptionOfGoods = obj.KindOfPackagesDescriptionOfGoods;
                        a.GrossWeight = obj.GrossWeight;
                        a.NetWeight = obj.NetWeight;
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

                                    responseText = "BL/CRO no already exist.";
                                }
                                else
                                {
                                    //  _apiResponse.statusCode = "00";
                                    //    obj.CreateDate = DateTime.Now.ToString();
                                    //  obj.UserID = Session["UserName"].ToString();
                                    obj.CreateDate = DateTime.Now.ToString();
                                    obj.UserID = Session["UserName"].ToString();
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

                var BL = from opo in db.BAShippingLines.Where(a => a.BLShippingID == id)
                             // join VV in db.stp_Status on opo.Approval equals VV.StatusID
                         select new
                         {
                             ID = opo.BLShippingID,
                             bl = opo.BL,
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
                             ContainerNo = opo.ContainerNo,
                             SealNo = opo.SealNo,
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

                         };


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
                              ContainerNo = opo.ContainerNo,
                              SealNo = opo.SealNo,
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

                          }).ToList().OrderByDescending(x=> x.ID);

                return Json(new { BL });
            }

        }

        public ActionResult PrintGDReport(int id)
        {
            ERPMVCEntities context = new ERPMVCEntities();

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BLReport.rpt"));
            var data = context.BAShippingLines.Where(x => x.BLShippingID == id).Select(c => new
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
                ContainerNo = c.ContainerNo,
                SealNo = c.SealNo,
                NumberOfConatinerPack = c.NumberOfConatinerPack,
                KindOfPackagesDescriptionOfGoods = c.KindOfPackagesDescriptionOfGoods,
                GrossWeight = c.GrossWeight,
                NetWeight = c.NetWeight,
                Frightandcharges = c.Frightandcharges,
                FrightPayable = c.FrightPayable,
                TypeOfService = c.TypeOfService,
                NumberOfOrignalBL = c.NumberOfOrignalBL,
                PlaceOfIssue = c.PlaceOfIssue,
                Collect = c.Collect,
                DateOfIssue = c.DateOfIssue.ToString(),
                BLAgent = c.BLAgent,
                BLAgentDetail= context.BLAgentDetails.Where(x=> x.BLAgent== c.BLAgent).Select(x=> x.BLAgentDetail1).FirstOrDefault()
                //BLAgent = $"{c.BLAgent} /n {c.DateOfIssue.ToString()}",

            }).ToList();
            rd.SetDataSource(data);
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            rd.PrintOptions.PaperOrientation = CrystalDecisions.Shared.PaperOrientation.Landscape;
            rd.PrintOptions.ApplyPageMargins(new CrystalDecisions.Shared.PageMargins(4, 4, 4, 4));
            rd.PrintOptions.PaperSize = CrystalDecisions.Shared.PaperSize.PaperA5;

            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);

            return File(stream, "application/pdf", $"BL_{data.Select(x=> x.BL).FirstOrDefault()}.pdf");
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



    }
}