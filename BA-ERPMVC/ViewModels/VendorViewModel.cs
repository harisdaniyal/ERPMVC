using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class VendorViewModel
    {
        public string VendorId { get; set; }
        public string VendorName { get; set; }
        public string isActive { get; set; }
        public string StateId { get; set; }
        public string CityId { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }
}