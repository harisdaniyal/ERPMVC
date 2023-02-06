using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class BookingViewModel
    {
        public int[] FacilityIds { get; set; }
        public int OrderId { get; set; }
        public string OrderNo { get; set; }
        public int CustomerId { get; set; }
        public int BusinessDivisionId { get; set; }
        public string OrderType { get; set; }
        public string BL { get; set; }
        public string CRO { get; set; }
        public int? TwentyContainerQty { get; set; }
        public int? FortyContainerQty { get; set; }
        public string TwentyContainerPrice { get; set; }
        public string FortyContainerPrice { get; set; }
        public DateTime? OrderDate { get; set; }
        public int InvoiceAmount { get; set; }
        public int ShippingLineId { get; set; }
        public int ShippingAgentId { get; set; }
        public int FreeDays { get; set; }
        public string Remarks { get; set; }
        public DateTime? VesselBerthingDate { get; set; }
        public string BookingPOCName { get; set; }
        public DateTime? DOGuarantee { get; set; }
        public DateTime? ImportEIR { get; set; }
        public DateTime? PortWeighment { get; set; }
        public DateTime? OutSidePortWeighment { get; set; }
        public DateTime? GD { get; set; }
        public DateTime? BLDate { get; set; }
    }
}