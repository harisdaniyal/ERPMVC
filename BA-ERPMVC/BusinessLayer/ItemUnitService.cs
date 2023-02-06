using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{
    public class ItemUnitService
    {
        IItemUnitRepository _itemUnitRepository = null;
        ERPMVCEntities _dbContext = null;
        public ItemUnitService()
        {
            _dbContext = new ERPMVCEntities();
            _itemUnitRepository = new ItemUnitRepository(_dbContext);
        }






        public string addItemUnit(ItemUnitViewModel itemUnitViewModel)
        {
            string statusCode = "11";

           // var isExist = _dbContext.Setup_Item_Unit.Where(x => x.CategoryName == categoryViewModel.CategoryName).FirstOrDefault();
           // if (isExist == null)
           // {
                Mapper.Reset();
                Mapper.Initialize(config =>
                {
                    config.ValidateInlineMaps = false;
                    config.CreateMap<ItemUnitViewModel, Setup_Item_Unit>();
                });

                var order = Mapper.Map<ItemUnitViewModel, Setup_Item_Unit>(itemUnitViewModel);
                order.Is_Deleted = true;
                _itemUnitRepository.Add(order);
                int isAdded = _dbContext.SaveChanges();
                if (isAdded > 0)
                {
                    statusCode = "00";
                }
           // }

            return statusCode;
        }
    }
}