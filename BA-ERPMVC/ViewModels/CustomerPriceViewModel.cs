using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class CustomerPriceViewModel
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public int FacilityID { get; set; }
        public int TotalFacility { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreateDate { get; set; }
        public string UpdatedBy { get; set; }
        public bool isActive { get; set; }
        public List<CustomerFacilityDetailsViewModel> customerFacilityDetailsViewModels { get; set; }
    }
}