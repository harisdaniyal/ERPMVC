
function save() {
    if (!validateInputs())
        return false;

    var facilities = [];
    $("input:checkbox[name='cbx_Facilities']:checked").each(function () {
        facilities.push($(this).val());
    });

    showLoader();

    return fetch("/OrderBooking/Booking", {
        method: 'POST',
        body: JSON.stringify({
            orderId: getBookingOrderId(),
            orderNo: $("#sp_OrderNo").html(),
            customerId: $("#ddl_Customers").val(),
            businessDivisionId: $("#ddl_BusinessDivision").val(),
            orderType: $("#ddl_OrderType option:selected").val(),
            bl: $("#txt_BL").val(),
            cro: $("#txt_CRO").val(),
            orderDate: $("#txt_OrderDate").val(),
            invoiceAmount: $("#txt_InvoiceAmount").val(),
            FacilityIds: facilities
        }),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json());
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
        loadPartial('ExecuteTrips');
    }
}


//==============================================================
// Step specific code
//==============================================================

function onChange_OrderType(item) {
    var orderType = $(item).val();

    if (orderType == "") {
        $("#tr_BL_CRO").hide();
        $("#div_HOrates").hide();
    }
    else {
        $("#tr_BL_CRO").show();

        if (orderType == "Import") {
            $("#txt_BL").show();
            $("#txt_CRO").hide();
            $("#lbl_BL_CRO").text("BL");
        }
        else if (orderType == "Export") {
            $("#txt_BL").hide();
            $("#txt_CRO").show();
            $("#lbl_BL_CRO").text("CRO");
        }
    }

    $("#cbx_HOrates").prop("checked", false)
    $("#txt_BL").val('');
    $("#txt_CRO").val('');
}


function validateInputs() {
    var isValid = true;
    $('.input-group').removeClass('invalid');

    if (!$("#sp_OrderNo").html()) {
        isValid = false;
    }

    if (!$("#ddl_Customers").val()) {
        $("#ddl_Customers").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#ddl_BusinessDivision").val()) {
        $("#ddl_BusinessDivision").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#ddl_OrderType").val()) {
        $("#ddl_OrderType").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if ($("#ddl_OrderType").val() == "Import" && !$("#txt_BL").val()) {
        $("#txt_BL").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if ($("#ddl_OrderType").val() == "Export" && !$("#txt_CRO").val()) {
        $("#txt_CRO").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#txt_OrderDate").val()) {
        $("#txt_OrderDate").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    return isValid;
}

function onClick_BtnSubmitBookingOrder() {
    next();
}