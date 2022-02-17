using BA_ERPMVC.Models;
//using InfiSolMVC.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfiSolMVC.Controllers
{
    public class RoleController : Controller
    {
        ApplicationDbContext db = new ApplicationDbContext();
        // GET: Role
        public ActionResult RoleList()
        {
            var rolelist = db.Roles.ToList();
            return View(rolelist);
        }

        [HttpGet]
        public ActionResult CreateRole()
        {
            var role = new IdentityRole();
            return View(role);
        }

        [HttpPost]
        public ActionResult CreateRole(IdentityRole identity)
        {
            db.Roles.Add(identity);
            db.SaveChanges();
            return RedirectToAction("RoleList");
        }


    }
}