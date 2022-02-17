using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class TripViewModel
    {
        public int OrderId { get; set; }
        public int TripId { get; set; }
        public string TripCode { get; set; }
        public string VendorName { get; set; }
        public int VendorId { get; set; }
        public int TotalExpense { get; set; }
        public string TripDate { get; set; }
        public string DriverName { get; set; }
        public string DriverContactNumber { get; set; }
        public string DriverCNIC { get; set; }
        public string VehicleNumber { get; set; }
        public string FromLocationCode { get; set; }
        public string ToLocationCode { get; set; }
        public int FromLocation { get; set; }
        public int ToLocation { get; set; }
        public IEnumerable<TripContainersViewModel> TripContainers { get; set; }
        //public IEnumerable<TripExpensesViewModel> TripExpense { get; set; }
    }
}