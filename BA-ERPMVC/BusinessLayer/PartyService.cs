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
    public class PartyService
    {
        ERPMVCEntities _dbContext = null;
        IPartyRepository _partyrepository = null;
        CityService _cityservice = null;
        StateService _stateservice = null;

        public PartyService()
        {
            _dbContext = new ERPMVCEntities();
            _partyrepository = new PartyRepository(_dbContext);

            _cityservice = new CityService();
            _stateservice = new StateService();
        }

        public IEnumerable<VendorListViewModel> GetAllVendors()
        {
            var _allParties = _partyrepository.GetAll().AsEnumerable();

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_Party, VendorListViewModel>();
            });

            var parties = Mapper.Map<IEnumerable<tbl_Party>, IEnumerable<VendorListViewModel>>(_allParties);
            parties = parties.Select(x => { x.State = _stateservice.GetStateByID(x.StateId.Value).StateName;x.City = _cityservice.GetCityByID(x.CityId.Value).CityName; return x; });

            return parties;
        }

        public IEnumerable<VendorListViewModel> GetVendors(int typeId)
        {
            var _allParties = _partyrepository.Find(x => x.Type == typeId).AsEnumerable();

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_Party, VendorListViewModel>();
            });

            var parties = Mapper.Map<IEnumerable<tbl_Party>, IEnumerable<VendorListViewModel>>(_allParties);
            parties = parties.Select(x => { x.State = _stateservice.GetStateByID(x.StateId.Value).StateName; x.City = _cityservice.GetCityByID(x.CityId.Value).CityName; return x; });

            return parties;
        }



        public VendorListViewModel GetVendorByID(int id)
        {
            var _party = _partyrepository.Get(id);

            Mapper.Reset();
            Mapper.Initialize(config =>
            {
                config.ValidateInlineMaps = false;
                config.CreateMap<tbl_Party, VendorListViewModel>();
            });

            var party = Mapper.Map<tbl_Party, VendorListViewModel>(_party);
            party.State = _stateservice.GetStateByID(party.StateId.Value).StateName;
            party.City = _cityservice.GetCityByID(party.CityId.Value).CityName;

            return party;
        }

        public VendorListViewModel AddVendor(VendorListViewModel vendorObj)
        {
            bool _isInternalException = false;
            try
            {
                
                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<VendorListViewModel, tbl_Party>();
                });

                var party = Mapper.Map<VendorListViewModel, tbl_Party>(vendorObj);

                if (_partyrepository.Find(x => x.PartyName.Equals(vendorObj.PartyName.Trim())).Count() > 0)
                {
                    _isInternalException = true;
                    throw new Exception("Vendor name already exists in the system !");
                }

                _partyrepository.Add(party);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded <= 0)
                {
                    _isInternalException = true;
                    throw new Exception("Oops! It is our fault.Something went wrong on server(Add).");
                }

                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<tbl_Party, VendorListViewModel>();
                });

                var returnObj = Mapper.Map<tbl_Party, VendorListViewModel>(party);
                returnObj.State = _stateservice.GetStateByID(party.StateId.Value).StateName;
                returnObj.City = _cityservice.GetCityByID(party.CityId.Value).CityName;

                return returnObj;

            }
            catch(Exception ex)
            {
                if(_isInternalException)
                {
                    throw ex;
                }

                throw new Exception("Oops! It is our fault.Something went wrong on server(Exception).",ex);
            }

        }

        public VendorListViewModel UpdateVendor(VendorListViewModel vendorObj)
        {
            bool _isInternalException = false;
            try
            {

                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<VendorListViewModel, tbl_Party>();
                });

                var party = Mapper.Map<VendorListViewModel, tbl_Party>(vendorObj);

                if (_partyrepository.Find(x => x.PartyName.Equals(vendorObj.PartyName.Trim()) && x.PartyId != vendorObj.PartyId).Count() > 0)
                {
                    _isInternalException = true;
                    throw new Exception("Vendor name already exists in the system !");
                }


                if(vendorObj.isActive== null)
                {
                    party.isActive = _partyrepository.Get(vendorObj.PartyId).isActive;
                }

                _partyrepository.Update(party);
                int _isUpdated = _dbContext.SaveChanges();
                if (_isUpdated <= 0)
                {
                    _isInternalException = true;
                    throw new Exception("Oops! It is our fault.Something went wrong on server(Update).");
                }

                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<tbl_Party, VendorListViewModel>();
                });

                var returnObj = Mapper.Map<tbl_Party, VendorListViewModel>(party);
                returnObj.State = _stateservice.GetStateByID(party.StateId.Value).StateName;
                returnObj.City = _cityservice.GetCityByID(party.CityId.Value).CityName;

                return returnObj;

            }
            catch (Exception ex)
            {
                if (_isInternalException)
                {
                    throw ex;
                }

                throw new Exception("Oops! It is our fault.Something went wrong on server(Exception).", ex);
            }

        }

        public VendorListViewModel DeleteVendor(int id)
        {
            bool _isInternalException = false;
            try
            {

                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<VendorListViewModel, tbl_Party>();
                });

                var _party = _partyrepository.Get(id);
                _party.isActive = false;


                _partyrepository.Update(_party);

                var party = Mapper.Map<tbl_Party, VendorListViewModel>(_party);

                int _isUpdated = _dbContext.SaveChanges();
                if (_isUpdated <= 0)
                {
                    _isInternalException = true;
                    throw new Exception("Oops! It is our fault.Something went wrong on server(Delete).");
                }


                return party;

            }
            catch (Exception ex)
            {
                if (_isInternalException)
                {
                    throw ex;
                }

                throw new Exception("Oops! It is our fault.Something went wrong on server(Exception).", ex);
            }

        }
    }
}