using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.Models;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class LocationsRepositry : Repository<Location>, ILocationsRepositry
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }
        public LocationsRepositry(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}