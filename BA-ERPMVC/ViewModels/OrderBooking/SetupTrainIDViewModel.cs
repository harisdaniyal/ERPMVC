﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels.OrderBooking
{
    public class SetupTrainIDViewModel
    {
        public int? ID { get; set; }
        public string TrainID { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public bool? IsDeleted { get; set; }
    }
}