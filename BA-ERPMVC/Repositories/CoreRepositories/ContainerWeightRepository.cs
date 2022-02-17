using System;
using BA_ERPMVC.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class ContainerWeightRepository : Repository<tbl_ContainerWeightCategory>, IContainerWeightRepositroy
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public ContainerWeightRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }


    }
}