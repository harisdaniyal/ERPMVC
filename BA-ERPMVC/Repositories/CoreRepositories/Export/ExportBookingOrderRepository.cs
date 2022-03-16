using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Repositories.CoreRepositories.Export
{
    public class ExportBookingOrderRepository : Repository<ExportBookingOrder>, IExportBookingOrderRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }
        public ExportBookingOrderRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}