using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using BA_ERPMVC.Models;
using BA_ERPMVC.Repositories.CoreRepositories;
using BA_ERPMVC.Repositories.IRepositories;
using AutoMapper;
using BA_ERPMVC.ViewModels;
using BA_ERPMVC.ViewModels.OrderBooking;
using System.Threading.Tasks;
using BA_ERPMVC.UtilityClasses;
using BA_ERPMVC.Repositories.CoreRepositories.Export;
using BA_ERPMVC.ViewModels.ExportOrderBooking;

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class OrderBookingService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly OrderContainerRepository _orderContainerRepository;
        private readonly OrderRepository _orderRepository;
        private readonly LogisticsRepositry _logisticsRepositry;
        private readonly ReadyForDispatchedRepositry _readyForDispatchedRepositry;
        private readonly ReDispatchedRepositry _reDispatchedRepositry;
        private readonly BLShippingLineRepository _blshippinglineRepository;
        private readonly OrderFacilityMapping _orderFacilityRepository;
        private readonly TripRepository _tripRepository;
        private readonly TripExpenseMapping _tripExpenseMapping;
        private readonly TripContainerRepositry _tripContainerRepositry;
        private readonly PartyRepository _partyRepository;
        private readonly PreDispatchedMovementRepository _preDispatchedMovementRepository;
        private readonly DispatchedOrderRepository _dispatchedOrderRepository;
        private readonly InTransactTrainRepository _intransactTrainRepository;
        private readonly DeliveryTrainRepository _deliveryTrainRepository;
        private readonly EmptyDropOffRepository _emptyDropoffRepository;
        private readonly DispatchedTruckRepository _dispatchedtruckRepository;
        private readonly DeliveryTruckRepository _deliverytruckRepository;

        private readonly ExportBookingOrderRepository _exportbookingorderRepository;  //*****Export******///
        private readonly ExportLogisticRepository _exportlogisticRepository;
        private readonly ExportPreDispatchedRepository _exportpredispatchedRepository;
        private readonly ExportDispatchedTrainRepository _exportdispatchedtrainRepository;
        private readonly ExportDispatchedTruckRepository _exportdispatchedtruckRepository;
        private readonly ExportReDispatchedRepository _exportRedispatchedRepository;
        private readonly ExportDeliveryRepository _exportDeliveryRepository;
        // setup train Id//

        private readonly TrainIdRepository _trainIdRepository;
        private readonly ExportTrainRepository _exptrainIdRepository;


        public OrderBookingService()
        {
            _dbContext = new ERPMVCEntities();
            _orderRepository = new OrderRepository(_dbContext);
            _logisticsRepositry = new LogisticsRepositry(_dbContext);
            _readyForDispatchedRepositry = new ReadyForDispatchedRepositry(_dbContext);
            _reDispatchedRepositry = new ReDispatchedRepositry(_dbContext);
            _preDispatchedMovementRepository = new PreDispatchedMovementRepository(_dbContext);
            _dispatchedOrderRepository = new DispatchedOrderRepository(_dbContext);
            _dispatchedtruckRepository = new DispatchedTruckRepository(_dbContext);
            _intransactTrainRepository = new InTransactTrainRepository(_dbContext);
            _deliveryTrainRepository = new DeliveryTrainRepository(_dbContext);
            _deliverytruckRepository = new DeliveryTruckRepository(_dbContext);
            _emptyDropoffRepository = new EmptyDropOffRepository(_dbContext);
            _orderFacilityRepository = new OrderFacilityMapping(_dbContext);
            _tripRepository = new TripRepository(_dbContext);
            _tripExpenseMapping = new TripExpenseMapping(_dbContext);
            _tripContainerRepositry = new TripContainerRepositry(_dbContext);
            _partyRepository = new PartyRepository(_dbContext);
            _blshippinglineRepository = new BLShippingLineRepository(_dbContext);

            _exportbookingorderRepository = new ExportBookingOrderRepository(_dbContext);   /////******Export******/////
            _exportlogisticRepository = new ExportLogisticRepository(_dbContext);
            _exportpredispatchedRepository = new ExportPreDispatchedRepository(_dbContext);
            _exportdispatchedtrainRepository = new ExportDispatchedTrainRepository(_dbContext);
            _exportdispatchedtruckRepository = new ExportDispatchedTruckRepository(_dbContext);
            _exportRedispatchedRepository = new ExportReDispatchedRepository(_dbContext);
            _exportDeliveryRepository = new ExportDeliveryRepository(_dbContext);
            _orderContainerRepository = new OrderContainerRepository(_dbContext);

            //Setup TrainId //
            _trainIdRepository = new TrainIdRepository(_dbContext);
            _exptrainIdRepository = new ExportTrainRepository(_dbContext);


        }

        public async Task<BookingViewModel> GetOrderBookingAsync(int orderBookingId)
        {
            var bookingModel = await _orderRepository.GetAsync(orderBookingId);
            var bookingViewModel = Mapper.Map<GenerateOrder, BookingViewModel>(bookingModel);
            if (bookingViewModel != null)
                bookingViewModel.FacilityIds = await GetOrderFacilitiesAsync(orderBookingId);
            return bookingViewModel;
        }

        public async Task<string> GetNewOrderNumber()
        {
            var orderNo = await _dbContext.GenerateOrders
                .OrderByDescending(x => x.OrderNo)
                .Select(x => x.OrderNo)
                .FirstOrDefaultAsync();

            if (!string.IsNullOrEmpty(orderNo))
            {
                orderNo = orderNo.Replace("IMP", "");
            }
            return string.IsNullOrEmpty(orderNo) ? 1.ToString("IMP000000") : (Convert.ToInt64(orderNo) + 1).ToString("IMP000000");
        }

        public async Task CreateOrderBookingAsync(BookingViewModel bookingViewModel)
        {
            var bookingModel = Mapper.Map<BookingViewModel, GenerateOrder>(bookingViewModel);
            if (bookingModel == null)
            {
                throw new ArgumentNullException(nameof(bookingModel));
            }

            var order = await _orderRepository.FindAsync(x => x.OrderNo == bookingModel.OrderNo);

            if (order.Any())
            {
                throw new ArgumentException($"{nameof(bookingModel.OrderNo)} already exist. Please try again");
            }

            order = await _orderRepository.FindAsync(x => (bookingModel.OrderType == "Import" && x.BL == bookingModel.BL)
                                                        || (bookingModel.OrderType == "Export" && x.CRO == bookingModel.CRO));
            if (order.Any())
            {
                throw new ArgumentException($"{nameof(bookingModel.BL)}/{nameof(bookingModel.CRO)} already exist. ");
            }

            if (bookingViewModel.FacilityIds == null || bookingViewModel.FacilityIds.Length == 0)
            {
                throw new ArgumentNullException(nameof(bookingViewModel.FacilityIds));
            }

            if (bookingModel.OrderType == "Import")
            {
                bookingModel.CRO = string.Empty;
            }

            if (bookingModel.OrderType == "Export")
            {
                bookingModel.BL = string.Empty;
            }
            bookingModel.isCompleted = false;
            bookingModel.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            bookingModel.CreatedDate = DateTime.Now;

            _orderRepository.Add(bookingModel);
            await AddOrderFacilitiesAsync(bookingViewModel.FacilityIds, bookingModel.OrderID);
            await _dbContext.SaveChangesAsync();


            bookingViewModel.OrderId = bookingModel.OrderID;
        }

        public async Task CreateOrderBookingContainerAsync(List<OrderContainerViewModel> bookingContainerViewModel)
        {
            List<OrderContainer> bookingContainerModelList = Mapper.Map<List<OrderContainerViewModel>, List<OrderContainer>>(bookingContainerViewModel);
            if (bookingContainerModelList == null)
            {
                throw new ArgumentNullException(nameof(bookingContainerModelList));
            }

            _dbContext.OrderContainers.AddRange(bookingContainerModelList);
            await _dbContext.SaveChangesAsync();
        }


        public async Task UpdateOrderBookingAsync(BookingViewModel bookingViewModel)
        {
            if (bookingViewModel == null)
            {
                throw new ArgumentNullException(nameof(bookingViewModel));
            }

            GenerateOrder bookingModel = await _orderRepository.GetAsync(bookingViewModel.OrderId);

            if (bookingModel == null)
            {
                throw new InvalidOperationException($"{nameof(bookingViewModel.OrderId)} is invalid");
            }

            var order = await _orderRepository.FindAsync(x => x.OrderID != bookingViewModel.OrderId &&
                                                                ((bookingViewModel.OrderType == "Import"
                                                                    && x.BL == bookingViewModel.BL) ||
                                                               (bookingViewModel.OrderType == "Export"
                                                                    && x.CRO == bookingViewModel.CRO)));
            if (order.Any())
            {
                throw new ArgumentException($"{nameof(bookingModel.BL)}/{nameof(bookingModel.CRO)} already exist. ");
            }

            bookingModel.CustomerID = bookingViewModel.CustomerId;
            bookingModel.BusinessDivisionId = bookingViewModel.BusinessDivisionId;
            bookingModel.BL = bookingViewModel.BL;
            bookingModel.CRO = bookingViewModel.CRO;
            bookingModel.OrderDate = bookingViewModel.OrderDate;
            bookingModel.OrderType = bookingViewModel.OrderType;
            bookingModel.TwentyContainerQty = bookingViewModel.TwentyContainerQty;
            bookingModel.FortyContainerQty = bookingViewModel.FortyContainerQty;
            bookingModel.TwentyContainerPrice = bookingViewModel.TwentyContainerPrice;
            bookingModel.FortyContainerPrice = bookingViewModel.FortyContainerPrice;
            bookingModel.InvoiceAmount = bookingViewModel.InvoiceAmount;
            bookingModel.VesselBerthingDate = bookingViewModel.VesselBerthingDate;
            bookingModel.FreeDays = bookingViewModel.FreeDays;
            bookingModel.Remarks = bookingViewModel.Remarks;
            bookingModel.ShippingLineId = bookingViewModel.ShippingLineId;
            bookingModel.ShippingAgentId = bookingViewModel.ShippingAgentId;
            bookingModel.BookingPOCName = bookingViewModel.BookingPOCName;
            bookingModel.DOGuarantee = bookingViewModel.DOGuarantee;
            bookingModel.BLDate = bookingViewModel.BLDate;
            bookingModel.GD = bookingViewModel.GD;
            bookingModel.ImportEIR = bookingViewModel.ImportEIR;
            bookingModel.PortWeighment = bookingViewModel.PortWeighment;
            bookingModel.OutSidePortWeighment = bookingViewModel.OutSidePortWeighment;

            if (bookingViewModel.OrderType == "Import")
            {
                bookingModel.CRO = string.Empty;
            }

            if (bookingViewModel.OrderType == "Export")
            {
                bookingModel.BL = string.Empty;
            }

            _orderRepository.Update(bookingModel);

            await _dbContext.SaveChangesAsync();
            await AddOrderFacilitiesAsync(bookingViewModel.FacilityIds, bookingModel.OrderID);

            bookingViewModel.OrderId = bookingModel.OrderID;
        }

        public async Task UpdateOrderBookingContainerAsync(List<OrderContainerViewModel> bookingContainerViewModel, int orderId)
        {
            if (bookingContainerViewModel.Count == 0)
            {
                throw new ArgumentNullException(nameof(bookingContainerViewModel));
            }

            var containers = _dbContext.OrderContainers.Where(x => x.OrderID == orderId).ToList();
            _dbContext.OrderContainers.RemoveRange(containers);
            var bookingContainerModelList = Mapper.Map<List<OrderContainerViewModel>, List<OrderContainer>>(bookingContainerViewModel);
            if (bookingContainerModelList == null)
            {
                throw new ArgumentNullException(nameof(bookingContainerModelList));
            }
            bookingContainerModelList.ForEach(x => x.ID = 0);
            _dbContext.OrderContainers.AddRange(bookingContainerModelList);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<int[]> GetOrderFacilitiesAsync(int orderBookingId)
        {
            var facilities = await _orderFacilityRepository.FindAsync(x => x.OrderID == orderBookingId);
            return facilities.Select(x => x.FacilityID.GetValueOrDefault()).ToArray();
        }

        public async Task AddOrderFacilitiesAsync(int[] facilityIds, int orderBookingId)
        {
            await DeleteFacilitiesAsync(orderBookingId);
            await AddFacilitiesAsync(facilityIds, orderBookingId);
        }

        private Task DeleteFacilitiesAsync(int orderBookingId)
        {
            var facilities = _dbContext.Order_FacilityMapping.Where(x => x.OrderID == orderBookingId);
            _orderFacilityRepository.RemoveRange(facilities);

            return _dbContext.SaveChangesAsync();
        }

        private Task AddFacilitiesAsync(int[] facilityIds, int orderBookingId)
        {
            _orderFacilityRepository.AddRange(
                facilityIds.Select(x => new Order_FacilityMapping
                {
                    FacilityID = x,
                    OrderID = orderBookingId
                })
             );

            return _dbContext.SaveChangesAsync();
        }

        public async Task<IEnumerable<stp_ProductCategory>> GetContainerSizesAsync()
        {
            // to do : make repositry 
            return await _dbContext.stp_ProductCategory.Where(x => x.ProductCatID == 2 || x.ProductCatID == 7).ToListAsync();
        }

        public async Task<IEnumerable<PortAndTerminal>> GetPortAndTerminal()
        {
            // to do : make repositry 
            return await _dbContext.PortAndTerminals.Where(x => x.IsDeleted == false).ToListAsync();
        }

        public Task<IEnumerable<Logistic>> GeLogisticsAsync(int orderBookingId)
        {
            return _logisticsRepositry.FindAsync(x => x.OrderId == orderBookingId);
        }

        ///******Ready For Dispatched  Start*******///
        public IEnumerable<ReadyForDispatchedViewModel> GetReadyForDispatchedAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReadyForDispatched.ToString())
                        on order.OrderID equals logistics.OrderId
                    join RFD in _dbContext.ReadyForDispatcheds.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RFD.OrderId, ContainerNo = RFD.ContainerNo } into RFDGroup
                    from readyForDispatched in RFDGroup.DefaultIfEmpty()
                    select new ReadyForDispatchedViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        DOGranty = readyForDispatched.DOGranty,
                        ImportEIR = readyForDispatched.ImportEIR,
                        PortWeighment = readyForDispatched.PortWeighment,
                        OutSidePortWeighment = readyForDispatched.OutSidePortWeighment,

                        ID = readyForDispatched.ID,
                        GD = readyForDispatched.GD,
                        BL = readyForDispatched.BL
                    }).Distinct().ToList();
        }

        public async Task SaveReadyForDispatchedAsync(ReadyForDispatchedViewModel readyForDispatchedVM)
        {

            var readyForDispatched = Mapper.Map<ReadyForDispatchedViewModel, ReadyForDispatched>(readyForDispatchedVM);
            if (readyForDispatched == null)
            {
                throw new ArgumentNullException(nameof(readyForDispatched));
            }

            _readyForDispatchedRepositry.Add(readyForDispatched);

            if (readyForDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReadyForDispatched.ToString()
                    && x.ContainerNo == readyForDispatchedVM.ContainerNo && x.OrderId == readyForDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    if (logistic.PreDispatched.GetValueOrDefault())
                    {
                        logistic.Status = OrdersStatus.PreDispatched.ToString();
                    }
                    else
                    {
                        logistic.Status = OrdersStatus.Dispatched.ToString();
                    }
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            readyForDispatchedVM.ID = readyForDispatched.ID;
        }

        public async Task UpdateReadyForDispatchedAsync(ReadyForDispatchedViewModel readyForDispatchedVM)
        {

            if (readyForDispatchedVM == null)
            {
                throw new ArgumentNullException(nameof(readyForDispatchedVM));
            }

            var readyForDispatched = await _readyForDispatchedRepositry.GetAsync(Convert.ToInt32(readyForDispatchedVM.ID));

            if (readyForDispatched == null)
            {
                throw new InvalidOperationException($"Booking order:{readyForDispatchedVM.OrderNo}  not found.");
            }

            readyForDispatched.DOGranty = readyForDispatchedVM.DOGranty;
            readyForDispatched.ImportEIR = readyForDispatchedVM.ImportEIR;
            readyForDispatched.PortWeighment = readyForDispatchedVM.PortWeighment;
            readyForDispatched.OutSidePortWeighment = readyForDispatchedVM.OutSidePortWeighment;
            readyForDispatched.GD = readyForDispatchedVM.GD;
            readyForDispatched.BL = readyForDispatchedVM.BL;
            readyForDispatched.IsCompleted = readyForDispatchedVM.IsCompleted;
            _readyForDispatchedRepositry.Update(readyForDispatched);

            if (readyForDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReadyForDispatched.ToString()
                    && x.ContainerNo == readyForDispatchedVM.ContainerNo && x.OrderId == readyForDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    if (logistic.PreDispatched.GetValueOrDefault())
                    {
                        logistic.Status = OrdersStatus.PreDispatched.ToString();
                    }
                    else
                    {
                        logistic.Status = OrdersStatus.Dispatched.ToString();
                    }
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            readyForDispatchedVM.ID = readyForDispatched.ID;
        }
        ///******Ready For Dispatched End*******///

        ///******Pre Dispatched Movement*******///

        public IEnumerable<PreDispatchedMovementViewModel> GetPreDispatchedMovementAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.PreDispatched.ToString())
                        on order.OrderID equals logistics.OrderId
                    join PDM in _dbContext.PreDispatchedMovements.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = PDM.OrderId, ContainerNo = PDM.ContainerNo } into PDMGroup
                    from PreDispatchedMovements in PDMGroup.DefaultIfEmpty()
                    select new PreDispatchedMovementViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ReferenceContainer = logistics.ReferenceContainer,
                        FromLocation = PreDispatchedMovements.FromLocation,
                        FromDateTime = PreDispatchedMovements.FromDateTime,
                        ToLocation = PreDispatchedMovements.ToLocation,
                        ToDateTime = PreDispatchedMovements.ToDateTime,
                        TransporterName = PreDispatchedMovements.TransporterName,
                        VehicleNumber = PreDispatchedMovements.VehicleNumber,
                        LogisticsId = logistics.logisticsid,




            ID = PreDispatchedMovements.ID,
                        //GD = readyForDispatched.GD,
                        //BL = readyForDispatched.BL
                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }

        public async Task SavePreDispatchedMovementAsync(PreDispatchedMovementViewModel preDispatchedMovementVM)
        {

            var preDispatchedMovement = Mapper.Map<PreDispatchedMovementViewModel, PreDispatchedMovement>(preDispatchedMovementVM);
            if (preDispatchedMovement == null)
            {
                throw new ArgumentNullException(nameof(preDispatchedMovementVM));
            }

            preDispatchedMovement.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            preDispatchedMovement.CreateDate = DateTime.Now;
            _preDispatchedMovementRepository.Add(preDispatchedMovement);

            if (preDispatchedMovementVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.PreDispatched.ToString()
                    && x.ContainerNo == preDispatchedMovementVM.ContainerNo && x.OrderId == preDispatchedMovementVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Dispatched.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            preDispatchedMovementVM.ID = preDispatchedMovement.ID;
        }

        public async Task UpdatePreDispatchedMovementAsync(PreDispatchedMovementViewModel preDispatchedMovementVM)
        {

            if (preDispatchedMovementVM == null)
            {
                throw new ArgumentNullException(nameof(preDispatchedMovementVM));
            }

            var preDispatchedMovement = await _preDispatchedMovementRepository.GetAsync(Convert.ToInt32(preDispatchedMovementVM.ID));

            if (preDispatchedMovement == null)
            {
                throw new InvalidOperationException($"Booking order:{preDispatchedMovementVM.OrderNo}  not found.");
            }

            preDispatchedMovement.FromLocation = preDispatchedMovementVM.FromLocation;
            preDispatchedMovement.FromDateTime = preDispatchedMovementVM.FromDateTime;
            preDispatchedMovement.ToLocation = preDispatchedMovementVM.ToLocation;
            preDispatchedMovement.ToDateTime = preDispatchedMovementVM.ToDateTime;
            preDispatchedMovement.TransporterName = preDispatchedMovementVM.TransporterName;
            preDispatchedMovement.VehicleNumber = preDispatchedMovementVM.VehicleNumber;
            preDispatchedMovement.IsCompleted = preDispatchedMovementVM.IsCompleted;
            _preDispatchedMovementRepository.Update(preDispatchedMovement);

            if (preDispatchedMovementVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.PreDispatched.ToString()
                    && x.ContainerNo == preDispatchedMovementVM.ContainerNo && x.OrderId == preDispatchedMovementVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Dispatched.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            preDispatchedMovementVM.ID = preDispatchedMovement.ID;
        }
        /////********* PreDispatchedMovement*********////////


        /////////*********** Dispatched Order ***************//////////
        public IEnumerable<DispatchedOrderViewModel> GetDispatchedOrderAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString() && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId
                    join DPO in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DPO.OrderId, ContainerNo = DPO.ContainerNo } into DPOGroup
                    from DispatchedOrders in DPOGroup.DefaultIfEmpty()
                    select new DispatchedOrderViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,

                        ReferenceContainer = logistics.ReferenceContainer,
                        PriorityForDispatched = DispatchedOrders.PriorityForDispatched,
                        TrainID = DispatchedOrders.TrainID,
                        DispatchedDate = DispatchedOrders.DispatchedDate,
                        StationID = DispatchedOrders.StationID,
                        StationName = DispatchedOrders.StationName,
                        WagonNo = DispatchedOrders.WagonNo,
                        WagonType = DispatchedOrders.WagonType,
                        RRNo = DispatchedOrders.RRNo,
                        EngineNo = DispatchedOrders.EngineNo,
                        InvoiceNumber = DispatchedOrders.InvoiceNumber,
                        LogisticsId = logistics.logisticsid,



                        ID = DispatchedOrders.ID,
                        //ID = readyForDispatched.GD,
                        //BL = readyForDispatched.BL
                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }
        public IEnumerable<tbl_TrainId> GetTrainID()
        {
            return _dbContext.tbl_TrainId.ToList();
        }

        public async Task SaveDispatchedOrderAsync(DispatchedOrderViewModel dispatchedOrderVM)
        {

            var dispatchedOrder = Mapper.Map<DispatchedOrderViewModel, DispatchedOrder>(dispatchedOrderVM);
            if (dispatchedOrder == null)
            {
                throw new ArgumentNullException(nameof(dispatchedOrderVM));
            }

            dispatchedOrder.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            dispatchedOrder.CreateDate = DateTime.Now;
            _dispatchedOrderRepository.Add(dispatchedOrder);

            if (dispatchedOrderVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == dispatchedOrderVM.ContainerNo && x.OrderId == dispatchedOrderVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.InTransact.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            dispatchedOrderVM.ID = dispatchedOrder.ID;
        }

        public async Task UpdateDispatchedOrderAsync(DispatchedOrderViewModel dispatchedOrderVM)
        {

            if (dispatchedOrderVM == null)
            {
                throw new ArgumentNullException(nameof(dispatchedOrderVM));
            }

            var dispatchedOrder = await _dispatchedOrderRepository.GetAsync(Convert.ToInt32(dispatchedOrderVM.ID));

            if (dispatchedOrder == null)
            {
                throw new InvalidOperationException($"Booking order:{dispatchedOrderVM.OrderNo}  not found.");
            }

            dispatchedOrder.PriorityForDispatched = dispatchedOrderVM.PriorityForDispatched;
            dispatchedOrder.ReferenceContainer = dispatchedOrderVM.ReferenceContainer;
            dispatchedOrder.TrainID = dispatchedOrderVM.TrainID;
            dispatchedOrder.DispatchedDate = dispatchedOrderVM.DispatchedDate;
            dispatchedOrder.StationName = dispatchedOrderVM.StationName;
            dispatchedOrder.WagonNo = dispatchedOrderVM.WagonNo;
            dispatchedOrder.WagonType = dispatchedOrderVM.WagonType;
            dispatchedOrder.RRNo = dispatchedOrderVM.RRNo;
            dispatchedOrder.EngineNo = dispatchedOrderVM.EngineNo;
            dispatchedOrder.InvoiceNumber = dispatchedOrderVM.InvoiceNumber;
            dispatchedOrder.IsCompleted = dispatchedOrderVM.IsCompleted;
            _dispatchedOrderRepository.Update(dispatchedOrder);

            if (dispatchedOrderVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == dispatchedOrderVM.ContainerNo && x.OrderId == dispatchedOrderVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.InTransact.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            dispatchedOrderVM.ID = dispatchedOrder.ID;
        }

        public IEnumerable<Station> GetStationList()
        {
            return _dbContext.Stations.Where(x => x.Status == true).ToList();
        }

        /////////////****** End Dispatched Order *********//////////



        /////////////******InTransact Train*********////////////
        public IEnumerable<InTransactTrainViewModel> GetInTransactTrainAsync(int stationID)
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.InTransact.ToString() && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId
                    join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true && stationID > 0 ? x.StationID == stationID : true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = dispatch.OrderId, ContainerNo = dispatch.ContainerNo }
                    join DPO in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == false)
                    on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DPO.OrderId, ContainerNo = DPO.ContainerNo } into DPOGroup
                    from DispatchedOrders in DPOGroup.DefaultIfEmpty()
                    join ITT in _dbContext.InTransactTrains.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = ITT.OrderId, ContainerNo = ITT.ContainerNo } into ITTGroup
                    from InTransactTrains in ITTGroup.DefaultIfEmpty()
                    select new InTransactTrainViewModel()
                    {

                        BLnumber = order.BL,
                        Customer_Name = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,

                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        LogisticsId = logistics.logisticsid,


                        PriorityForDispatched = dispatch.PriorityForDispatched,
                        StationID = dispatch.StationID,
                        StationName = _dbContext.Stations.Where(x => x.StationID == dispatch.StationID && x.Status == true).FirstOrDefault().StationName,
                        TrainID = dispatch.TrainID,
                        ReferenceContainer = logistics.ReferenceContainer,

                        ArrivalDate = InTransactTrains.ArrivalDate,
                        LOLO = InTransactTrains.LOLO,
                        ID = InTransactTrains.ID,

                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }

        public async Task SaveIntransactTrainAsync(InTransactTrainViewModel intransacttrainVM)
        {

            var intransacttrain = Mapper.Map<InTransactTrainViewModel, InTransactTrain>(intransacttrainVM);
            if (intransacttrain == null)
            {
                throw new ArgumentNullException(nameof(intransacttrainVM));
            }
            intransacttrain.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            intransacttrain.CreateDate = DateTime.Now;

            _intransactTrainRepository.Add(intransacttrain);

            if (intransacttrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.InTransact.ToString()
                    && x.ContainerNo == intransacttrainVM.ContainerNo && x.OrderId == intransacttrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.ReDispatched.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            intransacttrainVM.ID = intransacttrain.ID;
        }

        public async Task UpdateIntransactTrainAsync(InTransactTrainViewModel intransacttrainVM)
        {

            if (intransacttrainVM == null)
            {
                throw new ArgumentNullException(nameof(intransacttrainVM));
            }

            var intransacttrain = await _intransactTrainRepository.GetAsync(Convert.ToInt32(intransacttrainVM.ID));

            if (intransacttrain == null)
            {
                throw new InvalidOperationException($"Booking order:{intransacttrainVM.OrderNo}  not found.");
            }

            intransacttrain.PriorityForDispatched = intransacttrainVM.PriorityForDispatched;
            intransacttrain.ArrivalDate = intransacttrainVM.ArrivalDate;
            intransacttrain.LOLO = intransacttrainVM.LOLO;
            intransacttrain.IsCompleted = intransacttrainVM.IsCompleted;
            _intransactTrainRepository.Update(intransacttrain);

            if (intransacttrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.InTransact.ToString()
                    && x.ContainerNo == intransacttrainVM.ContainerNo && x.OrderId == intransacttrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.ReDispatched.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            intransacttrainVM.ID = intransacttrain.ID;
        }
        /////////////******InTransact Train End*********////////////
        ///
        /// 
        ///******Re-Dispatched Start*******///
        public IEnumerable<ReDispatchedViewModel> GetReDispatchedAsync(int stationID)
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReDispatched.ToString() && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId
                    join inTransactTrains in _dbContext.InTransactTrains.Where(x => x.IsCompleted == true && stationID > 0 ? x.StationID == stationID : true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = inTransactTrains.OrderId, ContainerNo = inTransactTrains.ContainerNo }
                    join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true && stationID > 0 ? x.StationID == stationID : true)
                       on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = dispatch.OrderId, ContainerNo = dispatch.ContainerNo }
                    join DPO in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == false)
                    on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DPO.OrderId, ContainerNo = DPO.ContainerNo } into DPOGroup
                    from DispatchedOrders in DPOGroup.DefaultIfEmpty()

                    join RD in _dbContext.ReDispatcheds.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RD.OrderId, ContainerNo = RD.ContainerNo } into RDGroup
                    from reDispatched in RDGroup.DefaultIfEmpty()
                    select new ReDispatchedViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        FreeDays = order.FreeDays,
                        LastDateofEmptyReturn = order.VesselBerthingDate,//.AddDays(Convert.ToDouble(order.FreeDays)),

                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        DelieveryLocation = logistics.ToLocation,
                        EmptyDropOffLocation = logistics.EmptyReturnLocation,
                        ReferenceContainer = logistics.ReferenceContainer,
                        LogisticsId = logistics.logisticsid,

                        ArrivalDate = inTransactTrains.ArrivalDate,

                        ID = reDispatched.ID,
                        VehicleNo = reDispatched.VehicleNo,
                        ReDispatchedDate = reDispatched.ReDispatchedDate,
                        TranspoterName = reDispatched.TranspoterName,
                        BiltyNumber = reDispatched.BiltyNumber,
                        TransportationCost = reDispatched.TransportationCost,
                        StationName = _dbContext.Stations.Where(x => x.StationID == inTransactTrains.StationID).FirstOrDefault().StationName,
                        StationID = inTransactTrains.StationID
                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }

        public async Task SaveReDispatchedAsync(ReDispatchedViewModel reDispatchedVM)
        {

            var reDispatched = Mapper.Map<ReDispatchedViewModel, ReDispatched>(reDispatchedVM);
            if (reDispatched == null)
            {
                throw new ArgumentNullException(nameof(reDispatched));
            }

            reDispatched.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            reDispatched.CreateDate = DateTime.Now;

            _reDispatchedRepositry.Add(reDispatched);

            if (reDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReDispatched.ToString()
                    && x.ContainerNo == reDispatchedVM.ContainerNo && x.OrderId == reDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            reDispatchedVM.ID = reDispatched.ID;
        }

        public async Task UpdateReDispatchedAsync(ReDispatchedViewModel reDispatchedVM)
        {

            if (reDispatchedVM == null)
            {
                throw new ArgumentNullException(nameof(reDispatchedVM));
            }

            var reDispatched = await _reDispatchedRepositry.GetAsync(Convert.ToInt32(reDispatchedVM.ID));

            if (reDispatched == null)
            {
                throw new InvalidOperationException($"Booking order:{reDispatchedVM.OrderNo}  not found.");
            }

            reDispatched.VehicleNo = reDispatchedVM.VehicleNo;
            reDispatched.ReDispatchedDate = reDispatchedVM.ReDispatchedDate;
            reDispatched.TranspoterName = reDispatchedVM.TranspoterName;
            reDispatched.TransportationCost = reDispatchedVM.TransportationCost;
            reDispatched.BiltyNumber = reDispatchedVM.BiltyNumber;
            reDispatched.IsCompleted = reDispatchedVM.IsCompleted;
            _reDispatchedRepositry.Update(reDispatched);

            if (reDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReDispatched.ToString()
                    && x.ContainerNo == reDispatchedVM.ContainerNo && x.OrderId == reDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            reDispatchedVM.ID = reDispatched.ID;
        }
        ///******Ready For Dispatched Movement End*******///

        //////////***** End InTransact Train********/////////

        ///////*********** Delivery Train*********/////////

        public IEnumerable<DeliveryTrainViewModel> GetDeliveryTrainAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString() && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId
                    join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = dispatch.OrderId, ContainerNo = dispatch.ContainerNo }
                    join DT in _dbContext.DeliveryTrains.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from DeliveryTrains in DTGroup.DefaultIfEmpty()
                    select new DeliveryTrainViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        LogisticsId = logistics.logisticsid,

                        EmptyDropOffLocation = logistics.EmptyReturnLocation,
                        DeliveryLocation = logistics.ToLocation,
                        ReferenceContainer = logistics.ReferenceContainer,
                        PriorityForDispatched = dispatch.PriorityForDispatched,
                        TrainID = dispatch.TrainID,
                        DispatchedDate = dispatch.DispatchedDate,

                        VehicleNo = DeliveryTrains.VehicleNo,
                        ArrivalDate = DeliveryTrains.ArrivalDate,
                        DeliveryDate = DeliveryTrains.DeliveryDate,
                        ID = DeliveryTrains.ID,

                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }

        public async Task SaveDeliveryTrainAsync(DeliveryTrainViewModel deliverytrainVM)
        {

            var deliverytrain = Mapper.Map<DeliveryTrainViewModel, DeliveryTrain>(deliverytrainVM);
            if (deliverytrain == null)
            {
                throw new ArgumentNullException(nameof(deliverytrainVM));
            }

            deliverytrain.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            deliverytrain.CreateDate = DateTime.Now;

            _deliveryTrainRepository.Add(deliverytrain);

            if (deliverytrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == deliverytrainVM.ContainerNo && x.OrderId == deliverytrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.EmptyDropOff.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            deliverytrainVM.ID = deliverytrain.ID;
        }

        public async Task UpdateDeliveryTrainAsync(DeliveryTrainViewModel deliverytrainVM)
        {

            if (deliverytrainVM == null)
            {
                throw new ArgumentNullException(nameof(deliverytrainVM));
            }

            var deliverytrain = await _deliveryTrainRepository.GetAsync(Convert.ToInt32(deliverytrainVM.ID));

            if (deliverytrain == null)
            {
                throw new InvalidOperationException($"Booking order:{deliverytrainVM.OrderNo}  not found.");
            }

            deliverytrain.PriorityForDispatched = deliverytrainVM.PriorityForDispatched;
            deliverytrain.TrainID = deliverytrainVM.TrainID;
            deliverytrain.DispatchedDate = deliverytrainVM.DispatchedDate;
            deliverytrain.DeliveryDate = deliverytrainVM.DeliveryDate;
            deliverytrain.DeliveryLocation = deliverytrainVM.DeliveryLocation;
            deliverytrain.VehicleNo = deliverytrainVM.VehicleNo;
            deliverytrain.IsCompleted = deliverytrainVM.IsCompleted;
            _deliveryTrainRepository.Update(deliverytrain);

            if (deliverytrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == deliverytrainVM.ContainerNo && x.OrderId == deliverytrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.EmptyDropOff.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            deliverytrainVM.ID = deliverytrain.ID;
        }


        /////*********** Delivery Train***********/////////


        //////////******** EmptyDropOff********//////////


        public IEnumerable<EmptyDropOffViewModel> GetEmptyDropOffAsync(int PortAndTerminalId)
        {
            string PortName = string.Empty;
            var terminal = _dbContext.PortAndTerminals.Where(x => x.PortAndTerminalId == PortAndTerminalId).FirstOrDefault();
            if (terminal != null)
            {
                PortName = terminal.PortName;
            }
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.EmptyDropOff.ToString() && (!string.IsNullOrEmpty(PortName) ? x.EmptyReturnLocation == PortName : true))
                        on order.OrderID equals logistics.OrderId
                    join EDO in _dbContext.EmptyDropOffs.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = EDO.OrderId, ContainerNo = EDO.ContainerNo } into EDOGroup
                    from EmptyDropOffs in EDOGroup.DefaultIfEmpty()
                    select new EmptyDropOffViewModel()
                    {

                        BLnumber = order.BL,
                        ShippingLineName = _dbContext.ShippingLines.Where(x => x.ShippingLineId == order.ShippingLineId).FirstOrDefault().ShippingLineName,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        LogisticsId = logistics.logisticsid,

                        ContainerSize = logistics.ContainerSize,
                        PortName = logistics.EmptyReturnLocation,
                        ReferenceContainer = logistics.ReferenceContainer,



                        ID = EmptyDropOffs.ID,
                        EIRNo = EmptyDropOffs.EIRNo,
                        ExpenseAtEmptyLocation = EmptyDropOffs.ExpenseAtEmptyLocation,
                        Remarks = EmptyDropOffs.Remarks,
                        DeliveryDate = EmptyDropOffs.DeliveryDate,
                    }).Distinct().ToList().OrderByDescending(x => x.OrderId).ThenByDescending(x => x.LogisticsId);
        }

        public async Task SaveEmptyDropOffAsync(EmptyDropOffViewModel emptydropoffVM)
        {

            var emptydropoff = Mapper.Map<EmptyDropOffViewModel, EmptyDropOff>(emptydropoffVM);
            if (emptydropoff == null)
            {
                throw new ArgumentNullException(nameof(emptydropoffVM));
            }

            emptydropoff.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            emptydropoff.CreateDate = DateTime.Now;

            _emptyDropoffRepository.Add(emptydropoff);

            if (emptydropoffVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.EmptyDropOff.ToString()
                    && x.ContainerNo == emptydropoffVM.ContainerNo && x.OrderId == emptydropoffVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Completed.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            emptydropoffVM.ID = emptydropoff.ID;
        }

        public async Task UpdateEmptyDropOffAsync(EmptyDropOffViewModel emptydropoffVM)
        {

            if (emptydropoffVM == null)
            {
                throw new ArgumentNullException(nameof(emptydropoffVM));
            }

            var emptydropoff = await _emptyDropoffRepository.GetAsync(Convert.ToInt32(emptydropoffVM.ID));

            if (emptydropoff == null)
            {
                throw new InvalidOperationException($"Booking order:{emptydropoffVM.OrderNo}  not found.");
            }

            emptydropoff.EIRNo = emptydropoffVM.EIRNo;
            emptydropoff.ExpenseAtEmptyLocation = emptydropoffVM.ExpenseAtEmptyLocation;
            emptydropoff.TerminalName = emptydropoffVM.PortName;
            emptydropoff.Remarks = emptydropoffVM.Remarks;
            emptydropoff.DeliveryDate = emptydropoffVM.DeliveryDate;
            emptydropoff.IsCompleted = emptydropoffVM.IsCompleted;
            _emptyDropoffRepository.Update(emptydropoff);

            if (emptydropoffVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.EmptyDropOff.ToString()
                    && x.ContainerNo == emptydropoffVM.ContainerNo && x.OrderId == emptydropoffVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Completed.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            emptydropoffVM.ID = emptydropoff.ID;

        }

        public IEnumerable<PortAndTerminal> GetTerminalList()
        {
            return _dbContext.PortAndTerminals.Where(x => x.IsDeleted == false).ToList();
        }

        /////////////******** End  EmptyDropOff********//////////

        /// ********** DispatchedTruck*********** ///

        public IEnumerable<DispatchedTruckViewModel> GetDispatchedTruckAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString() && x.ModeOfTransportation == ModeOfTransaction.Truck.ToString())
                        on order.OrderID equals logistics.OrderId

                    join DT in _dbContext.DispatchedTrucks.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from DispatchedTrucks in DTGroup.DefaultIfEmpty()
                    select new DispatchedTruckViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        LastDateofEmptyReturn = order.VesselBerthingDate,
                        ContainerNo = logistics.ContainerNo,

                        ContainerSize = logistics.ContainerSize,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        FreeDays = order.FreeDays,

                        DispatchedDate = DispatchedTrucks.DispatchedDate,
                        VehicleNo = DispatchedTrucks.VehicleNo,
                        DriverName = DispatchedTrucks.DriverName,
                        DriverNo = DispatchedTrucks.DriverNo,
                        TransporterName = DispatchedTrucks.TransporterName,
                        BiltyNo = DispatchedTrucks.BiltyNo,
                        ID = DispatchedTrucks.ID,

                    }).Distinct().ToList().OrderByDescending(x => x.ContainerNo);
        }

        public async Task SaveDispatchedTruckAsync(DispatchedTruckViewModel dispatchedtruckVM)
        {

            var dispatchedtruck = Mapper.Map<DispatchedTruckViewModel, DispatchedTruck>(dispatchedtruckVM);
            if (dispatchedtruck == null)
            {
                throw new ArgumentNullException(nameof(dispatchedtruckVM));
            }

            dispatchedtruck.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            dispatchedtruck.CreateDate = DateTime.Now;

            _dispatchedtruckRepository.Add(dispatchedtruck);

            if (dispatchedtruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == dispatchedtruckVM.ContainerNo && x.OrderId == dispatchedtruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            dispatchedtruckVM.ID = dispatchedtruck.ID;
        }

        public async Task UpdateDispatchedTruckAsync(DispatchedTruckViewModel dispatchedtruckVM)
        {

            if (dispatchedtruckVM == null)
            {
                throw new ArgumentNullException(nameof(dispatchedtruckVM));
            }

            var dispatchedtruck = await _dispatchedtruckRepository.GetAsync(Convert.ToInt32(dispatchedtruckVM.ID));

            if (dispatchedtruck == null)
            {
                throw new InvalidOperationException($"Booking order:{dispatchedtruckVM.OrderNo}  not found.");
            }

            dispatchedtruck.DispatchedDate = dispatchedtruckVM.DispatchedDate;
            dispatchedtruck.VehicleNo = dispatchedtruckVM.VehicleNo;
            dispatchedtruck.DriverName = dispatchedtruckVM.DriverName;
            dispatchedtruck.DriverNo = dispatchedtruckVM.DriverNo;
            dispatchedtruck.TransporterName = dispatchedtruckVM.TransporterName;
            dispatchedtruck.BiltyNo = dispatchedtruckVM.BiltyNo;
            dispatchedtruck.IsCompleted = dispatchedtruckVM.IsCompleted;
            _dispatchedtruckRepository.Update(dispatchedtruck);

            if (dispatchedtruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == dispatchedtruckVM.ContainerNo && x.OrderId == dispatchedtruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            dispatchedtruckVM.ID = dispatchedtruck.ID;
        }

        /// ******* End*******/////


        ///////*********** Delivery Truck*********/////////

        public IEnumerable<DeliveryTruckViewModel> GetDeliveryTruckAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString() && x.ModeOfTransportation == ModeOfTransaction.Truck.ToString())
                        on order.OrderID equals logistics.OrderId
                    join dispatch in _dbContext.DispatchedTrucks.Where(x => x.IsCompleted == true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = dispatch.OrderId, ContainerNo = dispatch.ContainerNo }
                    join DT in _dbContext.DeliveryTrucks.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from DeliveryTrucks in DTGroup.DefaultIfEmpty()
                    select new DeliveryTruckViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ReferenceContainer = logistics.ReferenceContainer,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        DeliveryLocation = logistics.EmptyReturnLocation,
                        DriverName = dispatch.DriverName,
                        DriverNo = dispatch.DriverNo,
                        DispatchedDate = dispatch.DispatchedDate,
                        VehicleNo = dispatch.VehicleNo,
                        ArrivalDate = DeliveryTrucks.ArrivalDate,
                        DeliveryDate = DeliveryTrucks.DeliveryDate,


                        ID = DeliveryTrucks.ID,

                    }).Distinct().ToList().OrderByDescending(x => x.ContainerNo);
        }

        public async Task SaveDeliveryTruckAsync(DeliveryTruckViewModel deliverytruckVM)
        {

            var deliverytruck = Mapper.Map<DeliveryTruckViewModel, DeliveryTruck>(deliverytruckVM);
            if (deliverytruck == null)
            {
                throw new ArgumentNullException(nameof(deliverytruckVM));
            }
            deliverytruck.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            deliverytruck.CreateDate = DateTime.Now;

            _deliverytruckRepository.Add(deliverytruck);

            if (deliverytruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == deliverytruckVM.ContainerNo && x.OrderId == deliverytruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.EmptyDropOff.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }

            await _dbContext.SaveChangesAsync();
            deliverytruckVM.ID = deliverytruck.ID;
        }

        public async Task UpdateDeliveryTrucknAsync(DeliveryTruckViewModel deliverytruckVM)
        {

            if (deliverytruckVM == null)
            {
                throw new ArgumentNullException(nameof(deliverytruckVM));
            }

            var deliverytruck = await _deliverytruckRepository.GetAsync(Convert.ToInt32(deliverytruckVM.ID));

            if (deliverytruck == null)
            {
                throw new InvalidOperationException($"Booking order:{deliverytruckVM.OrderNo}  not found.");
            }

            deliverytruck.ArrivalDate = deliverytruckVM.ArrivalDate;
            deliverytruck.DeliveryDate = deliverytruckVM.DeliveryDate;

            deliverytruck.IsCompleted = deliverytruckVM.IsCompleted;
            _deliverytruckRepository.Update(deliverytruck);

            if (deliverytruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == deliverytruckVM.ContainerNo && x.OrderId == deliverytruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.EmptyDropOff.ToString();
                    _logisticsRepositry.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            deliverytruckVM.ID = deliverytruck.ID;
        }


        /////*********** Delivery Truck***********/////////



        public Task SaveLogisticsAsync(Logistic logistics)
        {

            _logisticsRepositry.Add(logistics);
            return _dbContext.SaveChangesAsync();
        }

        public bool DeleteLogistics(int logisticsId)
        {
            bool isSuccess = false;
            var logistics = _dbContext.Logistics.Where(x => x.Status != OrdersStatus.Dispatched.ToString() && x.logisticsid == logisticsId).FirstOrDefault();
            if (logistics != null)
            {
                isSuccess = false;
            }
            else
            {
                _logisticsRepositry.Remove(logisticsId);
                _dbContext.SaveChangesAsync();
                isSuccess = true;
            }

            return isSuccess;

        }

        ////****** Train Report *******////
        public IEnumerable<TrainOrderReportViewModel> TrainOrderReport()
        {
            return (from order in _dbContext.GenerateOrders
                    join logistics in _dbContext.Logistics.Where(x => x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId

                    join RFD in _dbContext.ReadyForDispatcheds
                         on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RFD.OrderId, ContainerNo = RFD.ContainerNo } into RFDGroup
                    from ReadyForDispatcheds in RFDGroup.DefaultIfEmpty()
                    join PDM in _dbContext.PreDispatchedMovements.Where(x => x.IsCompleted == true)
                   on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = PDM.OrderId, ContainerNo = PDM.ContainerNo } into PDMGroup
                    from PreDispatchedMovements in PDMGroup.DefaultIfEmpty()
                    join DPO in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true)
                   on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DPO.OrderId, ContainerNo = DPO.ContainerNo } into DPOGroup
                    from DispatchedOrders in DPOGroup.DefaultIfEmpty()
                    join ITT in _dbContext.InTransactTrains.Where(x => x.IsCompleted == true)
                    on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = ITT.OrderId, ContainerNo = ITT.ContainerNo } into ITTGroup
                    from InTransactTrains in ITTGroup.DefaultIfEmpty()
                    join RD in _dbContext.ReDispatcheds.Where(x => x.IsCompleted == true)
                   on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RD.OrderId, ContainerNo = RD.ContainerNo } into RDGroup
                    from ReDispatcheds in RDGroup.DefaultIfEmpty()
                    join DT in _dbContext.DeliveryTrains.Where(x => x.IsCompleted == true)
                    on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from DeliveryTrains in DTGroup.DefaultIfEmpty()
                    join EDO in _dbContext.EmptyDropOffs
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = EDO.OrderId, ContainerNo = EDO.ContainerNo } into EDOGroup
                    from EmptyDropOffs in EDOGroup.DefaultIfEmpty()
                    select new TrainOrderReportViewModel()
                    {


                        BLNumber = order.BL,
                        OrderNo = order.OrderNo,
                        LastDateofEmptyReturn = order.VesselBerthingDate,
                        FreeDays = order.FreeDays,
                        CustomerName = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        BusinessDivisionName = _dbContext.stp_BusinessDivision.Where(x => x.BusinessDivisionID == order.BusinessDivisionId).FirstOrDefault().BusinessDivisionName,
                        OrderType = order.OrderType,
                        CRO = order.CRO,
                        OrderDate = order.OrderDate,
                        InvoiceAmount = order.InvoiceAmount,
                        ShippingAgentName = _dbContext.ShippingAgents.Where(x => x.ShippingAgentId == order.ShippingAgentId).FirstOrDefault().Name,
                        Remarks = order.Remarks,
                        VesselBerthingDate = order.VesselBerthingDate,
                        ShippingLineName = _dbContext.ShippingLines.Where(x => x.ShippingLineId == order.ShippingLineId).FirstOrDefault().ShippingLineName,
                        BookingPOCName = order.BookingPOCName,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ReferenceContainer = logistics.ReferenceContainer,
                        ContainerTypeName = _dbContext.ContainerTypes.Where(x => x.ContainerTypeID == logistics.ContainerType).FirstOrDefault().ContainerTypeName,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        JobType = logistics.JobType,
                        EmptyReturnLocation = logistics.EmptyReturnLocation,
                        EmptyReturnDate = logistics.EmptyReturnDate.ToString(),
                        ModeOfTransportation = logistics.ModeOfTransportation,
                        ContainerWeight = logistics.ContainerWeight,
                        PreDispatched = logistics.PreDispatched,
                        Commodities = logistics.Comodities,
                        DoGuaranteeDate = ReadyForDispatcheds.DOGranty,
                        ImportEIR = ReadyForDispatcheds.ImportEIR,
                        PortWeighment = ReadyForDispatcheds.PortWeighment,
                        OutsidePortWeighment = ReadyForDispatcheds.OutSidePortWeighment,
                        GD = ReadyForDispatcheds.GD,
                        BL = ReadyForDispatcheds.BL,
                        PreDispatchedFromLocation = PreDispatchedMovements.FromLocation,
                        PreDispatchedToLocation = PreDispatchedMovements.ToLocation,
                        PreDispatchedTransporterName = PreDispatchedMovements.TransporterName,
                        TransporterName = ReDispatcheds.TranspoterName,
                        VehicleNumber = ReDispatcheds.VehicleNo,
                        PriorityForDispatched = DispatchedOrders.PriorityForDispatched,
                        DispatchedDate = DispatchedOrders.DispatchedDate,
                        StationName = DispatchedOrders.StationName,
                        WagonNumber = DispatchedOrders.WagonNo,
                        WagonType = DispatchedOrders.WagonType,
                        RRNo = DispatchedOrders.RRNo,
                        EngineNo = DispatchedOrders.EngineNo,
                        InvoiceNumber = DispatchedOrders.InvoiceNumber,
                        ArrivalDate = InTransactTrains.ArrivalDate,
                        LOLO = InTransactTrains.LOLO,
                        ReDispatchedDate = ReDispatcheds.ReDispatchedDate,
                        BiltyNo = ReDispatcheds.BiltyNumber,
                        TransportationCost = ReDispatcheds.TransportationCost,
                        DeliveryDate = DeliveryTrains.DeliveryDate,
                        DeliveryArrivalDate = DeliveryTrains.ArrivalDate,
                        DeliveryVehicleNumber = DeliveryTrains.VehicleNo,
                        EIRNo = EmptyDropOffs.EIRNo,
                        EmptyDropOffRemarks = EmptyDropOffs.Remarks,
                        ExpenseAtEmptyLocation = EmptyDropOffs.ExpenseAtEmptyLocation,
                        TrainID = DispatchedOrders.TrainID



                    }).Distinct().ToList();
        }
        ///***End***///


        ////****** Import Booking Report *******////
        public IEnumerable<ImportBookingReportViewModel> ImportBookingReportTrain()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.ModeOfTransportation == ModeOfTransaction.Train.ToString() && x.Status == OrdersStatus.PreDispatched.ToString())
                    on order.OrderID equals logistics.OrderId
                    


                    select new ImportBookingReportViewModel()
                    {

                        BL = order.BL,
                        OrderNo = order.OrderNo,
                        FreeDays = order.FreeDays,
                        EmptyReturnDate = logistics.EmptyReturnDate.ToString(),
                        CustomerName = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        OrderType = order.OrderType,
                        OrderDate = order.OrderDate,
                        InvoiceAmount = order.InvoiceAmount,
                        ShippingAgentName = _dbContext.ShippingAgents.Where(x => x.ShippingAgentId == order.ShippingAgentId).FirstOrDefault().Name,
                        Remarks = order.Remarks,
                        VesselBerthingDate = order.VesselBerthingDate,
                        ShippingLineName = _dbContext.ShippingLines.Where(x => x.ShippingLineId == order.ShippingLineId).FirstOrDefault().ShippingLineName,
                        BookingPOCName = order.BookingPOCName,
                        TwentyContainerQty = order.TwentyContainerQty,
                        FortyContainerQty = order.FortyContainerQty,
                        TwentyContainerPrice = order.TwentyContainerPrice,
                        FortyContainerPrice = order.FortyContainerPrice,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerTypeName = _dbContext.ContainerTypes.Where(x => x.ContainerTypeID == logistics.ContainerType).FirstOrDefault().ContainerTypeName,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        JobType = logistics.JobType,
                        EmptyReturnLocation = logistics.EmptyReturnLocation,
                        ModeOfTransportation = logistics.ModeOfTransportation,
                        ContainerWeight = logistics.ContainerWeight,
                        PreDispatched = logistics.PreDispatched,
                        Comodities = logistics.Comodities,
                        DOGuarantee = order.DOGuarantee,
                        ImportEIR = order.ImportEIR,
                        PortWeighment = order.PortWeighment,
                        OutSidePortWeighment = order.OutSidePortWeighment,
                        GD = order.GD,
                        BLDate = order.BLDate,

                    }).Distinct().ToList();
        }

        public IEnumerable<ImportBookingReportViewModel> ImportBookingReportTruck()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.ModeOfTransportation == ModeOfTransaction.Truck.ToString() && x.Status == OrdersStatus.Dispatched.ToString())
                    on order.OrderID equals logistics.OrderId


                    select new ImportBookingReportViewModel()
                    {

                        BL = order.BL,
                        OrderNo = order.OrderNo,
                        FreeDays = order.FreeDays,
                        EmptyReturnDate = logistics.EmptyReturnDate.ToString(),
                        CustomerName = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        OrderType = order.OrderType,
                        OrderDate = order.OrderDate,
                        InvoiceAmount = order.InvoiceAmount,
                        ShippingAgentName = _dbContext.ShippingAgents.Where(x => x.ShippingAgentId == order.ShippingAgentId).FirstOrDefault().Name,
                        Remarks = order.Remarks,
                        VesselBerthingDate = order.VesselBerthingDate,
                        ShippingLineName = _dbContext.ShippingLines.Where(x => x.ShippingLineId == order.ShippingLineId).FirstOrDefault().ShippingLineName,
                        BookingPOCName = order.BookingPOCName,
                        TwentyContainerQty = order.TwentyContainerQty,
                        FortyContainerQty = order.FortyContainerQty,
                        TwentyContainerPrice = order.TwentyContainerPrice,
                        FortyContainerPrice = order.FortyContainerPrice,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerTypeName = _dbContext.ContainerTypes.Where(x => x.ContainerTypeID == logistics.ContainerType).FirstOrDefault().ContainerTypeName,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        JobType = logistics.JobType,
                        EmptyReturnLocation = logistics.EmptyReturnLocation,
                        ModeOfTransportation = logistics.ModeOfTransportation,
                        ContainerWeight = logistics.ContainerWeight,
                        PreDispatched = logistics.PreDispatched,
                        Comodities = logistics.Comodities,
                        DOGuarantee = order.DOGuarantee,
                        ImportEIR = order.ImportEIR,
                        PortWeighment = order.PortWeighment,
                        OutSidePortWeighment = order.OutSidePortWeighment,
                        GD = order.GD,
                        BLDate = order.BLDate,

                    }).Distinct().ToList();
        }
        ///***End***///

        public async Task<IEnumerable<BAtrip>> GetTripsDetailAsync(int orderBookingId)
        {
            return await _tripRepository.FindAsync(x => x.OrderId == orderBookingId);
        }
        public async Task<BAtrip> GetTripAsync(int tripId)
        {
            return await _tripRepository.GetAsync(tripId);
        }
        public async Task<IEnumerable<BAtrip>> GetTripsByContainerAsync(int logisticsId)
        {
            var containers = await _tripContainerRepositry.FindAsync(x => x.LogisticsId == logisticsId);
            var containerIds = containers.Select(x => x.TripId.Value).ToArray();
            return await _tripRepository.FindAsync(x => containerIds.Contains(x.ID));
        }
        public async Task<BAtrip> AddTripAsync(BAtrip tripModel)
        {
            tripModel.ContainerStatus = 1;
            _tripRepository.Add(tripModel);
            await _dbContext.SaveChangesAsync();

            return tripModel;
        }

        public Task AddTripExpenseAsync(IEnumerable<BAExpensesDetail> bAExpensesDetails)
        {
            _tripExpenseMapping.AddRange(bAExpensesDetails);

            return _dbContext.SaveChangesAsync();
        }

        public Task AddTripContainersAsync(IEnumerable<TripContainer> tripContainers)
        {
            _tripContainerRepositry.AddRange(tripContainers);

            return _dbContext.SaveChangesAsync();
        }

        public async Task<string> GetNewTripCode()
        {
            var tripCode = await _dbContext.BAtrips
                .OrderByDescending(x => x.Trip_ID)
                .Select(x => x.Trip_ID)
                .FirstOrDefaultAsync();

            return string.IsNullOrEmpty(tripCode) ? 1.ToString("000000") : (Convert.ToInt64(tripCode) + 1).ToString("000000");
        }

        public Task<IEnumerable<tbl_Party>> GetVendorsAsync()
        {
            return _partyRepository.FindAsync(x => x.PartyType == "Trucking" || x.PartyType == "Railway");
        }
        public Task DeleteTrip(int tripId)
        {
            _tripRepository.Remove(tripId);
            return _dbContext.SaveChangesAsync();
        }
        public IEnumerable<OrderListViewModel> GetOrderList(int businessDivisionId)
        {
            return (from order in _dbContext.GenerateOrders//.Where(x=> x.isCompleted == false)
                    join bDivision in _dbContext.stp_BusinessDivision.Where(x => businessDivisionId == 0 || x.BusinessDivisionID == businessDivisionId)
                            on order.BusinessDivisionId equals bDivision.BusinessDivisionID
                    join customer in _dbContext.BACustomerRegistrations on order.CustomerID equals customer.CustomerID
                    select new OrderListViewModel()
                    {
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        CustomerName = customer.Customer_Name,
                        BusinessDivision = bDivision.BusinessDivisionName,
                        OrderType = order.OrderType,
                        InvoiceAmount = (order.InvoiceAmount ?? 0).ToString(),
                        RemainingTrips = _dbContext.BAtrips.Count(x => x.ContainerStatus != 4 && x.OrderId == order.OrderID && x.IsActive == true),
                        VendorExpense = _dbContext.BAtrips.Where(x => x.OrderId == order.OrderID && x.IsActive == true).Sum(x => x.PartyRate) ?? 0,
                        ReadyForDispatched = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.ReadyForDispatched.ToString()).ToList().Count().ToString(),
                        PreDispatched = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.PreDispatched.ToString()).ToList().Count().ToString(),
                        Dispatched = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.Dispatched.ToString()).ToList().Count().ToString(),
                        InTransact = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.InTransact.ToString()).ToList().Count().ToString(),
                        ReDispatched = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.ReDispatched.ToString()).ToList().Count().ToString(),
                        Delivery = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.Delivery.ToString()).ToList().Count().ToString(),
                        EmptyDropOff = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.EmptyDropOff.ToString()).ToList().Count().ToString(),
                        Completed = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.Status == OrdersStatus.Completed.ToString()).ToList().Count().ToString(),
                        ContainerCount = _dbContext.Logistics.Where(x => x.OrderId == order.OrderID && x.IsActive == true).ToList().Count(),
                        IsCompleted = order.isCompleted
                    }).Distinct().ToList();
        }

        /////********* Export OrderList*********//////



        public IEnumerable<OrderListViewModel> GetExportOrderList()
        {
            return (from order in _dbContext.ExportBookingOrders//.Where(x=> x.IsCompleted == false)
                        //join bDivision in _dbContext.stp_BusinessDivision.Where(x => businessDivisionId == 0 || x.BusinessDivisionID == businessDivisionId)
                        //        on order.BusinessDivisionId equals bDivision.BusinessDivisionID
                        //join customer in _dbContext.BACustomerRegistrations on order.CustomerID equals customer.CustomerID
                    select new OrderListViewModel()
                    {
                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        ExportPreDispatched = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.PreDispatched.ToString()).ToList().Count().ToString(),
                        ExportDispatchedTrain = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.Dispatched.ToString()).ToList().Count().ToString(),
                        ExportDispatchedTruck = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.Dispatched.ToString()).ToList().Count().ToString(),
                        ExportReDispatched = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.ReDispatched.ToString()).ToList().Count().ToString(),
                        ExportDelivery = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.Delivery.ToString()).ToList().Count().ToString(),
                        Completed = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId && x.Status == OrdersStatus.Completed.ToString()).ToList().Count().ToString(),
                        ContainerCount = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId).ToList().Count(),
                        IsCompleted = order.IsCompleted
                    }).Distinct().ToList();
        }


        public IEnumerable<ShippingAgent> GetShippingAgent()
        {
            return _dbContext.ShippingAgents.Where(x => x.IsDeleted == false).ToList();
        }

        public IEnumerable<ShippingLine> GetShippingLine()
        {
            return _dbContext.ShippingLines.Where(x => x.IsDeleted == false).ToList();
        }

        public IEnumerable<BAShippingLine> GetBLApprovalAsync()
        {

            return _dbContext.BAShippingLines.Where(x => x.IsCompleted == true).ToList().OrderByDescending(x => x.BLShippingID);

        }


        public async Task UpdateBLApprovalAsync(BLShippingLineViewModel BlshippinglineVM)
        {
            if (BlshippinglineVM == null)
            {
                throw new ArgumentNullException(nameof(BlshippinglineVM));
            }

            var blshippingline = await _blshippinglineRepository.GetAsync(Convert.ToInt32(BlshippinglineVM.BLShippingID));

            if (blshippingline == null)
            {
                throw new InvalidOperationException($"BL:{BlshippinglineVM.BL}  not found.");
            }

            blshippingline.Approval = BlshippinglineVM.Approval;
            _blshippinglineRepository.Update(blshippingline);


            await _dbContext.SaveChangesAsync();
            BlshippinglineVM.BLShippingID = blshippingline.BLShippingID;
        }



        ///////******************************Export Booking Order*******************************////////

        public async Task<string> GetExportNewOrderNumber()
        {
            var orderNo = await _dbContext.ExportBookingOrders
                .OrderByDescending(x => x.OrderNo)
                .Select(x => x.OrderNo)
                .FirstOrDefaultAsync();
            if (!string.IsNullOrEmpty(orderNo))
            {
                orderNo = orderNo.Replace("EXP", "");
            }
            return string.IsNullOrEmpty(orderNo) ? 1.ToString("EXP000000") : (Convert.ToInt64(orderNo) + 1).ToString("EXP000000");
        }

        public async Task<ExportOrderBookingViewModel> GetExportOrderBookingAsync(int orderBookingId)
        {
            var exportbookingModel = await _exportbookingorderRepository.GetAsync(orderBookingId);
            var exportorderbookingViewModel = Mapper.Map<ExportBookingOrder, ExportOrderBookingViewModel>(exportbookingModel);
            if (exportorderbookingViewModel != null)
                exportorderbookingViewModel.FacilityIds = await GetOrderFacilitiesAsync(orderBookingId);
            return exportorderbookingViewModel;
        }

        public async Task CreateExportOrderBookingAsync(ExportOrderBookingViewModel exportorderbookingViewModel)
        {
            var exportbookingModel = Mapper.Map<ExportOrderBookingViewModel, ExportBookingOrder>(exportorderbookingViewModel);
            if (exportbookingModel == null)
            {
                throw new ArgumentNullException(nameof(exportbookingModel));
            }

            var order = await _exportbookingorderRepository.FindAsync(x => x.OrderNo == exportbookingModel.OrderNo);

            if (order.Any())
            {
                throw new ArgumentException($"{nameof(exportbookingModel.OrderNo)} already exist. Please try again");
            }
            order = await _exportbookingorderRepository.FindAsync(x => x.CRO == exportbookingModel.CRO);
            if (order.Any())
            {
                throw new ArgumentException($"{nameof(exportbookingModel.CRO)} already exist. ");
            }
            exportbookingModel.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            exportbookingModel.CreateDate = DateTime.Now;
            exportbookingModel.IsCompleted = false;

            _exportbookingorderRepository.Add(exportbookingModel);
            await _dbContext.SaveChangesAsync();
            await AddOrderFacilitiesAsync(exportorderbookingViewModel.FacilityIds, exportbookingModel.OrderId);

            exportorderbookingViewModel.OrderID = exportbookingModel.OrderId;
        }

        public async Task UpdateExportOrderBookingAsync(ExportOrderBookingViewModel exportbookingViewModel)
        {
            if (exportbookingViewModel == null)
            {
                throw new ArgumentNullException(nameof(exportbookingViewModel));
            }

            ExportBookingOrder exportBookingModel = await _exportbookingorderRepository.GetAsync(exportbookingViewModel.OrderID);

            if (exportBookingModel == null)
            {
                throw new InvalidOperationException($"{nameof(exportbookingViewModel.OrderID)} is invalid");
            }


            exportBookingModel.DateOfBooking = exportbookingViewModel.DateOfBooking;
            exportBookingModel.CRO = exportbookingViewModel.CRO;
            exportBookingModel.TwentyContainerQty = exportbookingViewModel.TwentyContainerQty;
            exportBookingModel.FortyContainerQty = exportbookingViewModel.FortyContainerQty;
            exportBookingModel.TwentyContainerPrice = exportbookingViewModel.TwentyContainerPrice;
            exportBookingModel.FortyContainerPrice = exportbookingViewModel.FortyContainerPrice;
            exportBookingModel.RateOfTransportation = exportbookingViewModel.RateOfTransportation;
            exportBookingModel.PointOfLoadingStation = exportbookingViewModel.PointOfLoadingStation;
            exportBookingModel.Forwarder = exportbookingViewModel.Forwarder;
            exportBookingModel.ShipperName = exportbookingViewModel.ShipperName;
            exportBookingModel.ShipperContact = exportbookingViewModel.ShipperContact;

            _exportbookingorderRepository.Update(exportBookingModel);

            await _dbContext.SaveChangesAsync();
            await AddOrderFacilitiesAsync(exportbookingViewModel.FacilityIds, exportBookingModel.OrderId);

            exportbookingViewModel.OrderID = exportBookingModel.OrderId;
        }

        public Task<IEnumerable<ExportLogistic>> GetExportLogisticsAsync(int orderBookingId)
        {
            return _exportlogisticRepository.FindAsync(x => x.OrderId == orderBookingId);
        }

        public async Task SaveExportLogisticsAsync(ExportLogisticViewModel exportlogisticsViewModels)
        {
            var exportlogistic = Mapper.Map<ExportLogisticViewModel, ExportLogistic>(exportlogisticsViewModels);
            exportlogistic.Status = OrdersStatus.PreDispatched.ToString();

            if (!exportlogistic.PreDispatched.GetValueOrDefault())
            {
                exportlogistic.Status = OrdersStatus.Dispatched.ToString();
            }
            exportlogistic.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            exportlogistic.CreateDate = DateTime.Now;

            _exportlogisticRepository.Add(exportlogistic);
            await _dbContext.SaveChangesAsync();
            exportlogisticsViewModels.LogisticId = exportlogistic.LogisticId;
        }

        public bool ExportDeleteLogistic(int LogisticId)
        {
            bool isSuccess = false;
            var exportlogistic = _dbContext.ExportLogistics.Where(x => x.Status != OrdersStatus.PreDispatched.ToString() && x.LogisticId == LogisticId).FirstOrDefault();
            if (exportlogistic != null)
            {
                isSuccess = false;
            }
            else
            {
                _exportlogisticRepository.Remove(LogisticId);
                _dbContext.SaveChangesAsync();
                isSuccess = true;
            }

            return isSuccess;

        }

        ////*************** Export PreDispatched***********/////

        public IEnumerable<ExportPreDispatchedViewModel> GetExportPreDispatchedAsync()
        {
            return (from order in _dbContext.ExportBookingOrders.Where(x => x.IsCompleted == false)
                    join logistics in _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.PreDispatched.ToString() && x.PreDispatched == true)
                        on order.OrderId equals logistics.OrderId
                    join PD in _dbContext.ExportPreDispatcheds.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = PD.OrderId, ContainerNo = PD.ContainerNo } into PDGroup
                    from ExportPreDispatched in PDGroup.DefaultIfEmpty()
                    select new ExportPreDispatchedViewModel()
                    {

                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        CRO = order.CRO,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,


                        PickupFrom = ExportPreDispatched.PickupFrom,
                        VehicleNo = ExportPreDispatched.VehicleNo,
                        TransporterName = ExportPreDispatched.TransporterName,
                        TransporterCost = ExportPreDispatched.TransporterCost,
                        ID = ExportPreDispatched.ID,

                    }).Distinct().ToList();
        }

        public async Task SaveExportPreDispatchedAsync(ExportPreDispatchedViewModel ExportpreDispatchedVM)
        {

            var ExportpreDispatched = Mapper.Map<ExportPreDispatchedViewModel, ExportPreDispatched>(ExportpreDispatchedVM);
            if (ExportpreDispatched == null)
            {
                throw new ArgumentNullException(nameof(ExportpreDispatchedVM));
            }
            ExportpreDispatched.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            ExportpreDispatched.CreateDate = DateTime.Now;

            _exportpredispatchedRepository.Add(ExportpreDispatched);

            if (ExportpreDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.PreDispatched.ToString()
                    && x.ContainerNo == ExportpreDispatchedVM.ContainerNo && x.OrderId == ExportpreDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Dispatched.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportpreDispatchedVM.ID = ExportpreDispatched.ID;
        }

        public async Task UpdateExportPreDispatchedAsync(ExportPreDispatchedViewModel ExportpreDispatchedVM)
        {

            if (ExportpreDispatchedVM == null)
            {
                throw new ArgumentNullException(nameof(ExportpreDispatchedVM));
            }

            var ExportpreDispatched = await _exportpredispatchedRepository.GetAsync(Convert.ToInt32(ExportpreDispatchedVM.ID));

            if (ExportpreDispatched == null)
            {
                throw new InvalidOperationException($"Booking order:{ExportpreDispatchedVM.OrderNo}  not found.");
            }

            ExportpreDispatched.PickupFrom = ExportpreDispatchedVM.PickupFrom;
            ExportpreDispatched.TransporterName = ExportpreDispatchedVM.TransporterName;
            ExportpreDispatched.VehicleNo = ExportpreDispatchedVM.VehicleNo;
            ExportpreDispatched.TransporterCost = ExportpreDispatchedVM.TransporterCost;
            ExportpreDispatched.IsCompleted = ExportpreDispatchedVM.IsCompleted;
            _exportpredispatchedRepository.Update(ExportpreDispatched);

            if (ExportpreDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.PreDispatched.ToString()
                    && x.ContainerNo == ExportpreDispatchedVM.ContainerNo && x.OrderId == ExportpreDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Dispatched.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportpreDispatchedVM.ID = ExportpreDispatched.ID;
        }

        ////*************** Export Dispatched Train***********/////

        public IEnumerable<ExportDispatchedTrainViewModel> GetExportDispatchedTrainAsync()
        {
            return (from order in _dbContext.ExportBookingOrders.Where(x => x.IsCompleted == false)
                    join logistics in _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString() && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderId equals logistics.OrderId
                    join EDT in _dbContext.ExportDispatchedTrains.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = EDT.OrderId, ContainerNo = EDT.ContainerNo } into EDTGroup
                    from ExportDispatchedTrains in EDTGroup.DefaultIfEmpty()
                    select new ExportDispatchedTrainViewModel()
                    {

                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        CRO = order.CRO,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerType = logistics.ContainerType,
                        EngineNo = logistics.EGNo,
                        ShipperName = order.ShipperName,


                        TrainID = ExportDispatchedTrains.TrainID,
                        DispatchedOfDate = ExportDispatchedTrains.DispatchedOfDate,
                        WagonNo = ExportDispatchedTrains.WagonNo,
                        RRNo = ExportDispatchedTrains.RRNo,
                        WagonType = ExportDispatchedTrains.WagonType,
                        ReDispatched = ExportDispatchedTrains.ReDispatched,
                        CargoWeight = ExportDispatchedTrains.CargoWeight,
                        TareWeight = ExportDispatchedTrains.TareWeight,
                        ID = ExportDispatchedTrains.ID,

                    }).Distinct().ToList();
        }

        public IEnumerable<tbl_ExportTrain> GetExportTrainID()
        {
            return _dbContext.tbl_ExportTrain.ToList();
        }

        public async Task SaveExportDispatchedTrainAsync(ExportDispatchedTrainViewModel ExportDispatchedTrainVM)
        {

            var ExportDispatchedTrain = Mapper.Map<ExportDispatchedTrainViewModel, ExportDispatchedTrain>(ExportDispatchedTrainVM);
            if (ExportDispatchedTrain == null)
            {
                throw new ArgumentNullException(nameof(ExportDispatchedTrainVM));
            }
            ExportDispatchedTrain.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            ExportDispatchedTrain.CreateDate = DateTime.Now;

            _exportdispatchedtrainRepository.Add(ExportDispatchedTrain);

            if (ExportDispatchedTrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == ExportDispatchedTrainVM.ContainerNo && x.OrderId == ExportDispatchedTrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.ReDispatched.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDispatchedTrainVM.ID = ExportDispatchedTrain.ID;
        }

        public async Task UpdateExportDispatchedTrainAsync(ExportDispatchedTrainViewModel ExportDispatchedTrainVM)
        {

            if (ExportDispatchedTrainVM == null)
            {
                throw new ArgumentNullException(nameof(ExportDispatchedTrainVM));
            }

            var ExportDispatchedTrain = await _exportdispatchedtrainRepository.GetAsync(Convert.ToInt32(ExportDispatchedTrainVM.ID));

            if (ExportDispatchedTrain == null)
            {
                throw new InvalidOperationException($"Booking order:{ExportDispatchedTrainVM.OrderNo}  not found.");
            }

            ExportDispatchedTrain.TrainID = ExportDispatchedTrainVM.TrainID;
            ExportDispatchedTrain.DispatchedOfDate = ExportDispatchedTrainVM.DispatchedOfDate;
            ExportDispatchedTrain.WagonNo = ExportDispatchedTrainVM.WagonNo;
            ExportDispatchedTrain.RRNo = ExportDispatchedTrainVM.RRNo;
            ExportDispatchedTrain.WagonType = ExportDispatchedTrainVM.WagonType;
            ExportDispatchedTrain.ReDispatched = ExportDispatchedTrainVM.ReDispatched;
            ExportDispatchedTrain.CargoWeight = ExportDispatchedTrainVM.CargoWeight;
            ExportDispatchedTrain.TareWeight = ExportDispatchedTrainVM.TareWeight;
            ExportDispatchedTrain.IsCompleted = ExportDispatchedTrainVM.IsCompleted;
            _exportdispatchedtrainRepository.Update(ExportDispatchedTrain);

            if (ExportDispatchedTrainVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == ExportDispatchedTrainVM.ContainerNo && x.OrderId == ExportDispatchedTrainVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.ReDispatched.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDispatchedTrainVM.ID = ExportDispatchedTrain.ID;
        }

        ///////********* Export Dispatched Truck***********////////


        public IEnumerable<ExportDispatchedTruckViewModel> GetExportDispatchedTruckAsync()
        {
            return (from order in _dbContext.ExportBookingOrders.Where(x => x.IsCompleted == false)
                    join logistics in _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString() && x.ModeOfTransportation == ModeOfTransaction.Truck.ToString())
                        on order.OrderId equals logistics.OrderId
                    join DT in _dbContext.ExportDispatchedTrucks.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from ExportDispatchedTrucks in DTGroup.DefaultIfEmpty()
                    select new ExportDispatchedTruckViewModel()
                    {

                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        CRO = order.CRO,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerType = logistics.ContainerType,


                        TruckNo = ExportDispatchedTrucks.TruckNo,
                        DateOfDispatched = ExportDispatchedTrucks.DateOfDispatched,
                        CustomerName = ExportDispatchedTrucks.CustomerName,
                        TruckContactNo = ExportDispatchedTrucks.TruckContactNo,
                        BiltyNo = ExportDispatchedTrucks.BiltyNo,
                        DeliveryLocation = ExportDispatchedTrucks.DeliveryLocation,
                        ID = ExportDispatchedTrucks.ID,

                    }).Distinct().ToList();
        }

        public async Task SaveExportDispatchedTruckAsync(ExportDispatchedTruckViewModel ExportDispatchedTruckVM)
        {

            var ExportDispatchedTruck = Mapper.Map<ExportDispatchedTruckViewModel, ExportDispatchedTruck>(ExportDispatchedTruckVM);
            if (ExportDispatchedTruck == null)
            {
                throw new ArgumentNullException(nameof(ExportDispatchedTruckVM));
            }
            ExportDispatchedTruck.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            ExportDispatchedTruck.CreateDate = DateTime.Now;

            _exportdispatchedtruckRepository.Add(ExportDispatchedTruck);

            if (ExportDispatchedTruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == ExportDispatchedTruckVM.ContainerNo && x.OrderId == ExportDispatchedTruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDispatchedTruckVM.ID = ExportDispatchedTruck.ID;
        }

        public async Task UpdateExportDispatchedTruckAsync(ExportDispatchedTruckViewModel ExportDispatchedTruckVM)
        {

            if (ExportDispatchedTruckVM == null)
            {
                throw new ArgumentNullException(nameof(ExportDispatchedTruckVM));
            }

            var ExportDispatchedTruck = await _exportdispatchedtruckRepository.GetAsync(Convert.ToInt32(ExportDispatchedTruckVM.ID));

            if (ExportDispatchedTruck == null)
            {
                throw new InvalidOperationException($"Booking order:{ExportDispatchedTruckVM.OrderNo}  not found.");
            }

            ExportDispatchedTruck.TruckNo = ExportDispatchedTruckVM.TruckNo;
            ExportDispatchedTruck.DateOfDispatched = ExportDispatchedTruckVM.DateOfDispatched;
            ExportDispatchedTruck.CustomerName = ExportDispatchedTruckVM.CustomerName;
            ExportDispatchedTruck.TruckContactNo = ExportDispatchedTruckVM.TruckContactNo;
            ExportDispatchedTruck.BiltyNo = ExportDispatchedTruckVM.BiltyNo;
            ExportDispatchedTruck.DeliveryLocation = ExportDispatchedTruckVM.DeliveryLocation;

            ExportDispatchedTruck.IsCompleted = ExportDispatchedTruckVM.IsCompleted;
            _exportdispatchedtruckRepository.Update(ExportDispatchedTruck);

            if (ExportDispatchedTruckVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Dispatched.ToString()
                    && x.ContainerNo == ExportDispatchedTruckVM.ContainerNo && x.OrderId == ExportDispatchedTruckVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDispatchedTruckVM.ID = ExportDispatchedTruck.ID;
        }

        ////*************** Export ReDispatched***********/////

        public IEnumerable<ExportReDispatchedViewModel> GetExportReDispatchedAsync()
        {
            return (from order in _dbContext.ExportBookingOrders.Where(x => x.IsCompleted == false)
                    join logistics in _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.ReDispatched.ToString())
                        on order.OrderId equals logistics.OrderId
                    join PD in _dbContext.ExportReDispatcheds.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = PD.OrderId, ContainerNo = PD.ContainerNo } into PDGroup
                    from ExportReDispatcheds in PDGroup.DefaultIfEmpty()
                    select new ExportReDispatchedViewModel()
                    {

                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        CRO = order.CRO,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerType = logistics.ContainerType,


                        TransporterName = ExportReDispatcheds.TransporterName,
                        VehicleNo = ExportReDispatcheds.VehicleNo,
                        CustomerName = ExportReDispatcheds.CustomerName,
                        TruckingCost = ExportReDispatcheds.TruckingCost,
                        ID = ExportReDispatcheds.ID,

                    }).Distinct().ToList();
        }

        public async Task SaveExportReDispatchedAsync(ExportReDispatchedViewModel ExportReDispatchedVM)
        {

            var ExportReDispatched = Mapper.Map<ExportReDispatchedViewModel, ExportReDispatched>(ExportReDispatchedVM);
            if (ExportReDispatched == null)
            {
                throw new ArgumentNullException(nameof(ExportReDispatchedVM));
            }
            ExportReDispatched.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            ExportReDispatched.CreateDate = DateTime.Now;

            _exportRedispatchedRepository.Add(ExportReDispatched);

            if (ExportReDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.ReDispatched.ToString()
                    && x.ContainerNo == ExportReDispatchedVM.ContainerNo && x.OrderId == ExportReDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportReDispatchedVM.ID = ExportReDispatched.ID;
        }

        public async Task UpdateExportReDispatchedAsync(ExportReDispatchedViewModel ExportReDispatchedVM)
        {

            if (ExportReDispatchedVM == null)
            {
                throw new ArgumentNullException(nameof(ExportReDispatchedVM));
            }

            var ExportReDispatched = await _exportRedispatchedRepository.GetAsync(Convert.ToInt32(ExportReDispatchedVM.ID));

            if (ExportReDispatched == null)
            {
                throw new InvalidOperationException($"Booking order:{ExportReDispatchedVM.OrderNo}  not found.");
            }

            ExportReDispatched.TransporterName = ExportReDispatchedVM.TransporterName;
            ExportReDispatched.VehicleNo = ExportReDispatchedVM.VehicleNo;
            ExportReDispatched.CustomerName = ExportReDispatchedVM.CustomerName;
            ExportReDispatched.TruckingCost = ExportReDispatchedVM.TruckingCost;

            ExportReDispatched.IsCompleted = ExportReDispatchedVM.IsCompleted;
            _exportRedispatchedRepository.Update(ExportReDispatched);

            if (ExportReDispatchedVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.ReDispatched.ToString()
                    && x.ContainerNo == ExportReDispatchedVM.ContainerNo && x.OrderId == ExportReDispatchedVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Delivery.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportReDispatchedVM.ID = ExportReDispatched.ID;
        }

        ////*************** Export Delivery***********/////

        public IEnumerable<ExportDeliveryViewModel> GetExportDeliveryAsync()
        {
            return (from order in _dbContext.ExportBookingOrders.Where(x => x.IsCompleted == false)
                    join logistics in _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Delivery.ToString())
                        on order.OrderId equals logistics.OrderId
                    join RD in _dbContext.ExportReDispatcheds.Where(x => x.IsCompleted == true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RD.OrderId, ContainerNo = RD.ContainerNo } into RDGroup
                    from ExportReDispatcheds in RDGroup.DefaultIfEmpty()
                    join DT in _dbContext.ExportDispatchedTrucks.Where(x => x.IsCompleted == true)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = DT.OrderId, ContainerNo = DT.ContainerNo } into DTGroup
                    from ExportDispatchedTrucks in DTGroup.DefaultIfEmpty()
                    join EDT in _dbContext.ExportDispatchedTrains.Where(x => x.IsCompleted == true)// && x.ReDispatched.ToLower() == "false")
                    on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = EDT.OrderId, ContainerNo = EDT.ContainerNo } into EDTGroup
                    from ExportDispatchedTrains in EDTGroup.DefaultIfEmpty()
                    join ED in _dbContext.ExportDeliveries.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = ED.OrderId, ContainerNo = ED.ContainerNo } into EDGroup
                    from ExportDeliveries in EDGroup.DefaultIfEmpty()
                    select new ExportDeliveryViewModel()
                    {

                        OrderId = order.OrderId,
                        OrderNo = order.OrderNo,
                        CRO = order.CRO,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerType = logistics.ContainerType,


                        VehicleNo = ExportReDispatcheds.VehicleNo,
                        TruckNo = ExportDispatchedTrucks.TruckNo,
                        WagonNo = ExportDispatchedTrains.WagonNo,
                        DeliveryDate = ExportDeliveries.DeliveryDate,
                        ID = ExportDeliveries.ID,

                    }).Distinct().ToList();
        }

        public async Task SaveExportDeliveryAsync(ExportDeliveryViewModel ExportDeliveryVM)
        {

            var ExportDelivery = Mapper.Map<ExportDeliveryViewModel, ExportDelivery>(ExportDeliveryVM);
            if (ExportDelivery == null)
            {
                throw new ArgumentNullException(nameof(ExportDeliveryVM));
            }
            ExportDelivery.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            ExportDelivery.CreateDate = DateTime.Now;

            _exportDeliveryRepository.Add(ExportDelivery);

            if (ExportDeliveryVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == ExportDeliveryVM.ContainerNo && x.OrderId == ExportDeliveryVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Completed.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDeliveryVM.ID = ExportDelivery.ID;
        }
        public async Task UpdateExportDeliveryAsync(ExportDeliveryViewModel ExportDeliveryVM)
        {

            if (ExportDeliveryVM == null)
            {
                throw new ArgumentNullException(nameof(ExportDeliveryVM));
            }

            var ExportDelivery = await _exportDeliveryRepository.GetAsync(Convert.ToInt32(ExportDeliveryVM.ID));

            if (ExportDelivery == null)
            {
                throw new InvalidOperationException($"Booking order:{ExportDeliveryVM.OrderNo}  not found.");
            }

            ExportDelivery.VehicleNo = ExportDeliveryVM.VehicleNo;
            ExportDelivery.TruckNo = ExportDeliveryVM.TruckNo;
            ExportDelivery.WagonNo = ExportDeliveryVM.WagonNo;
            ExportDelivery.DeliveryDate = ExportDeliveryVM.DeliveryDate;

            ExportDelivery.IsCompleted = ExportDeliveryVM.IsCompleted;
            _exportDeliveryRepository.Update(ExportDelivery);

            if (ExportDeliveryVM.IsCompleted.GetValueOrDefault())
            {
                var logistic = _dbContext.ExportLogistics.Where(x => x.Status == OrdersStatus.Delivery.ToString()
                    && x.ContainerNo == ExportDeliveryVM.ContainerNo && x.OrderId == ExportDeliveryVM.OrderId).FirstOrDefault();
                if (logistic != null)
                {
                    logistic.Status = OrdersStatus.Completed.ToString();
                    _exportlogisticRepository.Update(logistic);
                }
            }
            await _dbContext.SaveChangesAsync();
            ExportDeliveryVM.ID = ExportDelivery.ID;
        }

        // --- Import ContainerWise Report --- //
        public IEnumerable<PrintImportReportViewModel> PrintContainerWiseReport(string section, string bl)
        {
            if (section == "header")
            {
                return (from order in _dbContext.GenerateOrders.Where(x => x.BL == bl)
                        select new PrintImportReportViewModel()
                        {

                            BL = order.BL,
                            Customer_Name = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                            OrderType = order.OrderType,
                            Remarks = order.Remarks,
                            OrderDate = order.OrderDate,
                            ContainerCount = _dbContext.OrderContainers.Where(x => x.OrderID == order.OrderID).Count()
                        }).Distinct().ToList();
            }
            else if (section == "detail")
            {
                var data = (from order in _dbContext.GenerateOrders.Where(x => x.BL == bl)
                            join orderContainers in _dbContext.OrderContainers
                            on order.OrderID equals orderContainers.OrderID into OCGroup
                            from ImportOrderContainers in OCGroup.DefaultIfEmpty()
                            join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true)
                            on new { OrderId = ImportOrderContainers.OrderID, ContainerNo = ImportOrderContainers.ContainerNo } equals new { OrderId = dispatch.OrderId, ContainerNo = dispatch.ContainerNo } into RFDGroup
                            from readyForDispatched in RFDGroup.DefaultIfEmpty()
                                //join dispatchtruck in _dbContext.DispatchedTrucks.Where(x => x.IsCompleted == true)
                                //on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = dispatchtruck.OrderId, ContainerNo = dispatchtruck.ContainerNo }
                            select new PrintImportReportViewModel()
                            {
                                BL = order.BL,
                                ContainerSize = ImportOrderContainers.ContainerSize,
                                ContainerNo = ImportOrderContainers.ContainerNo,
                                WagonNo = readyForDispatched.WagonNo,
                                // VehicleNo = dispatchtruck.VehicleNo,
                                ContainerWeight = ImportOrderContainers.ContainerWeight,
                                ContainerCount = _dbContext.OrderContainers.Where(x => x.OrderID == order.OrderID).Count(),
                                FortyContainerPrice = order.FortyContainerPrice,
                                TwentyContainerPrice = order.TwentyContainerPrice
                            }).Distinct().ToList();
                foreach (var item in data)
                {
                    item.InvoiceAmount = item.ContainerSize == "40 DR" ? (Convert.ToDecimal(item.FortyContainerPrice) / item.ContainerCount)
                        : (Convert.ToDecimal(item.TwentyContainerPrice) / item.ContainerCount);
                }
                return data;
            }
            return null;
        }


        // --- Export ContainerWise Report --- //
        public IEnumerable<PrintImportReportViewModel> PrintExportContainerWiseReport(string section, string cro)
        {
            if (section == "header")
            {
                return (from order in _dbContext.ExportBookingOrders.Where(x => x.CRO == cro)
                        select new PrintImportReportViewModel()
                        {

                            CRO = order.CRO,
                            Customer_Name = order.Forwarder,
                            DateOfBooking = order.DateOfBooking,
                            ContainerCount = _dbContext.ExportLogistics.Where(x => /*x.IsCompleted == true &&*/ x.OrderId == order.OrderId).Count()
                        }).Distinct().ToList();
            }
            else if (section == "detail")
            {
                return (from order in _dbContext.ExportBookingOrders.Where(x => x.CRO == cro)
                        join exportlogistics in _dbContext.ExportLogistics
                        on order.OrderId equals exportlogistics.OrderId
                        //join dispatchtruck in _dbContext.ExportDispatchedTrucks.Where(x => x.IsCompleted == true)
                        //on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = dispatchtruck.OrderId, ContainerNo = dispatchtruck.ContainerNo }
                        join dispatchtrain in _dbContext.ExportDispatchedTrains.Where(x => x.IsCompleted == true)
                        on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = dispatchtrain.OrderId, ContainerNo = dispatchtrain.ContainerNo }
                        select new PrintImportReportViewModel()
                        {
                            CRO = order.CRO,
                            ContainerSize = exportlogistics.ContainerSize,
                            ContainerNo = exportlogistics.ContainerNo,
                            //TransportationType = exportlogistics.ModeOfTransportation,
                            WagonNo = dispatchtrain.WagonNo,
                            //TruckNo = dispatchtruck.TruckNo,
                            // ContainerWeight = exportlogistics.,
                            RateOfTransportation = order.RateOfTransportation
                        }).Distinct().ToList();
            }
            return null;
        }
        // --- Import BLWise Report --- //
        public IEnumerable<PrintContainerWiseReportViewModel> PrintImportBLWiseImportReport(string section, string bl)
        {
            var singleBL = bl.Split(',');
            if (section == "header")
            {
                return (from order in _dbContext.GenerateOrders.Where(x => singleBL.Contains(x.BL))
                        select new PrintContainerWiseReportViewModel()
                        {

                            BL = order.BL,
                            OrderType = order.OrderType,
                            Customer_Name = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                            TotalContainerCount = _dbContext.OrderContainers.Where(x => x.OrderID == order.OrderID).Count()
                        }).Distinct().ToList();
            }
            else if (section == "detail")
            {
                return (from order in _dbContext.GenerateOrders.Where(x => x.BL == bl)
                        select new PrintContainerWiseReportViewModel()
                        {
                            BL = order.BL,
                            ContainerCountTwenty = order.TwentyContainerQty,
                            ContainerCountForty = order.FortyContainerQty,
                            RateTwenty = order.TwentyContainerPrice,
                            RateForty = order.FortyContainerPrice,
                            TotalContainerCount = _dbContext.OrderContainers.Where(x => x.OrderID == order.OrderID).Count(),


                        }).Distinct().ToList();

            }
            return null;
        }
        // --- Export CROWise Report --- //
        public IEnumerable<PrintContainerWiseReportViewModel> PrintExportCROWiseReport(string section, string cro)
        {
            if (section == "header")
            {
                return (from order in _dbContext.ExportBookingOrders.Where(x => x.CRO == cro)
                        select new PrintContainerWiseReportViewModel()
                        {

                            CRO = order.CRO,
                            Customer_Name = order.Forwarder,
                            //Customer_Name = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                            TotalContainerCount = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId).Count()
                        }).Distinct().ToList();
            }
            else if (section == "detail")
            {
                return (from order in _dbContext.ExportBookingOrders.Where(x => x.CRO == cro)
                        join logistics in _dbContext.ExportLogistics
                        on order.OrderId equals logistics.OrderId
                        select new PrintContainerWiseReportViewModel()
                        {
                            CRO = order.CRO,
                            ContainerCountTwenty = order.TwentyContainerQty,
                            ContainerCountForty = order.FortyContainerQty,
                            RateTwenty = order.TwentyContainerPrice,
                            RateForty = order.FortyContainerPrice,
                            TotalContainerCount = _dbContext.ExportLogistics.Where(x => x.OrderId == order.OrderId).Count()


                        }).Distinct().ToList();

            }
            return null;
        }

        ////****** Export Train Report *******////

        public IEnumerable<ExportTrainOrderReportViewModel> ExportTrainOrderReport()
        {
            return (from exportorder in _dbContext.ExportBookingOrders
                    join exportlogistics in _dbContext.ExportLogistics.Where(x => x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on exportorder.OrderId equals exportlogistics.OrderId

                    join EPD in _dbContext.ExportPreDispatcheds.Where(x=> x.IsCompleted == true)
                        on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = EPD.OrderId, ContainerNo = EPD.ContainerNo } into EPDGroup
                    from ExportPreDispatched in EPDGroup.DefaultIfEmpty()
                    join EDT in _dbContext.ExportDispatchedTrains.Where(x => x.IsCompleted == true)
                          on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = EDT.OrderId, ContainerNo = EDT.ContainerNo } into EDTGroup
                    from ExportDispatchedTrains in EDTGroup.DefaultIfEmpty()
                    join EPD in _dbContext.ExportReDispatcheds.Where(x => x.IsCompleted == true)
                        on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = EPD.OrderId, ContainerNo = EPD.ContainerNo } into PDGroup
                    from ExportReDispatcheds in PDGroup.DefaultIfEmpty()
                    join ED in _dbContext.ExportDeliveries.Where(x => x.IsCompleted == true)
                     on new { OrderId = exportlogistics.OrderId, ContainerNo = exportlogistics.ContainerNo } equals new { OrderId = ED.OrderId, ContainerNo = ED.ContainerNo } into EDGroup
                    from ExportDeliveries in EDGroup.DefaultIfEmpty()

                    select new ExportTrainOrderReportViewModel()
                    {
                        CRO = exportorder.CRO,
                        OrderNo = exportorder.OrderNo,
                        DateOfBooking = exportorder.DateOfBooking,
                        Forwarder = exportorder.Forwarder,
                        ShipperName = exportorder.ShipperName,
                        ShipperContact = exportorder.ShipperContact,
                        TwentyContainerQty = exportorder.TwentyContainerQty,
                        TwentyContainerPrice = exportorder.TwentyContainerPrice,
                        FortyContainerQty = exportorder.FortyContainerQty,
                        FortyContainerPrice = exportorder.FortyContainerPrice,
                        RateOfTransportation = exportorder.RateOfTransportation,
                        PointOfLoadingStation = exportorder.PointOfLoadingStation,
                        ContainerNo = exportlogistics.ContainerNo,
                        ContainerSize = exportlogistics.ContainerSize,
                        ContainerType = exportlogistics.ContainerType,
                        EGNo = exportlogistics.EGNo,
                        vessel = exportlogistics.vessel,
                        Voyage = exportlogistics.Voyage,
                        ETD = exportlogistics.ETD,
                        VesselCutOff = exportlogistics.VesselCutOff,
                        ShippingLine = exportlogistics.ShippingLine,
                        ClearingAgentName = exportlogistics.ClearingAgentName,
                        CAContactNo = exportlogistics.CAContactNo,
                        BookingPort = exportlogistics.BookingPort,
                        ModeOfTransportation = exportlogistics.ModeOfTransportation,
                        DateOfReceivingCargo = exportlogistics.DateOfReceivingCargo,
                        PreDispatched = exportlogistics.PreDispatched,
                        PickupFrom = ExportPreDispatched.PickupFrom,
                        PreVehicleNo = ExportPreDispatched.VehicleNo,
                        PreTransporterName = ExportPreDispatched.TransporterName,
                        TransporterCost = ExportPreDispatched.TransporterCost,
                        TrainID = ExportDispatchedTrains.TrainID,
                        DispatchedOfDate = ExportDispatchedTrains.DispatchedOfDate,
                        WagonNo = ExportDispatchedTrains.WagonNo,
                        RRNo = ExportDispatchedTrains.RRNo,
                        EngineNo = ExportDispatchedTrains.EngineNo,
                        WagonType = ExportDispatchedTrains.WagonType,
                        ReDispatched = ExportDispatchedTrains.ReDispatched,
                        CargoWeight = ExportDispatchedTrains.CargoWeight,
                        TareWeight = ExportDispatchedTrains.TareWeight,
                        ReTransporterName = ExportReDispatcheds.TransporterName,
                        ReVehicleNo = ExportReDispatcheds.VehicleNo,
                        CustomerName = ExportReDispatcheds.CustomerName,
                        TruckingCost = ExportReDispatcheds.TruckingCost,
                        DeliveryDate = ExportDeliveries.DeliveryDate
                    }).Distinct().ToList();

                    }


        ///***End***///


        // Train ID Setup Screen //
        public IEnumerable<SetupTrainIDViewModel> GetTrainIdAsync()
        {
            return (from trainId in _dbContext.tbl_TrainId.Where(x => x.IsDeleted == false)

                    select new SetupTrainIDViewModel()
                    {
                        ID = trainId.ID,
                        TrainID = trainId.TrainID,
                        CreatedBy = trainId.CreatedBy,
                        CreatedDate = trainId.CreatedDate,
                        IsDeleted = trainId.IsDeleted,

                    }).OrderByDescending(x => x.ID);
        }

        public async Task SaveTrainIdAsync(SetupTrainIDViewModel setuptrainVM)
        {

            var setuptrainId = Mapper.Map<SetupTrainIDViewModel, tbl_TrainId>(setuptrainVM);
            if (setuptrainId == null)
            {
                throw new ArgumentNullException(nameof(setuptrainVM));
            }
            setuptrainId.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            setuptrainId.CreatedDate = DateTime.Now;
            setuptrainId.IsDeleted = false;
            _trainIdRepository.Add(setuptrainId);

            await _dbContext.SaveChangesAsync();
            setuptrainVM.ID = setuptrainId.ID;
        }

        public async Task UpdateTrainIdAsync(SetupTrainIDViewModel setuptrainVM)
        {

            if (setuptrainVM == null)
            {
                throw new ArgumentNullException(nameof(setuptrainVM));
            }

            var setuptrainId = await _trainIdRepository.GetAsync(Convert.ToInt32(setuptrainVM.ID));

            if (setuptrainId == null)
            {
                throw new InvalidOperationException($"This TrainID:{setuptrainVM.ID}  not found.");
            }

            setuptrainId.TrainID = setuptrainVM.TrainID;

            _trainIdRepository.Update(setuptrainId);


            await _dbContext.SaveChangesAsync();
            setuptrainVM.ID = setuptrainId.ID;
        }

        public bool DeleteTrainId(int Id)
        {
            bool isSuccess = false;
            var setuptrainId = _dbContext.tbl_TrainId.Where(x => x.ID == Id).FirstOrDefault();
            if (setuptrainId == null)
            {
                isSuccess = false;
            }
            else
            {
                setuptrainId.IsDeleted = true;
                _dbContext.SaveChangesAsync();
                isSuccess = true;
            }

            return isSuccess;

        }


        //Export Train ID Setup Screen //
        public IEnumerable<SetupExportTrainViewModel> GetExportTrainIdAsync()
        {
            return (from trainId in _dbContext.tbl_ExportTrain.Where(x => x.IsDeleted == false)

                    select new SetupExportTrainViewModel()
                    {
                        ID = trainId.ID,
                        TrainID = trainId.TrainID,
                        CreatedBy = trainId.CreatedBy,
                        CreatedDate = trainId.CreatedDate,
                        IsDeleted = trainId.IsDeleted,

                    }).OrderByDescending(x => x.ID);
        }

        public async Task SaveExportTrainIdAsync(SetupExportTrainViewModel setupexptrainVM)
        {

            var setupexptrain = Mapper.Map<SetupExportTrainViewModel, tbl_ExportTrain>(setupexptrainVM);
            if (setupexptrain == null)
            {
                throw new ArgumentNullException(nameof(setupexptrainVM));
            }
            setupexptrain.CreatedBy = Convert.ToString(HttpContext.Current.Session["UserName"]);
            setupexptrain.CreatedDate = DateTime.Now;
            setupexptrain.IsDeleted = false;
            _exptrainIdRepository.Add(setupexptrain);

            await _dbContext.SaveChangesAsync();
            setupexptrainVM.ID = setupexptrain.ID;
        }

        public async Task UpdateExportTrainIdAsync(SetupExportTrainViewModel setupexptrainVM)
        {

            if (setupexptrainVM == null)
            {
                throw new ArgumentNullException(nameof(setupexptrainVM));
            }

            var setupexptrainId = await _exptrainIdRepository.GetAsync(Convert.ToInt32(setupexptrainVM.ID));

            if (setupexptrainId == null)
            {
                throw new InvalidOperationException($"This TrainID:{setupexptrainVM.ID}  not found.");
            }

            setupexptrainId.TrainID = setupexptrainVM.TrainID;

            _exptrainIdRepository.Update(setupexptrainId);


            await _dbContext.SaveChangesAsync();
            setupexptrainVM.ID = setupexptrainId.ID;
        }

        public bool DeleteExportTrainId(int Id)
        {
            bool isSuccess = false;
            var setupexptrainId = _dbContext.tbl_ExportTrain.Where(x => x.ID == Id).FirstOrDefault();
            if (setupexptrainId == null)
            {
                isSuccess = false;
            }
            else
            {
                setupexptrainId.IsDeleted = true;
                _dbContext.SaveChangesAsync();
                isSuccess = true;
            }

            return isSuccess;

        }

    }



}

