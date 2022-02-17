using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class OrderExpenseMapping : Repository<Order_Expense_Mapping>, IOrderExpenseMapping
    {

        private ERPMVCEntities _dbContext
        {
            get { return _dbContext as ERPMVCEntities; }
        }

        public OrderExpenseMapping(ERPMVCEntities dbContext) : base(dbContext)
        {

        }

    }
}