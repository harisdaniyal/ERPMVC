using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Repositories.IRepositories;


namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class InTransactTrainRepository : Repository<InTransactTrain>, IIntransactTrainRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public InTransactTrainRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    
    }
}