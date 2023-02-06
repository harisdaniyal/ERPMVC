using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class DeliveryTruckRepository : Repository<DeliveryTruck>, IDeliveryTruckRepository
    {
         
    
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public DeliveryTruckRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }

    }

}