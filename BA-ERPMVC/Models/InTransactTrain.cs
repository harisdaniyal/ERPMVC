//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BA_ERPMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class InTransactTrain
    {
        public int ID { get; set; }
        public int OrderId { get; set; }
        public string OrderNo { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerSize { get; set; }
        public string BLnumber { get; set; }
        public Nullable<int> StationID { get; set; }
        public string TrainID { get; set; }
        public string Customer_Name { get; set; }
        public string PriorityForDispatched { get; set; }
        public Nullable<System.DateTime> ArrivalDate { get; set; }
        public Nullable<bool> LOLO { get; set; }
        public Nullable<bool> IsCompleted { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}