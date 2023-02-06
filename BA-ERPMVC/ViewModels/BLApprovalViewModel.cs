using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class BLApprovalViewModel
    {
		public int? ID { get; set; }
		public string Approval { get; set; }
		public string ContainerNo { get; set; }
		public string BLnumber { get; set; }
		public string SealNo { get; set; }
		public bool? IsCompleted { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreateDate { get; set; }
		public string UpdatedBy { get; set; }
		public DateTime? UpdateDate { get; set; }
		public bool? IsDeleted { get; set; }

	}
}