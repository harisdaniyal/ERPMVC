using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using System.Data.Entity;

namespace BA_ERPMVC.BusinessLayer
{
    public class TripServices
    {
        ERPMVCEntities _dbContext = null;
        ITripRepository _triprepository = null;
        ITripExpenseMapping _tripexpensemapping = null;

        public TripServices()
        {
            _dbContext = new ERPMVCEntities();
            _triprepository = new TripRepository(_dbContext);
            _tripexpensemapping = new TripExpenseMapping(_dbContext);
        }



        public string DeleteTrip(int TripId)
        {
            string statusCode = "11";
            BAtrip obj = _triprepository.Find(x => x.ID == TripId).FirstOrDefault();
            obj.IsActive = false;

            _dbContext.BAtrips.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            int isDeleted = _dbContext.SaveChanges();

            if (isDeleted > 0)
            {
                statusCode = "00";
            }
            return statusCode;
        }


        //All Update Query Start



        public string UpdateExpenseById(BAExpensesDetail bAExpensesDetail)
        {

            string statusCode = "11";

            var isExist = _dbContext.BAExpensesDetails.Where(x => x.TripId == bAExpensesDetail.TripId && x.ExpenseId == bAExpensesDetail.ExpenseId).FirstOrDefault();
            if (isExist == null)
            {
                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<BAExpensesDetail, BAExpensesDetail>();
                });

                var order = Mapper.Map<BAExpensesDetail, BAExpensesDetail>(bAExpensesDetail);
                _tripexpensemapping.Add(order);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded > 0)
                {
                    statusCode = "00";
                }
            }

            return statusCode;
        }




        public string DeleteExpenses(int TripId)
        {
            BAExpensesDetail _ExpensesMapping = new BAExpensesDetail();
            _ExpensesMapping.TripId = TripId;
            string statusCode = "11";
            var isExist = _dbContext.BAExpensesDetails.Where(x => x.TripId == TripId).ToList();
            if (isExist != null)
            {

                _tripexpensemapping.RemoveRange(isExist);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded > 0)
                {
                    statusCode = "00";
                }
            }

            return statusCode;
        }



        //All Update Query End








        public int Addtrip(TripViewModel Tvm)
        {
            string statusCode = "11";
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<TripViewModel, BAtrip>();
            });

            var Trip = Mapper.Map<TripViewModel, BAtrip>(Tvm);
            _triprepository.Add(Trip);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }
            int Tripid = Trip.ID;
            return Tripid;
            
        }
        public string AddExpenses(int Expenseid, int price, string remarks, int TripId )
        {
            string statusCode = "11";

            BAExpensesDetail ofm = new BAExpensesDetail();
            ofm.TripId = TripId;
            ofm.ExpenseId = Expenseid;
            ofm.price = price;
            ofm.Remarks = remarks;
           // ofm.Remarks = Remarks;
            _tripexpensemapping.Add(ofm);
            int isAdded = _dbContext.SaveChanges();
            if (isAdded > 0)
            {
                statusCode = "00";
            }

            return statusCode;
        }

        public IEnumerable<BAtrip> GetAll()
        {
            return _triprepository.GetAll();
        }

    }
}