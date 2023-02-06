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
        public int? ContainerCount { get; set; }
        public string ReadyForDispatched { get; set; }
        public string PreDispatched { get; set; }
        public string Dispatched { get; set; }
        public string InTransact { get; set; }
        public string ReDispatched { get; set; }
        public string Delivery { get; set; }
        public string EmptyDropOff { get; set; }
        public string Completed { get; set; }
        public bool? IsCompleted { get; set; }

        //Export//
        public string ExportPreDispatched { get; set; }
        public string ExportDispatchedTrain { get; set; }
        public string ExportDispatchedTruck { get; set; }
        public string ExportReDispatched { get; set; }
        public string ExportDelivery { get; set; }
        
    }
}