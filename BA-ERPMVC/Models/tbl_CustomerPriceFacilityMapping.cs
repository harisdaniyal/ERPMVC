//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BA_ERPMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_CustomerPriceFacilityMapping
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
    }
}
