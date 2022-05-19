using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class BLShippingContainerViewModel
    {
		public int? ID { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerType { get; set; }
		public string ContainerSize { get; set; }
		public DateTime? DeletedDate { get; set; }
		public bool? IsDeleted { get; set; }
	}
}