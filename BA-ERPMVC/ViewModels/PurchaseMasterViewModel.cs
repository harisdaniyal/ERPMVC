using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class PurchaseMasterViewModel
    {

        public int PurchaseId { get; set; }
        public string PurchaseNo { get; set; }
        public DateTime Date { get; set; }
        public int CreditDay { get; set; }
        public DateTime DueDate { get; set; }
        public int PartyId { get; set; }
        public string BillNo { get; set; }
        public string TotalAmount { get; set; }
        public bool isActive { get; set; }
        public List<PurchaseDetailViewModel> purchaseDetailViewModels { get; set; }
    }
}