using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class SideBarQuantity
    {
        public int UserQuantity { get; set; }
        public int Inventory { get; set; }
        public int CustomerQuantity { get; set; }
        public int DriverQuantity { get; set; }
    }
}