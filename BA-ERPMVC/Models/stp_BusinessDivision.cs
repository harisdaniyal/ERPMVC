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
    
    public partial class stp_BusinessDivision
    {
        public int BusinessDivisionID { get; set; }
        public string BusinessDivisionCode { get; set; }
        public string BusinessDivisionName { get; set; }
        public decimal CompanyID { get; set; }
        public string UserID { get; set; }
        public string UpdateBy { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<bool> Status { get; set; }
    }
}
