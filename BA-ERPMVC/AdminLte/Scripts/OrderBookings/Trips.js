
var tbl_LogisticsContainers = null;

function initialize(trips) {

    $("#tripList").html('');
    for (var i = 0; i < trips.length; i++) {
        addTrip(trips[i]);
    }

    if (!tbl_LogisticsContainers)
        tbl_LogisticsContainers = $('#tbl_LogisticsContainers').DataTable({
            "bPaginate": false,
            "bInfo": false
        });
}

function addTrip(trip) {
    var template = Handlebars.compile($('#template').html());
    var html = template(trip);

    $('#tripList').append(html);
}

function onChange_ddlVendor(ddl) {
    var vendorId = $(ddl).val();

    if (vendorId) {
        fetch("/OrderBooking/GetVendorExpenses/?vendorId=" + vendorId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            }
        })
            .then(res => res.json())
            .then(function (response) {
                if (response.success)
                    populateVendorExpenses(response.VendorExpenses)
            });
    }
}

function populateVendorExpenses(vendorExpense) {
    $('#div_VendorExpenses').html('');

    for (var i = 0; i < vendorExpense.length; i++) {
        var template = Handlebars.compile($('#templateVendorExpense').html());
        var html = template(vendorExpense[i]);

        $('#div_VendorExpenses').append(html);
    }
}

