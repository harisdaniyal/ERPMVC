$(document).ready(function myfunction() {

    $(".btnSave").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_OrderId").val())
        save(row, false)

    })

    $(".btnDispatched").click(function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    function save(row, isCompleted) {

        if (!row.find('.txt_station').val()) {
            row.find('.txt_station').addClass('error');
            return false;
        }
        //else if (!row.find('.txt_ToLoc').val()) {
        //    row.find('.txt_ToLoc').addClass('error');
        //    return false;
        //}

        var dataObject = JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'OrderId': row.find(".txt_OrderId").val(),
            'IsCompleted': isCompleted,
            'BLnumber': row.find(".txt_BLnumber").val(),

            'OrderNo': row.find(".txt_OrderNo").val(),
            'ContainerNo': row.find(".txt_ContainerNo").val(),
            'ContainerSize': row.find(".txt_ContainerSize").val(),
            'ReferenceContainer': row.find(".txt_ReferenceContainer").val(),
            'PriorityForDispatched': row.find(".txt_Priority").val(),
            'TrainID': row.find(".txt_Train option:selected").val(),
            'DispatchedDate': row.find(".txt_Dispatcheddate").val(),
            'StationID': row.find(".txt_station").val(),
            'StationName': row.find(".txt_station option:selected").text(),
            'WagonNo': row.find(".txt_WagonNo").val(),
            'WagonType': row.find(".txt_WagonType").val(),
            'RRNo': row.find(".txt_RRNo").val(),
            'EngineNo': row.find(".txt_EngineNo").val(),
            'InvoiceNumber': row.find(".txt_InvoiceNumber").val(),
        });
        showLoader();
        fetch('/OrderExecution/Dispatched', {
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