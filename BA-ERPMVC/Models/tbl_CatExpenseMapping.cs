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
    
    public partial class tbl_CatExpenseMapping
    {
        public int MappingId { get; set; }
        public Nullable<int> CatID { get; set; }
        public Nullable<int> ExpenseTypeId { get; set; }
    
        public virtual tbl_Category tbl_Category { get; set; }
        public virtual tbl_ExpenseType tbl_ExpenseType { get; set; }
    }
}
