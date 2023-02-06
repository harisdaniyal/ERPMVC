using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class VendorListViewModel
    {
        public VendorListViewModel()
        {

        }

        public int PartyId { get; set; }
        public string PartyName { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> StateId { get; set; }
        public Nullable<int> CityId { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public Nullable<int> Type { get; set; }
        public Nullable<bool> Receiveable { get; set; }
        public Nullable<bool> Payable { get; set; }
        public string PartyType { get; set; }
    }
}