using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class TripContainersViewModel
    {
        public int TripContainerId { get; set; }
        public int LogisticsId { get; set; }
        public string ContainerNumber { get; set; }
        public int ContainerWeight { get; set; }
    }
}