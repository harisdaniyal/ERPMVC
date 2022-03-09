$(document).ready(function myfunction() {
    $(".btnSave").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_OrderId").val())
        save(row, false)

    })

    $(".btnReadyForDispatched").click(function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    

    function save(row, isCompleted) {

        if (!row.find('.txt_DOGranty').val()) {
            row.find('.txt_DOGranty').addClass('error');
            return false;
        }
        var dataObject = JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'OrderId': row.find(".txt_OrderId").val(),
            'IsCompleted': isCompleted,
            'OrderNo': row.find(".txt_OrderNo").val(),
            'ContainerNo': row.find(".txt_ContainerNo").val(),
            'ContainerSize': row.find(".txt_ContainerSize").val(),
            'BLnumber': row.find(".txt_BLnumber").val(),

            'DOGranty': row.find(".txt_DOGranty").val(),
            'ImportEIR': row.find(".txt_ImportEIR").val(),
            'PortWeighment': row.find(".txt_PortWeighment").val(),
            'OutSidePortWeighment': row.find(".txt_OutSidePortWeighment").val(),
            'GD': row.find(".txt_GD").val(),
            'BL': row.find(".txt_BL").val()

        });
        showLoader();
        fetch('/OrderExecution/ReadyForDispatched', {
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