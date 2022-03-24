using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class BLShippingLineViewModel
    {
		public int BLShippingID { get; set; }
		public string BL { get; set; }
		public bool? Approval { get; set; }
		public int? Collect { get; set; }
		public string NumberOfOrignalBL { get; set; }
		public string Shipper { get; set; }
		public string Consignee { get; set; }
		public string NotifyParty { get; set; }
		public string precarriageby { get; set; }
		public string ForwardingAgent { get; set; }
		public string FinalDestination { get; set; }
		public string placeofreceipt { get; set; }
		public string OceanVessel { get; set; }
		public string VoyNo { get; set; }
		public string Portoflanding { get; set; }
		public string PortofDischarge { get; set; }
		public string PlaceOfIssue { get; set; }
		public DateTime? DateOfIssue { get; set; }
		public string PlaceOfDelivery { get; set; }
		public string ContainerNo { get; set; }
		public string SealNo { get; set; }
		public string NumberOfConatinerPack { get; set; }
		public string KindOfPackagesDescriptionOfGoods { get; set; }
		public string GrossWeight { get; set; }
		public string NetWeight { get; set; }
		public string Frightandcharges { get; set; }
		public string TypeOfService { get; set; }
		public string BLAgent { get; set; }
		public string BLAgentDetail { get; set; }
		public string FrightPayable { get; set; }
		public DateTime? placeOfDateofIssue { get; set; }
		public bool? IsCompleted { get; set; }
		public string UserID { get; set; }
		public string UpdateBy { get; set; }
		public string CreateDate { get; set; }
		public string UpdateDate { get; set; }


	}
}