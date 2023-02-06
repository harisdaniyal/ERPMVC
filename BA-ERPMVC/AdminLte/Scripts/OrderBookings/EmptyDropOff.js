$(document).ready(function myfunction() {


$(".btnSave").click(function () {
    row = $(this).closest("tr")
    console.log(row.find(".txt_OrderId").val())
    save(row, false)

})

$(".btnEmptyDropOff").click(function () {
    var row = $(this).closest("tr")
    save(row, true)
})


$(".ddl_terminals").change(function () {
    PortAndTerminalId = $(this).val()
    window.location.href = "/OrderExecution/EmptyDropOff?portandterminalId=" + PortAndTerminalId;
})

function save(row, isCompleted) {

    //if (!row.find('.txt_DOGranty').val()) {
    //    row.find('.txt_DOGranty').addClass('error');
    //    return false;
    //}
    var dataObject = JSON.stringify({
        'ID': row.find(".txt_ID").val(),
        'OrderId': row.find(".txt_OrderId").val(),
        'IsCompleted': isCompleted,
        'BLnumber': row.find(".txt_BLnumber").val(),
        'ReferenceContainer': row.find(".txt_ReferenceContainer").val(),

        'OrderNo': row.find(".txt_OrderNo").val(),
        'ContainerNo': row.find(".txt_ContainerNo").val(),
        'ContainerSize': row.find(".txt_ContainerSize").val(),
        'PortName': row.find(".txt_PortName").val(),
        'ShippingLineName': row.find(".txt_ShippingLineName").val(),
        'EIRNo': row.find(".txt_EIRNumber").val(),
        'ExpenseAtEmptyLocation': row.find(".txt_EmptyLoc").val(),
        'Remarks': row.find(".txt_Remarks").val(),
        'DeliveryDate': row.find(".txt_DeliveryDate").val(),

    });
    showLoader();
    fetch('/OrderExecution/EmptyDropOff', {
        method: 'POST',
        body: dataObject,
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then(function (response) {
        if (response.success) {
            if (isCompleted) {
                row.remove();
            }
            else {
                row.find(".txt_ID").val(response.Id)
            }
            hideLoader();
        }
        else showErrorMessage(response.message);
    });
    }
});