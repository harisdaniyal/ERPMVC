using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using ExpressiveAnnotations.Attributes;


namespace BA_ERPMVC.Models
{
    public class OrderBookingViewModel
    {
        public int OrderID { get; set; }

        public string CreatedBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool isActive { get; set; }
        
        public DateTime OrderDate { get; set; }
        
        public string OrderNo { get; set; }
       
        public int? CustomerID { get; set; }
        
        public int? BusinessDevisionID { get; set; }
        
        public string OrderType { get; set; }
       
        public string BL { get; set; }

        public string CRO { get; set; }
        
        public string InBond_Number { get; set; }
        
        public string DeliveryNo { get; set; }
        
        public string[] facilityID { get; set; }
        
    }
    public class OrderGridViewModels
    {
        public List<BACustomerRegistration> CustomerList { get; set; }
        public List<stp_BusinessDivision> DivisionList { get; set; }
        public List<GenerateOrder> OrderDetail { get; set; }
        public OrderGridViewModels()
        {
            CustomerList = new List<BACustomerRegistration>();
            DivisionList = new List<stp_BusinessDivision>();
            OrderDetail = new List<GenerateOrder>();
        }
    }
    public class OrderBookingDropdownViewModels
   { 
        public OrderBookingDropdownViewModels()
        {
            CustomerList = new List<BACustomerRegistration>();
            DivisionList = new List<stp_BusinessDivision>();
            OrderList = new List<stp_ServiceType>();
            FacilityList = new List<stp_Facility>();
        }
        public List<BACustomerRegistration> CustomerList { get; set; }
        public List<stp_BusinessDivision> DivisionList { get; set; }
        public List<stp_ServiceType> OrderList { get; set; }
        public List<stp_Facility> FacilityList { get; set; }

    }
}