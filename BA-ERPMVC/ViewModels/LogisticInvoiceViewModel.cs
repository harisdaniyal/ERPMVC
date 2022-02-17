using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class LogisticInvoiceViewModel
    {
        public decimal LocalLogisticsInvoiceMstID { get; set; }
        public string InvoiceNumber { get; set; }
        public string CustomerName { get; set; }
        public string ContainerNo { get; set; }
        public string JobType { get; set; }
        public long Qty { get; set; }
        public string ServiecType { get; set; }
        public Nullable<DateTime> InvoiceDate { get; set; }
        public Nullable<DateTime> OperationDate { get; set; }
        public Nullable<DateTime> FromDate { get; set; }
        public Nullable<DateTime> ToDate { get; set; }
        public string ProductCaTName { get; set; }
        public string VehicleNo { get; set; }
        public string FromLocation { get; set; }
        public string ToLocation { get; set; }
        public decimal GatePassAmt { get; set; }
        public decimal WeightAmt { get; set; }
        public decimal Others { get; set; }
        public string OtherExpenseDesc { get; set; }
        public string ContainerQTY { get; set; }
    }
}