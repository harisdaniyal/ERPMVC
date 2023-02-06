using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class PrintImportReportViewModel
    {
        public int OrderId { get; set; }
        public int LogisticsId { get; set; }
        // public string OrderNo { get; set; }
        public int CustomerId { get; set; }
        public string Customer_Name { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerSize { get; set; }
        public int? ContainerWeight { get; set; }
        public string WagonNo { get; set; }
        public string VehicleNo { get; set; }
        public string TruckNo { get; set; }
        public string OrderType { get; set; }
        public string TransportationType { get; set; }
        public string RateOfTransportation { get; set; }
        public string BL { get; set; }
        public string CRO { get; set; }
        public string TrainID { get; set; }
        public decimal? InvoiceAmount { get; set; }
        public string Remarks { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? DateOfBooking { get; set; }
        public int? ContainerCount { get; set; }
        public string FortyContainerPrice { get; set; }
        public string TwentyContainerPrice { get; set; }
    }
}