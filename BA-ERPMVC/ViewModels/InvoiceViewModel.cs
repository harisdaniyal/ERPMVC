using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class InvoiceViewModel
    {
        public string OrderNo { get; set; }
        public string InvoiceNumber  { get; set; }
        public Nullable<System.DateTime> InvoiceDate { get; set; }
        public string VerifiedBy { get; set; }
        public Nullable<System.DateTime> VerifiedDate { get; set; }   
        public bool isActive { get; set; }
        public string Status { get; set; }
        public string Customer_Name { get; set; }
        public string BL_CRO { get; set; }
        public string OrderTYpe { get; set; }
        public string CRO { get; set; }
        public string DeliveryNo { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string BusinessDivisionName { get; set; }
        public int S20Container { get; set; }
        public int D20Container { get; set; }
        public int S20ContainerEmpty { get; set; }
        public int D20ContainerEmpty { get; set; }
        public int WS20Container { get; set; }
        public int WD20Container { get; set; }
       // public int WCContainer { get; set; }
        public int Qty40Container { get; set; }
        public int Qty40ContainerLaden { get; set; }
        public int Qty40ContainerEmpty { get; set; }
        public dynamic Price20 { get; set; }
        public dynamic Price40 { get; set; }
        public dynamic Price20Empty { get; set; }
        public dynamic Price40Empty { get; set; }
        public dynamic priceLolo { get; set; }
        public dynamic priceLoloEMPTY { get; set; }
        public int? LoloQty { get; set; }
        public int? LOloQtyEmpty { get; set; }
        public dynamic WCPrice { get; set; }
        public dynamic WC40Price { get; set; }


        public int S01_10TonConatiner { get; set; }
        public int S10_15TonConatiner { get; set; }
        public int S15_20TonConatiner { get; set; }
        public int S20_25TonConatiner { get; set; }
        public int S25_30TonConatiner { get; set; }
        public int D20_25TonConatiner { get; set; }
        public int D30_35TonConatiner { get; set; }
        public int D35_40TonConatiner { get; set; }
        public int D40_45TonConatiner { get; set; }
        public int D45_50TonConatiner { get; set; }
        public int D50_55TonConatiner { get; set; }
        public int D55_60TonConatiner { get; set; }
    }


  
}