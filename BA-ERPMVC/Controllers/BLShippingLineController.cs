using BA_ERPMVC.Extensions;
using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    public class BLShippingLineController : Controller
    {
        ERPMVCEntities db = new ERPMVCEntities();
        ApiResponse _apiResponse = new ApiResponse();
        // GET: BLShippingLine
        public ActionResult Index()
        {
            return View();
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
                        a.Approval = obj.Approval;
                        a.Shipper = obj.Shipper;
                        a.Consignee = obj.Consignee;
                        a.NotifyParty = obj.NotifyParty;
                        a.precarriageby = obj.precarriageby;
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
                        a.TypeOfService = obj.TypeOfService;
                        a.NumberOfOrignalBL = obj.NumberOfOrignalBL;
                        a.FrightPayable = obj.FrightPayable;
                        a.placeOfDateofIssue = obj.placeOfDateofIssue;
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
                                    obj.Approval = 1;
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
                                obj.Approval = 1;
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
                              join VV in db.stp_Status on opo.Approval equals VV.StatusID
                              select new
                              {
                                 ID = opo.BLShippingID,
                                 bl = opo.BL,
                                 Approv = opo.Approval,
                                 shipper = opo.Shipper,
                                 consignee = opo.Consignee,
                                 notifyParty = opo.NotifyParty,
                                 precarriageby = opo.precarriageby,
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
                                 TypeOfService = opo.TypeOfService,
                                 NumberOfOrignalBL = opo.NumberOfOrignalBL,
                                 FrightPayable = opo.FrightPayable,
                                 placeOfDateofIssue = opo.placeOfDateofIssue,

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
                                join VV in db.stp_Status on opo.Approval equals VV.StatusID
                                select new
                                {
                                    ID = opo.BLShippingID,
                                    bl = opo.BL,
                                    Approv = VV.Status, 
                                    shipper = opo.Shipper,
                                    consignee = opo.Consignee,
                                    notifyParty = opo.NotifyParty,
                                    precarriageby = opo.precarriageby,
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
                                    TypeOfService = opo.TypeOfService,
                                    NumberOfOrignalBL = opo.NumberOfOrignalBL,
                                    FrightPayable = opo.FrightPayable,
                                    placeOfDateofIssue = opo.placeOfDateofIssue,

                                }).ToList();

                return Json(new { BL });
            }

        }






    }
}