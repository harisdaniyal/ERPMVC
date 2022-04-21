using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.ExportOrderBooking
{
    public class ExportDispatchedTruckViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string ContainerType { get; set; }
		public string CRO { get; set; }
		public string TruckNo { get; set; }
		public DateTime? DateOfDispatched { get; set; }
		public string CustomerName { get; set; }
		public string TruckContactNo { get; set; }
		public string BiltyNo { get; set; }
		public string DeliveryLocation { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

	}
}