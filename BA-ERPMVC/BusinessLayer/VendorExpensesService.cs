using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;

namespace BA_ERPMVC.BusinessLayer
{
    public class VendorExpensesService
    {
        ERPMVCEntities _dbContext = null;
        private readonly VendorExpensesRepositry _vendorExpensesRepositry;
        public VendorExpensesService()
        {
            _dbContext = new ERPMVCEntities();
            _vendorExpensesRepositry = new VendorExpensesRepositry(_dbContext);
        }

        public async Task<IEnumerable<VendorExpens>> GetVendorExpensesAsync(int vendorId)
        {
            return await _vendorExpensesRepositry.FindAsync(x => x.VendorId == vendorId && x.IsActive == true);
        }
    }
}