using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class UserViewModel
    {
		public int? ID { get; set; }
		public string UserName { get; set; }
		public string CNIC { get; set; }
		public string CreatedBy { get; set; }
		public DateTime? CreatedDate { get; set; }
		public bool? IsDeleted { get; set; }

	}
}