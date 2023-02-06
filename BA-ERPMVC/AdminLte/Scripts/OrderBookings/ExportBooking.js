
function save() {
   if (!validateInputs())
        return false;
    var facilities = [];
    $("input:checkbox[name='cbx_Facilities']:checked").each(function () {
        facilities.push($(this).val());
    });
  
    showLoader();

    return fetch("/OrderBooking/ExportBooking", {
        method: 'POST',
        body: JSON.stringify({
            orderId: getBookingOrderId(),
            orderNo: $("#sp_OrderNo").html(),
            CRO: $("#txt_CRO").val(),
            DateOfBooking: $("#txt_OrderDate").val(),
            Forwarder: $("#txt_Forwarder").val(),
            ShipperName: $("#txt_Shipper").val(),
            ShipperContact: $("#txt_ShipperContact").val(),
            TwentyContainerQty: $("#txt_TwentycontainerQty").val(),
            FortyContainerQty: $("#txt_FortycontainerQty").val(),
            TwentyContainerPrice: $("#txt_Twentycontainerprice").val(),
            FortyContainerPrice: $("#txt_Fortycontainerprice").val(),
            RateOfTransportation: $("#txt_Rateoftransportation").val(),
            PointOfLoadingStation: $("#txt_LoadingStation option:selected").val(),
            FacilityIds: facilities
        }),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json());
}

function CalculateTotalAmount() {
    var twentycontainer = $("#txt_Twentycontainerprice").val();
    var fortycontainer = $("#txt_Fortycontainerprice").val();
    var total = 0;
    if (twentycontainer != "" && fortycontainer != "") {
        total = parseInt(twentycontainer) + parseInt(fortycontainer);
        $("#txt_Rateoftransportation").val(total);
    }
    else if (twentycontainer != "") {
        total = parseInt(twentycontainer);
        $("#txt_Rateoftransportation").val(total);
    }
    else if (fortycontainer != "") {
        total = parseInt(fortycontainer);
        $("#txt_Rateoftransportation").val(total);
    }
    else {
        $("#txt_Rateoftransportation").val(0);
    }
}

async function saveDraft(showSuccessBanner) {
    var response = await save();

    if (!response) return false;

    if (!response.success) {
        showErrorMessage(response.message);
    }

    if (response.success) {
        sessionStorage.setItem("orderBookingId", response.orderBookingId);

        if (showSuccessBanner)
            showSuccessMessage("Booking has been created successfully");
    }

    return response.success;
}

async function next() {
    var isSucceeded = await saveDraft(false);

    if (isSucceeded) {
        loadPartial('ExportLogistic');
    }
}


//==============================================================
// Step specific code
//==============================================================

//function onChange_OrderType(item) {
//    var orderType = $(item).val();

//    if (orderType == "") {
//        $("#tr_BL_CRO").hide();
//        $("#div_HOrates").hide();
//    }
//    else {
//        $("#tr_BL_CRO").show();

//        if (orderType == "Import") {
//            $("#txt_BL").show();
//            $("#txt_CRO").hide();
//            $("#lbl_BL_CRO").text("BL");
//        }
//        else if (orderType == "Export") {
//            $("#txt_BL").hide();
//            $("#txt_CRO").show();
//            $("#lbl_BL_CRO").text("CRO");
//        }
//    }

//    $("#cbx_HOrates").prop("checked", false)
//    $("#txt_BL").val('');
//    $("#txt_CRO").val('');
//}


function validateInputs() {
    
    var isValid = true;
    $('.input-group').removeClass('invalid');

    if (!$("#txt_Forwarder").val()) {
        $("#txt_Forwarder").parent('.input-group').addClass('invalid');
        isValid = false;
    }
    if (!$("#txt_OrderDate").val()) {
        $("#txt_OrderDate").parent('.input-group').addClass('invalid');
        isValid = false;
    }

 
//    if (!$("#ddl_BusinessDivision").val()) {
//        $("#ddl_BusinessDivision").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

//    if (!$("#ddl_OrderType").val()) {
//        $("#ddl_OrderType").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

//    if ($("#ddl_OrderType").val() == "Import" && !$("#txt_BL").val()) {
//        $("#txt_BL").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

//    if ($("#ddl_OrderType").val() == "Export" && !$("#txt_CRO").val()) {
//        $("#txt_CRO").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

//    if (!$("#txt_OrderDate").val()) {
//        $("#txt_OrderDate").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

//    if (!$("#txt_FreeDays").val()) {
//        $("#txt_FreeDays").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }
//    if (!$("#txt_VesselBerthingDate").val()) {
//        $("#txt_VesselBerthingDate").parent('.input-group').addClass('invalid');
//        isValid = false;
//    }

   return isValid;
}

function onClick_BtnSubmitBookingOrder() {
    next();
}