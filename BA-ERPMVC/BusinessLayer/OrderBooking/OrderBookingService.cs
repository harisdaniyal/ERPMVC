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

namespace BA_ERPMVC.BusinessLayer.OrderBooking
{
    public class OrderBookingService
    {
        private readonly ERPMVCEntities _dbContext;
        private readonly OrderRepository _orderRepository;
        private readonly LogisticsRepositry _logisticsRepositry;
        private readonly OrderFacilityMapping _orderFacilityRepository;
        private readonly TripRepository _tripRepository;
        private readonly TripExpenseMapping _tripExpenseMapping;
        private readonly TripContainerRepositry _tripContainerRepositry;
        private readonly PartyRepository _partyRepository;

        public OrderBookingService()
        {
            _dbContext = new ERPMVCEntities();
            _orderRepository = new OrderRepository(_dbContext);
            _logisticsRepositry = new LogisticsRepositry(_dbContext);
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

        public Task<IEnumerable<Logistic>> GeLogisticsAsync(int orderBookingId)
        {
            return _logisticsRepositry.FindAsync(x => x.OrderId == orderBookingId);
        }

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
    }
}