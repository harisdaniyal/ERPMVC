using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
    public class ExportTrainOrderReportViewModel
	{
		// Booking //
		public int OrderID { get; set; }
		public string OrderNo { get; set; }
		public DateTime? DateOfBooking { get; set; }
		public string Forwarder { get; set; }
		public string CRO { get; set; }
		public string ShipperName { get; set; }
		public string ShipperContact { get; set; }
		public int? TwentyContainerQty { get; set; }
		public int? FortyContainerQty { get; set; }
		public string TwentyContainerPrice { get; set; }
		public string FortyContainerPrice { get; set; }
		public string RateOfTransportation { get; set; }
		public string PointOfLoadingStation { get; set; }

		//Logistic//
	
		public string ContainerNo { get; set; }
		public string ContainerType { get; set; }
		public string ContainerSize { get; set; }
		public string EGNo { get; set; }
		public string vessel { get; set; }
		public string Voyage { get; set; }
		public DateTime? ETD { get; set; }
		public DateTime? VesselCutOff { get; set; }
		public string ShippingLine { get; set; }
		public string ClearingAgentName { get; set; }
		public string CAContactNo { get; set; }
		public string BookingPort { get; set; }
		public string ModeOfTransportation { get; set; }
		public DateTime? DateOfReceivingCargo { get; set; }
		public bool? PreDispatched { get; set; }

		// PreDispatched //
		public DateTime? PickupFrom { get; set; }
		public string PreVehicleNo { get; set; }
		public string PreTransporterName { get; set; }
		public int? TransporterCost { get; set; }

		// Dispatched //
		public string TrainID { get; set; }
		public DateTime? DispatchedOfDate { get; set; }
		public string WagonNo { get; set; }
		public string RRNo { get; set; }
		public string EngineNo { get; set; }
		public string WagonType { get; set; }
		public string ReDispatched { get; set; }
		public string CargoWeight { get; set; }
		public string TareWeight { get; set; }

		// ReDispatched //
		public string ReTransporterName { get; set; }
		public string ReVehicleNo { get; set; }
		public string CustomerName { get; set; }
		public int? TruckingCost { get; set; }

		// Delivery //
		public DateTime? DeliveryDate { get; set; }
	}
}