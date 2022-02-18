var tblLogistics = null;

function initialize(logistics) {
    tblLogistics = $('#tbl_Logistics').DataTable({
        dom: 'Bfrtip',
        lengthChange: true,
        searching: true,
        "bPaginate": false,
        "bInfo": false,
        order: [[2, "desc"]],
        data: logistics,
        columns: [{
            data: 'ContainerNo',
            width: 10
        }, {
            data: 'ContainerWeight',
            width: 10
        }, {
            data: 'ContainerSize',
            width: 10
        }, {
            data: 'ContainerTypeName',
            width: 10
        }, {
            data: 'JobType',
            width: 10
        }, {
            data: 'FromLocation',
            width: 10
        }, {
            data: 'ToLocation',
            width: 10
        }, {
            data: 'EmptyReturnLocation',
            width: 10
        }, {
            data: 'EmptyReturnDate',
            width: 10,
            'render': function (date) {
                return date ? moment(date).format("ll") : "--";
            }
        }, {
            data: 'LogisticsId',
            width: 10,
            "render": function (data) {
                return appendActionMenu(data);
            }
        }],
        buttons: []
    });
}

function appendActionMenu(id) {
    return '<button type="button" id="btn_RemoveLogistics" class="btn btn-sm btn-block btn-danger btn-v2" data-id="' + id + '" onclick="onClick_RemoveLogistics(this)"><i class="fas fa-times"></i></button>'
}

function save() {
    debugger
    if (!validateInputs()) return false;

    //var logistics = [];
    //for (var i = 0; i < tblLogistics.rows().data().length; i++) {
    //    var item = tblLogistics.rows(i).data()[0];
    //    item.OrderId = getBookingOrderId();
    //    logistics.push(tblLogistics.rows(i).data()[0]);
    //}
    showLoader();
    fetch('/OrderBooking/Logistics', {
        method: 'POST',
        body: getLogisticsObject(),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then(function (response) {
        if (response.success) {
            addLogisticsRow(response.logisticsId);
            hideLoader();
        }
        else showErrorMessage(response.message);
    });
}

function next() {
    loadPartial('OrderDelivery');
}

function back() {
    loadPartial('Dispatched');
}

function onClick_BtnBackToBooking() {
    back();
}

function onClick_BtnProceedToTrips() {
    next();
}

function onClick_RemoveLogistics(btn_RemoveLogistics) {
    debugger

    showLoader();

    fetch("/OrderBooking/DeleteLogistics", {
        method: 'POST',
        body: JSON.stringify({
            logisticsId: $(btn_RemoveLogistics).attr('data-id')
        }),
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then(function (response) {
        debugger
        if (response.success) {
            removeLogisticsRow(btn_RemoveLogistics);
            hideLoader();
        }
        else showErrorMessage(response.message);
    });
}
function removeLogisticsRow(btn_RemoveLogistics) {
    tblLogistics
        .row($(btn_RemoveLogistics).parents('tr'))
        .remove()
        .draw();
}
function validateInputs() {
    var isValid = true;

    $('.form-control').removeClass('error');

    $("#sp_containerError").hide();

    if (!$("#txt_ContainerNo").val()) {
        $("#txt_ContainerNo").addClass('error');
        $("#sp_containerError").show();
        isValid = false;
    }

    if (!$("#txt_ContainerWeight").val()) {
        $("#txt_ContainerWeight").addClass('error');
        isValid = false;
    }

    if (!$("#ddl_ContainerSize").val()) {
        $("#ddl_ContainerSize").addClass('error');
        isValid = false;
    }

    if (!$("#ddl_ContainerType").val()) {
        $("#ddl_ContainerType").addClass('error');
        isValid = false;
    }

    if (!$("#ddl_JobType").val()) {
        $("#ddl_JobType").addClass('error');
        isValid = false;
    }

    if (!$("#ddl_FromLocation").val()) {
        $("#ddl_FromLocation").addClass('error');
        isValid = false;
    }

    if (!$("#ddl_ToLocation").val()) {
        $("#ddl_ToLocation").addClass('error');
        isValid = false;
    }

    //if (!$("#ddl_EmptyContainerReturnLocation").val()) {
    //    $("#ddl_EmptyContainerReturnLocation").addClass('error');
    //    isValid = false;
    //}

    //if (!$("#txt_EmptyContainerReturnDate").val()) {
    //    $("#txt_EmptyContainerReturnDate").addClass('error');
    //    isValid = false;
    //}
    return isValid;
}
function clearInputs() {
    $("#txt_ContainerNo").val('');
    $("#txt_ContainerWeight").val('');
    $("#ddl_ContainerSize").val('');
    $("#ddl_ContainerType").val('');
    $("#ddl_JobType").val('');
    $("#ddl_FromLocation").val('');
    $("#ddl_ToLocation").val('');
    $("#ddl_EmptyContainerReturnLocation").val('');
    $("#txt_EmptyContainerReturnDate").val('');
}
function addLogisticsRow(logisticsId) {
    var data = JSON.parse(getLogisticsObject());
    data.LogisticsId = logisticsId;
    tblLogistics.row.add(data).draw();
    clearInputs();
}
function getLogisticsObject() {
    return JSON.stringify({
        'ContainerNo': $("#txt_ContainerNo").val(),
        'ContainerWeight': $("#txt_ContainerWeight").val(),
        'ContainerSize': $("#ddl_ContainerSize option:selected").text(),
        'ContainerType': $("#ddl_ContainerType").val(),
        'JobType': $("#ddl_JobType option:selected").text(),
        'FromLocation': $("#ddl_FromLocation option:selected").text(),
        'ToLocation': $("#ddl_ToLocation option:selected").text(),
        'EmptyReturnLocation': $("#ddl_EmptyContainerReturnLocation option:selected").text(),
        'EmptyReturnDate': $("#txt_EmptyContainerReturnDate").val(),
        'LogisticsId': 0,
        'OrderId': getBookingOrderId(),
        'ContainerTypeName': $("#ddl_ContainerType option:selected").text(),

    });
}
function onClick_AddLogistics() {
    save();
}

function onChange_ContainerNumber(item) {
    $("#sp_containerError").hide();
    for (var i = 0; i < tblLogistics.rows().data().length; i++) {
        var containerNo = tblLogistics.rows(i).data()[0]["ContainerNo"];
        if (containerNo == $(item).val()) {
            showErrorMessage("Container Number should be unique");
            $("#sp_containerError").show();
            $(item).val(''); return;
        }
    }
}