using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class CityListViewModel
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> StateId { get; set; }
        public string State { get; set; }
    }
}