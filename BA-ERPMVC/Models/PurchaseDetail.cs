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
    
    public partial class PurchaseDetail
    {
        public int PurchaseDetailId { get; set; }
        public Nullable<int> ItemId { get; set; }
        public string Quantity { get; set; }
        public string UnitIn { get; set; }
        public string Rate { get; set; }
        public string Amount { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> PurchaseId { get; set; }
        public string Remarks { get; set; }
    
        public virtual PurchaseMaster PurchaseMaster { get; set; }
        public virtual tbl_Item tbl_Item { get; set; }
    }
}
