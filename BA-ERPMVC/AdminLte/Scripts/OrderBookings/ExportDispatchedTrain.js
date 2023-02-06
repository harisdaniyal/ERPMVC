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

        if (!row.find('.txt_ExportDispatcheddate').val()) {
            row.find('.txt_ExportDispatcheddate').addClass('error');
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
            'CRO': row.find(".txt_CROnumber").val(),
            'OrderNo': row.find(".txt_OrderNo").val(),
            'ContainerNo': row.find(".txt_ContainerNo").val(),
            'ContainerSize': row.find(".txt_ContainerSize").val(),
            'ContainerType': row.find(".txt_ContainerType").val(),
            'TrainID': row.find(".txt_Train option:selected").val(),
            'DispatchedOfDate': row.find(".txt_ExportDispatcheddate").val(),
            'WagonNo': row.find(".txt_WagonNo").val(),
            'RRNo': row.find(".txt_RRNo").val(),
            'EngineNo': row.find(".txt_EngineNo").val(),
            'ShipperName': row.find(".txt_ShipperName").val(),
            'WagonType': row.find(".txt_WagonType").val(),
            'ReDispatched': row.find(".txt_ReDispatched").val(),
            'CargoWeight': row.find(".txt_Cargoweight").val(),
            'TareWeight': row.find(".txt_Tareweight").val(),

        });
        showLoader();
        fetch('/OrderExecution/ExportDispatchedTrain', {
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