using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;

namespace BA_ERPMVC.BusinessLayer
{
    public class VendorTypeService
    {
        ERPMVCEntities _dbContext = null;
        private readonly VendorTypeRepositry _vendorTypeRepository;
        public VendorTypeService()
        {
            _dbContext = new ERPMVCEntities();
            _vendorTypeRepository = new VendorTypeRepositry(_dbContext);
        }

        public IEnumerable<VendorType> GetAllVendorTypes()
        {
            return _vendorTypeRepository.GetAll().Where(x => x.IsActive == true);
        }
    }
}