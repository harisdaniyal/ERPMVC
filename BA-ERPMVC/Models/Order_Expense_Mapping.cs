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
    
    public partial class Order_Expense_Mapping
    {
        public int OEId { get; set; }
        public Nullable<int> OrderId { get; set; }
        public Nullable<int> ExpenseId { get; set; }
        public string Rates { get; set; }
    }
}