using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class PurchaseMasterRepository : Repository<PurchaseMaster>, IPurchaseMasterRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }
        public PurchaseMasterRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}