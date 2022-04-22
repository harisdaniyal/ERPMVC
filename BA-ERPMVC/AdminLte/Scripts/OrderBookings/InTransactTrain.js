$(document).ready(function myfunction() {


$(".btnSave").click(function () {
    row = $(this).closest("tr")
    console.log(row.find(".txt_OrderId").val())
    save(row, false)

})

$(".btnIntransact").click(function () {
    var row = $(this).closest("tr")
    save(row, true)
})

$(".ddl_stations").change(function () {
    stationID = $(this).val()
    window.location.href = "/OrderExecution/InTransactTrain?stationID=" + stationID;
})

function save(row, isCompleted) {

    //if (!row.find('.txt_station').val()) {
    //    row.find('.txt_station').addClass('error');
    //    return false;
    //}
    //else if (!row.find('.txt_ToLoc').val()) {
    //    row.find('.txt_ToLoc').addClass('error');
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
        'PriorityForDispatched': row.find(".txt_Priority").val(),
        'TrainID': row.find(".txt_TrainID").val(),
        'StationID': row.find(".txt_StationID").val(),
        'StationName': row.find(".txt_StationName").val(),
        'Customer_Name': row.find(".txt_ClientName").val(),
        'ArrivalDate': row.find(".txt_ArrivalDateTime").val(),
        'LOLO': row.find(".txt_lolo").val(),
        //'StationName': row.find(".txt_station option:selected").text(),

    });
    showLoader();
    fetch('/OrderExecution/InTransactTrain', {
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