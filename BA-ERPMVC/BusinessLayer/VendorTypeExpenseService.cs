using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;

namespace BA_ERPMVC.BusinessLayer
{
    public class VendorTypeExpenseService
    {
        ERPMVCEntities _dbContext = null;
        private readonly VendorTypeExpenseRepositry _vendorTypeExpenseRepositry;

        public VendorTypeExpenseService()
        {
            _dbContext = new ERPMVCEntities();
            _vendorTypeExpenseRepositry = new VendorTypeExpenseRepositry(_dbContext);
        }
        public async Task<IEnumerable<VendorTypeExpense>> GetVendorDefaultExpenses(int vendorId)
        {
            return await _vendorTypeExpenseRepositry.FindAsync(x => x.IsActive == true);
        }
    }
}