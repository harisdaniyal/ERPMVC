using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class EmptyDropOffRepository : Repository<EmptyDropOff>, IEmptyDropOffRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public EmptyDropOffRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    
    }
}