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
    
    public partial class tbl_City
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_City()
        {
            this.tbl_Party = new HashSet<tbl_Party>();
        }
    
        public int CityId { get; set; }
        public string CityName { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> StateId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Party> tbl_Party { get; set; }
    }
}
