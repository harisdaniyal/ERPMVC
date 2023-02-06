using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class DispatchedOrderViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public string PriorityForDispatched { get; set; }
		public string TrainID { get; set; }
		public DateTime? DispatchedDate { get; set; }
		public DateTime? DispatchedDateTrain { get; set; }
		public int? StationID { get; set; }
		public string StationName { get; set; }
		public string WagonNo { get; set; }
		public string WagonType { get; set; }
		public string RRNo { get; set; }
		public string EngineNo { get; set; }
		public string InvoiceNumber { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }

		//Added By Own////
		public string ContainerNo { get; set; }
		public int? LogisticsId { get; set; }
		public string ContainerSize { get; set; }
	}
}