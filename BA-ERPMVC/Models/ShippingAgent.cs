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
    
    public partial class ShippingAgent
    {
        public long ShippingAgentId { get; set; }
        public string Name { get; set; }
        public string Line { get; set; }
        public string LineCode { get; set; }
        public int OtherCharges { get; set; }
        public string ChargesName { get; set; }
        public System.DateTime DeleteDate { get; set; }
        public bool IsDeleted { get; set; }
        public string BillDateType { get; set; }
    }
}
