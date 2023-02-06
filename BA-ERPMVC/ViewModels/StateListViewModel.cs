using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class StateListViewModel
    {
        public int StateId { get; set; }
        public string StateName { get; set; }
        public Nullable<bool> isActive { get; set; }
    }
}