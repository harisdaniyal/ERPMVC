using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;


namespace BA_ERPMVC.BusinessLayer
{
    public class UserService
    {
        ERPMVCEntities _dbContext = null;
        ApplicationDbContext _applicationDbContext = null;
        IUserRepository _userRepository = null;
        ISetupUserRepository _SetupuserRepository = null;
        private readonly UserMenuRepository userMenuRepository;


        public UserService()
        {
            _dbContext = new ERPMVCEntities();
            _applicationDbContext = new ApplicationDbContext();
            _userRepository = new UserRepository(_dbContext);
            _SetupuserRepository = new SetupUserRepository(_dbContext);
            userMenuRepository = new UserMenuRepository(_dbContext);

        }



        public IEnumerable<AspNetUser> GetAll()
        {
            return _userRepository.GetAll();
        }


        public Object GetUserList(string UserRole)
        {

            var result = _userRepository.GetAll().
                                    Where(x => x.AspNetRoles.Any(r => r.Name == UserRole) /*&& x.IsActive == true*/).
                                    Select(x => new
                                    {
                                        x.Id,


                                        x.PhoneNumber,
                                        x.Email,
                                        x.UserName

                                    });
            return result;

        }
        public Object GetStaffList()
        {
            var result = _userRepository.GetAll().
                                    Where(x => x.AspNetRoles.Any(r => r.Name == "STAFF") /*&& x.IsActive == true*/).
                                    Select(x => new
                                    {
                                        x.Id,


                                        x.PhoneNumber,
                                        x.Email,
                                        x.UserName
                                    });
            return result;

        }

        public string IsUserExists(UserRegistrationViewModel userRegistrationViewModel)
        {
            string message = string.Empty;
            if (string.IsNullOrEmpty(userRegistrationViewModel.Id))
            {
                if (_userRepository.Find(x => x.UserName.Trim() == userRegistrationViewModel.UserName.Trim() && x.isActive == true).FirstOrDefault() != null)
                {
                    message = "Customer with the same CNIC already exists";
                }
                else if (_userRepository.Find(x => x.Email.Trim() == userRegistrationViewModel.Email.Trim() && x.isActive == true).FirstOrDefault() != null)
                {
                    message = "Customer with the same EMAIL already exists";
                }

            }
            else
            {
                if (_userRepository.Find(x => x.UserName.Trim().ToLower() == userRegistrationViewModel.UserName.Trim().ToLower() && x.Id != userRegistrationViewModel.Id && x.isActive == true).FirstOrDefault() != null)
                {
                    message = "Customer with the same Email already exists";
                }
                else if (_userRepository.Find(x => x.Email.Trim() == userRegistrationViewModel.Email.Trim() && x.isActive == true).FirstOrDefault() != null)
                {
                    message = "Customer with the same EMAIL already exists";
                }
            }

            return message;
        }

        public string Delete(string id)
        {
            string statusCode = "11";
            AspNetUser obj = _userRepository.Find(x => x.Id == id).FirstOrDefault();
            obj.isActive = false;

            _dbContext.AspNetUsers.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            int isDeleted = _dbContext.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }


        public string AddUser(AspNetUser user)
        {
            string statusCode = "11";
            user.isActive = true;

            _dbContext.AspNetUsers.Add(user);
            int isDeleted = _dbContext.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }


        // ****************************** User-Menu-Assignment **************************** //


        public IEnumerable<AspNetUser> GetUserNameList()
        {
            return _dbContext.AspNetUsers.Where(x => x.isActive == true).ToList();
        }

        public IEnumerable<UserMenuViewModel> GetAssignUserMenu(string userID)
        {
            return (from menu in _dbContext.Menus.Where(x => x.IsDeleted == false)
                    join MA in _dbContext.MenuAssignments.Where(x => x.IsDeleted == false && x.UserId == userID)
                        on menu.MenuId equals MA.MenuId into MAGroup
                    from MenuAssignment in MAGroup.DefaultIfEmpty()
                    select new UserMenuViewModel()
                    {
                        MenuId = menu.MenuId,
                        UserId = MenuAssignment.UserId,
                        UserName = _dbContext.AspNetUsers.Where(x => x.isActive == true).FirstOrDefault().UserName,
                        IsView = MenuAssignment.IsView,
                        MenuName = menu.MenuName,
                        Url = menu.Url

                    }).Distinct().ToList();

        }

        public async Task SaveAssignMenuAsync(List<UserMenuViewModel> UserMenuVM)
        {
            try
            {
                var userassignmenu = Mapper.Map<List<UserMenuViewModel>, List<MenuAssignment>>(UserMenuVM);
                string userID = string.Empty;
                if (userassignmenu.Count == 0)
                {
                    throw new ArgumentNullException(nameof(UserMenuVM));
                }

                userID = userassignmenu[0].UserId;
                if (_dbContext.MenuAssignments.Any(x => x.UserId == userID))
                {
                    userMenuRepository.RemoveRange(_dbContext.MenuAssignments.Where(x => x.UserId == userID).ToList());
                    await _dbContext.SaveChangesAsync();
                }

                userMenuRepository.AddRange(userassignmenu);
                await _dbContext.SaveChangesAsync();
            }
            catch (Exception ex)
            {

            }
        }

        /// *********** Setup User *********///
        public IEnumerable<UserViewModel> GetUserAsync()
        {
            return (from user in _dbContext.tbl_User.Where(x => x.IsDeleted == false)

                    select new UserViewModel()
                    {
                        ID = user.ID,
                        UserName = user.UserName,
                        CNIC = user.CNIC,
                        CreatedBy = user.CreatedBy,
                        CreatedDate = user.CreatedDate,
                        IsDeleted = user.IsDeleted,

                    }).OrderByDescending(x => x.ID);
        }
        public async Task SaveUserAsync(UserViewModel setupuserVM)
        {

            var setupUser = Mapper.Map<UserViewModel, tbl_User>(setupuserVM);
            if (setupUser == null)
            {
                throw new ArgumentNullException(nameof(setupuserVM));
            }
            setupUser.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            setupUser.CreatedDate = DateTime.Now;
            setupUser.IsDeleted = false;
            _SetupuserRepository.Add(setupUser);

            await _dbContext.SaveChangesAsync();
            setupuserVM.ID = setupUser.ID;
        }

        public async Task UpdateUsertAsync(UserViewModel setupuserVM)
        {

            if (setupuserVM == null)
            {
                throw new ArgumentNullException(nameof(setupuserVM));
            }

            var setupUser = await _SetupuserRepository.GetAsync(Convert.ToInt32(setupuserVM.ID));

            if (setupUser == null)
            {
                throw new InvalidOperationException($"This User:{setupuserVM.ID}  not found.");
            }

            setupUser.UserName = setupuserVM.UserName;
            setupUser.CNIC = setupuserVM.CNIC;

            _SetupuserRepository.Update(setupUser);


            await _dbContext.SaveChangesAsync();
            setupuserVM.ID = setupUser.ID;
        }

        public bool DeleteUser(int Id)
        {
            bool isSuccess = false;
            var setupUser = _dbContext.tbl_User.Where(x => x.ID == Id).FirstOrDefault();
            if (setupUser == null)
            {
                isSuccess = false;
            }
            else
            {
                setupUser.IsDeleted = true;
                _dbContext.SaveChangesAsync();
                isSuccess = true;
            }

            return isSuccess;

        }


      
    }
}