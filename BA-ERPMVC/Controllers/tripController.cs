using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.BusinessLayer;
using System.Web.Mvc;
using BA_ERPMVC.Extensions;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class tripController : Controller
    {
        TripServices ts = null;
        ERPMVCEntities db = null;
        ApiResponse _apiResponse = null;
        public tripController()
        {
            db = new ERPMVCEntities();
            ts = new TripServices();
            _apiResponse = new ApiResponse();
        }





        public JsonResult UpdateTripDetailsDeilivery(BAtrip tvm)
        {
            //int Customerid = 0;
            //tvm.CreatedBy = Session["UserName"].ToString();
            //tvm.CreateDate = DateTime.Today.Date;
            //Customerid = ts.AddCustPrice(tvm);

            var responseText = "";
            var done = 0;
            try
            {
                BAtrip a = db.BAtrips.First(i => i.ID == tvm.ID);


                a.Trip_ID = tvm.Trip_ID;
                a.Operation_Date = tvm.Operation_Date;
                //a.Order_ID = tvm.Order_ID;
                ////  a.CustomerID = tvm.CustomerID;
                //a.CountainerNo_ID = tvm.CountainerNo_ID;
                //if (a.CountainerNo2_ID == "")
                //{
                //    tvm.CountainerNo2_ID = "";
                //}
                //else
                //{
                //    tvm.CountainerNo2_ID = tvm.CountainerNo2_ID.ToString();
                //}
                ////  a.CountainerNo2_ID = tvm.CountainerNo2_ID;
                //a.FromLocation = tvm.FromLocation;
                //a.Tolocation = tvm.Tolocation;
                //if (a.CurrentFromLocation == null)
                //{
                //    tvm.CurrentFromLocation = "";
                //}
                //else
                //{
                //    tvm.CurrentFromLocation = tvm.CurrentFromLocation.ToString();
                //}
                // a.CurrentFromLocation = tvm.CurrentFromLocation;
                //if (a.CurrentToLocation == null)
                //{
                //    tvm.CurrentToLocation = "";
                //}
                //else
                //{
                //    tvm.CurrentToLocation = tvm.CurrentToLocation.ToString();
                //}
                //  a.CurrentToLocation = tvm.CurrentToLocation;
                a.Drive_ID = tvm.Drive_ID;
                a.Driver2_ID = tvm.Driver2_ID;
                a.Vechial_ID = tvm.Vechial_ID;
                a.RecivedDate = DateTime.Now;
                a.ContainerStatus = tvm.ContainerStatus;
                a.IsActive = true;
               // a.ContainerStatus = 1;
                a.UpdatedBy = Session["UserName"].ToString();
                //a.CreatedDate = tvm.CreateDate;
                done = db.SaveChanges();
                responseText = "Data Updated Successfully.";

                return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception E)
            {

                return Json(new { success = false, E }, JsonRequestBehavior.AllowGet);
            }

        }







        [HttpPost]
        public JsonResult UpdateExpenseFacilityDeilivery(int[] Expenseid, int[] price, string[] remarks, int TripID)
        {
            ts.DeleteExpenses(TripID);
            int prc = 0;
            for (int i = 0; i < Expenseid.Length; i++)
            {
                BAExpensesDetail _BAExpensesDetail = new BAExpensesDetail();
                _BAExpensesDetail.TripId = TripID;
                _BAExpensesDetail.price = price[i];
                _BAExpensesDetail.Remarks = remarks[i];
                _BAExpensesDetail.ExpenseId = Expenseid[i];
                prc = prc + price[i];
                _apiResponse.statusCode = ts.UpdateExpenseById(_BAExpensesDetail);
                BAtrip b = db.BAtrips.First(a => a.ID == TripID);

                b.TotalExpense = prc;
                db.SaveChanges();
                if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
                {
                    _apiResponse.message = StatusCode.SUCCESS_DESCRIPTION;
                }
                else
                {
                    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                }
            }

            return Json(_apiResponse);
        }






        [HttpPost]
        public JsonResult DeleteTrip(int TripId)
        {
            _apiResponse.statusCode = ts.DeleteTrip(TripId);
            if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
            {
                _apiResponse.message = StatusCode.DELETE_DESCRIPTION;
            }
            else
            {
                _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

            }
            return Json(_apiResponse);
        }




        public JsonResult UpdateTripDetails(BAtrip tvm)
        {
            //int Customerid = 0;
            //tvm.CreatedBy = Session["UserName"].ToString();
            //tvm.CreateDate = DateTime.Today.Date;
            //Customerid = ts.AddCustPrice(tvm);

            var responseText = "";
            var done = 0;
            try
            {
                BAtrip a = db.BAtrips.First(i => i.ID == tvm.ID);


                a.Trip_ID = tvm.Trip_ID;
                a.Operation_Date = tvm.Operation_Date;
                a.Logistics_ID = tvm.Logistics_ID;
                //a.Order_ID = tvm.Order_ID;
                //  a.CustomerID = tvm.CustomerID;
                //a.CountainerNo_ID = tvm.CountainerNo_ID;
                //if (a.CountainerNo2_ID == "")
                //{
                //    tvm.CountainerNo2_ID = "";
                //}
                //else
                //{
                //    tvm.CountainerNo2_ID = tvm.CountainerNo2_ID.ToString();
                //}
              //  a.CountainerNo2_ID = tvm.CountainerNo2_ID;
                //a.FromLocation = tvm.FromLocation;
                //a.Tolocation = tvm.Tolocation;
                //if (a.CurrentFromLocation == null)
                //{
                //    tvm.CurrentFromLocation = "";
                //}
                //else {
                //    tvm.CurrentFromLocation = tvm.CurrentFromLocation.ToString();
                //}
                // a.CurrentFromLocation = tvm.CurrentFromLocation;
                //if (a.CurrentToLocation == null)
                //{
                //    tvm.CurrentToLocation = "";
                //}
                //else
                //{
                //    tvm.CurrentToLocation = tvm.CurrentToLocation.ToString();
                //}
              //  a.CurrentToLocation = tvm.CurrentToLocation;
                a.Drive_ID = tvm.Drive_ID;
                a.Driver2_ID = tvm.Driver2_ID;
                a.Vechial_ID = tvm.Vechial_ID;
                a.RecivedDate = tvm.RecivedDate;
                a.IsActive = true;
                a.ContainerStatus = 1;
                a.UpdatedBy = Session["UserName"].ToString();
                //a.CreatedDate = tvm.CreateDate;
                done = db.SaveChanges();
                responseText = "Data Updated Successfully.";

                return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception E)
            {

                return Json(new { success = false, E }, JsonRequestBehavior.AllowGet);
            }

        }







        [HttpPost]
        public JsonResult GetContainerStatus()
        {

            var result = db.ContainerStatus.Select(x => new
            {
                CID = x.id,
                CConatinerStatus = x.ContainerStatus
            }).ToList();
            return Json(new { result });

        }




        public ActionResult GetContainerNo()
        {

            var result = (from opo in db.Logistics.Where(a => a.IsActive == true)
                          select new
                          {
                              ContainerID = opo.logisticsid,
                              ContainerNo = opo.ContainerNo

                          }).ToList();
            return Json(result);

        }



        [HttpPost]
        public JsonResult getContainerbyid(int id)
        {

            var result = (from opo in db.Logistics.Where(a => a.OrderId == id && a.IsActive == true)
                               // join vt in db.Logistics on opo.ContainerNo equals vt.OrderId
                          select new
                          {
                              logi = opo.logisticsid,
                              CNo = opo.ContainerNo,
                              Cno2 = opo.ContainerNo2,
                           //   CNo2 = opo.ContainerNo2

                          }).ToList();
            return Json(result);

        }

        [HttpPost]
        public JsonResult getContainer2byid(int id)
        {

            var result = (from opo in db.Logistics.Where(a => a.logisticsid == id && a.IsActive == true)
                              //  join vt in db.BACustomerRegistrations on opo.CustomerID equals vt.CustomerID
                          select new
                          {
                            //  CNo = opo.ContainerNo,
                              CNo2 = opo.ContainerNo2,
                              fromloc = opo.FromLocation,
                              toloc = opo.ToLocation,
                              containerWeight = opo.ContainerWeight
                              //   CNo2 = opo.ContainerNo2

                          }).ToList();
            return Json(result);

        }


        public ActionResult GetOrderContainer()
        {

            return Json(db.Logistics.Where(x => x.IsActive == true).Select(a => new
            {

                LID = a.logisticsid,
                OLID = a.OrderId


            }).ToList(), JsonRequestBehavior.AllowGet);

        }


        [HttpPost]
        public JsonResult TripID()
        {
            string Orderno = "";
            string code = "";
            Int64 maxValue = 0;

            Orderno = db.BAtrips.OrderByDescending(x => x.Trip_ID).Select(x => x.Trip_ID).FirstOrDefault();
            if (Orderno != null || Orderno == "")
            {
                Int64 ordernumber = Convert.ToInt64(Orderno);
                maxValue = ordernumber;
                maxValue++;
            }
            else
            {
                maxValue = 1;

            }
            code = maxValue.ToString("000000");



            return Json(code);
        }


        public ActionResult GetDriver()
        {

            var result = (from opo in db.Employees.Where(a => a.DesignationId == 44)
                          select new
                          {
                              Eid = opo.EmployeeID,
                              Ename = opo.Employee_FirstName + " " + opo.Employee_LastName

                          }).ToList();
            return Json(result);

        }


        public ActionResult GetVehicle()
        {

            var result = (from opo in db.VehicleRegistrationDetails.Where(a =>  a.IsActive == true)
                          select new
                          {
                              vehicleid = opo.VehicleID,
                              vehicleno = opo.Vehicle_Number

                          }).ToList();
            return Json(result);

        }



        public ActionResult GetContainers()
        {

            var result = (from opo in db.Logistics//.Where(a => a.IsActive == true)
                          select new
                          {
                              logisID = opo.logisticsid,
                              ContainerNo1 = opo.ContainerNo

                          }).ToList();
            return Json(result);

        }


        public ActionResult GetExpenses()
        {

            var result = (from opo in db.BAExpensesDropDowns.Where(a => a.IsActive == true)
                          select new
                          {
                              Expenseid = opo.id,
                              ID = opo.id,
                              expensename = opo.ExpenseName,
                              expenseprice = opo.ExpensePrice
                              


                          }).ToList();
            return Json(result);

        }



        public ActionResult GetExpensesBytripId(int id)
        {

            var result = (from opo in db.BAExpensesDropDowns.Where(a => a.IsActive == true)
                          join s in db.Order_Expense_Mapping on opo.id equals s.ExpenseId into tbl1
                          from d in tbl1.ToList().Where(a => a.OrderId == id)//.Where(a=> a.OrderId == id && a.ExpenseId == opo.id)
                          select new
                          {
                              Expenseid = opo.id,
                              ID = opo.id,
                              expensename = opo.ExpenseName,
                              //expenseprice = s.ExpensePrice,

                              //Expenseid = s.id,
                              //ID = s.id,
                              //expensename = s.ExpenseName,
                              ifd = d.OEId,
                              // orderID = d.OrderId,
                              expenseprice = d.Rates

                          }).ToList();
            return Json(result);
        }

        [HttpPost]
        public JsonResult AddTripDetails(TripViewModel tvm)
        {
            DateTime? dt = null;
            int TripID = 0;
            _apiResponse.statusCode = "11";
            string statuscode = "11";
            tvm.ContainerStatus = 1;
            if (tvm.Driver2_ID == null)
            {
                tvm.Driver2_ID = null;
            }
            else {
                tvm.Driver2_ID = tvm.Driver2_ID;

            }

            //if (tvm.CountainerNo2_ID == null)
            //{
            //    tvm.CountainerNo2_ID = "";
            //}
            //else
            //{
            //    tvm.CountainerNo2_ID = tvm.CountainerNo2_ID.ToString();
            //}
            //tvm.FromLocation = tvm.FromLocation.ToString();
            //tvm.Tolocation = tvm.Tolocation.ToString();
            //if (tvm.CurrentFromLocation == null)
            //{
            //    tvm.CurrentFromLocation = null;
            //}
            //else
            //{
            //    tvm.CurrentFromLocation = tvm.CurrentFromLocation.ToString();
            //}
            //if (tvm.CurrentToLocation == null)
            //{
            //    tvm.CurrentToLocation = null;
            //}
            //else
            //{
            //    tvm.CurrentToLocation = tvm.CurrentToLocation.ToString();
            //}
           // tvm.Logistics_ID = tvm.Logistics_ID

            DateTime? nullableDateTime = null;
            if (nullableDateTime.HasValue)
            {
                tvm.RecivedDate = nullableDateTime;
            }

             //   Console.WriteLine(nullableDateTime.Value.ToShortDateString());



            tvm.IsActive = true;
           
            tvm.CreatedBy = Session["Username"].ToString();
            tvm.CreatedDate = DateTime.Today.Date;
            TripID = ts.Addtrip(tvm);
       //     _apiResponse.data = ts.Addtrip(tvm);

            
            return Json(TripID);
        }



        [HttpPost]
        public JsonResult UpdateExpenseFacility(int[] Expenseid, int[] price, string[] remarks, int TripID)
        {
            ts.DeleteExpenses(TripID);
            int prc = 0;
            for (int i = 0; i < Expenseid.Length; i++)
            {
                BAExpensesDetail _BAExpensesDetail = new BAExpensesDetail();
                _BAExpensesDetail.TripId = TripID;
                _BAExpensesDetail.price = price[i];
                _BAExpensesDetail.ExpenseId = Expenseid[i];
                _BAExpensesDetail.Remarks = remarks[i];
                 prc = prc + price[i];
                _apiResponse.statusCode = ts.UpdateExpenseById(_BAExpensesDetail);
                BAtrip b = db.BAtrips.First(a => a.ID == TripID);

                b.TotalExpense = prc;
                db.SaveChanges();
                if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
                {
                    _apiResponse.message = StatusCode.SUCCESS_DESCRIPTION;
                }
                else
                {
                    _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

                }
            }

            return Json(_apiResponse);
        }




        public JsonResult AddTripExpense(int[] Expenseid, int[] price, string[] remarks, int OrderID)
        {
            string statusCode = "11";
            int prc = 0;
            string pcr = "null";
            for (int i = 0; i < Expenseid.Length; i++)
            {
                prc = prc + price[i];
               // pcr = pcr + Remarks[i];
                statusCode = ts.AddExpenses(Expenseid[i], price[i], remarks[i], OrderID);
            }


            BAtrip b = db.BAtrips.First(a => a.ID == OrderID);

            b.TotalExpense = prc;
           Logistic lg = db.Logistics.First(a => a.logisticsid == b.Logistics_ID);
           // Logistic lgs = db.Logistics.First(a => a.OrderId == b.Order_ID && a.ContainerNo2 == b.CountainerNo2_ID );
           // lgs.IsActive = false;
            lg.ContainerTripStatus = 2;
            db.SaveChanges();



            return Json(statusCode);
        }






        [HttpPost]
        public JsonResult EditeTripByID(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var tripById = from opo in db.BAtrips.Where(a => a.ID == id)
                                join XV in db.BAExpensesDetails on opo.ID equals XV.TripId
                                join VP in db.BAExpensesDropDowns on XV.ExpenseId equals VP.id
                                join logisc in db.Logistics on opo.Logistics_ID equals logisc.logisticsid
                                join ZX in db.Logistics on logisc.OrderId equals ZX.OrderId
                                join CC in db.ContainerStatus on opo.ContainerStatus equals CC.id
                                select new
                                {
                                    TID = opo.ID,
                                    TCode = opo.Trip_ID,
                                    TOperation = opo.Operation_Date,
                                    TOrderId = logisc.OrderId,
                                    TContainerNo1 = logisc.logisticsid,
                                    TContainer2 = logisc.ContainerNo2,
                                    TFromLoc = logisc.FromLocation,
                                    TToLoc = logisc.ToLocation,
                                    TRecivedDate = opo.RecivedDate,
                                    TDriverID2 = opo.Driver2_ID,
                                    //TCurrentToLoc = opo.CurrentToLocation,
                                    //TCurrentFromloc = opo.CurrentFromLocation,
                                    TDrive = opo.Drive_ID,
                                    TVecheilId = opo.Vechial_ID,
                                    CContainerStatus = opo.ContainerStatus,
                                    ETripID = XV.ExpenseId,
                                    EPrice = XV.price,
                                    ERemarks = XV.Remarks,



                                };
                return Json(new { result = tripById.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }









    }
}