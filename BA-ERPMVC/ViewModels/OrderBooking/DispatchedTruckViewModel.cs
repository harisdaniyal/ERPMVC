using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class DispatchedTruckViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public int? LogisticsId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public DateTime? DispatchedDate { get; set; }
		public string VehicleNo { get; set; }
		public string DriverName { get; set; }
		public string DriverNo { get; set; }
		public string TransporterName { get; set; }
		public string BiltyNo { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool IsDeleted { get; set; }

		// ADD ON//
		public string FromLocation { get; set; }
		public string ToLocation { get; set; }
		public DateTime? LastDateofEmptyReturn { get; set; }
        public int? FreeDays { get; set; }
    }
}