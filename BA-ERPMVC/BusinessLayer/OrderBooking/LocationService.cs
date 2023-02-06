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
    public class LocationService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly LocationsRepositry _locationsRepositry;
        private readonly EmptyDropOffLocRepository _emptydropofflocRepository;

        public LocationService()
        {
            _dbContext = new ERPMVCEntities();
            _locationsRepositry = new LocationsRepositry(_dbContext);
            _emptydropofflocRepository = new EmptyDropOffLocRepository(_dbContext);
        }

        public Task<IEnumerable<Location>> GetLocationsAsync()
        {
            return _locationsRepositry.GetAllAsync();
        }


        public Task<IEnumerable<EmptyDropOffLoc>> GetEmptyDropOffLocAsync()
        {
            return _emptydropofflocRepository.GetAllAsync();
        }
    }
}