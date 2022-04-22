$(document).ready(function myfunction() {


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

        if (!row.find('.txt_TruckingCost').val()) {
            row.find('.txt_TruckingCost').addClass('error');
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

            'TransporterName': row.find(".txt_TransporterName").val(),
            'VehicleNo': row.find(".txt_Vehicleno").val(),
            'CustomerName': row.find(".txt_CustomerName").val(),
            'TruckingCost': row.find(".txt_TruckingCost").val(),

        });
        showLoader();
        fetch('/OrderExecution/ExportReDispatched', {
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