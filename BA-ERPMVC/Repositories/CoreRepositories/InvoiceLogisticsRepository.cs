using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class InvoiceLogisticsRepository:  Repository<tbl_Invoice_logistics>, IInvoiceLogisticsRepository
    {

        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public InvoiceLogisticsRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }
    }
}