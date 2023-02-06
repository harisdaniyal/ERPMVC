using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Models
{
    public class TempOrder
    {
      //  public string containerStatus { get; set; }
        public string containerno { get; set; }
        public string containerno2 { get; set; }
        public string containersize { get; set; }
        public string fromlocation { get; set; }
        public string tolocation { get; set; }
        public string jobtype { get; set; }
        public string jobtype2 { get; set; }
        public int containerWeight { get; set; }
        public int? logisContainerStatus { get; set; }
        
    }
}