using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class OrderContainerViewModel
    {
		public int ID { get; set; }
		public int OrderID { get; set; }
		public string ContainerNo { get; set; }
		public string ContainerSize { get; set; }
		public int? ContainerWeight { get; set; }
		public string OrderType { get; set; }
	}
}