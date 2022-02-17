using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;

namespace BA_ERPMVC.BusinessLayer
{
    public class StateService
    {
        ERPMVCEntities _dbContext = null;
        IStateRepository _staterepository = null;

        public StateService()
        {
            _dbContext = new ERPMVCEntities();
            _staterepository = new StateRepository(_dbContext);
        }

        public IEnumerable<StateListViewModel> GetAllStates()
        {
            var _allStates = _staterepository.GetAll().AsEnumerable();

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_State, StateListViewModel>();
            });

            var states = Mapper.Map<IEnumerable<tbl_State>, IEnumerable<StateListViewModel>>(_allStates);

            return states;
        }

        public StateListViewModel GetStateByID(int id)
        {
            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_State, StateListViewModel>();
            });

            return Mapper.Map<tbl_State, StateListViewModel>(_staterepository.Get(id));
        }
    }
}