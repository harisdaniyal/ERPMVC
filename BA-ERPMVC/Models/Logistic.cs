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
    
    public partial class Logistic
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Logistic()
        {
            this.TripContainers = new HashSet<TripContainer>();
        }
    
        public int logisticsid { get; set; }
        public int OrderId { get; set; }
        public string FromLocation { get; set; }
        public string ToLocation { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string JobType { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerNo2 { get; set; }
        public string JobType2 { get; set; }
        public string ContainerSize { get; set; }
        public Nullable<int> ContainerWeight { get; set; }
        public Nullable<int> OrderServiceId { get; set; }
        public Nullable<int> Qty { get; set; }
        public Nullable<int> ContainerTripStatus { get; set; }
        public Nullable<int> ContainerType { get; set; }
        public string EmptyReturnLocation { get; set; }
        public string EmptyReturnDate { get; set; }
        public string Status { get; set; }
        public string ModeOfTransportation { get; set; }
        public Nullable<bool> PreDispatched { get; set; }
        public string Comodities { get; set; }
        public string ReferenceContainer { get; set; }
    
        public virtual ContainerType ContainerType1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TripContainer> TripContainers { get; set; }
        public virtual tbl_Container_logistics_Status tbl_Container_logistics_Status { get; set; }
    }
}
