using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class ImportBookingReportViewModel
    {
        
  
        public int OrderId { get; set; }
        public string OrderNo { get; set; }
        public string CustomerName { get; set; }
        public int CustomerId { get; set; }
        public string OrderType { get; set; }
        public string BL { get; set; }
        public int? TwentyContainerQty { get; set; }
        public int? FortyContainerQty { get; set; }
        public string TwentyContainerPrice { get; set; }
        public string FortyContainerPrice { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal? InvoiceAmount { get; set; }
        public int ShippingLineId { get; set; }
        public int ShippingAgentId { get; set; }
        public string ShippingAgentName { get; set; }
        public string ShippingLineName { get; set; }
        public int? FreeDays { get; set; }
        public string Remarks { get; set; }
        public DateTime? VesselBerthingDate { get; set; }
        public string BookingPOCName { get; set; }
        public DateTime? DOGuarantee { get; set; }
        public DateTime? ImportEIR { get; set; }
        public DateTime? PortWeighment { get; set; }
        public DateTime? OutSidePortWeighment { get; set; }
        public DateTime? GD { get; set; }
        public DateTime? BLDate { get; set; }
        public string ContainerNo { get; set; }
        public int? ContainerWeight { get; set; }
        public string ContainerSize { get; set; }
        public int ContainerType { get; set; }
        public string ContainerTypeName { get; set; }
        public string JobType { get; set; }
        public string FromLocation { get; set; }
        public string ToLocation { get; set; }
        public string EmptyReturnLocation { get; set; }
        public string EmptyReturnDate { get; set; }
        public string ModeOfTransportation { get; set; }
        public bool? PreDispatched { get; set; }
        public string Comodities { get; set; }
    }
}