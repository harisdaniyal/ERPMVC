using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.ViewModels
{
    public class ReportLogistics
    {
        public string Jobtype { get; set; }
        public string jobyType2 { get; set; }
        public string ContainerSize { get; set; }
        public string EntriedBy { get; set; }
        public string TripNo { get; set; }
        public string tripModel { get; set; }
        public string InvoiceNo { get; set; }
        public DateTime? InvoiceDate { get; set; }
        public DateTime? OperationDate { get; set; }
        public string VechicleType { get; set; }
        public string CellNo { get; set; }
        public string CNIC { get; set; }
        public string OrderNO { get; set; }
        public string CustomerName { get; set; }
        public string ContainerNo { get; set; }
        public string ContainerNo2 { get; set; }
        public string fromLocation { get; set; }
        public string tolocation { get; set; }
        public string CurrenFromLocation { get; set; }
        public string CurrentTolocation { get; set; }
        public string VechileNo { get; set; }
        public string DriveNo { get; set; }
        public string BL { get; set; }
        public int? TotalExpense { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string BusinessDivisionName { get; set; }
        public string status { get; set; }

        //HoRates 
        public dynamic ExcisePolice1 { get; set; }
        public dynamic Meal1 { get; set; }
        public dynamic Challan1 { get; set; }
        public dynamic MobileCard1 { get; set; }
        public dynamic Loading1 { get; set; }
        public dynamic AddaComission1 { get; set; }
        public dynamic TollTax1 { get; set; }
        public dynamic TyreRepair1 { get; set; }
        public dynamic ServicingAndGressing1 { get; set; }
        public dynamic CustomsGate1 { get; set; }
        public dynamic KPTGate1 { get; set; }
        public dynamic Misc1 { get; set; }
        public dynamic Fuel1 { get; set; }
        public dynamic WEIGHTCHARGES1 { get; set; }
        public dynamic MicsRemarks1 { get; set; }
        //HoRates
        public dynamic ExcisePolice { get; set; }
        public dynamic Meal { get; set; }
        public dynamic Challan { get; set; }
        public dynamic MobileCard { get; set; }
        public dynamic Loading { get; set; }
        public dynamic AddaComission { get; set; }
        public dynamic TollTax { get; set; }
        public dynamic TyreRepair { get; set; }
        public dynamic ServicingAndGressing { get; set; }
        public dynamic CustomsGate { get; set; }
        public dynamic KPTGate { get; set; }
        public dynamic Misc { get; set; }
        public dynamic Fuel { get; set; }
        public dynamic WEIGHTCHARGES { get; set; }
        public dynamic MicsRemarks { get; set; }
        public string Driver2ndName { get; set; }
        public string Cell2ndDriver { get; set; }
        public string CNIC2nddriver { get; set; }
        public DateTime? RecivedDate { get; set; }
        public string VechicleName { get; set; }


        //DriverSlip START

        public int SlipNo { get; set; }
        public string PrintBy { get; set; }
        //DriverSlip END
    }
}