var tblExportLogistics = null;

function initialize(logistics) {
    tblExportLogistics = $('#tbl_ExportLogistics').DataTable({
        dom: 'Bfrtip',
        lengthChange: true,
        searching: true,
        "bPaginate": true,
        "bInfo": false,
        order: [[2, "desc"]],
        data: logistics,
        columns: [{
            data: 'ContainerNo',
            width: 10
        }, {
            data: 'ContainerType',
            width: 10
        }, {
            data: 'ContainerSize',
            width: 10
        }, {
            data: 'EGNo',
            width: 10
        }, {
            data: 'vessel',
            width: 10
        }, {
            data: 'Voyage',
            width: 10
        }, {
            data: 'ETD',
            width: 10,
            'render': function (date) {
                return date ? moment(date).format("ll") : "--";
            }
        }, {
            data: 'VesselCutOff',
            width: 10,
            'render': function (date) {
                return date ? moment(date).format("ll") : "--";

            }
        },
        {
            data: 'ShippingLine',
            width: 10
        }, {
            data: 'ClearingAgentName',
            width: 10
        }, {
            data: 'CAContactNo',
            width: 10
        }
            //},  {
            //    data: 'RefrenceContainer',
            //    width: 10
            //}

            , {
            data: 'BookingPort',
            width: 10,

        }, {
            data: 'ModeOfTransportation',
            width: 10
        }, {
            data: 'DateOfReceivingCargo',
            width: 10,
            'render': function (date) {
                return date ? moment(date).format("ll") : "--";
            }
        }, {
            data: 'PreDispatched',
            width: 10,
            'render': function (data) {
                return data == "true" ? "Yes" : "No";
            }
        }, {
            data: 'Status',
            width: 10,
            'render': function (data) {
                if (!data) {
                    return '<div class="badge badge-pill badge-success w-100 py-2">N/A</div>';
                }
                else {
                    return '<div class="badge badge-pill badge-success w-100 py-2">' + data + '</div>';
                }

            }
        }, {
            data: 'LogisticId',
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
    fetch('/OrderBooking/ExportLogistic', {
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
    loadPartial('Invoice');
}

function back() {
    var orderBookingId = getBookingOrderId();
    window.location.href = `/OrderBooking/ExportOrder?orderBookingId=${orderBookingId}&stepNo=ExportBooking`;
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

    fetch("/OrderBooking/DeleteExportLogistic", {
        method: 'POST',
        body: JSON.stringify({
            LogisticId: $(btn_RemoveLogistics).attr('data-id')
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
    tblExportLogistics
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
        /* $("#sp_containerError").show();*/
        isValid = false;
    }



    if (!$("#txt_ContainerSize").val()) {
        $("#txt_ContainerSize").addClass('error');
        isValid = false;
    }

    if (!$("#txt_ContainerType").val()) {
        $("#txt_ContainerType").addClass('error');
        isValid = false;
    }

    if (!$("#txt_PreDispatched").val()) {
        $("#txt_PreDispatched").parent('.input-group').addClass('invalid');
        isValid = false;
    }

    //if (!$("#ddl_JobType").val()) {
    //    $("#ddl_JobType").addClass('error');
    //    isValid = false;
    //}

    //if (!$("#ddl_FromLocation").val()) {
    //    $("#ddl_FromLocation").addClass('error');
    //    isValid = false;
    //}

    //if (!$("#ddl_ToLocation").val()) {
    //    $("#ddl_ToLocation").addClass('error');
    //    isValid = false;
    //}

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
    $("#txt_ContainerSize").val('');
    $("#txt_ContainerType").val('');
    $("#txt_EgNo").val('');
    // $("#txt_Cro").val('');
    $("#txt_Vessel").val('');
    $("#txt_Voyage").val('');
    $("#txt_ETD").val('');
    $("#txt_VesselCutoff").val('');
    $("#txt_Clearingagent").val('');
    $("#txt_Clearingagentno").val('');
    //$("#txt_ReferenceContainer").val('');
    $("#txt_ShippingLine").val('');
    $("#txt_Bookingport").val('');
    $("#txt_ModeOfTransportation").val('');
    $("#txt_DateofcargoReceiving").val('');
    $("#txt_PreDispatched").val('');
}
function addLogisticsRow(logisticsId) {
    debugger;
    var data = JSON.parse(getLogisticsObject());
    data.LogisticId = logisticsId;
    tblExportLogistics.row.add(data).draw();
    clearInputs();
}
function getLogisticsObject() {
    return JSON.stringify({
        'ContainerNo': $("#txt_ContainerNo").val(),
        'ContainerSize': $("#txt_ContainerSize option:selected").val(),
        'ContainerType': $("#txt_ContainerType option:selected").val(),
        'EGNo': $("#txt_EgNo").val(),
        //'CRO': $('#txt_Cro').val(),
        'vessel': $("#txt_Vessel").val(),
        'Voyage': $("#txt_Voyage").val(),
        'ETD': $("#txt_ETD").val(),
        'VesselCutOff': $("#txt_VesselCutoff").val(),
        'ClearingAgentName': $("#txt_Clearingagent").val(),
        'CAContactNo': $("#txt_Clearingagentno").val(),
        //'RefrenceContainer': $("#txt_ReferenceContainer").val(),
        'ShippingLine': $("#txt_ShippingLine option:selected").val(),
        'BookingPort': $("#txt_Bookingport option:selected").val(),
        'ModeOfTransportation': $("#txt_ModeOfTransportation option:selected").val(),
        'DateOfReceivingCargo': $("#txt_DateofcargoReceiving").val(),
        'PreDispatched': $("#txt_PreDispatched option:selected").val(),
        'LogisticId': 0,
        'OrderId': getBookingOrderId(),

    });
}
function onClick_AddLogistics() {
    save();
}

function onChange_ContainerNumber(item) {
    $("#sp_containerError").hide();
    for (var i = 0; i < tblExportLogistics.rows().data().length; i++) {
        var containerNo = tblExportLogistics.rows(i).data()[0]["ContainerNo"];
        if (containerNo == $(item).val()) {
            showErrorMessage("Container Number should be unique");
            $("#sp_containerError").show();
            $(item).val(''); return;
        }
    }
}