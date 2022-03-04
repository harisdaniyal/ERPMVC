using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class ShippingAgentViewModel
    {
        public long ShippingAgentId { get; set; }
        public string Name { get; set; }
        public DateTime? DeletedDate { get; set; }
        public bool? IsDeleted { get; set; }
    }
}