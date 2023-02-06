using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class UserMenuViewModel
    {
        public int? Id { get; set; }
        public long? MenuId { get; set; }
        public string UserId { get; set; }
        public string MenuName { get; set; }
        public string UserName { get; set; }
        public string Url { get; set; }
        public bool? IsView { get; set; }
        public bool? IsDeleted { get; set; }
    }
}