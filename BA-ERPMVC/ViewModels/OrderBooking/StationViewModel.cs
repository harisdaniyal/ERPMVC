using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class StationViewModel
    {
		public int? StationID { get; set; }
		public string StationName { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

	}
}