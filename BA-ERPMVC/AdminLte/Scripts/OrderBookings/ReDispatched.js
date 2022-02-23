$(".btnSave").click(function () {
    row = $(this).closest("tr")
    console.log(row.find(".txt_OrderId").val())
    save(row, false)

})

$(".btnReDispatched").click(function () {
    var row = $(this).closest("tr")
    save(row, true)
})

function save(row, isCompleted) {

    if (!row.find('.txt_VehicleNo').val()) {
        row.find('.txt_VehicleNo').addClass('error');
        return false;
    }
    var dataObject = JSON.stringify({
        'ID': row.find(".txt_ID").val(),
        'OrderId': row.find(".txt_OrderId").val(),
        'IsCompleted': isCompleted,
        'BLnumber': row.find(".txt_BLnumber").val(),
        'OrderNo': row.find(".txt_OrderNo").val(),
        'ContainerNo': row.find(".txt_ContainerNo").val(),
        'ContainerSize': row.find(".txt_ContainerSize").val(),
        
        'VehicleNo': row.find(".txt_VehicleNo").val(),
        'ReDispatchedDate': row.find(".txt_ReDispatchedDate").val(),
        'TranspoterName': row.find(".txt_TranspoterName").val(),
        'BiltyNumber': row.find(".txt_BiltyNumber").val(),
        'TransportationCost': row.find(".txt_TransportationCost").val()

    });
    showLoader();
    fetch('/OrderExecution/ReDispatched', {
        method: 'POST',
        body: dataObject,
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
    }).then(res => res.json()).then(function (response) {
        if (response.success) {
            hideLoader();
            location.reload();
        }
        else showErrorMessage(response.message);
    });
}