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
        private readonly OrderFacilityMapping _orderFacilityRepository;
        private readonly TripRepository _tripRepository;
        private readonly TripExpenseMapping _tripExpenseMapping;
        private readonly TripContainerRepositry _tripContainerRepositry;
        private readonly PartyRepository _partyRepository;
        private readonly PreDispatchedMovementRepository _preDispatchedMovementRepository;
        private readonly DispatchedOrderRepository _dispatchedOrderRepository;
        private readonly InTransactTrainRepository _intransactTrainRepository;
        private readonly DeliveryTrainRepository _deliveryTrainRepository;


        public OrderBookingService()
        {
            _dbContext = new ERPMVCEntities();
            _orderRepository = new OrderRepository(_dbContext);
            _logisticsRepositry = new LogisticsRepositry(_dbContext);
            _readyForDispatchedRepositry = new ReadyForDispatchedRepositry(_dbContext);
            _preDispatchedMovementRepository = new PreDispatchedMovementRepository(_dbContext);
            _dispatchedOrderRepository = new DispatchedOrderRepository(_dbContext);
            _intransactTrainRepository = new InTransactTrainRepository(_dbContext);
            _deliveryTrainRepository = new DeliveryTrainRepository(_dbContext);
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

        public IEnumerable<ReadyForDispatchedViewModel> GetReadyForDispatchedAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.ReadyForDispatched.ToString())
                        on order.OrderID equals logistics.OrderId
                    join RFD in _dbContext.ReadyForDispatcheds.Where(x => x.IsCompleted == false)
                        on order.OrderID equals RFD.OrderId into RFDGroup
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

        ///******Pre Dispatched Movement*******///

        public IEnumerable<PreDispatchedMovementViewModel> GetPreDispatchedMovementAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.PreDispatched.ToString())
                        on order.OrderID equals logistics.OrderId
                    join PDM in _dbContext.PreDispatchedMovements.Where(x => x.IsCompleted == false)
                        on order.OrderID equals PDM.OrderId into PDMGroup
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
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Dispatched.ToString())
                        on order.OrderID equals logistics.OrderId
                    join DPO in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == false)
                        on order.OrderID equals DPO.OrderId into DPOGroup
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


        public IEnumerable<InTransactTrainViewModel> GetInTransactTrainAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.InTransact.ToString())
                        on order.OrderID equals logistics.OrderId
                    join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true)
                        on order.OrderID equals dispatch.OrderId
                    join ITT in _dbContext.InTransactTrains.Where(x => x.IsCompleted == false)
                        on order.OrderID equals ITT.OrderId into ITTGroup
                    from InTransactTrains in ITTGroup.DefaultIfEmpty()
                    select new InTransactTrainViewModel()
                    {

                        BLnumber = order.BL,
                        Customer_Name = _dbContext.BACustomerRegistrations.Where(x=> x.CustomerID == order.CustomerID).FirstOrDefault().Customer_Name,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        StationID=dispatch.StationID,
                        TrainID = dispatch.TrainID,
                        PriorityForDispatched = InTransactTrains.PriorityForDispatched,
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

        //////////***** End InTransact Train********/////////

        ///////*********** Delivery Train*********/////////


        public IEnumerable<DeliveryTrainViewModel> GetInDeliveryTrainAsync()
        {
            return (from order in _dbContext.GenerateOrders.Where(x => x.isCompleted == false)
                    join logistics in _dbContext.Logistics.Where(x => x.IsActive == true && x.Status == OrdersStatus.Delivery.ToString())
                        on order.OrderID equals logistics.OrderId
                    join dispatch in _dbContext.DispatchedOrders.Where(x => x.IsCompleted == true)
                        on order.OrderID equals dispatch.OrderId
                    join DT in _dbContext.DeliveryTrains.Where(x => x.IsCompleted == false)
                        on order.OrderID equals DT.OrderId into DTGroup
                    from DeliveryTrains in DTGroup.DefaultIfEmpty()
                    select new DeliveryTrainViewModel()
                    {

                        BLnumber = order.BL,
                        OrderId = order.OrderID,
                        OrderNo = order.OrderNo,
                        ContainerNo = logistics.ContainerNo,
                        ContainerSize = logistics.ContainerSize,
                        PriorityForDispatched = DeliveryTrains.PriorityForDispatched,
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

        public Task SaveLogisticsAsync(Logistic logistics)
        {

            _logisticsRepositry.Add(logistics);
            return _dbContext.SaveChangesAsync();
        }

        public Task DeleteLogisticsAsync(int logisticsId)
        {
            _logisticsRepositry.Remove(logisticsId);

            return _dbContext.SaveChangesAsync();
        }

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
                        VendorExpense = _dbContext.BAtrips.Where(x => x.OrderId == order.OrderID && x.IsActive == true).Sum(x => x.PartyRate) ?? 0
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