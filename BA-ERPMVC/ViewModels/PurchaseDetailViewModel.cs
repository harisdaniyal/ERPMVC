using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class PurchaseDetailViewModel
    {
        
        public int PurchaseDetailId { get; set; }
        public int ItemId { get; set; }
        public string Quantity { get; set; }
        public string UnitIn { get; set; }
        public string Rate { get; set; }
        public string Amount { get; set; }
        public string Remarks { get; set; }
        public bool isActive { get; set; }
        public int PurchaseId { get; set; }
    }
}
