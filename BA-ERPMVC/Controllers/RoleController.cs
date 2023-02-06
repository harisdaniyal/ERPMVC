using BA_ERPMVC.BusinessLayer;
using BA_ERPMVC.Filter;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
//using InfiSolMVC.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace InfiSolMVC.Controllers
{
    [CustomAuthenticationFilter]
    public class RoleController : Controller
    {
        private readonly UserService userservice;
        ApplicationDbContext db = new ApplicationDbContext();

        public RoleController()
        {
            userservice = new UserService();
        }
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

        [HttpGet]
        public ActionResult AssignMenu(string userID)
        {
            this.ViewBag.UserNames = userservice.GetUserNameList();
            var assignuserModel = userservice.GetAssignUserMenu(userID);

            return View(assignuserModel);
        }

        [HttpPost]
        public async Task<ActionResult> AssignMenu(List<UserMenuViewModel> UserMenuVM)
        {
            if (UserMenuVM.Count == 0)
            {
                return Json(new { success = false, message = $"{nameof(UserMenuVM)} should not be null or empty" });
            }

            try
            {

                await userservice.SaveAssignMenuAsync(UserMenuVM);

                return Json(new { success = true, message = "Successfully Saved" });

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
    }
}
    