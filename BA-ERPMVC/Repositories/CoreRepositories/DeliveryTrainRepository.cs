﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.IRepositories;

namespace BA_ERPMVC.Repositories.CoreRepositories
{
    public class DeliveryTrainRepository : Repository<DeliveryTrain>, IDeliveryTrainRepository
    {
        private ERPMVCEntities _dbContext
    {
        get { return _dbContext as ERPMVCEntities; }
    }

    public DeliveryTrainRepository(ERPMVCEntities dbContext) : base(dbContext)
    {

    }
    
    }
}