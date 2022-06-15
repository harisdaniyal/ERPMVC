using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class LogisticsViewModel
    {
        public int OrderId { get; set; }
        public int LogisticsId { get; set; }
        public string ContainerNo { get; set; }
        public int ContainerWeight { get; set; }
        public string ContainerSize { get; set; }
        public int ContainerType { get; set; }
        public string ContainerTypeName { get; set; }
        public string JobType { get; set; }
        public string ReferenceContainer { get; set; }
        public string FromLocation { get; set; }
        public string ToLocation { get; set; }
        public string EmptyReturnLocation { get; set; }
        public string EmptyReturnDate { get; set; }
        public string ModeOfTransportation { get; set; }
        public string Status { get; set; }
        public bool? PreDispatched { get; set; }
        public string Comodities { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }

    }
}