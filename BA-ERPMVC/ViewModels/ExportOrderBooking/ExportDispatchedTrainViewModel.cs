using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
    public class ExportDispatchedTrainViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string ContainerType { get; set; }

		public string CRO { get; set; }
		public string TrainID { get; set; }
		public DateTime? DispatchedOfDate { get; set; }
		public string WagonNo { get; set; }
		public string RRNo { get; set; }
		public string EngineNo { get; set; }
		public string ShipperName { get; set; }
		public string WagonType { get; set; }
		public string ReDispatched { get; set; }
		public string CargoWeight { get; set; }
		public string TareWeight { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }
	}
}