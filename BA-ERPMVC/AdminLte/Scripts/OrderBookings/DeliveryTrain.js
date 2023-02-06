$(document).ready(function myfunction() {

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
            'PriorityForDispatched': row.find(".txt_Priority").val(),
            'TrainID': row.find(".txt_TrainID").val(),
            'DispatchedDate': row.find(".txt_Dispatcheddate").val(),
            'DeliveryLocation': row.find(".txt_DeliveryLoc").val(),
            'VehicleNo': row.find(".txt_VehicleNo").val(),
            'ArrivalDate': row.find(".txt_Arrivaldate").val(),
            'DeliveryDate': row.find(".txt_Deliverydate").val()

        });
        showLoader();
        fetch('/OrderExecution/DeliveryTrain', {
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