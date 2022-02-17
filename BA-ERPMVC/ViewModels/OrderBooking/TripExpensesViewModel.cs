using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class TripExpensesViewModel
    {
        public int TripExpenseId { get; set; }
        public int Price { get; set; }
        public string HoRates { get; set; }
        public Nullable<int> ExpenseId { get; set; }
        public string ExpenseName { get; set; }
        public string Remarks { get; set; }
    }
}