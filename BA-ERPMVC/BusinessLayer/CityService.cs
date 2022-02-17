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
    public class CityService
    {
        ERPMVCEntities _dbContext = null;
        ICityRepository _cityrepository = null;

        StateService _stateservice = null;

        public CityService()
        {
            _dbContext = new ERPMVCEntities();
            _cityrepository = new CityRepository(_dbContext);

            _stateservice = new StateService();
        }

        public IEnumerable<CityListViewModel> GetAllCities()
        {
            var _allCities = _cityrepository.GetAll().AsEnumerable();

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_City, CityListViewModel>();
            });

            var cities = Mapper.Map<IEnumerable<tbl_City>, IEnumerable<CityListViewModel>>(_allCities);
            cities = cities.Select(x => { x.State = _stateservice.GetStateByID(x.StateId.Value).StateName; return x; });

            return cities;
        }

        public CityListViewModel GetCityByID(int id)
        {
            var _city = _cityrepository.Get(id);

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_City, CityListViewModel>();
            });

            var city = Mapper.Map<tbl_City, CityListViewModel>(_city);
            city.State = _stateservice.GetStateByID(city.StateId.Value).StateName;

            return city;
        }


        public IEnumerable<CityListViewModel> GetCityByStateID(int id)
        {
            var _allCities = _cityrepository.Find(x=>x.StateId== id).AsEnumerable();

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_City, CityListViewModel>();
            });

            var cities = Mapper.Map<IEnumerable<tbl_City>, IEnumerable<CityListViewModel>>(_allCities);
            cities = cities.Select(x => { x.State = _stateservice.GetStateByID(x.StateId.Value).StateName; return x; });

            return cities;
        }
    }
}