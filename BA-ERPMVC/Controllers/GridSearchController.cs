using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.Reports;
using CrystalDecisions.CrystalReports.Engine;
using MasterLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class GridSearchController : Controller
    {
        ERPMVCEntities db = null;
        ApplicationDbContext _applicationDbContext = null;
        InvoiceServices _invoiceServices = null;
        public GridSearchController()
        {
            db = new ERPMVCEntities();
            _applicationDbContext = new ApplicationDbContext();
            _invoiceServices = new InvoiceServices();    

        }
        // GET: GridSearch
        public ActionResult VehicleGrid(string word, int page, int rows, string searchString, string sord)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  
           
                int pageIndex = Convert.ToInt32(page) - 1;
                int pageSize = rows;
                //#2 Setting Paging  
                var Results = from opo in db.VehicleRegistrationDetails
                              join VT in db.VehicleTypes on opo.VehicleTypeID equals VT.VehicleTypeID into LEFTJOIN
                              from remain in LEFTJOIN.DefaultIfEmpty()
                              select new
                              {
                                  VehicleID = opo.VehicleID,
                                  VehicleName = opo.VehicleName,
                                  Vehicle_Number = opo.Vehicle_Number,
                                  VehicleChassisNO = opo.VehicleChassisNO,
                                  VehicleEngineNo = opo.VehicleEngineNo,
                                  UpdateBy = opo.UpdateBy,
                                  UpdateDate = opo.UpdateDate,
                                  UserID = opo.UserID,
                                  CreateDate = opo.CreateDate,
                                  IsActive = opo.IsActive,
                                  VehicleTypeID = remain.VehicleTypeDesc,
                                  VehicleTypeDesc = opo.VehicleTypeID
                              };


                //#3 Linq Query to Get Customer   
                int totalRecords = Results.Count();
                var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);

                if (sord.ToUpper() == "DESC")
                {

                    Results = Results.OrderByDescending(s => s.Vehicle_Number);
                    Results = Results.Skip(pageIndex * pageSize).Take(pageSize);
                }
                else
                {
                    Results = Results.OrderBy(s => s.Vehicle_Number);
                    Results = Results.Skip(pageIndex * pageSize).Take(pageSize);
                }
                //#6 Setting Search  


                //#7 Sending Json Object to View.  
                var jsonData = new
                {
                    total = totalPages,
                    page,
                    records = totalRecords,
                    rows = Results.ToList()
                };


                //#4 Get Total Row Count  

                return Json(jsonData, JsonRequestBehavior.AllowGet);
            

        }

      
        public JsonResult LogisticGrid(int id)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  
            //#2 Setting Paging  
            CustomLogger.Debug("=========START GETDAILYEXPENSE() =========");
         //   CustomLogger.Debug("From Date = " + FromDate + " and To Date = " + ToDate + "");
            var facilityList = db.stp_Facility.ToList();
                var Results = (from opo in db.Logistics
                               join go in db.GenerateOrders on opo.OrderId equals go.OrderID into table1
                               from Orders in table1.ToList()
                               join bd in db.stp_BusinessDivision on Orders.BusinessDivisionId equals bd.BusinessDivisionID into table2
                               from Business in table2.ToList()
                               join c in db.BACustomerRegistrations on Orders.CustomerID equals c.CustomerID into table3
                               from Cust in table3.ToList()
                               join fl in db.stp_Facility on opo.OrderServiceId equals fl.facilityID into table5
                               from faciltyLst in table5.ToList()
                               
                              // where Orders.OrderDate >= FromDate && Orders.OrderDate <= ToDate
                               where Orders.OrderID == id
                               select new
                               {
                                 opo.logisticsid,
                                   Orders.OrderNo,
                                 Cust.Customer_Name,
                                 opo.JobType,
                                faciltyLst.FacilityName,
                                 opo.ContainerNo,
                                 opo.ContainerNo2,
                                 opo.ContainerWeight,
                                   //  Orders.OrderID,
                                   OrderT = Orders.OrderID,
                                   //    opo.SingleDouble,
                                   opo.ContainerSize,
                                 opo.FromLocation,
                                 opo.ToLocation,
                                 opo.IsActive,
                                 opo.Qty
                               }).ToList();
               
                return Json(new { Results }, JsonRequestBehavior.AllowGet);
            

        }


        //start




 

        //end








        [HttpPost]
        public JsonResult EmployeeGrid()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  
            
                var employee = (from opo in db.Employees
                                join VT in db.Departments on opo.DeptID equals VT.DeptId
                                join VV in db.stp_Company on opo.CompanyId equals VV.CompanyID
                                join VX in db.Designations on opo.DesignationId equals VX.DesignationId
                                select new
                                {
                                    EID = opo.EmployeeID,
                                    Ecode = opo.Empcode,
                                    FirstName = opo.Employee_FirstName,
                                    LastName = opo.Employee_LastName,
                                    status = opo.MaritalStatus,
                                    cnic = opo.Cnic,
                                    Doj = opo.Date_Of_Joining,
                                    DeptName = VT.Dept_Name,
                                    CmpName = VV.CompanyName,
                                    design = VX.Designation_Name,
                                    EmpPhoneNo = opo.EmpPhoneno,
                                    EmpPhoneNoopt = opo.EmpPhonenoopt,
                                    emailaddress = opo.EmailAddress,
                                    address = opo.Address,

                                }).ToList();



                return Json(new { employee });

            
        }






        //start
        [HttpPost]
        public JsonResult GetCustPriceGrideRecntLolo(int id, int ids2)
        {

            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var CustPrice = from opo in db.BACustomerFacilityDetailsHistoryMappings
                                join div in db.stp_Facility on opo.FacilityID equals div.facilityID
                                join ty in db.BACustomerRegistrations on opo.CustomerID equals ty.CustomerID
                                where opo.CustomerID == id && opo.FacilityID == ids2
                                select new
                                {

                                    CID = opo.Customer_Facilityid,
                                    CCustomer = ty.CustomerID,
                                    FID = div.facilityID,
                                    FPrice = opo.price,
                                    FPriceEmpty = opo.priceEmpty,
                                    container1 = opo.ContainerSize20P,
                                    container2 = opo.ContainerSize40P,
                                    container3 = opo.ContainerSize20PEmpty,
                                    container4 = opo.ContainerSize40PEmpty,
                                    FWeightmentCharges20 = opo.WeightmentCharges,
                                    FWeightmentCharges40 = opo.WeightmentCharges40,
                                    UpdateDate = opo.UpdateDate,
                                    updateby = opo.UpdateBy,

                                };


                return Json(new { result = CustPrice.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }






        [HttpPost]
        public JsonResult OrderById(int id)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  

            var order = (from opo in db.GenerateOrders
                         where opo.OrderID == id
                         select new
                        {
                            id = opo.OrderID,
                            //tripid = opo.Trip_ID,
                          
                        }).ToList();

            return Json(new { order });


        }







        [HttpPost]
        public JsonResult TripGrid(int id)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  

            var trip = (from opo in db.BAtrips.Where(x => x.IsActive == true)
                        join party in db.tbl_Party on opo.PartyId equals party.PartyId into table0
                        from tblParty in table0.DefaultIfEmpty()
                        join emp in db.Employees on opo.Drive_ID equals emp.EmployeeID into table1
                        from employee in table1.DefaultIfEmpty()
                        //join pp in db.tbl_Party on opo.PartyId equals pp.PartyId 
                        join veh in db.VehicleRegistrationDetails on opo.Vechial_ID equals veh.VehicleID into table2
                        from vehicle in table2.DefaultIfEmpty()
                        join Logis in db.Logistics on opo.Logistics_ID equals Logis.logisticsid
                        join ord in db.GenerateOrders on Logis.OrderId equals ord.OrderID into table3
                        from order in table3.DefaultIfEmpty()
                        join CC in db.ContainerStatus on opo.ContainerStatus equals CC.id
                        where Logis.OrderId == id 
                        select new
                        {
                            id = opo.ID,
                            tripid = opo.Trip_ID,
                            orderno = order.OrderNo,
                            contno = Logis.ContainerNo,
                            contno2 = Logis.ContainerNo2,
                            fromloc = Logis.FromLocation,
                            toloc = Logis.ToLocation,
                            OrderT = order.OrderID,
                            // curentfromloc = opo.CurrentFromLocation,
                            //  currenttoloc = opo.CurrentToLocation,
                            vehicleno = vehicle.Vehicle_Number,
                            driver = employee.Employee_FirstName + " " + employee.Employee_LastName,
                            CContainerStatus = CC.ContainerStatus,
                            total = opo.TotalExpense,
                            PartyDriverName = opo.PartyDriverName ?? "",
                            PartyDriverCNIC = opo.PartyDriverCNIC ?? "",
                            PartyDriverContactNumber = opo.PartyDriverContactNumber?? "",
                            PartyVehicleNo = opo.PartyVehicleNo ?? "",
                            PartyName = tblParty.PartyName
                        }).ToList();

                return Json(new { trip });

            
        }





        [HttpPost]
        public JsonResult UpCommingTrips()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  

            var trip = (from opo in db.BAtrips.Where(x => x.IsActive == true && x.ContainerStatus == 1)
                        join emp in db.Employees on opo.Drive_ID equals emp.EmployeeID into table1
                        from employee in table1.ToList()
                        join veh in db.VehicleRegistrationDetails on opo.Vechial_ID equals veh.VehicleID into table2
                        from vehicle in table2.ToList()
                        join logis in db.Logistics on opo.Logistics_ID equals logis.logisticsid
                        join ord in db.GenerateOrders on logis.OrderId equals ord.OrderID into table3
                        from order in table3.ToList()
                        join CC in db.ContainerStatus on opo.ContainerStatus equals CC.id
                        select new
                        {
                            id = opo.ID,
                            tripid = opo.Trip_ID,
                            orderno = order.OrderNo,
                            contno = logis.ContainerNo,
                            contno2 = logis.ContainerNo2,
                            fromloc = logis.FromLocation,
                            toloc = logis.ToLocation,
                            // curentfromloc = opo.CurrentFromLocation,
                            //  currenttoloc = opo.CurrentToLocation,
                            vehicleno = vehicle.Vehicle_Number,
                            driver = employee.Employee_FirstName + " " + employee.Employee_LastName,
                            CContainerStatus = CC.ContainerStatus,
                            total = opo.TotalExpense
                        }).ToList();

            return Json(new { trip });


        }







        [HttpPost]
        public ActionResult GetCustomerGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Customer = (from opo in db.BACustomerRegistrations
                                join div in db.stp_BusinessDivision on opo.BusinessDivisionID equals div.BusinessDivisionID
                                join ty in db.BACustomertypes on opo.Customer_type equals ty.ID
                                select new
                                {
                                    CID = opo.CustomerID,
                                    COrder = opo.CustomerCode,
                                    CName = opo.Customer_Name,
                                    CAddress = opo.Customer_Address,
                                    CEmail = opo.Customer_Eamil,
                                    CType = ty.CustomerType,
                                    CPhoneNo = opo.Customer_Phone_Number,
                                    CCountry = opo.Customer_Country,
                                    CCity = opo.Customer_City,
                                    CBusinessDivision = div.BusinessDivisionName,
                                    CStatus = opo.Customer_Status,
                                    UserID = opo.UserID,
                                    UpdateBy = opo.UpdateBy,
                                    CreateDate = opo.CreateDate,
                                    UpdateDate = opo.UpdateDate

                                }).ToList();

                return Json(new { Customer });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }








        [HttpPost]
        public JsonResult ChildGrid(int id)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  
            
                var Child = (from opo in db.Emp_Child.Where(a =>a.EmpID==id)
                                
                                select new
                                {
                                    Childid = opo.ChildID,
                                    Cname = opo.Child_Name,
                                    ChildCnic = opo.Cnic,
                                    Cdob = opo.Date_of_Birth,
                                    ChildStatus = opo.MaritalStatus,
                                    Cgender = opo.Gender,
                                    

                                }).ToList();



                return Json(new { Child });

            
        }


        [HttpPost]
        public ActionResult GetVechailGride()
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.
            using (ERPMVCEntities db = new ERPMVCEntities())
            {

                var Vechial = (from opo in db.VehicleRegistrationDetails
                               join VT in db.VehicleTypes on opo.VehicleTypeID equals VT.VehicleTypeID
                               //   join div in db.stp_BusinessDivision on opo.BusinessDivisionID equals div.BusinessDivisionID
                               //  join ty in db.BACustomertypes on opo.Customer_type equals ty.ID
                               select new
                               {
                                   VID = opo.VehicleID,
                                   VNUMBER = opo.Vehicle_Number,
                                   VTYPE = VT.VehicleTypeDesc,
                                   VENGINE = opo.VehicleEngineNo,
                                   VCHASSIS = opo.VehicleChassisNO,
                                   VNAME = opo.VehicleName,
                                   VSTATUS = opo.IsActive,
                                   VUserID = opo.UserID,
                                   VUpdateBy = opo.UpdateBy,
                                   VCreate = opo.CreateDate,
                                   VUpdateDate = opo.UpdateDate

                               }).ToList();

                return Json(new { Vechial });
                // return Json(new { data = Customer.ToList() }, JsonRequestBehavior.AllowGet);
            }

        }

        [HttpPost]
        public JsonResult GetMenuList()
        {
            var result = db.Menus.ToList();
            return Json(result);
        }





    }

    
    }
