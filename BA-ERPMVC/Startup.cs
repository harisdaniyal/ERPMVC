using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.ViewModels.OrderBooking;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using System;
using Hangfire;
using System.Linq;

[assembly: OwinStartupAttribute(typeof(BA_ERPMVC.Startup))]
namespace BA_ERPMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            GlobalConfiguration.Configuration.UseSqlServerStorage("DefaultConnection");
            app.UseHangfireDashboard();
            app.UseHangfireServer();


            createRolesandUsers();
            MappingConfigurations();
        }

        private void createRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            // In Startup iam creating first Admin Role and creating a default Admin User     
            if (!roleManager.RoleExists("Admin"))
            {

                // first we create Admin rool    
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Admin";
                roleManager.Create(role);

                //Here we create a Admin super user who will maintain the website                   

                var user = new ApplicationUser();
                user.UserName = "admin";
                user.Email = "admin@bilal-group.com";

                string userPWD = "qWer1234@";

                var chkUser = UserManager.Create(user, userPWD);

                //Add default User to Role Admin    
                if (chkUser.Succeeded)
                {
                    var result1 = UserManager.AddToRole(user.Id, "Admin");

                }
            }

            // creating Creating Manager role     
            if (!roleManager.RoleExists("Manager"))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Manager";
                roleManager.Create(role);

            }

            // creating Creating Employee role     
            if (!roleManager.RoleExists("Employee"))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Employee";
                roleManager.Create(role);

            }
        }

        public void MappingConfigurations()
        {
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;

               

                config.CreateMap<LogisticsViewModel, Logistic>()
                    .ForMember(to => to.CreatedBy, opt => opt.MapFrom(from => "Admin"))
                    .ForMember(to => to.CreatedDate, opt => opt.MapFrom(from => DateTime.Now.ToShortDateString()))
                    .ForMember(to => to.IsActive, opt => opt.MapFrom(from => 1));

                config.CreateMap<Logistic, LogisticsViewModel>()
                    .ForMember(to => to.ContainerTypeName, opt => opt.MapFrom(from => from.ContainerType1.ContainerTypeName));

                config.CreateMap<VendorExpens, VendorExpensesViewModel>()
                    .ForMember(to => to.ExpenseName, opt => opt.MapFrom(from => from.VendorTypeExpense.ExpenseName));

                config.CreateMap<TripContainer, TripContainersViewModel>()
                    .ForMember(to => to.ContainerNumber, opt => opt.MapFrom(from => from.Logistic.ContainerNo))
                    .ForMember(to => to.ContainerWeight, opt => opt.MapFrom(from => from.Logistic.ContainerWeight));

                config.CreateMap<Logistic, TripContainersViewModel>()
                    .ForMember(to => to.ContainerNumber, opt => opt.MapFrom(from => from.ContainerNo));

                config.CreateMap<TripContainersViewModel, Logistic>()
                    .ForMember(to => to.ContainerNo, opt => opt.MapFrom(from => from.ContainerNumber));
                config.CreateMap<EmptyDropOffViewModel, EmptyDropOff>()
                    .ForMember(to => to.TerminalName, opt => opt.MapFrom(from => from.PortName));

                config.CreateMap<ViewModels.OrderBooking.TripViewModel, BAtrip>()
                    .ForMember(to => to.ID, opt => opt.MapFrom(from => from.TripId))
                    .ForMember(to => to.Trip_ID, opt => opt.MapFrom(from => from.TripCode))
                    .ForMember(to => to.Operation_Date, opt => opt.MapFrom(from => DateTime.Parse(from.TripDate)))
                    .ForMember(to => to.TotalExpense, opt => opt.MapFrom(from => 0))
                    .ForMember(to => to.CreatedBy, opt => opt.MapFrom(from => "Admin"))
                    .ForMember(to => to.CreatedDate, opt => opt.MapFrom(from => DateTime.Now.ToShortDateString()))
                    .ForMember(to => to.IsActive, opt => opt.MapFrom(from => 1))
                    .ForMember(to => to.PartyId, opt => opt.MapFrom(from => from.VendorId))
                    .ForMember(to => to.PartyDriverName, opt => opt.MapFrom(from => from.DriverName))
                    .ForMember(to => to.PartyDriverCNIC, opt => opt.MapFrom(from => from.DriverCNIC))
                    .ForMember(to => to.PartyDriverContactNumber, opt => opt.MapFrom(from => from.DriverContactNumber))
                    .ForMember(to => to.PartyVehicleNo, opt => opt.MapFrom(from => from.VehicleNumber))
                    .ForMember(to => to.PartyRate, opt => opt.MapFrom(from => from.TotalExpense))
                    .ForMember(to => to.OrderId, opt => opt.MapFrom(from => from.OrderId))
                    .ForMember(to => to.FromLocation, opt => opt.MapFrom(from => from.FromLocation))
                    .ForMember(to => to.ToLocation, opt => opt.MapFrom(from => from.ToLocation))
                    //.ForMember(to => to.BAExpensesDetails, opt => opt.MapFrom(from => from.TripExpense))
                    .ForMember(to => to.TripContainers, opt => opt.MapFrom(from => from.TripContainers));

                config.CreateMap<BAtrip, ViewModels.OrderBooking.TripViewModel>()
                    .ForMember(to => to.TripId, opt => opt.MapFrom(from => from.ID))
                    .ForMember(to => to.TripCode, opt => opt.MapFrom(from => from.Trip_ID))
                    .ForMember(to => to.TripDate, opt => opt.MapFrom(from => from.Operation_Date.Value.ToShortDateString()))
                    .ForMember(to => to.VendorId, opt => opt.MapFrom(from => from.PartyId))
                    .ForMember(to => to.DriverName, opt => opt.MapFrom(from => from.PartyDriverName))
                    .ForMember(to => to.DriverCNIC, opt => opt.MapFrom(from => from.PartyDriverCNIC))
                    .ForMember(to => to.DriverContactNumber, opt => opt.MapFrom(from => from.PartyDriverContactNumber))
                    .ForMember(to => to.VehicleNumber, opt => opt.MapFrom(from => from.PartyVehicleNo))
                    .ForMember(to => to.TotalExpense, opt => opt.MapFrom(from => from.PartyRate))
                    .ForMember(to => to.OrderId, opt => opt.MapFrom(from => from.OrderId))
                    .ForMember(to => to.FromLocation, opt => opt.MapFrom(from => from.FromLocation))
                    .ForMember(to => to.ToLocation, opt => opt.MapFrom(from => from.ToLocation))
                    //.ForMember(to => to.TripExpense, opt => opt.MapFrom(from => from.BAExpensesDetails))
                    .ForMember(to => to.TripContainers, opt => opt.MapFrom(from => from.TripContainers))
                    .ForMember(to => to.VendorName, opt => opt.MapFrom(from => from.tbl_Party.PartyName))
                    .ForMember(to => to.FromLocationCode, opt => opt.MapFrom(from => from.stp_City.CityCode))
                    .ForMember(to => to.ToLocationCode, opt => opt.MapFrom(from => from.stp_City1.CityCode));
            });
        }
    }
}
