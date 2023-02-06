
function save() {
    if (!validateInputs())
        return false;

    var facilities = [];
    $("input:checkbox[name='cbx_Facilities']:checked").each(function () {
        facilities.push($(this).val());
    }); save

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
            TwentyContainerQty: $("#txt_TwentycontainerQty").val(),
            FortyContainerQty: $("#txt_FortycontainerQty").val(),
            TwentyContainerPrice: $("#txt_Twentycontainerprice").val(),
            FortyContainerPrice: $("#txt_Fortycontainerprice").val(),
            /*cro: $("#txt_CRO").val(),*/
            orderDate: $("#txt_OrderDate").val(),
            vesselBerthingDate: $("#txt_VesselBerthingDate").val(),
            DOGuarantee: $("#txt_DoGuarantee").val(),
            ImportEIR: $("#txt_ImportEIR").val(),
            PortWeighment: $("#txt_PortWeighment").val(),
            OutSidePortWeighment: $("#txt_OutSidePortWeighment").val(),
            BLDate: $("#txt_BLDate").val(),
            GD: $("#txt_GD").val(),
            freeDays: $("#txt_FreeDays").val(),
            remarks: $("#txt_Remarks").val(),
            ShippingAgentId: $("#ddl_ShippingAgent").val(),
            ShippingLineId: $("#ddl_ShippingLine").val(),
            BookingPOCName: $("#txt_BookingPOCName").val(),
            InvoiceAmount: $("#txt_InvoiceAmount").val(),
            FacilityIds: facilities
        }),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json());
}

function saveContainerDetails(orderId) {

    debugger;
    var containerData = [];
    $('#example tbody tr').each(function () {
        if ($(this).find(".txt_container").val() == '') {
            return
        }
        debugger;
        containerData.push({
            ID: $(this).find(".txt_container_id").val(),
            OrderId: orderId,
            ContainerNo: $(this).find(".txt_container").val(),
            ContainerSize: $(this).find(".ddl_ContainerSize").val(),
            ContainerWeight: $(this).find(".txt_container_weight").val(),
            OrderType: "Import"
        });
    });

    showLoader();

    return fetch("/OrderBooking/BookingContainerDetails?orderId=" + orderId, {
        method: 'POST',
        body: JSON.stringify(containerData),
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
        $("#txt_InvoiceAmount").val(total);
    }
    else if (twentycontainer != "") {
        total = parseInt(twentycontainer);
        $("#txt_InvoiceAmount").val(total);
    }
    else if (fortycontainer != "") {
        total = parseInt(fortycontainer);
        $("#txt_InvoiceAmount").val(total);
    }
    else {
        $("#txt_InvoiceAmount").val(0);
    }
}

async function saveDraft(showSuccessBanner) {
    var response = await save();
    debugger;
    if (!response) return false;

    if (!response.success) {
        showErrorMessage(response.message);
    }

    if (response.success) {
        sessionStorage.setItem("orderBookingId", response.orderBookingId);
        saveContainerDetails(response.orderBookingId);
        if (showSuccessBanner)
            showSuccessMessage("Booking has been created successfully");
    }

    return response.success;
}

async function next() {
    var isSucceeded = await saveDraft(false);

    if (isSucceeded) {
        loadPartial('Logistics');
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
            /* $("#txt_CRO").hide();*/
            $("#lbl_BL_CRO").text("BL");
        }
        //else if (orderType == "Export") {
        //    $("#txt_BL").hide();
        //    $("#txt_CRO").show();
        //    $("#lbl_BL_CRO").text("CRO");
        //}
    }

    $("#cbx_HOrates").prop("checked", false)
    $("#txt_BL").val('');
    /*$("#txt_CRO").val('');*/
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

    if (!$("#txt_FreeDays").val()) {
        $("#txt_FreeDays").parent('.input-group').addClass('invalid');
        isValid = false;
    }
    if (!$("#txt_VesselBerthingDate").val()) {
        $("#txt_VesselBerthingDate").parent('.input-group').addClass('invalid');
        isValid = false;
    }


    return isValid;
}

function onClick_BtnSubmitBookingOrder() {
    next();
}