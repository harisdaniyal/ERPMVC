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
    
    public partial class tbl_Invoice
    {
        public int InvoiceID { get; set; }
        public string InvoiceNumber { get; set; }
        public Nullable<int> OrderID { get; set; }
        public Nullable<System.DateTime> InvoiceDate { get; set; }
        public string NTN { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string VerifiedBy { get; set; }
        public Nullable<System.DateTime> VerifiedDate { get; set; }
        public Nullable<System.DateTime> InvoiceDataFromDate { get; set; }
        public Nullable<System.DateTime> InvoiceDataToDate { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> Status { get; set; }
    }
}