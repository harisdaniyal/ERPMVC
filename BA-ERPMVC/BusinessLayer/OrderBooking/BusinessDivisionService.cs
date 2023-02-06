using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.ViewModels.OrderBooking;

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class BusinessDivisionService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly BusinessDivisionRepository _businessDivisionRepository;

        public BusinessDivisionService()
        {
            _dbContext = new ERPMVCEntities();
            _businessDivisionRepository = new BusinessDivisionRepository(_dbContext);
        }
        public Task<IEnumerable<stp_BusinessDivision>> GetAllBusinessDivisionsAsync()
        {
            return _businessDivisionRepository.FindAsync(x => x.Status ?? true);
        }
    }
}