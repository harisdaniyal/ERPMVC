using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class DeliveryTruckViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public int? LogisticsId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public DateTime? ArrivalDate { get; set; }
		public DateTime? DeliveryDate { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

		//  Add On  //
		public string ToLocation { get; set; }
		public string FromLocation { get; set; }
		public string DriverName { get; set; }
		public string DriverNo { get; set; }
		public string VehicleNo { get; set; }
		public string DeliveryLocation { get; set; }
		public DateTime? DispatchedDate { get; set; }

	}
}