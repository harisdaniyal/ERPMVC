using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using BA_ERPMVC.Models;
using System.Data;
using BA_ERPMVC.Filter;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class HumanResourceManagmentController : Controller
    {
        ERPMVCEntities db = null;
        public HumanResourceManagmentController()
        {
            db = new ERPMVCEntities();

        }
        // GET: HumanResourceManagment
        public ActionResult EmployeeDetails()
        {

            return View();
        }
        public ActionResult FamilyDetails()
        {

            return View();
        }

        public JsonResult GetParent(int id)
        {
           
                var parent = (from opo in db.Emp_Parent where opo.EmpId == id 
                             
                             select new
                             {
                                 parentid=opo.ParentId,
                                 parentname=opo.Parent_Name,
                                paerntcnic= opo.Parent_Cnic,
                                parentdob=opo.Date_Of_Birth,
                                parentgender=opo.Gender
                                
                             }).ToList();
                
            return Json(parent) ;
            
            
        }
        public JsonResult GetParentById(int id)
        {
            
                var parent = (from opo in db.Emp_Parent
                              where opo.ParentId == id 

                              select new
                              {
                                  parentid = opo.ParentId,
                                  parentname = opo.Parent_Name,
                                  paerntcnic = opo.Parent_Cnic,
                                  parentdob = opo.Date_Of_Birth,
                                  parentgender = opo.Gender

                              }).ToList();

                return Json(parent);
            

        }
        public JsonResult GetSpouse(int id)
        {
            
                var spouse = (from opo in db.Emp_Spouse where opo.EmpId == id
                              select new
                              {
                                  spouseid = opo.SpouseId,
                                  spousename = opo.Spouse_Name,
                                  spousecnic = opo.Cnic,
                                  spousedob = opo.Date_Of_Birth,
                                  spousegender = opo.Gender
                                 
                              }).ToList();

                return Json(spouse);
            

        }
        public JsonResult GetSpousebyid(int id)
        {
           
                var spouse = (from opo in db.Emp_Spouse
                              where opo.SpouseId == id
                              select new
                              {
                                  spouseid = opo.SpouseId,
                                  spousename = opo.Spouse_Name,
                                  spousecnic = opo.Cnic,
                                  spousedob = opo.Date_Of_Birth,
                                  spousegender = opo.Gender

                              }).ToList();

                return Json(spouse);
            

        }

        [HttpPost]
        public JsonResult Getchildbyid(int id)
        {
            //#1 Create Instance of DatabaseContext class for Accessing Database.  
            
                var Child = (from opo in db.Emp_Child.Where(a => a.ChildID == id)

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
        public JsonResult EditEmployee(int id)
        {
            
            

                var employee = from opo in db.Employees.Where(a => a.EmployeeID == id)
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
                                   DeptName = opo.DeptID,
                                   CmpName = opo.CompanyId,
                                   design = opo.DesignationId,
                                   EmpPhoneNo = opo.EmpPhoneno,
                                   EmpPhoneNoopt = opo.EmpPhonenoopt,
                                   emailaddress = opo.EmailAddress,
                                   address = opo.Address,
                                   gender=opo.Gender,
                                   dob=opo.Date_Of_Birth,

                               };
               

                return Json(new { result = employee.ToList()}, JsonRequestBehavior.AllowGet);
            
            
        }

        //public ActionResult setchild(Emp_Child child)
        //{
        //    if (child != null)
        //    {
        //        listchild.addchild(child);
        //        return Json(new { success = true }, JsonRequestBehavior.AllowGet);

        //    }
        //    else
        //    {
        //        return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        //    }

        //}

        [HttpPost]
        public JsonResult EmpCode()
        {
            string Orderno = "";
            string code = "";
            Int64 maxValue = 0;
            
                Orderno = db.Employees.OrderByDescending(x => x.Empcode).Select(x => x.Empcode).FirstOrDefault();
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

        public ActionResult AddorEditEmployee(Employee obj)
        {
            var done=0;
            var responseText="";
            
                try
                {
                    if (obj.EmployeeID!=0)
                    {
                        

                        Employee a=db.Employees.First(i => i.EmployeeID== obj.EmployeeID);
                       
                        a.Employee_FirstName = obj.Employee_FirstName;
                        a.Employee_LastName = obj.Employee_LastName;
                        a.Cnic = obj.Cnic;
                        a.CompanyId = obj.CompanyId;
                        a.DeptID = obj.DeptID;
                        a.DesignationId = obj.DesignationId;
                        a.Date_Of_Joining = obj.Date_Of_Joining;
                        a.Date_Of_Birth = obj.Date_Of_Birth;
                        a.EmailAddress = obj.EmailAddress;
                        a.EmpPhonenoopt = obj.EmpPhonenoopt;
                        a.EmpPhoneno = obj.EmpPhoneno;
                        a.Gender = obj.Gender;
                        a.MaritalStatus = obj.MaritalStatus;
                        a.Address = obj.Address;
                        
                         done = db.SaveChanges();
                        responseText = "Data Updated Successfully.";
                    }
                    else
                    {
                        obj.Record_Date = DateTime.Now.ToString();
                        obj.CreatedBy = Session["Username"].ToString();

                        db.Employees.Add(obj);
                        done = db.SaveChanges();
                        responseText = "Data Inserted Successfully.";
                    }
                    
                    if (done == 1 )
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
}