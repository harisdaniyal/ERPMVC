using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class PreDispatchedMovementViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public int? LogisticsId { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public string FromLocation { get; set; }
		public DateTime? FromDateTime { get; set; }
		public string ToLocation { get; set; }
		public DateTime? ToDateTime { get; set; }
		public string TransporterName { get; set; }
		public string VehicleNumber { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }

		         //Added By Own////
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
	}
}