function onClick_DeleteTrip(element) {
    debugger

    showLoader();

    fetch("/OrderBooking/DeleteTrip", {
        method: 'POST',
        body: JSON.stringify({
            tripId: $(element).attr('data-id')
        }),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then(function (response) {
        debugger
        if (response.success) {
            // Find parent div with the help of jQuery and remove
            $(element).closest('div.tripBox').remove();
            hideLoader();
        }
        else showErrorMessage(response.message);
    });
}
function getTripObject() {

    //var tripExpense = [];

    //$("div.expense-div").each(function (index, div) {
    //    tripExpense.push({
    //        ExpenseId: $(div).find("input.expense-id").val(),
    //        Price: $(div).find("input.expense-amount").val(),
    //        Remarks: $(div).find("input.expense-remarks").val(),
    //        ExpenseName: $(div).find("input.expense-name").val()
    //    });
    //});

    var tripContainers = [];

    for (var i = 0; i < tbl_LogisticsContainers.rows().data().length; i++) {
        tripContainers.push({ LogisticsId: tbl_LogisticsContainers.rows(i).data()[0][3] });
    }

    var trip = {};

    trip.OrderId = getBookingOrderId();
    trip.TripId = 0;
    trip.TripCode = $("#txt_TripCode").val();
    trip.VendorId = $("#ddl_Vendor").val();
    trip.FromLocation = $("#ddl_FromLocation").val();
    trip.ToLocation = $("#ddl_ToLocation").val();
    trip.TripDate = $("#txt_TripDate").val();
    trip.DriverName = $("#txt_DriverName").val();
    trip.DriverContactNumber = $("#txt_DriverContactNo").val();
    trip.DriverCNIC = $("#txt_DriverCNIC").val();
    trip.VehicleNumber = $("#txt_DriverVehicleNo").val();
    trip.TotalExpense = $("#txt_VendorExpense").val();
    //trip.TripExpense = tripExpense;
    trip.TripContainers = tripContainers;

    return trip;
}
function populateTripData(trip) {
    trip.VendorName = $("#ddl_Vendor option:selected").text();
    trip.FromLocationCode = $('option:selected', $("#ddl_FromLocation")[0]).attr('data-code');
    trip.ToLocationCode = $('option:selected', $("#ddl_ToLocation")[0]).attr('data-code');
    //trip.TotalExpense = $("#st_TotalExpense").html();
    var tripContainers = [];
    for (var i = 0; i < tbl_LogisticsContainers.rows().data().length; i++) {
        tripContainers.push({
            ContainerNumber: tbl_LogisticsContainers.rows(i).data()[0][0],
            ContainerWeight: tbl_LogisticsContainers.rows(i).data()[0][1]
        });
    }
    trip.TripContainers = tripContainers;
}
function save() {
    if (!validateInputs())
        return false;

    showLoader();

    var trip = getTripObject();

    fetch("/OrderBooking/Trips", {
        method: 'POST',
        body: JSON.stringify(trip),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then((response) => {
        if (response.success) {
            if (response.tripId) {
                trip.TripId = response.tripId;
                populateTripData(trip);
                addTrip(trip);
                clearInputs();
                hideLoader();
            }
        }
        else showErrorMessage(response.message);
    });
}

function onClick_btnSaveTrip() {
    debugger
    save();
}

function next() {
    loadPartial('Invoice');
}

function validateInputs() {
    var isValid = true;
    $('.input-group').removeClass('invalid');

    if (!$("#txt_TripCode").val()) {
        $("#txt_TripCode").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#ddl_Vendor").val()) {
        $("#ddl_Vendor").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#ddl_FromLocation").val()) {
        $("#ddl_FromLocation").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#ddl_ToLocation").val()) {
        $("#ddl_ToLocation").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (!$("#txt_TripDate").val()) {
        $("#txt_TripDate").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    if (tbl_LogisticsContainers.rows().data().length == 0) {
        showErrorMessage("Min 1 container is required.");
        isValid = false;
    }

    //if (!$("#txt_DriverName").val()) {
    //    $("#txt_DriverName").parent('.input-group').addClass('invalid');
    //    isValid = false;
    //}

    //if (!$("#txt_DriverContactNo").val()) {
    //    $("#txt_DriverContactNo").parent('.input-group').addClass('invalid');
    //    isValid = false;
    //}

    //if (!$("#txt_DriverCNIC").val()) {
    //    $("#txt_DriverCNIC").parent('.input-group').addClass('invalid');
    //    isValid = false;
    //}

    //if (!$("#txt_DriverVehicleNo").val()) {
    //    $("#txt_DriverVehicleNo").parent('.input-group').addClass('invalid');
    //    isValid = false;
    //}

    return isValid;
}
function clearInputs() {
    $("#txt_TripCode").val('');
    $("#ddl_Vendor").val('');
    $("#ddl_FromLocation").val('');
    $("#ddl_ToLocation").val('');
    $("#txt_TripDate").val('');
    $("#txt_DriverName").val('');
    $("#txt_DriverContactNo").val('');
    $("#txt_DriverCNIC").val('');
    $("#txt_DriverVehicleNo").val('');
    $("#sp_TotalWeight").html('');
    /*$("#st_TotalExpense").html('');*/

    $('#div_VendorExpenses').html('');
    tbl_LogisticsContainers.clear().draw();
    $("#btn_AddTrip").click();
    getNewTripCode();
}
function getNewTripCode() {
    fetch("/OrderBooking/GetNewTripCode", {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        }
    }).then(res => res.json())
        .then(function (response) {
            if (response.success) {
                $("#txt_TripCode").val(response.newTripCode);
            }
        });
}
function back() {
    loadPartial('Logistics');
}

function onChange_ddlContainer(container) {
    var weight = $('option:selected', container).attr('data-container-weight');

    $(container).closest('tr.bg-white').find("#sp_ContainerWeight").html((weight ?? '0') + ' KG');
    var totalWeight = $("#sp_TotalWeight").html();
    if (totalWeight)
        $("#sp_TotalWeight").html((parseInt(totalWeight) + parseInt(weight)).toString() + ' KG');
}

function onClick_btnAddTripContainer() {
    var isValid = true;

    $('.form-control').removeClass('error');

    if (!$("#ddl_ContainerNumber").val()) {
        $("#ddl_ContainerNumber").addClass('error');
        isValid = false;
    }
    if (isValid) {
        tbl_LogisticsContainers.row.add([
            $("#ddl_ContainerNumber option:selected").text(),
            $("#sp_ContainerWeight").html(),
            '<button type="button" class="btn btn-sm btn-block btn-danger btn-v2" id="btn_RemoveTripContainer" onclick="OnClick_btnRemoveTripContainer(this)">Delete</button>',
            $("#ddl_ContainerNumber").val()
        ]).draw();

        $("#ddl_ContainerNumber").val('');
        $("#sp_ContainerWeight").html('');
    }
}

function onClick_BtnBackToLogistics() {
    back();
}

function onClick_BtnProceedToInvoice() {
    next();
}

function onChange_ExpenseAmount() {
    debugger
    var totalExpense = 0;
    $("input.expense-amount").each(function (index, expAmount) {
        if ($(expAmount).val())
            totalExpense += parseInt($(expAmount).val());
    });
    $("#st_TotalExpense").html(totalExpense.toString());
}

function OnClick_btnRemoveTripContainer(btn) {
    debugger

    //var weight = $('option:selected', $("#ddl_ContainerNumber")).attr('data-container-weight');

    //$(btn).closest('tr.bg-white').find("#sp_ContainerWeight").html((weight ?? '0') + ' KG');
    //var totalWeight = $("#sp_TotalWeight").html();
    //if (totalWeight)
    //    $("#sp_TotalWeight").html((parseInt(totalWeight) - parseInt(weight)).toString() + ' KG');

    $(btn).closest('tr').remove();


}
function onChange_logisticsContainers(element) {
    debugger
    var logisticsId = $(element).val();

    if (logisticsId) {

        showLoader();

        fetch("/OrderBooking/GetTripsByContainer/?logisticsId=" + logisticsId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            }
        }).then(res => res.json())
            .then(function (response) {
                if (response.success) {
                    $("#tripList").html('');
                    if (response.trips) {
                        var tripsData = response.trips
                        for (var i = 0; i < tripsData.length; i++) {
                            addTrip(tripsData[i]);
                        }
                        hideLoader();
                    }
                    if (response.message) {
                        showErrorMessage(response.message);
                    }
                }
                else showErrorMessage("Error Occurred.");
            });
    }
    else {
        initialize(trips);
    }
}


