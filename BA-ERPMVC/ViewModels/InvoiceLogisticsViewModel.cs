using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class InvoiceLogisticsViewModel
    {
        public int InvoiceID { get; set; }
        public string InvoiceNumber { get; set; }
        public int? OrderID { get; set; }
        public int? TripID { get; set; }
        public DateTime InvoiceDate { get; set; }
        public string NTN { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string VerifiedBy { get; set; }
        public DateTime VerifiedDate { get; set; }
        public DateTime InvoiceDataFromDate { get; set; }
        public DateTime InvoiceDataToDate { get; set; }
        public bool isActive { get; set; }
        public int? Status { get; set; }
    }



    public class InvoiceGrideViewModel
    {
        public List<BACustomerRegistration> CustomerList { get; set; }
        public List<stp_BusinessDivision> DivisionList { get; set; }
        public List<GenerateOrder> OrderDetail { get; set; }
        public List<BAtrip> TripDetails { get; set; }
        public List<VehicleRegistrationDetail> Vecheils { get; set; }
        public List<Employee> Employees { get; set; }
        public List<Logistic> logictis { get; set; }
        public InvoiceGrideViewModel()
        {
            CustomerList = new List<BACustomerRegistration>();
            DivisionList = new List<stp_BusinessDivision>();
            OrderDetail = new List<GenerateOrder>();
            TripDetails = new List<BAtrip>();
            Employees = new List<Employee>();
            Vecheils = new List<VehicleRegistrationDetail>();
            logictis = new List<Logistic>();
        }
    }
}