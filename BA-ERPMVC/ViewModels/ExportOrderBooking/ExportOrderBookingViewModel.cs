using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
	public class ExportOrderBookingViewModel
	{
			public int[] FacilityIds { get; set; }
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
			public bool? IsCompleted { get; set; }
			public string CreatedBy { get; set; }
			public DateTime? CreateDate { get; set; }
			public string UpdatedBy { get; set; }
			public DateTime? UpdateDate { get; set; }
			public bool? IsDeleted { get; set; }
		}

	}
