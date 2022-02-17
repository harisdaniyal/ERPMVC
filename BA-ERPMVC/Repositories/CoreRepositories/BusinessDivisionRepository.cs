using BA_ERPMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class BusinessDivisionRepository : Repository<stp_BusinessDivision>, IBusinessDivisionRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public BusinessDivisionRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}