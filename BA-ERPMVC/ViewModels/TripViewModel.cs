using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Models
{
    public class TripViewModel
    {
        public int ID { get; set; }
        public string Trip_ID { get; set; }
        public DateTime Operation_Date { get; set; }
        public int Order_ID { get; set; }
        public int Logistics_ID { get; set; }
        public string CountainerNo_ID { get; set; }
        public string CountainerNo2_ID { get; set; }
        public string FromLocation { get; set; }
        public string Tolocation { get; set; }
        public string CurrentFromLocation { get; set; }
        public string CurrentToLocation { get; set; }
        public int Drive_ID { get; set; }
        public int? Driver2_ID { get; set; }
        public int Vechial_ID { get; set; }
        public int ContainerStatus { get; set; }
        public DateTime? RecivedDate { get; set; }
        public int TotalExpense { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public bool IsActive { get; set; }
        public int? PartyId { get; set; }
        public string PartyDriverName { get; set; }
        public string PartyDriverCNIC { get; set; }
        public string PartyDriverContactNumber { get; set; }
        public string PartyVehicleNo { get; set; }
        public int PartyRate { get; set; }
    }
}