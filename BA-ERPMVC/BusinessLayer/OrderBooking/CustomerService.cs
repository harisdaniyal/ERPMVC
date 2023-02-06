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
    public class CustomerService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly CustomerRepository _customerRepository;

        public CustomerService()
        {
            _dbContext = new ERPMVCEntities();
            _customerRepository = new CustomerRepository(_dbContext);
        }

        public Task<IEnumerable<BACustomerRegistration>> GetAllCustomersAsync()
        {
            return _customerRepository.GetAllAsync();
        }
    }
}