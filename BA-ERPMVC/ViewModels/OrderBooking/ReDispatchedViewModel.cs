using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
	public class ReDispatchedViewModel
	{
		public int? ID { get; set; }
		public int? OrderId { get; set; }
		public int? LogisticsId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public string VehicleNo { get; set; }
		public DateTime? ReDispatchedDate { get; set; }
		public string TranspoterName { get; set; }
		public string BiltyNumber { get; set; }
		public decimal? TransportationCost { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

        public DateTime? ArrivalDate { get; set; }
        public DateTime? LastDateofEmptyReturn { get; set; }
        public string DelieveryLocation { get; set; }
        public string EmptyDropOffLocation { get; set; }
        public string StationName { get; set; }
        public int? StationID { get; set; }
		public int? FreeDays { get; set; }


	}
}