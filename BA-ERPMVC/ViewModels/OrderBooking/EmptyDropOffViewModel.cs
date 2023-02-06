using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class EmptyDropOffViewModel
    {
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public int? LogisticsId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
		public string ReferenceContainer { get; set; }
		public int? PortAndTerminalId { get; set; }
		public string PortName { get; set; }
		public string ShippingLineName { get; set; }
		public string EIRNo { get; set; }
		public decimal? ExpenseAtEmptyLocation { get; set; }
		public string Remarks { get; set; }
		public DateTime? DeliveryDate { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

	}
}