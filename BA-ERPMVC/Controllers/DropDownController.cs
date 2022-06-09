using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BA_ERPMVC.Models;
using System.Data.Entity;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class DropDownController : Controller
    {
        ERPMVCEntities db = null;
        public DropDownController()
        {
            db = new ERPMVCEntities();

        }

        [HttpPost]
        public JsonResult GetMaritalStatus()
        {

            var result = db.BAMaritalStatus.Select(x => new
            {
                MID = x.ID,
                MName = x.name
            }).ToList();
            return Json(new { result });

        }



        [HttpPost]
        public JsonResult GetGender()
        {

            var result = db.Genders.Select(x => new
            {
                GID = x.ID,
                GName = x.name
            }).ToList();
            return Json(new { result });

        }



        // GET: DropDown
        [HttpPost]
        public JsonResult GetCustomer()
        {
            
                var result = db.BACustomerRegistrations.Select(x => new
                {
                    CustomerID = x.CustomerID,
                    CustomerName = x.Customer_Name
                }).ToList();
                return Json(new { result });
            
        }

        public ActionResult GetServiceType()
        {
            
                return Json(db.stp_ServiceType.Where(x=>x.StatusID == 2).Select(x => new
                {
                    ServiceTypeID = x.ServiecTypeID,
                    SeriveTypeDesc = x.ServiceTypeDesc

                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult ContainerSize()
        {
            
                return Json(db.stp_ProductCategory.Where(x => x.ProductCatID == 2 || x.ProductCatID==7).Select(x => new
                {
                    ProductCatID = x.ProductCatID,
                    ProductCatName = x.ProductCatName

                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult VehcileNo()
        {
            
                return Json(db.VehicleRegistrationDetails.Select(x => new
                {
                    VehicleID = x.VehicleID,
                    VehicleName = x.Vehicle_Number

                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult GetLocation()
        {
            
                return Json(db.stp_City.Select(x => new
                {
                    CityID = x.CityID,
                    CityName = x.CityName

                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult GetVechicleType()
        {
            
                return Json(db.VehicleTypes.Select(x => new
                {
                    VehicleTypeID = x.VehicleTypeID,
                    VehicleTypeDesc = x.VehicleTypeDesc
                }).ToList(), JsonRequestBehavior.AllowGet);
            
        }
        [HttpPost]
        public JsonResult GetBusinessDevision()
        {
            
                var result = db.stp_BusinessDivision.Select(x => new
                {
                    BusinessDivisionID = x.BusinessDivisionID,
                    BusinessDivisionName = x.BusinessDivisionName
                }).ToList();
                return Json(new { result });
            
        }
        public JsonResult GetCompanyName()
        {

            var result = db.stp_Company.Select(x => new
            {
                CompanyID = x.CompanyID,
                CompanyName = x.CompanyName
            }).ToList();
            return Json(new { result });

        }
        [HttpPost]
        public JsonResult FacilityList()
        {

            var result = db.stp_Facility.Where(x => x.isActive == true).Select(x => new
            {
                facilityID = x.facilityID,
                FacilityName = x.FacilityName
            }).ToList();
            return Json(new { result });

        }
        [HttpPost]
        public JsonResult GetDepartmentName()
        {
                    
                        var result = db.Departments.Select(x => new
                        {
                            DepartmentID = x.DeptId,
                            DepartmentName = x.Dept_Name
                        }).ToList();
                        return Json(new { result });
                    
        }
        [HttpPost]
        public JsonResult GetDeseignation()
        {
                   
                        var result = db.Designations.Select(x => new
                        {
                            DesignationID = x.DesignationId,
                            DesignationName = x.Designation_Name
                        }).ToList();
                        return Json(new { result });
                    
        }
        [HttpPost]
        public JsonResult Employeedropdown()
        {
             
                        var result = db.Employees.Select(x => new
                        {
                            EID = x.EmployeeID,
                            Ecode = x.Empcode,
                            FirstName = x.Employee_FirstName,
                            LastName = x.Employee_LastName
                        }).ToList();
                        return Json(new { result });
                    
                }
                [HttpPost]
                public JsonResult OrderDropdown()
                {
                    
                        var result = (from opo in db.GenerateOrders.Where(a=>a.BusinessDivisionId ==1 || a.BusinessDivisionId == 4 || a.BusinessDivisionId == 20009)
                                     join VV in db.Order_FacilityMapping.Where(a=> a.FacilityID==1 || a.FacilityID==2) on opo.OrderID equals VV.OrderID
                                     
                                     select new 
                                    {
                                        Orderid = opo.OrderID,
                                        OrderNo = opo.OrderNo

                                    }).Distinct().ToList();
                        return Json(new { result });
                    
                }
                
        [HttpPost]
        public JsonResult getservicebyid(int id)
        {
           
                var result = (from opo in db.Order_FacilityMapping.Where(a => a.OrderID == id)
                             join VV in db.stp_Facility on opo.FacilityID equals VV.facilityID
                              
                              select new
                              {
                                  serviceid=opo.FacilityID,
                                  servicetype = VV.FacilityName
                                  

                              }).ToList();
                return Json(new { result });
            

        }
    }
}