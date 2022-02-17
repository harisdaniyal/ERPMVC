using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class OrderListViewModel
    {
        public int OrderId { get; set; }
        public string OrderNo { get; set; }
        public string CustomerName { get; set; }
        public string BusinessDivision { get; set; }
        public string OrderType { get; set; }
        public int RemainingTrips { get; set; }
        public string InvoiceAmount { get; set; }
        public int VendorExpense { get; set; }
    }
}