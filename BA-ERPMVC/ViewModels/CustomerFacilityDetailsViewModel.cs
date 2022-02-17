using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class CustomerFacilityDetailsViewModel
    {
        public int Customer_Facilityid { get; set; }
        public int CustomerID { get; set; }
        public string price { get; set; }
        public string priceEmpty { get; set; }
        public int FacilityID { get; set; }
        public int ContainerWeight { get; set; }
        public string ContainerSize20P { get; set; }
        public string ContainerSize40P { get; set; }
        public string ContainerSize20PEmpty { get; set; }
        public string ContainerSize40PEmpty { get; set; }
        public string WeightmentCharges { get; set; }
        public string WeightmentCharges40 { get; set; }
        public bool IsActive { get; set; }
        //   public int PurchaseId { get; set; }
    }
}