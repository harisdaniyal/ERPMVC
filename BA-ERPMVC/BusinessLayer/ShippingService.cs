using AutoMapper;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BA_ERPMVC.BusinessLayer
{
    public class ShippingService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly ShippingAgentRepository _shippingAgentRepository;
        private readonly ShippingLineRepository _shippingLineRepository;
        private readonly BLShippingContainerRepository _blshippingContainerRepository;
        private readonly BLShippingContainerDetailRepository _blshippingContainerdetailRepository;


        public ShippingService()
        {
            _dbContext = new ERPMVCEntities();
            _shippingAgentRepository = new ShippingAgentRepository(_dbContext);
            _shippingLineRepository = new ShippingLineRepository(_dbContext);
            _blshippingContainerRepository = new BLShippingContainerRepository(_dbContext);
            _blshippingContainerdetailRepository = new BLShippingContainerDetailRepository(_dbContext);
        }

        public IEnumerable<ShippingAgentViewModel> GetShippingAgentAsync()
        {
            return (from shippingagent in _dbContext.ShippingAgents.Where(x => x.IsDeleted == false)
                    select new ShippingAgentViewModel()
                    {
                        ShippingAgentId = shippingagent.ShippingAgentId,
                        Name = shippingagent.Name
                    }).OrderByDescending(x => x.ShippingAgentId);

        }

        public async Task SaveShippingAgentAsync(ShippingAgentViewModel shippingagentVM)
        {

            var shippingagent = Mapper.Map<ShippingAgentViewModel, ShippingAgent>(shippingagentVM);
            if (shippingagent == null)
            {
                throw new ArgumentNullException(nameof(shippingagentVM));
            }
            shippingagent.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            shippingagent.CreatedDate = DateTime.Now;
            shippingagent.IsDeleted = false;
            _shippingAgentRepository.Add(shippingagent);

            await _dbContext.SaveChangesAsync();
            shippingagentVM.ShippingAgentId = shippingagent.ShippingAgentId;
        }

        public async Task UpdateShippingAgentAsync(ShippingAgentViewModel shippingagentVM)
        {

            if (shippingagentVM == null)
            {
                throw new ArgumentNullException(nameof(shippingagentVM));
            }

            var shippingagent = await _shippingAgentRepository.GetAsync(Convert.ToInt32(shippingagentVM.ShippingAgentId));

            if (shippingagent == null)
            {
                throw new InvalidOperationException($"Booking order:{shippingagentVM.ShippingAgentId}  not found.");
            }

            shippingagent.Name = shippingagentVM.Name;
            shippingagent.IsDeleted = shippingagentVM.IsDeleted.GetValueOrDefault();




            _shippingAgentRepository.Update(shippingagent);


            await _dbContext.SaveChangesAsync();
            shippingagentVM.ShippingAgentId = shippingagent.ShippingAgentId;
        }

        /////******** ShippingLine ********/////

        public IEnumerable<ShippingLineViewModel> GetShippingLineAsync()
        {
            return (from shippingline in _dbContext.ShippingLines.Where(x => x.IsDeleted == false)
                    select new ShippingLineViewModel()
                    {
                        ShippingLineId = shippingline.ShippingLineId,
                        ShippingLineName = shippingline.ShippingLineName
                    }).OrderByDescending(x => x.ShippingLineId);

        }

        public async Task SaveShippingLineAsync(ShippingLineViewModel shippinglineVM)
        {

            var shippingline = Mapper.Map<ShippingLineViewModel, ShippingLine>(shippinglineVM);
            if (shippingline == null)
            {
                throw new ArgumentNullException(nameof(shippinglineVM));
            }
            shippingline.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            shippingline.CreatedDate = DateTime.Now;
            shippingline.IsDeleted = false;
            _shippingLineRepository.Add(shippingline);

            await _dbContext.SaveChangesAsync();
            shippinglineVM.ShippingLineId = shippingline.ShippingLineId;
        }

        public async Task UpdateShippingLineAsync(ShippingLineViewModel shippinglineVM)
        {

            if (shippinglineVM == null)
            {
                throw new ArgumentNullException(nameof(shippinglineVM));
            }

            var shippingline = await _shippingLineRepository.GetAsync(Convert.ToInt32(shippinglineVM.ShippingLineId));

            if (shippingline == null)
            {
                throw new InvalidOperationException($"Booking order:{shippinglineVM.ShippingLineId}  not found.");
            }

            shippingline.ShippingLineName = shippinglineVM.ShippingLineName;
            shippingline.IsDeleted = shippinglineVM.IsDeleted.GetValueOrDefault();




            _shippingLineRepository.Update(shippingline);


            await _dbContext.SaveChangesAsync();
            shippinglineVM.ShippingLineId = shippingline.ShippingLineId;
        }

        /////******* BL Shipping Container ********/////

        public IEnumerable<BLShippingContainerViewModel> GetBLShippingContainerAsync()
        {
            return (from blshippingcontainer in _dbContext.BLShippingContainers.Where(x => x.IsDeleted == false)
                    select new BLShippingContainerViewModel()
                    {
                        ID = blshippingcontainer.ID,
                        ContainerNo = blshippingcontainer.ContainerNo,
                        //SealNo = blshippingcontainer.SealNo,
                        ContainerType = blshippingcontainer.ContainerType,
                        ContainerSize = blshippingcontainer.ContainerSize,
                    }).OrderByDescending(x => x.ID);

        }

        public async Task SaveBLShippingContainerAsync(BLShippingContainerViewModel blshippingcontainerVM)
        {

            var blshippingcontainer = Mapper.Map<BLShippingContainerViewModel, BLShippingContainer>(blshippingcontainerVM);
            if (blshippingcontainer == null)
            {
                throw new ArgumentNullException(nameof(blshippingcontainerVM));
            }

            blshippingcontainer.IsDeleted = false;
            _blshippingContainerRepository.Add(blshippingcontainer);

            await _dbContext.SaveChangesAsync();
            blshippingcontainerVM.ID = blshippingcontainer.ID;
        }

        public async Task UpdateBLShippingContainerAsync(BLShippingContainerViewModel blshippingcontainerVM)
        {

            if (blshippingcontainerVM == null)
            {
                throw new ArgumentNullException(nameof(blshippingcontainerVM));
            }

            var blshippingcontainer = await _blshippingContainerRepository.GetAsync(Convert.ToInt32(blshippingcontainerVM.ID));

            if (blshippingcontainer == null)
            {
                throw new InvalidOperationException($"Booking order:{blshippingcontainerVM.ID}  not found.");
            }

            blshippingcontainer.ContainerNo = blshippingcontainerVM.ContainerNo;
            //blshippingcontainer.SealNo = blshippingcontainerVM.SealNo;
            blshippingcontainer.ContainerType = blshippingcontainerVM.ContainerType;
            blshippingcontainer.ContainerSize = blshippingcontainerVM.ContainerSize;
            blshippingcontainer.IsDeleted = blshippingcontainerVM.IsDeleted.GetValueOrDefault();




            _blshippingContainerRepository.Update(blshippingcontainer);


            await _dbContext.SaveChangesAsync();
            blshippingcontainerVM.ID = blshippingcontainer.ID;
        }


        /// BLShippingContainerDetail ///
        public IEnumerable<BLShippingContainerDetailViewModel> GetBLShippingContainerDetailAsync()
        {
            return (from shippingcontainerdetail in _dbContext.BLShippingContainerDetails.Where(x => x.IsDeleted == false)

                    select new BLShippingContainerDetailViewModel()
                    {
                        Id = shippingcontainerdetail.Id,
                        ContainerNo = shippingcontainerdetail.ContainerNo,
                        SealNo = shippingcontainerdetail.SealNo,
                        KindOfPackagesDescriptionOfGoods = shippingcontainerdetail.KindOfPackagesDescriptionOfGoods,
                        GrossWeight = shippingcontainerdetail.GrossWeight,
                        NetWeight = shippingcontainerdetail.NetWeight,
                        Bl = shippingcontainerdetail.Bl
                    }).OrderByDescending(x => x.Id);

        }
        public async Task SaveBLShippingContainerDetailAsync(BLShippingContainerDetailViewModel blshippingcontainerdetailVM)
        {

            var blshippingcontainerdetail = Mapper.Map<BLShippingContainerDetailViewModel, BLShippingContainerDetail>(blshippingcontainerdetailVM);
            if (blshippingcontainerdetail == null)
            {
                throw new ArgumentNullException(nameof(blshippingcontainerdetailVM));
            }

            blshippingcontainerdetail.IsDeleted = false;
            _blshippingContainerdetailRepository.Add(blshippingcontainerdetail);

            await _dbContext.SaveChangesAsync();
            blshippingcontainerdetailVM.Id = blshippingcontainerdetail.Id;
        }

        public async Task UpdateBLShippingContainerDetailAsync(List<BLShippingContainerDetailViewModel> blshippingcontainerdetailVM, string blNumber)
        {
            if (blshippingcontainerdetailVM.Count == 0)
            {
                throw new ArgumentNullException(nameof(blshippingcontainerdetailVM));
            }

            var containers = _dbContext.BLShippingContainerDetails.Where(x => x.Bl == blNumber).ToList();
            _dbContext.BLShippingContainerDetails.RemoveRange(containers);
            var blShippingContainerDetailList = Mapper.Map<List<BLShippingContainerDetailViewModel>, List<BLShippingContainerDetail>>(blshippingcontainerdetailVM);
            if (blShippingContainerDetailList == null)
            {
                throw new ArgumentNullException(nameof(blShippingContainerDetailList));
            }
            blShippingContainerDetailList.ForEach(x => x.Id = 0);
            blShippingContainerDetailList.ForEach(x => x.IsDeleted = false);
            _dbContext.BLShippingContainerDetails.AddRange(blShippingContainerDetailList);
            await _dbContext.SaveChangesAsync();
        }


    }
}