using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class BLShippingContainerDetailViewModel
    {
        public int? Id { get; set; }
        public string ContainerNo { get; set; }
        public string SealNo { get; set; }
        public string KindOfPackagesDescriptionOfGoods { get; set; }
        public string GrossWeight { get; set; }
        public string NetWeight { get; set; }
        public string Bl { get; set; }
        public bool? IsDeleted { get; set; }

    }
}