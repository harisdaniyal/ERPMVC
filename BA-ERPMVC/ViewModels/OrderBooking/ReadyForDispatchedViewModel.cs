using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
	public class ReadyForDispatchedViewModel
	{
		public int? ID { get; set; }
		public int OrderId { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public string BLnumber { get; set; }
        public DateTime? DOGranty { get; set; }
		public DateTime? ImportEIR { get; set; }
		public DateTime? PortWeighment { get; set; }
		public DateTime? OutSidePortWeighment { get; set; }
		public DateTime? GD { get; set; }
		public DateTime? BL { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }

		
        
    }
}