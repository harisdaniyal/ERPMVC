using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BA_ERPMVC.Models;
using System.Data.Entity;
using BA_ERPMVC.BusinessLayer;
using System.Threading.Tasks;
using System.IO;
using System.Data;
using BA_ERPMVC.Extensions;
using MasterLayer;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class salesController : Controller
    {
        // GET: sales
        OrderBookingServices _orderService;

        ERPMVCEntities db = null;
        ApiResponse _apiResponse = null;
        public salesController()
        {
            db = new ERPMVCEntities();
            _orderService = new OrderBookingServices();
            _apiResponse = new ApiResponse();
        }

        public ActionResult OrderBooking()
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
        public ActionResult StepwiseOrderCreation()
        {
            return View();
        }

        public ActionResult UpcommingTrips()
        {


            return View();

        }



        //[HttpPost]
        //public JsonResult DeleteGenrateOrder(int TripId)
        //{
        //    _apiResponse.statusCode = _orderService.DeleteTrip(TripId);
        //    if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
        //    {
        //        _apiResponse.message = StatusCode.DELETE_DESCRIPTION;
        //    }
        //    else
        //    {
        //        _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

        //    }
        //    return Json(_apiResponse);
        //}



        // GET: DropDown
        [HttpPost]
        public JsonResult GetContainerWeight()
        {

            var result = db.tbl_ContainerWeightCategory.Select(x => new
            {
                CID = x.ID,
                CWwight = x.ContainerWeight
            }).ToList();
            return Json(new { result });

        }




        public JsonResult UpdateOrderBooking(GenerateOrder tvm)
        {
            //int Customerid = 0;
            //tvm.CreatedBy = Session["UserName"].ToString();
            //tvm.CreateDate = DateTime.Today.Date;
            //Customerid = ts.AddCustPrice(tvm);

            var responseText = "";
            var done = 0;
            try
            {
                GenerateOrder a = db.GenerateOrders.First(i => i.OrderID == tvm.OrderID);


                a.OrderNo = tvm.OrderNo;
                a.CustomerID = tvm.CustomerID;
                a.BusinessDivisionId = tvm.BusinessDivisionId;
                //  a.CustomerID = tvm.CustomerID;
                a.OrderType = tvm.OrderType;
                a.BL = tvm.BL;
                a.CRO = tvm.CRO;
                a.InBond_Number = tvm.InBond_Number;
                a.DeliveryNo = tvm.DeliveryNo;
                a.OrderDate = tvm.OrderDate;
                // a.IsActive = true;
                // a. = Session["UserName"].ToString();
                //a.CreatedDate = tvm.CreateDate;
                a.isActive = true;
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
        public JsonResult UpdateOrderBookingFacility(int[] FacilityID, int OrderID)
        {
            _orderService.DeleteExpenses(OrderID);
            for (int i = 0; i < FacilityID.Length; i++)
            {
                Order_FacilityMapping _order_FacilityMapping = new Order_FacilityMapping();
                _order_FacilityMapping.OrderID = OrderID;
                _order_FacilityMapping.FacilityID = FacilityID[i];
                _apiResponse.statusCode = _orderService.UpdateFacilityById(_order_FacilityMapping);
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

        //Update
      //  [HttpPost]
        //public JsonResult UpdateOrderBookingFacility(Order_FacilityMapping order_FacilityMapping)
        //{
        //    //string statusCode = "11";
        //    //for (int i = 0; i < FacilityID.Length; i++)
        //    //{
        //    //    statusCode = _orderService.UpdateFacility(order_FacilityMapping);
        //    //}
        // //   for (int i = 0; i < FacilityID.Length; i++)
        //  //  {
        //        _apiResponse.statusCode = _orderService.UpdateFacilityType(order_FacilityMapping);
        //  //  }
        //    if (_apiResponse.statusCode == StatusCode.SUCCESS_CODE)
        //    {
        //        _apiResponse.message = StatusCode.SUCCESS_DESCRIPTION;
        //    }
        //    else
        //    {
        //        _apiResponse.message = StatusCode.ERROR_DESCRIPTION;

        //    }


        //    return Json(_apiResponse);
        //}

        //Update



        //public JsonResult UpdateOrderBookingFacility(Order_FacilityMapping tvm)
        //{
        //    //int Customerid = 0;
        //    //tvm.CreatedBy = Session["UserName"].ToString();
        //    //tvm.CreateDate = DateTime.Today.Date;
        //    //Customerid = ts.AddCustPrice(tvm);

        //    var responseText = "";
        //    var done = 0;
        //    try
        //    {
        //        Order_FacilityMapping a = db.Order_FacilityMapping.First(i => i.OFId == tvm.OFId);

        //        a.FacilityID = tvm.FacilityID;
        //        a.OrderID = tvm.OrderID;
        //        // a.IsActive = true;
        //        // a. = Session["UserName"].ToString();
        //        //a.CreatedDate = tvm.CreateDate;
        //        done = db.SaveChanges();
        //        responseText = "Data Updated Successfully.";

        //        return Json(new { success = true, responseText }, JsonRequestBehavior.AllowGet);
        //    }
        //    catch (Exception E)
        //    {

        //        return Json(new { success = false, E }, JsonRequestBehavior.AllowGet);
        //    }

        //}








        [HttpPost]
        public JsonResult AddorUpdateOrderBooking(OrderBookingViewModel OrderVmodel)
        {
            int OrderID = 0;
            _apiResponse.statusCode = "11";
            var isExistOrderNo = _orderService.GetAll().Where(x => x.OrderNo == OrderVmodel.OrderNo).FirstOrDefault();
            if (isExistOrderNo == null)
            {
                if (OrderVmodel.BL != null)
                {
                    var isExistBLCRO = _orderService.GetAll().Where(x => x.BL == OrderVmodel.BL).FirstOrDefault();
                    if (isExistBLCRO != null)
                    {

                        _apiResponse.message = "BL/CRO no already exist";

                    }
                    else
                    {
                        _apiResponse.statusCode = "00";
                        _apiResponse.data = _orderService.AddOrder(OrderVmodel);
                    }
                }
                else if (OrderVmodel.CRO != null)
                {
                    var isExistBLCRO = _orderService.GetAll().Where(x => x.CRO == OrderVmodel.CRO).FirstOrDefault();
                    if (isExistBLCRO != null)
                    {

                        _apiResponse.message = "BL/CRO no already exist";

                    }
                    else
                    {
                        _apiResponse.statusCode = "00";
                        _apiResponse.data = _orderService.AddOrder(OrderVmodel);
                    }
                }
                else if (OrderVmodel.DeliveryNo != null)
                {
                    var isExistBLCRO = _orderService.GetAll().Where(x => x.DeliveryNo == OrderVmodel.DeliveryNo).FirstOrDefault();
                    if (isExistBLCRO != null)
                    {
                        _apiResponse.message = "Delivery No already exist";
                    }
                    else
                    {
                        _apiResponse.statusCode = "00";
                        _apiResponse.data = _orderService.AddOrder(OrderVmodel);
                    }
                }
                else if (OrderVmodel.InBond_Number != null)
                {
                    var isExistBLCRO = _orderService.GetAll().Where(x => x.InBond_Number == OrderVmodel.InBond_Number).FirstOrDefault();
                    if (isExistBLCRO != null)
                    {
                        _apiResponse.message = "In-Bond Number already exist";
                    }
                    else
                    {
                        _apiResponse.statusCode = "00";
                        _apiResponse.data = _orderService.AddOrder(OrderVmodel);
                    }
                }
                else
                {
                    _apiResponse.statusCode = "00";
                    _apiResponse.data = _orderService.AddOrder(OrderVmodel);
                }

            }
            else
            {
                _apiResponse.message = "Order No already exist";
            }

           
            return Json(_apiResponse);
        }
        [HttpPost]
        public JsonResult AddFacilityByOrderID(int[] FacilityID, int OrderID)
        {
            string statusCode = "11";
            for (int i = 0; i < FacilityID.Length; i++)
            {
                statusCode = _orderService.AddFacility(FacilityID[i], OrderID);
            }


            return Json(statusCode);
        }
        //Here are we had set to receive two parameter FormCollection and Model  




        [HttpPost]
        public JsonResult AddExpenseByOrderID(int[] ExpenseID, string[] Rates, int OrderID)
        {
            string statusCode = "11";
            if (ExpenseID != null)
            {

                for (int i = 0; i < ExpenseID.Length; i++)
                {
                    statusCode = _orderService.AddFacilityExpense(ExpenseID[i], Rates[i], OrderID);
                }


            }
            else
            {


                _apiResponse.message = "Order No already exist";




            }



            return Json(statusCode);
        }

        public ActionResult LocalLogisticOperation()
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

        public ActionResult TripDetails()
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

        public ActionResult getDepartment()
        {

            return Json(db.stp_Customer.Select(x => new
            {
                CustomerID = x.CustomerID,
                CustomerName = x.CustomerName
            }).ToList(), JsonRequestBehavior.AllowGet);

        }
        //public List<MenuViewModel> SideMenu()
        //{
        //    using (ERPMVCEntities db = new ERPMVCEntities())
        //    {
        //        int Role = Convert.ToInt32(Session["RoleID"]);
        //        var permissions = (from Menu in db.Menus
        //                           join role in db.Role_Menu_Mapdping on Menu.Menu_ID equals role.Menu_ID
        //                           where role.Role_ID.Equals(Role)
        //                           orderby Menu.Menu_ID
        //                           select new MenuViewModel
        //                           {
        //                               Url = Menu.Url,
        //                               Menu_Caption = Menu.Menu_Caption,
        //                               ParentID = Menu.ParentID,
        //                               isParent = Menu.isParent,
        //                               Menu_ID = Menu.Menu_ID,
        //                               SubMenu = Menu.SubMenu
        //                           }).ToList();

        //        return permissions;
        //    }
        //}
        [HttpPost]
        public JsonResult getcustomerbyid(int id)
        {

            dynamic result = null;
            OrderGridViewModels orderGridServicesModel = _orderService.GetOrderServiceDetail();
            result = from e in orderGridServicesModel.OrderDetail
                     join d in orderGridServicesModel.DivisionList on e.BusinessDivisionId equals d.BusinessDivisionID into table1
                     from d in table1.ToList()
                     join i in orderGridServicesModel.CustomerList on e.CustomerID equals i.CustomerID into table2
                     from i in table2.ToList()
                     where e.OrderID == id
                     select new
                     {

                         e.OrderDate,
                         e.OrderType,
                         i.Customer_Name,
                         e.BL,
                         e.CRO
                     };
            return Json(result);


        }



        public FileResult Download(string filename)

        {

            string path = Server.MapPath("~/AdminLte/File/ExcelTransport.xlsx")+ filename;
            // string filename = Path.GetFileName("ExcelTransport.xlsx");
            byte[] bytes = System.IO.File.ReadAllBytes(path);
            return File(bytes, "application/octet-stream", filename);
           

        }


        public ActionResult GetConatinerStatus()
        {
            using (ERPMVCEntities db = new ERPMVCEntities())
            {
                return Json(db.stp_ContainerStatus.Select(x => new
                {
                    CID = x.ID,
                    CSTATUS = x.STATUS
                }).ToList(), JsonRequestBehavior.AllowGet);
            }
        }






        public JsonResult UpdateLogistics(Logistic obj)
        {
            var responseText = " ";
            var done = 0;
            try
            {


                Logistic a = db.Logistics.First(i => i.logisticsid == obj.logisticsid);

                a.ContainerNo = obj.ContainerNo;
                a.ContainerNo2 = obj.ContainerNo2;
                a.ContainerWeight = obj.ContainerWeight;
                a.ContainerSize = obj.ContainerSize;
                a.FromLocation = obj.FromLocation;
                a.ToLocation = obj.ToLocation;
                a.JobType = obj.JobType;
              //  a.ContainerTripStatus = obj.ContainerTripStatus;
                a.UpdatedBy = Session["UserName"].ToString();
                a.Qty = obj.Qty;

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
        public JsonResult getlogisticbyid(int id)
        {
            var result = (from opo in db.Logistics.Where(a => a.logisticsid == id)
                          join vt in db.GenerateOrders on opo.OrderId equals vt.OrderID
                          join zz in db.BACustomerRegistrations on vt.CustomerID equals zz.CustomerID
                          join yy in db.stp_Facility on opo.OrderServiceId equals yy.facilityID
                          where opo.IsActive == true
                          select new
                          {
                              logisticsid = opo.logisticsid,
                              cname = zz.Customer_Name,
                              flocation = opo.FromLocation,
                              tlocation = opo.ToLocation,
                              jobtype = opo.JobType,
                              cno = opo.ContainerNo,
                              cno2 = opo.ContainerNo2,
                              conWeight = opo.ContainerWeight,
                              csize = opo.ContainerSize,
                              orderid = vt.OrderNo,
                              service = yy.FacilityName,
                              quantity = opo.Qty,
                          //    ContainerTripStatus = opo.tbl_Container_logistics_Status.ID
                          }).ToList();
            //var result = (from opo in db.Logistics.Where(a => a.logisticsid == id)
            //              join vt in db.GenerateOrders on opo.OrderId equals vt.OrderID
            //              join zz in db.BACustomerRegistrations on vt.CustomerID equals zz.CustomerID
            //              join yy in db.OrderServices on opo.OrderServiceId equals yy.OrderServiceID


            //              select new
            //              {
            //                 logisticsid=opo.logisticsid,
            //                 cname= zz.Customer_Name,
            //                 flocation=opo.FromLocation,
            //                 tlocation=opo.ToLocation,
            //                 jobtype=opo.JobType,
            //                 cno=opo.ContainerNo,
            //                 csize=opo.ContainerSize,
            //                 orderid=vt.OrderID,
            //                 service=yy.ServiceType,
            //                 quantity=opo.Qty



            //              }).ToList();
            return Json(result);


        }

        [HttpPost]
        public JsonResult OrderNumber()
        {
            string Orderno = "";
            string code = "";
            Int64 maxValue = 0;

            Orderno = db.GenerateOrders.OrderByDescending(x => x.OrderNo).Select(x => x.OrderNo).FirstOrDefault();
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


        //ADD
        public ActionResult Addlogistics(Logistic lg, List<TempOrder> tp)
        {
            var done = 0;
            var responsetext = "";


            if (tp != null)
            {
                try
                {
                    foreach (TempOrder torder in tp)
                    {

                        lg.CreatedDate = DateTime.Now;
                        lg.CreatedBy = Session["username"].ToString();
                        lg.IsActive = true;

                        lg.ContainerNo = torder.containerno.ToString();
                        if (torder.containerno2 == null)
                        {
                            lg.ContainerNo2 = null;
                        }
                        else {
                            lg.ContainerNo2 = torder.containerno2.ToString();
                        }


                        
                        lg.ContainerSize = Convert.ToString(torder.containersize);
                        if (torder.containerWeight == null)
                        {
                            lg.ContainerWeight = null;
                        }
                        else
                        {
                            lg.ContainerWeight = torder.containerWeight;

                        }
                     
                        lg.ContainerTripStatus = 1;
                        //lg.ContainerWeight = Convert.ToString(torder.containerWeight);
                      //  lg.SingleDouble = Convert.ToString(torder.containerStatus);
                        if (torder.fromlocation == null && torder.tolocation == null)
                        {
                            lg.FromLocation = null;
                            lg.ToLocation = null;
                            if (torder.jobtype == "full" || torder.jobtype == "full" || torder.jobtype == "laden" || torder.jobtype == "laden")
                            {
                                lg.JobType = "laden";
                            }
                            else if (torder.jobtype == "empty")
                            {
                                lg.JobType = "empty";
                            }
                            else
                            {
                                lg.JobType = torder.jobtype.ToString();
                            }


                            if (torder.jobtype2 == "full" || torder.jobtype2 == "full" || torder.jobtype2 == "laden" || torder.jobtype2 == "laden")
                            {
                                lg.JobType2 = "laden";
                            }
                            else if (torder.jobtype2 == "empty")
                            {
                                lg.JobType2 = "empty";
                            }
                            else if (torder.jobtype2 == null)
                            {
                                lg.JobType2 = null;

                            }
                            else
                            {
                                lg.JobType2 = torder.jobtype2.ToString();
                            }

                            lg.Qty = 1;
                        }
                        else
                        {
                            lg.FromLocation = torder.fromlocation.ToString();
                            lg.ToLocation = torder.tolocation.ToString();
                            if (torder.jobtype == "full" || torder.jobtype == "full" || torder.jobtype == "laden" || torder.jobtype == "laden")
                            {
                                lg.JobType = "laden";
                            }
                            else if (torder.jobtype == "empty")
                            {
                                lg.JobType = "empty";
                            }
                            else
                            {
                                lg.JobType = torder.jobtype.ToString();
                            }



                            if (torder.jobtype2 == "full" || torder.jobtype2 == "full" || torder.jobtype2 == "laden" || torder.jobtype2 == "laden")
                            {
                                lg.JobType2 = "laden";
                            }
                            else if (torder.jobtype2 == "empty")
                            {
                                lg.JobType2 = "empty";
                            }else if (torder.jobtype2 == null)
                            {
                                lg.JobType2 = null;

                            }
                            else
                            {
                                lg.JobType2 = torder.jobtype2.ToString();
                            }



                            lg.Qty = 1;
                        }


                        db.Logistics.Add(lg);
                        done = db.SaveChanges();
                    }
                    responsetext = "data inserted successfully.";
                }
                catch (Exception e)
                {

                    return Json(new { success = false, responsetext = e }, JsonRequestBehavior.AllowGet);
                }
            }
            else if (tp == null)
            {
                try
                {

                    lg.CreatedDate = DateTime.Now;
                    lg.CreatedBy = Session["username"].ToString();
                    lg.IsActive = true;
                   // lg.SingleDouble = null;
                    lg.ContainerNo = null;
                    lg.ContainerNo2 = null;
                    lg.ContainerSize = null;
                    lg.FromLocation = null;
                    lg.ToLocation = null;
                    lg.ContainerWeight = null;
                    lg.ContainerTripStatus = null;
                    db.Logistics.Add(lg);
                    done = db.SaveChanges();
                    responsetext = "data inserted successfully.";
                }

                catch (Exception e)
                {

                    return Json(new { success = false, responsetext = e }, JsonRequestBehavior.AllowGet);
                }
            }


            if (done == 1)
            {

                return Json(new { success = true, responsetext }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = false, responsetext = "data not inserted successfully." }, JsonRequestBehavior.AllowGet);





        }
        //add
        //public ActionResult GetCustomers(string word, int page, int rows, string searchString, string sord)
        //{
        //    //#1 Create Instance of DatabaseContext class for Accessing Database.  

        //        int pageIndex = Convert.ToInt32(page) - 1;
        //        int pageSize = rows;
        //        //#2 Setting Paging  
        //        var Results = from opo in db.OrderPrcocessOtherExpenses
        //                      join cust in db.stp_Customer on opo.CustomerID equals cust.CustomerID into LEFTJOIN
        //                      from remain in LEFTJOIN.DefaultIfEmpty()
        //                      select new
        //                      {
        //                          opo.ContainerNo,
        //                          opo.OperationDate,
        //                          opo.OPOtherEID,
        //                          opo.WeightAmt,
        //                          opo.VehicleNo,
        //                          opo.ToLocation,
        //                          opo.OtherExpenseDesc,
        //                          opo.FromLocation,
        //                          opo.GatePassAmt,
        //                          opo.CreateDate,
        //                          remain.CustomerName
        //                      };


        //        //#3 Linq Query to Get Customer   
        //        int totalRecords = Results.Count();
        //        var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);

        //        if (sord.ToUpper() == "DESC")
        //        {

        //            Results = Results.OrderByDescending(s => s.OPOtherEID);
        //            Results = Results.Skip(pageIndex * pageSize).Take(pageSize);
        //        }
        //        else
        //        {
        //            Results = Results.OrderBy(s => s.OPOtherEID);
        //            Results = Results.Skip(pageIndex * pageSize).Take(pageSize);
        //        }
        //        //#6 Setting Search  
        //        if (!string.IsNullOrEmpty(searchString))
        //        {
        //            Results = Results.Where(m => m.VehicleNo == searchString || m.FromLocation == searchString || m.ToLocation == searchString || m.ContainerNo == searchString);
        //        }

        //        //#7 Sending Json Object to View.  
        //        var jsonData = new
        //        {
        //            total = totalPages,
        //            page,
        //            records = totalRecords,
        //            rows = Results.ToList()
        //        };


        //        //#4 Get Total Row Count  

        //        return Json(jsonData, JsonRequestBehavior.AllowGet);


        //}

        //[HttpPost]
        //public ActionResult GetCustomers()
        //{
        //    //#1 Create Instance of DatabaseContext class for Accessing Database.  
        //   //#2 Setting Paging  
        //        var Results = (from opo in db.OrderPrcocessOtherExpenses
        //                       join cust in db.stp_Customer on opo.CustomerID equals cust.CustomerID into LEFTJOIN
        //                       from remain in LEFTJOIN.DefaultIfEmpty()
        //                       select new
        //                       {
        //                           opo.ContainerNo,
        //                           opo.OperationDate,
        //                           opo.OPOtherEID,
        //                           opo.WeightAmt,
        //                           opo.VehicleNo,
        //                           opo.ToLocation,
        //                           opo.OtherExpenseDesc,
        //                           opo.FromLocation,
        //                           opo.GatePassAmt,
        //                           opo.CreateDate,
        //                           remain.CustomerName
        //                       }).ToList();

        //        //#4 Get Total Row Count  

        //        return Json(Results);


        //}

        //[HttpPost]
        //public ActionResult AddOrder(OrderPrcocessOtherExpense obj)
        //{


        //        db.OrderPrcocessOtherExpenses.Add(obj);
        //        var done = db.SaveChanges();
        //        if (done == 1)
        //        {
        //            return Json(new { success = true, responseText = "Data Inserted Successfully." }, JsonRequestBehavior.AllowGet);
        //        }
        //        return Json(new { success = false, responseText = "Data Not Inserted Successfully." }, JsonRequestBehavior.AllowGet);




        //}





        //[HttpPost]
        //public JsonResult getOrderViewById(int id)
        //{
        //    var result = (from opo in db.GenerateOrders.Where(a => a.OrderID == id)
        //               //   join vt in db.GenerateOrders on opo.OrderID equals vt.OrderID
        //                  join zz in db.BACustomerRegistrations on opo.CustomerID equals zz.CustomerID
        //                 // join yy in db.stp_Facility on opo.OrderID equals yy.facilityID
        //                  join pp in db.stp_BusinessDivision on opo.BusinessDevisionID equals pp.BusinessDivisionID
        //                 // where opo.IsActive == true
        //                  select new
        //                  {
        //                      OID = opo.OrderID,
        //                      ONo = opo.OrderNo,
        //                      OCustomer = zz.Customer_Name,
        //                      ObuinessDivision = pp.BusinessDivisionName,
        //                      Ordertype = opo.OrderType,
        //                      Oblcro = opo.BL_CRO,
        //                      OInbound = opo.InBond_Number,
        //                      ODelivery = opo.DeliveryNo,
        //                      OrderDate = opo.OrderDate,

        //                    //  orderid = vt.OrderNo,
        //                    //  service = yy.FacilityName,
        //                    //  quantity = opo.Qty
        //                  }).ToList();

        //    return Json(result);


        //}




        [HttpPost]
        public JsonResult EditeOrderBooking(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var SaleOrder = from opo in db.GenerateOrders.Where(a => a.OrderID == id)
                                join XV in db.Order_FacilityMapping on opo.OrderID equals XV.OrderID
                                // join VP in db.stp_Facility on opo.OrderID equals VP.

                                join CS in db.Order_Expense_Mapping on opo.OrderID equals CS.OrderId into vlist
                                from v in vlist.DefaultIfEmpty()
                                select new
                              {
                                  OID = opo.OrderID,
                                  OOrderNo = opo.OrderNo,
                                  OCustomerID = opo.CustomerID,
                                  OBussinessDivision = opo.BusinessDivisionId,
                                  OOrderType = opo.OrderType,
                                  OBLCRo = opo.BL,
                                  CRO = opo.CRO,
                                  OInbound = opo.InBond_Number,
                                  ODeilvery = opo.DeliveryNo,
                                  OOrderDate = opo.OrderDate,
                                  OrderFacilityid = XV.FacilityID,
                                  OrderIDfacility = XV.OrderID,
                                    OrderExpenseid = v.ExpenseId,
                                    OrderRates = v.Rates,
                                    OrderIDExpense = v.OrderId,


                                };
                return Json(new { result = SaleOrder.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }




        [HttpPost]
        public JsonResult EditeGetExpenseListById(int id)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var SaleOrder = from opo in db.Order_FacilityMapping.Where(a => a.OFId == id)
                                    //     join XV in db.GenerateOrders on opo.OrderID equals XV.OrderID
                                        join VP in db.stp_Facility on opo.FacilityID equals VP.facilityID
                                select new
                                {
                                    OID = opo.OFId,
                                    OCustomerID = opo.OrderID,
                                    OOrderNo = VP.FacilityName,

                                };
                return Json(new { result = SaleOrder.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }





        //[HttpPost]
        //public JsonResult GetExpenseListById(int id)
        //{
        //    var result = _orderService.GetAllExpenseMapping().Where(x => x.OFId == id).Select(x => new { x.OFId, x.ExpenseTypeId, x.tbl_ExpenseType.ExpenseNature });
        //    return Json(result);
        //}








        [HttpPost]
        public JsonResult GetOrderDetail()
        {
            dynamic result = null;

            OrderGridViewModels orderGridServicesModel = _orderService.GetOrderServiceDetail();
            result = from e in orderGridServicesModel.OrderDetail
                     join d in orderGridServicesModel.DivisionList on e.BusinessDivisionId equals d.BusinessDivisionID into table1
                     from d in table1.ToList()
                     join i in orderGridServicesModel.CustomerList on e.CustomerID equals i.CustomerID into table2
                     from i in table2.ToList()
                     select new
                     {
                         e.OrderID ,
                         e.OrderNo,
                         e.OrderDate,
                         e.OrderType,
                         e.InBond_Number,
                         e.DeliveryNo,
                         e.CreatedBy,
                         e.CreatedDate,
                         d.BusinessDivisionName,
                         i.Customer_Name,
                         e.BL,
                         e.CRO,
                     };
            //result = _orderService.GetOrderServiceDetail().Join(_dbContext.stp_BusinessDivision, x => x.BusinessDevisionID, y => y.BusinessDivisionID,
            //   (x, y) => new
            //   {
            //       y.BusinessDivisionName,
            //       x.CreatedBy,
            //       x.OrderID,
            //       x.OrderDate,
            //       x.OrderNo,
            //       x.OrderType,
            //       x.BusinessDevisionID,
            //       x.CustomerID,
            //       x.BL_CRO,
            //       x.DeliveryNo,
            //       x.InBond_Number,
            //       x.CreatedDate,

            //   }).ToList();
            return Json(new { result });
        }
        [HttpPost]
        public JsonResult DeleteLogistic(int LogisticID)
        {
            string statusCode = "11";
            Logistic a = db.Logistics.First(i => i.logisticsid == LogisticID);
            a.IsActive = false;

            db.Logistics.Attach(a);
            db.Entry(a).State = EntityState.Modified;
            int isDeleted = db.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return Json(statusCode);
        }
        //[HttpPost]
        //public ActionResult AddDetails(OrderPrcocessOtherExpense obj)
        //{

        //        db.OrderPrcocessOtherExpenses.Add(obj);
        //        var done = db.SaveChanges();
        //        if (done == 1)
        //        {
        //            return Json(new { success = true, responseText = "Data Inserted Successfully." }, JsonRequestBehavior.AllowGet);
        //        }
        //        return Json(new { success = false, responseText = "Data Not Inserted Successfully." }, JsonRequestBehavior.AllowGet);




        //}

        //public ActionResult PrintLogisticInvoice(DateTime FromDate, DateTime ToDate, string InvoiceNumber)
        //{
        //    var list = _orderService.PrintInvoiceDetail(FromDate, ToDate, InvoiceNumber);
        //    InvoiceData applicationsList = new InvoiceData();
        //    DataTable dataTable = applicationsList.Invoice;
        //    string fileName = "";
        //    string ids = string.Empty;

        //    foreach (var item in list)
        //    {
        //        DataRow row = dataTable.NewRow();                
        //        row["CustomerName"] = item.CustomerName;
        //        row["ToLocation"] = item.ToLocation;
        //        row["FromLocation"] = item.FromLocation;
        //        row["IDate"] = item.InvoiceDate;
        //        row["InvoiceNumber"] = item.InvoiceNumber;                
        //        fileName = item.InvoiceNumber;
        //        dataTable.Rows.Add(row);
        //    }


        //    return PrintReport(applicationsList, "LocalDetailInvoice.rpt", fileName, FromDate, ids);
        //}
        //[NonAction]
        //public ActionResult PrintReport(DataSet dataSet, string reportName, string filename, DateTime Fdate, string ids = "")
        //{

        //    ReportDocument rd = new ReportDocument();
        //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), reportName));
        //    rd.SetDataSource(dataSet);
        //    rd.DataDefinition.FormulaFields["FromDt"].Text = "\'" + Fdate.ToString("dd-MMM-yyyy") + "\'";          
        //    Response.Buffer = false;
        //    Response.ClearContent();
        //    Response.ClearHeaders();


        //    Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
        //    //stream.Seek(0, SeekOrigin.Begin);
        //    string fileName = string.Format(filename + "-{0}.pdf", ids);
        //    //return File(stream, "application/pdf");
        //    return File(stream, "application/pdf", fileName);
        //}


            //Filter Gride start




        [HttpPost]
        public JsonResult GetOrderDetailsByFilter(DateTime? FromDate, DateTime? ToDate)// int? ExpenseId)
        {
            dynamic result = null;
            try
            {
                CustomLogger.Debug("=========START GETDAILYEXPENSE() =========");
                CustomLogger.Debug("From Date = " + FromDate + " and To Date = " + ToDate);// + " and Expense Id = " + ExpenseId);

               // if (ExpenseId == null)
               // {
                    CustomLogger.Debug("Expense Id is Null");
                    OrderGridViewModels orderGridServicesModel = _orderService.GetOrderServiceDetail();
                    result = from e in orderGridServicesModel.OrderDetail.Where(x => x.OrderDate >= FromDate && x.OrderDate <= ToDate)
                             join d in orderGridServicesModel.DivisionList on e.BusinessDivisionId equals d.BusinessDivisionID into table1
                             from d in table1.ToList()
                             join i in orderGridServicesModel.CustomerList on e.CustomerID equals i.CustomerID into table2
                             from i in table2.ToList()
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
                                 e.BL,
                                 e.CRO,
                             };



                    //result = _expenseService.GetAllDailyExpense().Where(x => x.ExpenseDate >= FromDate && x.ExpenseDate <= ToDate).Select(x => new { x.ExpenseId, x.ExpenseDate, x.Remarks, x.EstimatedAmount, x.CreateDate, x.tbl_Category.CategoryName, x.tbl_PaymentMode.PaymentMode, x.tbl_ExpenseType.ExpenseNature }).ToList();

             //   }
             //   else
              //  {
                //    CustomLogger.Debug("Expense Id is not Null");

                  //  result = _expenseService.GetAllDailyExpense().Where(x => x.ExpenseId == ExpenseId).Select(x => new { x.ExpenseId, x.ExpenseDate, x.Remarks, x.EstimatedAmount, x.CreateDate, x.CreatedBy, x.ExpenseCategoryId, x.PaymentModeId, x.ExpenseNatureId }).FirstOrDefault();

              //  }
                CustomLogger.Debug("RESULT " + result);

            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }
            return Json(result);
        }


        //Filter Gride End




    }
}