using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class PrintContainerWiseReportViewModel
    {
        public int OrderId { get; set; }
        public int LogisticsId { get; set; }
        public int CustomerId { get; set; }
        public string RateTwenty{ get; set; }
        public string RateForty{ get; set; }
        public int? TotalContainerCount { get; set; }
        public string Customer_Name { get; set; }
        public int? ContainerCountTwenty { get; set; }
        public int? ContainerCountForty { get; set; }
        public string BL { get; set; }
        public string CRO { get; set; }
        public string OrderType { get; set; }
    }
}