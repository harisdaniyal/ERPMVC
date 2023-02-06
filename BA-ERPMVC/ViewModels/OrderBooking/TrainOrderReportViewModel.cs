using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class TrainOrderReportViewModel
    {
        public int? Id { get; set; }
        public int TrainId { get; set; }
        public string OrderNo { get; set; }
        public string CustomerName { get; set; }
        public string BusinessDivisionName { get; set; }
        public string OrderType { get; set; }
        public string BLNumber { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerSize { get; set; }
        public int? ContainerWeight { get; set; }
        public string ContainerTypeName { get; set; }
        public string EmptyReturnLocation { get; set; }
        public string ModeOfTransportation { get; set; }
        public string Commodities { get; set; }
        public string JobType { get; set; }
        public string CRO { get; set; }
        public string EIRNo { get; set; }
        public decimal? InvoiceAmount { get; set; }
        public string InvoiceNumber { get; set; }
        public string ShippingAgentName { get; set; }
        public string ShippingLineName { get; set; }
        public string BookingPOCName { get; set; }
        public string StationName { get; set; }
        public string TransporterName { get; set; }
        public string PreDispatchedTransporterName { get; set; }
        public string DeliveryVehicleNumber { get; set; }
        public string VehicleNumber { get; set; }
        public string WagonNumber { get; set; }
        public string WagonType { get; set; }
        public string TrainID { get; set; }
        public string RRNo { get; set; }
        public string EngineNo { get; set; }
        public string BiltyNo { get; set; }
        public Nullable<decimal> TransportationCost { get; set; }
        public string PriorityForDispatched { get; set; }
        public string FromLocation { get; set; }
        public string PreDispatchedFromLocation { get; set; }
        public string ToLocation { get; set; }
        public string PreDispatchedToLocation { get; set; }
        public int? FreeDays { get; set; }
        public string Remarks { get; set; }
        public string EmptyDropOffRemarks { get; set; }
        public string ReferenceContainer { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? VesselBerthingDate { get; set; }
        public string EmptyReturnDate { get; set; }
        public DateTime? DoGuaranteeDate { get; set; }
        public DateTime? ImportEIR { get; set; }
        public DateTime? PortWeighment { get; set; }
        public DateTime? OutsidePortWeighment { get; set; }
        public DateTime? FromDateTime { get; set; }
        public DateTime? ToDateTime { get; set; }
        public DateTime? DispatchedDate { get; set; }
        public DateTime? ReDispatchedDate { get; set; }
        public DateTime? ArrivalDate { get; set; }
        public DateTime? DeliveryArrivalDate { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public DateTime? LastDateofEmptyReturn { get; set; }
        public decimal? ExpenseAtEmptyLocation { get; set; }
        public DateTime? GD { get; set; }
        public DateTime? BL { get; set; }
        public bool? PreDispatched { get; set; }
        public bool? LOLO { get; set; }



    }
}