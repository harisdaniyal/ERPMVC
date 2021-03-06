//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BA_ERPMVC.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ERPMVCEntities : DbContext
    {
        public ERPMVCEntities()
            : base("name=ERPMVCEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<BA_Bank> BA_Bank { get; set; }
        public virtual DbSet<BACustomerFacilityDetail> BACustomerFacilityDetails { get; set; }
        public virtual DbSet<BACustomerFacilityDetailsHistoryMapping> BACustomerFacilityDetailsHistoryMappings { get; set; }
        public virtual DbSet<BACustomerPrice> BACustomerPrices { get; set; }
        public virtual DbSet<BACustomerRegistration> BACustomerRegistrations { get; set; }
        public virtual DbSet<BACustomertype> BACustomertypes { get; set; }
        public virtual DbSet<BAExpensesDetail> BAExpensesDetails { get; set; }
        public virtual DbSet<BAExpensesDropDown> BAExpensesDropDowns { get; set; }
        public virtual DbSet<BAMaritalStatu> BAMaritalStatus { get; set; }
        public virtual DbSet<BAtrip> BAtrips { get; set; }
        public virtual DbSet<ClearingAgent> ClearingAgents { get; set; }
        public virtual DbSet<ContainerStatu> ContainerStatus { get; set; }
        public virtual DbSet<ContainerType> ContainerTypes { get; set; }
        public virtual DbSet<DeliveryTrain> DeliveryTrains { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Designation> Designations { get; set; }
        public virtual DbSet<Emp_Child> Emp_Child { get; set; }
        public virtual DbSet<Emp_Parent> Emp_Parent { get; set; }
        public virtual DbSet<Emp_Spouse> Emp_Spouse { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<InTransactTrain> InTransactTrains { get; set; }
        public virtual DbSet<InventoryCategory> InventoryCategories { get; set; }
        public virtual DbSet<MaintenanceHistory> MaintenanceHistories { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Order_Expense_Mapping> Order_Expense_Mapping { get; set; }
        public virtual DbSet<Order_FacilityMapping> Order_FacilityMapping { get; set; }
        public virtual DbSet<OrderService> OrderServices { get; set; }
        public virtual DbSet<PortAndTerminal> PortAndTerminals { get; set; }
        public virtual DbSet<PreDispatchedMovement> PreDispatchedMovements { get; set; }
        public virtual DbSet<Purchase_Requisition> Purchase_Requisition { get; set; }
        public virtual DbSet<Purchase_Requisition_Detail> Purchase_Requisition_Detail { get; set; }
        public virtual DbSet<PurchaseDetail> PurchaseDetails { get; set; }
        public virtual DbSet<PurchaseMaster> PurchaseMasters { get; set; }
        public virtual DbSet<ReadyForDispatched> ReadyForDispatcheds { get; set; }
        public virtual DbSet<Setup_Item_Master> Setup_Item_Master { get; set; }
        public virtual DbSet<Setup_Item_Unit> Setup_Item_Unit { get; set; }
        public virtual DbSet<ShippingAgent> ShippingAgents { get; set; }
        public virtual DbSet<ShippingLine> ShippingLines { get; set; }
        public virtual DbSet<Station> Stations { get; set; }
        public virtual DbSet<stp_BusinessDivision> stp_BusinessDivision { get; set; }
        public virtual DbSet<stp_City> stp_City { get; set; }
        public virtual DbSet<stp_Company> stp_Company { get; set; }
        public virtual DbSet<stp_ContainerStatus> stp_ContainerStatus { get; set; }
        public virtual DbSet<stp_Country> stp_Country { get; set; }
        public virtual DbSet<stp_Customer> stp_Customer { get; set; }
        public virtual DbSet<stp_Facility> stp_Facility { get; set; }
        public virtual DbSet<stp_Oil> stp_Oil { get; set; }
        public virtual DbSet<stp_OilMaster> stp_OilMaster { get; set; }
        public virtual DbSet<stp_Product> stp_Product { get; set; }
        public virtual DbSet<stp_ProductCategory> stp_ProductCategory { get; set; }
        public virtual DbSet<stp_ServiceType> stp_ServiceType { get; set; }
        public virtual DbSet<stp_Status> stp_Status { get; set; }
        public virtual DbSet<tbl_Category> tbl_Category { get; set; }
        public virtual DbSet<tbl_CatExpenseMapping> tbl_CatExpenseMapping { get; set; }
        public virtual DbSet<tbl_City> tbl_City { get; set; }
        public virtual DbSet<tbl_Container_logistics_Status> tbl_Container_logistics_Status { get; set; }
        public virtual DbSet<tbl_ContainerWeightCategory> tbl_ContainerWeightCategory { get; set; }
        public virtual DbSet<tbl_CustomerPrice> tbl_CustomerPrice { get; set; }
        public virtual DbSet<tbl_CustomerPriceFacilityMapping> tbl_CustomerPriceFacilityMapping { get; set; }
        public virtual DbSet<tbl_ExpenseType> tbl_ExpenseType { get; set; }
        public virtual DbSet<tbl_Invoice> tbl_Invoice { get; set; }
        public virtual DbSet<tbl_Invoice_logistics> tbl_Invoice_logistics { get; set; }
        public virtual DbSet<tbl_Item> tbl_Item { get; set; }
        public virtual DbSet<tbl_ItemType> tbl_ItemType { get; set; }
        public virtual DbSet<tbl_Laden_Empty> tbl_Laden_Empty { get; set; }
        public virtual DbSet<tbl_Party> tbl_Party { get; set; }
        public virtual DbSet<tbl_State> tbl_State { get; set; }
        public virtual DbSet<TripContainer> TripContainers { get; set; }
        public virtual DbSet<VehicleRegistrationDetail> VehicleRegistrationDetails { get; set; }
        public virtual DbSet<VehicleType> VehicleTypes { get; set; }
        public virtual DbSet<VendorExpens> VendorExpenses { get; set; }
        public virtual DbSet<VendorType> VendorTypes { get; set; }
        public virtual DbSet<VendorTypeExpense> VendorTypeExpenses { get; set; }
        public virtual DbSet<OilBalance> OilBalances { get; set; }
        public virtual DbSet<OilCompany> OilCompanies { get; set; }
        public virtual DbSet<stp_PaymentMode> stp_PaymentMode { get; set; }
        public virtual DbSet<DeliveryTruck> DeliveryTrucks { get; set; }
        public virtual DbSet<DispatchedTruck> DispatchedTrucks { get; set; }
        public virtual DbSet<EmptyDropOff> EmptyDropOffs { get; set; }
        public virtual DbSet<EmptyDropOffLoc> EmptyDropOffLocs { get; set; }
        public virtual DbSet<ExportDelivery> ExportDeliveries { get; set; }
        public virtual DbSet<ExportDispatchedTrain> ExportDispatchedTrains { get; set; }
        public virtual DbSet<ExportDispatchedTruck> ExportDispatchedTrucks { get; set; }
        public virtual DbSet<ExportLogistic> ExportLogistics { get; set; }
        public virtual DbSet<ExportPreDispatched> ExportPreDispatcheds { get; set; }
        public virtual DbSet<ExportReDispatched> ExportReDispatcheds { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<ReDispatched> ReDispatcheds { get; set; }
        public virtual DbSet<BLShippingContainer> BLShippingContainers { get; set; }
        public virtual DbSet<BLAgentDetail> BLAgentDetails { get; set; }
        public virtual DbSet<BAShippingLine> BAShippingLines { get; set; }
        public virtual DbSet<BLShippingContainerDetail> BLShippingContainerDetails { get; set; }
        public virtual DbSet<BLApproval> BLApprovals { get; set; }
        public virtual DbSet<GenerateOrder> GenerateOrders { get; set; }
        public virtual DbSet<Logistic> Logistics { get; set; }
        public virtual DbSet<DispatchedOrder> DispatchedOrders { get; set; }
        public virtual DbSet<ExportBookingOrder> ExportBookingOrders { get; set; }

        public virtual DbSet<OrderContainer> OrderContainers { get; set; }
    }
}
