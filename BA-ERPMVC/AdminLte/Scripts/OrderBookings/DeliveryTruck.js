﻿$(document).ready(function myfunction() {



    $(".btnSave").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_OrderId").val())
        save(row, false)

    })

    $(".btnDelivery").click(function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    function save(row, isCompleted) {

        //if (!row.find('.txt_Dispatcheddate').val()) {
        //    row.find('.txt_Dispatcheddate').addClass('error');
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
            'FromLocation': row.find(".txt_FromLoc").val(),
            'ToLocation': row.find(".txt_ToLoc").val(),
            'DriverName': row.find(".txt_DriverName").val(),
            'DriverNo': row.find(".txt_DriverNo").val(),
            'DispatchedDate': row.find(".txt_Dispatcheddate").val(),
            'VehicleNo': row.find(".txt_VehicleNo").val(),
            'DeliveryLocation': row.find(".txt_DeliveryLoc").val(),
            'ArrivalDate': row.find(".txt_Arrivaldate").val(),
            'DeliveryDate': row.find(".txt_Deliverydate").val(),

        });
        showLoader();
        fetch('/OrderExecution/DeliveryTruck', {
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