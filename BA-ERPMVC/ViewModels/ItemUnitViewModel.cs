using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class ItemUnitViewModel
    {
        public int ID { get; set; }
        public string UnitName { get; set; }
        public int Version { get; set; }
        public bool Is_Deleted { get; set; }
        public string CreateUser { get; set; } 
        public string Create_IP { get; set; }
        public DateTime? Create_DateTime { get; set; }
        public string UpdateUser { get; set; } 
        public string Update_IP { get; set; }
        public DateTime? Update_DateTime { get; set; }
    }
}