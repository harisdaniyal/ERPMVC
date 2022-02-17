using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class PurchaseDetailRepository : Repository<PurchaseDetail>, IPurchaseDetailRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public PurchaseDetailRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}