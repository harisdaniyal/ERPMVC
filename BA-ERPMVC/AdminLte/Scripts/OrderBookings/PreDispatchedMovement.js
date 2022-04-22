$(document).ready(function myfunction() {


    $(".btnSave").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_OrderId").val())
        save(row, false)

    })

    $(".btnPreDispatched").click(function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    function save(row, isCompleted) {

        if (!row.find('.txt_FromLoc').val()) {
            row.find('.txt_FromLoc').addClass('error');
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
            'FromLocation': row.find(".txt_FromLoc").val(),
            'FromDateTime': row.find(".txt_FromDateTime").val(),
            'ToLocation': row.find(".txt_ToLoc").val(),
            'ToDateTime': row.find(".txt_ToDateTime").val(),
            'TransporterName': row.find(".txt_TransporterName").val(),
            'VehicleNumber': row.find(".txt_VehicleNumber").val(),

        });
        showLoader();
        fetch('/OrderExecution/PreDispatched', {
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