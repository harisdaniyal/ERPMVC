using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class LogisticsReportViewModel
    {
        public int logisticsid { get; set; }
        public string OrderNo { get; set; }
        public string Customer_Name { get; set; }
        public string JobType { get; set; }
        public string FacilityName { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerNo2 { get; set; }
        public int? ContainerWeight { get; set; }
        public string ContainerSize { get; set; }
        public string FromLocation { get; set; }
        public string ToLocation { get; set; }
        public bool? IsActive { get; set; }
        public int? Qty { get; set; }
        public string ContainerStatusTrip { get; set; } 
    }
}