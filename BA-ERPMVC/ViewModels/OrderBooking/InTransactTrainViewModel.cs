using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class InTransactTrainViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public int? LogisticsId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public string PriorityForDispatched { get; set; }
		public DateTime? ArrivalDate { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }
		public bool? LOLO { get; set; }

		//***Added By Own///
		
		public string TrainID { get; set; }
		public int? StationID  { get; set; }
        public string StationName { get; set; }
        public string  Customer_Name { get; set; }
    }
}
