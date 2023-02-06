using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class TripRepository : Repository<BAtrip>, ITripRepository
    {
        private ERPMVCEntities _dbContext
        {
            get { return _dbContext; }
        }

        public TripRepository(ERPMVCEntities dbContext) : base(dbContext)
        {

        }

        public override async Task<IEnumerable<BAtrip>> FindAsync(Expression<Func<BAtrip, bool>> predicate)
        {
            var results = dbSet.Where(predicate)
                .Include(x => x.BAExpensesDetails)
                .Include(x => x.TripContainers)
                .Include(x => x.tbl_Party)
                .Include(x => x.stp_City)
                .Include(x => x.stp_City1)
            .ToList();

            return await Task.FromResult(results);
        }

    }
}