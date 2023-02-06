//import { fetch as fetch } from 'whatwg-fetch';

class Services {



    constructor() {

    }


    //availableStock() {
    //    var response = fetch(baseURL + '/Stock/AvailableStock', {
    //        method: 'POST',
    //        headers: {
    //            'Content-Type': 'application/json;charset=utf-8'
    //        }
    //    }).then(res => res.json());
    //    return response;
    //}


    //getRequisitionLog(params) {
    //    var response = fetch(baseURL + '/PurchaseRequisition/GetRequisitionLog', {
    //        method: 'POST',
    //        headers: {
    //            'Content-Type': 'application/json;charset=utf-8'
    //        },
    //        body: params
    //    }).then(res => res.json());
    //    return response;
    //}


    addUnitItems(params) {
        var response = fetch(URLs.ADD_ITEM_UNIT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }


    getOrderByIdTrip(params) {
        var response = fetch(URLs.GET_ORDER_BY_ID_TRIP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }


    AddCustomerPriceView(params) {
        var response = fetch(URLs.ADD_Customer, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }

    getContainerWeightCategory(params) {
        var response = fetch(URLs.GET_CONTAINER_WEIGHT_CATEGORY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }


    getFacilityList(params) {
        var response = fetch(URLs.GET_FACILITY_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }



    getCustomerName(params) {
        var response = fetch(URLs.GET_CUSTOMERNAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }

    getContainerStatus(params) {
        var response = fetch(URLs.GET_CONTAINER_STATUS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }



    getRecentPriceWeight(params) {
        var response = fetch(URLs.GET_RESCENTPRICEWEIGHT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }

    getRecentPricelolo(params) {
        var response = fetch(URLs.GET_RECENTPRICELOLO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }


    getRecentPrice(params) {
        var response = fetch(URLs.GET_RECENTPRICEGRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }





    UpdateCustomerPriceHistory(params) {
        var response = fetch(URLs.UPDATE_CUSTOMER_PRICE_HISTORY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }


    UpdateCustomerPrice(params) {
        var response = fetch(URLs.UPDATE_CUSTOMER_PRICE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;


    }



    getFacilityOrderById(params) {
        var response = fetch(URLs.GET_FACILITY_ORDER_BY_ID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    DeleteItemDetail(params) {
        var response = fetch(URLs.DELETEITEM, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    DeleteTripDetail(params) {
        var response = fetch(URLs.DELETE_TRIP_DETAILS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getInvoiceNumber() {

        var response = fetch(URLs.GET_INV_No, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }




    getInvoiceNumberLogistics() {
        var response = fetch(URLs.GET_INVOICE_NUMBER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },

        }).then(res => res.json());
        return response;
    }

    getCustPriceByid(params) {
        var response = fetch(URLs.GET_CUST_PRICE_BY_ID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());


        return response;
    }


    getCustPriceGride() {
        var response = fetch(URLs.GET_CUSTPRICE_GRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }


    getExpenseListById(params) {
        var response = fetch(URLs.GET_EXPENSELISTBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());


        return response;
    }





    getTripBydata(params) {
        var response = fetch(URLs.GET_TRIPBYDATA, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    GetTripDetailsByTripNo(params) {
        var response = fetch(URLs.GET_TRIP_DETAILS_BY_TRIP_NO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    /*
    GetTripDetailsByTripNo(params){
            var response = fetch(URLs.GET_TRIP_DETAILS_BY_TRIP_NO, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: params
            }).then(res => res.json());
            return response;
        }
    */



    getReportGride() {
        var response = fetch(URLs.GET_REPORT_GRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getOrderNo(params) {
        var response = fetch(URLs.GET_ORDERNO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    GetOrderNoByTripID(params) {
        var response = fetch(URLs.GET_OrderByNoByTripID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getBlShippingLineByid(params) {
        var response = fetch(URLs.GET_BLSHIPPINGLINEBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getDepartmentByid(params) {
        var response = fetch(URLs.GET_DEPARTMENTBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getblshippingGride() {
        var response = fetch(URLs.GET_SHIPPING, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getDepartmentGride() {
        var response = fetch(URLs.GET_DEPARMENT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }




    GetMenuDetail() {
        var response = fetch(URLs.GET_MENULIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getDesignationGride(params) {
        var response = fetch(URLs.GET_DESIGNATIONGRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    getDesignationByid(params) {
        var response = fetch(URLs.GET_DESIGNATIONBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getCountryByid(params) {
        var response = fetch(URLs.GET_COUNTRYBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    getCountryGride(params) {
        var response = fetch(URLs.GET_COUNTRYGRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getInvoiceByid(params) {
        var response = fetch(URLs.GET_INVOICEBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    getInvoiceGride(params) {
        var response = fetch(URLs.GET_INVOICEGRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    getCityGride(params) {
        var response = fetch(URLs.GET_CITYGRIDE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getVendorGrid(params) {
        var response = fetch(URLs.GET_VENDORGRID, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            }
        }).then(res => res.json());
        return response;
    }

    getCitiesByState(params) {
        var response = fetch(URLs.GET_CITIESBYSTATE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getStates() {
        var response = fetch(URLs.GET_STATES, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            }
        }).then(res => res.json());
        return response;
    }

    getVendorByID(params) {
        var response = fetch(URLs.GET_VENDORBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    deleteVendor(params) {
        var response = fetch(URLs.DELETE_VENDOR, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    addVendor(params) {
        var response = fetch(URLs.ADD_VENDOR, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    updateVendor(params) {
        var response = fetch(URLs.UPDATE_VENDOR, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getHRMGridDetail(params) {
        var response = fetch(URLs.GET_HRMGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }




    getVechialGridDetail(params) {
        var response = fetch(URLs.GET_Vechil, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getTripById(params) {
        var response = fetch(URLs.GET_TRIPBY_ID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getOrderByid(params) {
        var response = fetch(URLs.GET_OrderByID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }








    getVechialbyid(params) {
        var response = fetch(URLs.GetVechialByID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    CustomerPriceGride() {
        var response = fetch(URLs.GET_CUSTOMERPRICEGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    BussinessDivisonGride() {
        var response = fetch(URLs.GET_BusinessD, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }




    getUserDetail() {
        var response = fetch(URLs.GET_USERDETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }
    getLocation() {
        var response = fetch(URLs.GET_LOCATION, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }
    getContainerSize() {
        var response = fetch(URLs.GET_CONTAINERSIZE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }
    getcustomerNo(params) {
        var response = fetch(URLs.GET_CustomerCode, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    getExpenseDropbyid(params) {
        var response = fetch(URLs.GetExpnseDropByID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getExpenseDropGridDetail(params) {
        var response = fetch(URLs.GET_DropExpenses, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    getFacilityDropbyid(params) {
        var response = fetch(URLs.GET_FAC, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getFacilityDropGridDetail(params) {
        var response = fetch(URLs.GET_Facility, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }





    getLocDropbyid(params) {
        var response = fetch(URLs.GetLocDropByID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getEmptyDropOffLocById(params) {
        var response = fetch(URLs.GET_EmptyDropOffLocById, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getLocDropGridDetail(params) {
        var response = fetch(URLs.GET_LOCDROPGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    getEmptyDropOffLoc(params) {
        var response = fetch(URLs.GET_EmptyDropOffLoc, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getOilInvoiceGridDetail(params) {
        var response = fetch(URLs.GET_OILInvoiceDetail, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    getOilInvoicebyorder(params) {
        var response = fetch(URLs.GET_InvoiceOrder, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getOilById(params) {
        var response = fetch(URLs.GET_OILById, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getOilGridDetail(params) {
        var response = fetch(URLs.GET_OIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    getCustomerCode() {
        var response = fetch(URLs.GetCustomerNumber, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }

    getCustomerbyid(params) {
        var response = fetch(URLs.GetCustomerByID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getCustomerGridDetail(params) {
        var response = fetch(URLs.GetCustomer, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }




    addInvoiceDetailReport(params) {
        var response = fetch(URLs.ADD_INVOICE_DETAILS_REPORTS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }







    addInvoiceDetail(params) {
        var response = fetch(URLs.ADD_INVOICEDETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getInvoiceNumber() {
        var response = fetch(URLs.GET_INVOICENUMBER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },

        }).then(res => res.json());
        return response;
    }
    GetOrderDetailByOrderNo(params) {
        var response = fetch(URLs.GET_ORDERDETAILBY_ORDERNO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getFacilitiesList() {
        var response = fetch(URLs.GET_FACILITYLIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },

        }).then(res => res.json());
        return response;
    }
    viewOrder() {
        var response = fetch(URLs.GET_ORDER_DETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }
    GetOrderNoByDivID(params) {
        var response = fetch(URLs.GET_ORDERNO_DIV_ID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    AddTripExpense(params) {
        var response = fetch(URLs.ADD_TRIPEXPENSE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    Addtrip(params) {
        var response = fetch(URLs.ADD_TRIP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    AddCustomerPriceFacility(params) {
        var response = fetch(URLs.ADD_FacilityPrice, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    AddFacilityCustomer(params) {
        var response = fetch(URLs.ADD_FACILITY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    AddFacilityNameCustomer(params) {
        var response = fetch(URLs.ADD_FACILITY_NAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    AddFacilityNameCustomerUpdate(params) {
        var response = fetch(URLs.ADD_FACILITY_NAME_UPDATE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    AddCustomerPriceFacilityNameUpdate(params) {
        var response = fetch(URLs.ADD_CUSTOMER_PRICE_FACILITY_UPDATE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    AddCustomerPriceFacilityName(params) {
        var response = fetch(URLs.ADD_FACILITY_PRICE_NAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    TripGridUpcomming() {
        var response = fetch(URLs.GET_UPCOMMING_TRIP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    TripGrid(params) {
        var response = fetch(URLs.GET_TRIPGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getExpenses(params) {
        var response = fetch(URLs.GET_EXPENSES, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getVehicle(params) {
        var response = fetch(URLs.GET_VEHICLE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getContainer(params) {
        var response = fetch(URLs.GET_CONTAINER_NO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getVendor(typeId) {
        var response = fetch(URLs.GET_ALL_VENDOR + "?TypeId=" + typeId, {
            method: 'GET'
        }).then(res => res.json());
        return response;
    }

    getdriver(params) {
        var response = fetch(URLs.GET_DRIVER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getdriver2nd(params) {
        var response = fetch(URLs.GET_DRIVER_2nd, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getContainerByOrder(params) {
        var response = fetch(URLs.GET_CONTAINERBYTRIP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getContainer2ByOrder(params) {
        var response = fetch(URLs.GET_CONTAINER2BYTRIP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getTripId(params) {
        var response = fetch(URLs.GET_TRIPID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getlogisticbyid(params) {
        var response = fetch(URLs.GET_LOGISTICBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getlogisticsDetail(params) {
        var response = fetch(URLs.GET_LOGISTICGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getcustomerbyorder(params) {
        var response = fetch(URLs.GET_CUSTOMERBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getservicebyorder(params) {
        var response = fetch(URLs.GET_SERVICEBYORDER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getlogisticsorders(params) {
        var response = fetch(URLs.Get_OrderList, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }


    getContainerWieght(params) {
        var response = fetch(URLs.GET_CONTAINER_WIEGHT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    getChildGridDetail(params) {
        var response = fetch(URLs.GET_CHILDGRID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getspousebyid(params) {
        var response = fetch(URLs.GET_SPOUSE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getparentbyid(params) {
        var response = fetch(URLs.GET_PARENT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getparentbypid(params) {
        var response = fetch(URLs.GET_PARENTBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getspousebypid(params) {
        var response = fetch(URLs.GET_SPOUSEBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getchildbypid(params) {
        var response = fetch(URLs.GET_CHILDBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getEmployeeDetail() {
        var response = fetch(URLs.GET_EMPFAMILY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }

    getOrderNumber() {
        var response = fetch(URLs.GetOrderNumber, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }

    getEmpCode() {
        var response = fetch(URLs.GetEmpCode, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }

    getBusinessDevision() {

        var response = fetch(URLs.GET_BUSINESSDEVISION, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());


        return response;
    }

    getCustomerDetail() {
        var response = fetch(URLs.GET_CUSTOMER, {

            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },

        }).then(res => res.json());
        return response;
    }

    getEmployeebyid(params) {
        var response = fetch(URLs.GET_EMP, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    getcompanyDetail(params) {
        var response = fetch(URLs.GET_COMPANYNAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }
    getDesigantionDetail(params) {
        var response = fetch(URLs.GET_DESIGNATIONNAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }
    getDepartmentDetail() {
        var response = fetch(URLs.GET_DEPARTMENTNAME, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: []
        }).then(res => res.json());
        return response;
    }



    getApplicationDetial(params) {
        var response = fetch(URLs.APPLICATION_DETAIL, {

            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },

        }).then(result => result.json());
        return response;
    }

    addOrderDetail(params) {
        var response = fetch(URLs.ADD_ORDER_DETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    UpdateOrderDetail(params) {
        var response = fetch(URLs.UPDTAE_ORDER_DETAILS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    UpdateExpenseListByTripIDDeilvery(params) {
        var response = fetch(URLs.UPDATE_EXPENSE_LIST_BY_ID_DEILVERY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    UpdateTripDetailDelivery(params) {
        var response = fetch(URLs.UPDATE_TRIP_DEATILS_DELIVERY, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    UpdateTripDetail(params) {
        var response = fetch(URLs.UPDATE_TRIP_DETAILS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getCustomerList(params) {
        var response = fetch(URLs.CUSTOMERLIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    addFacilityListByOrderID(params) {
        var response = fetch(URLs.ADD_FACILITY_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }



    UpdateFacilityListByOrderID(params) {
        var response = fetch(URLs.UPDATE_FACILITY_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }




    UpdateExpenseListByTripID(params) {
        var response = fetch(URLs.UPDATE_EXPENSE_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    deleteCustomer(params) {
        var response = fetch(URLs.DELETE_CUSTOMER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getPropertyInfo() {
        var response = fetch(URLs.GET_PROPERTY_INFO, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: null
        }).then(res => res.json());
        return response;
    }

    getStaffDetails(params) {
        var response = fetch(URLs.GET_STAFF_DETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    //addApplication(params) {
    //    var response = fetch(baseURL + '/Application/AddApplication', {
    //        method: 'POST',
    //        headers: {
    //            'Content-Type': 'application/json;charset=utf-8'
    //        },
    //        body: params
    //    }).then(res => res.json());
    //    return response;
    //}

    deleteStaff(params) {
        var response = fetch(URLs.DELETE_STAFF, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getApplicationList(params) {
        var response = fetch(URLs.APPLICATIONLIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    //For Bank
    getApplicationListForBank(params) {
        var response = fetch(URLs.BANK_APPLICATIONS_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    addBankBranch(params) {
        var response = fetch(URLs.Add_Branch_Detail, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getBranchById(params) {
        var response = fetch(URLs.GET_Branch_BYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getBranchList() {
        var response = fetch(URLs.BRANCHLIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: null
        }).then(res => res.json());
        return response;
    }

    getBranchListById(params) {
        var response = fetch(URLs.BRANCHLISTBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    deleteBranch(params) {
        var response = fetch(URLs.DELETE_BRANCH, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getBranchById(params) {
        var response = fetch(URLs.GETBRANCHBYBANKID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    resendPinCode(params) {
        var response = fetch(URLs.RESEND_PINCODE, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                //"__RequestVerificationToken": $('input[name="__RequestVerificationToken"]').val() 
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    addBank(params) {
        var response = fetch(URLs.Add_Bank_Detail, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    getBankList() {
        var response = fetch(URLs.BANKLIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: null
        }).then(res => res.json());
        return response;
    }
    getBankListById(params) {
        var response = fetch(URLs.BANKLISTBYID, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    deleteBank(params) {
        var response = fetch(URLs.DELETE_BANK, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    submitOrder(params) {
        var response = fetch(URLs.SUBMIT_ORDER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getPaymentStatus(params) {
        var response = fetch(URLs.GET_PAYMENT_STATUS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getOrderList(params) {
        var response = fetch(URLs.GET_ORDER_LIST, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getNomineeRelation() {
        var response = fetch(URLs.GET_NOMINEE_RELATION, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: null
        }).then(res => res.json());
        return response;
    }

    submitApplication(params) {
        var response = fetch(URLs.SUBMIT_APPLICATION, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getOrderDetial(params) {
        var response = fetch(URLs.GET_Order_DETAIL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }


    checkAvailableCustomer(params) {
        var response = fetch(URLs.Check_Available_Customer, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    submitBankApplication(params) {
        var response = fetch(URLs.BANK_APPLICATION_SUBMIT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    getApplicationCount(params) {
        var response = fetch(URLs.APPLICATION_COUNT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    checkOut(params) {
        var response = fetch(URLs.CHECK_OUT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    printApplicationByOrder(params) {
        var response = fetch(URLs.PRINT_APPLICATION_BY_ORDER, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }

    sendSMS() {
        var response = fetch(URLs.SEND_SMS, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: null
        }).then(res => res.json());
        return response;
    }

    //CheckAmout
    checkAmout(params) {
        var response = fetch(URLs.CHECK_AMOUNT, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
    loadOrderData( params) {
        var response = fetch(URLs.LOAD_ORDER_BOOKING_DATA,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: params
            }).then(res => res.json());
        return response;
    }
    saveOrderData( params) {
        var response = fetch(URLs.SAVE_ORDER_BOOKING_DATA, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: params
        }).then(res => res.json());
        return response;
    }
}

