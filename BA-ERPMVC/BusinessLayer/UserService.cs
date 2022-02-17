using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;


namespace BA_ERPMVC.BusinessLayer
{
    public class UserService
    {
        ERPMVCEntities _dbContext = null;
        ApplicationDbContext _applicationDbContext = null;
        IUserRepository _userRepository = null;
   

        public UserService()
        {
            _dbContext = new ERPMVCEntities();
            _applicationDbContext = new ApplicationDbContext();
            _userRepository = new UserRepository(_dbContext);
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
    }
}