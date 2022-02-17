using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Models
{
    public class GenerateInvoiceViewModel
    {
        public int InvoiceID { get; set; }
        public string InvoiceNumber { get; set; }
        public int? OrderID { get; set; }
        public DateTime InvoiceDate { get; set; }
        public string NTN { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string VerifiedBy { get; set; }
        public DateTime VerifiedDate { get; set; }
        public DateTime InvoiceDataFromDate { get; set; }
        public DateTime InvoiceDataToDate { get; set; }
        public bool isActive { get; set; }
        public int? Status { get; set; }
    }
}