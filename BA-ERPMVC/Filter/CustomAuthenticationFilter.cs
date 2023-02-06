using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;
using System.Web.Routing;

namespace BA_ERPMVC.Filter
{
    public class CustomAuthenticationFilter : ActionFilterAttribute, IAuthenticationFilter
    {

        public void OnAuthentication(AuthenticationContext filterContext)
        {
            //var controller = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            //var action = filterContext.ActionDescriptor.ActionName;

            if (HttpContext.Current.Session["UserName"] == null)
            {
                filterContext.Result = new HttpUnauthorizedResult();
            }
            //else
            //{
            //    List<UserMenuViewModel> menuAssignment = (List<UserMenuViewModel>)HttpContext.Current.Session["MenuAssignment"];
            //    if (menuAssignment!= null)
            //    {
            //        if (!menuAssignment.Any(x => x.Url == $"{controller}/{action}" && x.IsView == true) && action != "Dashboard")
            //        {
            //            filterContext.Result = new HttpUnauthorizedResult();
            //        }
            //    }
            //    else
            //    {
            //        filterContext.Result = new HttpUnauthorizedResult();
            //    }
               
            //}
            
        }
        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            if (filterContext.Result == null || filterContext.Result is HttpUnauthorizedResult)
            {
                //Redirecting the user to the Login View of Account Controller  
                filterContext.Result = new RedirectToRouteResult(
                new RouteValueDictionary
                {
                     { "controller", "Account" },
                     { "action", "Login" }
                });
            }
        }
        //public void OnAuthentication(AuthenticationContext filterContext)
        //{
        //    var controller = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
        //    var action = filterContext.ActionDescriptor.ActionName;
        //    using (ERPMVCEntities _dbContext = new ERPMVCEntities())
        //    {
        //        List<ViewModels.UserMenuViewModel> menuAssignment = (List<ViewModels.UserMenuViewModel>)HttpContext.Current.Items["MenuAssignment"];
        //        if (!menuAssignment.Any(x => x.Url == $"{controller}/{action}" && x.IsView == true))
        //        {
        //            filterContext.Result = new RedirectResult("~/Account/Login");
        //        }
        //    }

        //}
    }
}