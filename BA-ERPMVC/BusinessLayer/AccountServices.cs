using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.Repositories.CoreRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{
    
    public class AccountServices
    {
        ERPMVCEntities _dbContext = null;
        IRoleRepository _roleRepository = null;
        IBusinessDivisionRepository _businessRepository = null;
        public AccountServices()
        {
            _dbContext = new ERPMVCEntities();
            _roleRepository = new RoleRepository(_dbContext);
            _businessRepository = new BusinessDivisionRepository(_dbContext);
        }
        public RegisterDropDownViewModel GetAccountDropdowns()
        {
            RegisterDropDownViewModel accountDropdownViewModels = new RegisterDropDownViewModel()
            {
                RoleList = _roleRepository.GetAll().ToList(),
                BusinessList = _businessRepository.GetAll().ToList(),
            };


            return accountDropdownViewModels;
        }
    }
    
}