using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class ExpenseInvoiceViewModel
    {
		public int? ID { get; set; }
		public int? HeadID { get; set; }
		public int? UserID { get; set; }
		public string OrderNo { get; set; }
		public string ContainerNo { get; set; }
		public string OrderType { get; set; }
		public string HeadType { get; set; }
		public string HeadName { get; set; }
		public decimal? Amount { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreatedDate { get; set; }
		public bool? IsActive { get; set; }
		public string Remarks{ get; set; }
		public string UserName{ get; set; }

	}
}