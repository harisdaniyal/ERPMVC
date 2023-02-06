using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class VendorExpensesViewModel
    {
        public int VendorExpenseId { get; set; }
        public int VendorId { get; set; }
        public int VendorTypeExpenseId { get; set; }
        public string ExpenseName { get; set; }
        public double Amount { get; set; }
        public string Remarks { get; set; }
    }
}