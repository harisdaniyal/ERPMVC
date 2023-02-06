using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
    public class ExportLogisticViewModel
    {
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public int LogisticId { get; set; }
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
		public bool PreDispatched { get; set; }
		public string Status { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }
	}
}