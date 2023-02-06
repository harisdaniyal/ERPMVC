using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class InvoiceHeadViewModel
    {
		public int? ID { get; set; }
		public string HeadType { get; set; }
		public string HeadName { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreatedDate { get; set; }
		public string DeletedBy { get; set; }
		public DateTime? DeletedDate { get; set; }
		public bool? IsDeleted { get; set; }
	}
}