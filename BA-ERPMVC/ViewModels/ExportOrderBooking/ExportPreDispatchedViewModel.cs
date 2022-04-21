using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
    public class ExportPreDispatchedViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public DateTime? PickupFrom { get; set; }
		public string VehicleNo { get; set; }
		public string TransporterName { get; set; }
		public int? TransporterCost { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }


		/////***** Additional******/////
		public string CRO { get; set; }
	}
}