

$(".btnSave").click(function () {
    row = $(this).closest("tr")
    console.log(row.find(".txt_OrderId").val())
    save(row, false)

})

$(".btnReDispatched").click(function () {
    var row = $(this).closest("tr")
    save(row, true)
})

$(".ddl_stations").change(function () {
    stationID = $(this).val()
    window.location.href = "/OrderExecution/ReDispatched?stationID=" + stationID;
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
        'ReferenceContainer': row.find(".txt_ReferenceContainer").val(),
        'OrderNo': row.find(".txt_OrderNo").val(),
        'ContainerNo': row.find(".txt_ContainerNo").val(),
        'ContainerSize': row.find(".txt_ContainerSize").val(),
        'StationID': row.find(".txt_StationID").val(),
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
