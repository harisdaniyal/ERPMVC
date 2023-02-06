using BA_ERPMVC.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BA_ERPMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class ERPController : Controller
    {
        // GET: ERP
        public ActionResult Main()
        {
            return View();
        }
    }
}