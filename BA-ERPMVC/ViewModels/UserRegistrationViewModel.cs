using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BA_ERPMVC.ViewModels
{
    public class UserRegistrationViewModel
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public string CNIC { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int BusinessDivisionID { get; set; }
        public bool isActive { get; set; }
    }
}