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

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class OrderBookingService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly OrderRepository _orderRepository;
        private readonly LogisticsRepositry _logisticsRepositry;
        private readonly ReadyForDispatchedRepositry _readyForDispatchedRepositry;
        private readonly ReDispatchedRepositry _reDispatchedRepositry;
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

            return string.IsNullOrEmpty(orderNo) ? 1.ToString("000000") : (Convert.ToInt64(orderNo) + 1).ToString("000000");
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

            if (bookingModel.OrderType == "Import")
            {
                bookingModel.CRO = string.Empty;
            }

            if (bookingModel.OrderType == "Export")
            {
                bookingModel.BL = string.Empty;
            }
            bookingModel.isCompleted = false;

            _orderRepository.Add(bookingModel);

            await _dbContext.SaveChangesAsync();
            await AddOrderFacilitiesAsync(bookingViewModel.FacilityIds, bookingModel.OrderID);

            bookingViewModel.OrderId = bookingModel.OrderID;
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
            bookingModel.BusinessDevisionID = bookingViewModel.BusinessDivisionId;
            bookingModel.BL = bookingViewModel.BL;
            bookingModel.CRO = bookingViewModel.CRO;
            bookingModel.OrderDate = bookingViewModel.OrderDate;
            bookingModel.OrderType = bookingViewModel.OrderType;
            bookingModel.InvoiceAmount = bookingViewModel.InvoiceAmount;
            bookingModel.VesselBerthingDate = bookingViewModel.VesselBerthingDate;
            bookingModel.FreeDays = bookingViewModel.FreeDays;
            bookingModel.Remarks = bookingViewModel.Remarks;
            bookingModel.ShippingLineId = bookingViewModel.ShippingLineId;
            bookingModel.ShippingAgentId = bookingViewModel.ShippingAgentId;
            bookingModel.BookingPOCName = bookingViewModel.BookingPOCName;

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
            if (facilityIds == null || facilityIds.Length == 0)
            {
                throw new ArgumentNullException(nameof(facilityIds));
            }

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
                        FromLocation = PreDispatchedMovements.FromLocation,
                        FromDateTime = PreDispatchedMovements.FromDateTime,
                        ToLocation = PreDispatchedMovements.ToLocation,
                        ToDateTime = PreDispatchedMovements.ToDateTime,
                        TransporterName = PreDispatchedMovements.TransporterName,
                        VehicleNumber = PreDispatchedMovements.VehicleNumber,



                        ID = PreDispatchedMovements.ID,
                        //GD = readyForDispatched.GD,
                        //BL = readyForDispatched.BL
                    }).Distinct().ToList();
        }

        public async Task SavePreDispatchedMovementAsync(PreDispatchedMovementViewModel preDispatchedMovementVM)
        {

            var preDispatchedMovement = Mapper.Map<PreDispatchedMovementViewModel, PreDispatchedMovement>(preDispatchedMovementVM);
            if (preDispatchedMovement == null)
            {
                throw new ArgumentNullException(nameof(preDispatchedMovementVM));
            }

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



                        ID = DispatchedOrders.ID,
                        //ID = readyForDispatched.GD,
                        //BL = readyForDispatched.BL
                    }).Distinct().ToList();
        }

        public async Task SaveDispatchedOrderAsync(DispatchedOrderViewModel dispatchedOrderVM)
        {

            var dispatchedOrder = Mapper.Map<DispatchedOrderViewModel, DispatchedOrder>(dispatchedOrderVM);
            if (dispatchedOrder == null)
            {
                throw new ArgumentNullException(nameof(dispatchedOrderVM));
            }

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
                        PriorityForDispatched = dispatch.PriorityForDispatched,
                        StationID = dispatch.StationID,
                        StationName = _dbContext.Stations.Where(x => x.StationID == dispatch.StationID && x.Status == true).FirstOrDefault().StationName,
                        TrainID = dispatch.TrainID,
                        ArrivalDate = InTransactTrains.ArrivalDate,
                        LOLO = InTransactTrains.LOLO,





                        ID = InTransactTrains.ID,
                        //ID = readyForDispatched.GD,
                        //BL = readyForDispatched.BL
                    }).Distinct().ToList();
        }

        public async Task SaveIntransactTrainAsync(InTransactTrainViewModel intransacttrainVM)
        {

            var intransacttrain = Mapper.Map<InTransactTrainViewModel, InTransactTrain>(intransacttrainVM);
            if (intransacttrain == null)
            {
                throw new ArgumentNullException(nameof(intransacttrainVM));
            }

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
                    join RD in _dbContext.ReDispatcheds.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = RD.OrderId, ContainerNo = RD.ContainerNo } into RDGroup
                    from reDispatched in RDGroup.DefaultIfEmpty()
                    select new ReDispatchedViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        FreeDays = order.FreeDays,

                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,

                        ArrivalDate = inTransactTrains.ArrivalDate,
                        LastDateofEmptyReturn = order.VesselBerthingDate,//.AddDays(Convert.ToDouble(order.FreeDays)),
                        DelieveryLocation = logistics.ToLocation,
                        EmptyDropOffLocation = logistics.EmptyReturnLocation,

                        ID = reDispatched.ID,
                        VehicleNo = reDispatched.VehicleNo,
                        ReDispatchedDate = reDispatched.ReDispatchedDate,
                        TranspoterName = reDispatched.TranspoterName,
                        BiltyNumber = reDispatched.BiltyNumber,
                        TransportationCost = reDispatched.TransportationCost,
                        StationName = _dbContext.Stations.Where(x => x.StationID == inTransactTrains.StationID).FirstOrDefault().StationName,
                        StationID = inTransactTrains.StationID
                    }).Distinct().ToList();
        }

        public async Task SaveReDispatchedAsync(ReDispatchedViewModel reDispatchedVM)
        {

            var reDispatched = Mapper.Map<ReDispatchedViewModel, ReDispatched>(reDispatchedVM);
            if (reDispatched == null)
            {
                throw new ArgumentNullException(nameof(reDispatched));
            }

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
                        EmptyDropOffLocation = logistics.EmptyReturnLocation,
                        PriorityForDispatched = dispatch.PriorityForDispatched,


                        TrainID = dispatch.TrainID,
                        DispatchedDate = dispatch.DispatchedDate,
                        DeliveryLocation = logistics.ToLocation,
                        VehicleNo = DeliveryTrains.VehicleNo,
                        ArrivalDate = DeliveryTrains.ArrivalDate,
                        DeliveryDate = DeliveryTrains.DeliveryDate,
                        ID = DeliveryTrains.ID,

                    }).Distinct().ToList();
        }

        public async Task SaveDeliveryTrainAsync(DeliveryTrainViewModel deliverytrainVM)
        {

            var deliverytrain = Mapper.Map<DeliveryTrainViewModel, DeliveryTrain>(deliverytrainVM);
            if (deliverytrain == null)
            {
                throw new ArgumentNullException(nameof(deliverytrainVM));
            }

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
                        ContainerSize = logistics.ContainerSize,
                        PortName = logistics.EmptyReturnLocation,



                        ID = EmptyDropOffs.ID,
                        EIRNo = EmptyDropOffs.EIRNo,
                        ExpenseAtEmptyLocation = EmptyDropOffs.ExpenseAtEmptyLocation,
                        Remarks = EmptyDropOffs.Remarks,
                        DeliveryDate = EmptyDropOffs.DeliveryDate,
                    }).Distinct().ToList();
        }

        public async Task SaveEmptyDropOffAsync(EmptyDropOffViewModel emptydropoffVM)
        {

            var emptydropoff = Mapper.Map<EmptyDropOffViewModel, EmptyDropOff>(emptydropoffVM);
            if (emptydropoff == null)
            {
                throw new ArgumentNullException(nameof(emptydropoffVM));
            }

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

                    }).Distinct().ToList();
        }

        public async Task SaveDispatchedTruckAsync(DispatchedTruckViewModel dispatchedtruckVM)
        {

            var dispatchedtruck = Mapper.Map<DispatchedTruckViewModel, DispatchedTruck>(dispatchedtruckVM);
            if (dispatchedtruck == null)
            {
                throw new ArgumentNullException(nameof(dispatchedtruckVM));
            }

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

                    }).Distinct().ToList();
        }

        public async Task SaveDeliveryTruckAsync(DeliveryTruckViewModel deliverytruckVM)
        {

            var deliverytruck = Mapper.Map<DeliveryTruckViewModel, DeliveryTruck>(deliverytruckVM);
            if (deliverytruck == null)
            {
                throw new ArgumentNullException(nameof(deliverytruckVM));
            }

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
            var logistics = _dbContext.Logistics.Where(x => x.Status != OrdersStatus.ReadyForDispatched.ToString() && x.logisticsid == logisticsId).FirstOrDefault();
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
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.ModeOfTransportation == ModeOfTransaction.Train.ToString())
                        on order.OrderID equals logistics.OrderId

                    join RFD in _dbContext.ReadyForDispatcheds.Where(x => x.IsCompleted == true)
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
                    join EDO in _dbContext.EmptyDropOffs.Where(x => x.IsCompleted == false)
                        on new { OrderId = logistics.OrderId, ContainerNo = logistics.ContainerNo } equals new { OrderId = EDO.OrderId, ContainerNo = EDO.ContainerNo } into EDOGroup
                    from EmptyDropOffs in EDOGroup.DefaultIfEmpty()
                    select new TrainOrderReportViewModel()
                    {


                        BLNumber = order.BL,
                        OrderNo = order.OrderNo,
                        LastDateofEmptyReturn = order.VesselBerthingDate,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        ContainerTypeName = _dbContext.ContainerTypes.Where(x => x.ContainerTypeID == logistics.ContainerType).FirstOrDefault().ContainerTypeName,
                        FromLocation = logistics.FromLocation,
                        ToLocation = logistics.ToLocation,
                        FreeDays = order.FreeDays,
                        CustomerName = _dbContext.BACustomerRegistrations.Where(x => x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        BusinessDivisionName = _dbContext.stp_BusinessDivision.Where(x => x.BusinessDivisionID == order.BusinessDevisionID).FirstOrDefault().BusinessDivisionName,
                        OrderType = order.OrderType,
                        CRO = order.CRO,
                        OrderDate = order.OrderDate,
                        InvoiceAmount = order.InvoiceAmount,
                        ShippingAgentName = _dbContext.ShippingAgents.Where(x => x.ShippingAgentId == order.ShippingAgentId).FirstOrDefault().Name,
                        Remarks = order.Remarks,
                        VesselBerthingDate = order.VesselBerthingDate,
                        ShippingLineName = _dbContext.ShippingLines.Where(x => x.ShippingLineId == order.ShippingLineId).FirstOrDefault().ShippingLineName,
                        BookingPOCName = order.BookingPOCName,
                        JobType = logistics.JobType,
                        EmptyReturnLocation = logistics.EmptyReturnLocation,
                        EmptyReturnDate = logistics.EmptyReturnDate.ToString(),
                        ModeOfTransportation = logistics.ModeOfTransportation,
                        PreDispatched = logistics.PreDispatched,
                        Commodities = logistics.Comodities,
                        DoGuaranteeDate = ReadyForDispatcheds.DOGranty,
                        ImportEIR = ReadyForDispatcheds.ImportEIR,
                        PortWeighment = ReadyForDispatcheds.PortWeighment,
                        OutsidePortWeighment = ReadyForDispatcheds.OutSidePortWeighment,
                        GD = ReadyForDispatcheds.GD,
                        BL = ReadyForDispatcheds.BL,
                        FromDateTime = PreDispatchedMovements.FromDateTime,
                        ToDateTime = PreDispatchedMovements.ToDateTime,
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
                        EIRNo = EmptyDropOffs.EIRNo,
                        ExpenseAtEmptyLocation = EmptyDropOffs.ExpenseAtEmptyLocation,
                   



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
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join bDivision in _dbContext.stp_BusinessDivision.Where(x => businessDivisionId == 0 || x.BusinessDivisionID == businessDivisionId)
                            on order.BusinessDevisionID equals bDivision.BusinessDivisionID
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
    }
}