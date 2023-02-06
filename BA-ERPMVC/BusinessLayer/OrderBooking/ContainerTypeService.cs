using System.Collections.Generic;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using System.Threading.Tasks;

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class ContainerTypeService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly ContainerTypeRepositry _containerTypeRepositry;
        public ContainerTypeService()
        {
            _dbContext = new ERPMVCEntities();
            _containerTypeRepositry = new ContainerTypeRepositry(_dbContext);
        }

        public Task<IEnumerable<ContainerType>> GetAllContainerTypesAsync()
        {
            return _containerTypeRepositry.GetAllAsync();
        }
    }
}