using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.ViewModels.OrderBooking;
using System.Threading.Tasks;

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class FacilityService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly FacilityRepository _facilityRepository;

        public FacilityService()
        {
            _dbContext = new ERPMVCEntities();
            _facilityRepository = new FacilityRepository(_dbContext);
        }

        public Task<IEnumerable<stp_Facility>> GetAllFacilitiesAsync()
        {
            return _facilityRepository.FindAsync(x => x.isActive ?? true);
        }
    }
}