using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{
    public class ShippingService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly ShippingAgentRepository _shippingAgentRepository;
        private readonly ShippingLineRepository _shippingLineRepository;

        public ShippingService()
        {
            _dbContext = new ERPMVCEntities();
            _shippingAgentRepository = new ShippingAgentRepository(_dbContext);
            _shippingLineRepository = new ShippingLineRepository(_dbContext);
        }

        public IEnumerable<ShippingAgentViewModel> GetShippingAgentAsync()
        {
            return (from shippingagent in _dbContext.ShippingAgents.Where(x => x.IsDeleted == false)
                    select new ShippingAgentViewModel()
                    {
                        ShippingAgentId = shippingagent.ShippingAgentId,
                        Name = shippingagent.Name
                    }).OrderByDescending(x => x.ShippingAgentId);

        }

        public async Task SaveShippingAgentAsync(ShippingAgentViewModel shippingagentVM)
        {

            var shippingagent = Mapper.Map<ShippingAgentViewModel, ShippingAgent>(shippingagentVM);
            if (shippingagent == null)
            {
                throw new ArgumentNullException(nameof(shippingagentVM));
            }

            shippingagent.IsDeleted = false;
            _shippingAgentRepository.Add(shippingagent);

            await _dbContext.SaveChangesAsync();
            shippingagentVM.ShippingAgentId = shippingagent.ShippingAgentId;
        }

        public async Task UpdateShippingAgentAsync(ShippingAgentViewModel shippingagentVM)
        {

            if (shippingagentVM == null)
            {
                throw new ArgumentNullException(nameof(shippingagentVM));
            }

            var shippingagent = await _shippingAgentRepository.GetAsync(Convert.ToInt32(shippingagentVM.ShippingAgentId));

            if (shippingagent == null)
            {
                throw new InvalidOperationException($"Booking order:{shippingagentVM.ShippingAgentId}  not found.");
            }

            shippingagent.Name = shippingagentVM.Name;
            shippingagent.IsDeleted = shippingagentVM.IsDeleted.GetValueOrDefault();




            _shippingAgentRepository.Update(shippingagent);


            await _dbContext.SaveChangesAsync();
            shippingagentVM.ShippingAgentId = shippingagent.ShippingAgentId;
        }

                       /////******** ShippingLine ********/////
        
        public IEnumerable<ShippingLineViewModel> GetShippingLineAsync()
        {
            return (from shippingline in _dbContext.ShippingLines.Where(x => x.IsDeleted == false)
                    select new ShippingLineViewModel()
                    {
                        ShippingLineId = shippingline.ShippingLineId,
                        ShippingLineName = shippingline.ShippingLineName
                    }).OrderByDescending(x => x.ShippingLineId);

        }

        public async Task SaveShippingLineAsync(ShippingLineViewModel shippinglineVM)
        {

            var shippingline = Mapper.Map<ShippingLineViewModel, ShippingLine>(shippinglineVM);
            if (shippingline == null)
            {
                throw new ArgumentNullException(nameof(shippinglineVM));
            }

            shippingline.IsDeleted = false;
            _shippingLineRepository.Add(shippingline);

            await _dbContext.SaveChangesAsync();
            shippinglineVM.ShippingLineId = shippingline.ShippingLineId;
        }

        public async Task UpdateShippingLineAsync(ShippingLineViewModel shippinglineVM)
        {

            if (shippinglineVM == null)
            {
                throw new ArgumentNullException(nameof(shippinglineVM));
            }

            var shippingline = await _shippingLineRepository.GetAsync(Convert.ToInt32(shippinglineVM.ShippingLineId));

            if (shippingline == null)
            {
                throw new InvalidOperationException($"Booking order:{shippinglineVM.ShippingLineId}  not found.");
            }

            shippingline.ShippingLineName = shippinglineVM.ShippingLineName;
            shippingline.IsDeleted = shippinglineVM.IsDeleted.GetValueOrDefault();




            _shippingLineRepository.Update(shippingline);


            await _dbContext.SaveChangesAsync();
            shippinglineVM.ShippingLineId = shippingline.ShippingLineId;
        }
    }
}