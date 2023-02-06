$(document).ready(function () {


    $(document).on('click', '#btn_print', function () {


        var OrderType = $('#txt_OrderType').val();
        var BL = $('#txtBlNo').val();
        var CRO = $('#txtCRONo').val();

        if (OrderType == '') {
            alert('Please select Order Type')
            return false;
        }
        else if ((BL == '' || BL == undefined) && OrderType == 'Import') {
            alert('Please select BL')
            return false;
        }
        else if ((CRO == '' || CRO == undefined) && OrderType == 'Export') {
            alert('Please select CRO')
            return false;
        }
        if ($('#txt_Type').val() =="ContainerWise") {
            window.location.href = '/OrderBooking/PrintContainerWiseReport?ordertype=' + OrderType + '&bl=' + BL + '&cro=' + CRO;//+ '&type=' + Type ;
        }
        else {
            window.location.href = '/OrderBooking/PrintLotWiseReport?ordertype=' + OrderType + '&bl=' + BL + '&cro=' + CRO;//+ '&type=' + Type ;
        }
        
    })


    $.ajax({
        type: "GET",
        url: "/OrderBooking/GetCROByCustomerNo",
        data: "{}",
        async: false,
        success: function (data) {

            var _data = '<option value="">Please Select CRO</option>';
            for (var i = 0; i < data.length; i++) {
                _data += '<option value="' + data[i].CRO + '">' + data[i].CRO + '</option>';
            }
            $(".txtCRONo").html(_data);
            $('.txtCRONo').select2();
        }

    })

    $.ajax({
        type: "GET",
        url: "/OrderBooking/GetCustomerName",
        data: "{}",
        async: false,
        success: function (data) {
            var _data = '<option value="">Please Select Customer</option>';
            for (var i = 0; i < data.length; i++) {
                _data += '<option value="' + data[i].CustomerId + '">' + data[i].Customer_Name + '</option>';
            }
            $(".txtCustomerName").html(_data);

        }
    })

    $(".txtCustomerName").change(function () {
        $.ajax({
            type: "GET",
            url: "/OrderBooking/GetBlByCustomerNo?customerID=" + $(this).val(),
            async: false,
            success: function (data) {
                var _data = '<option value="">Please Select BL</option>';
                for (var i = 0; i < data.length; i++) {
                    _data += '<option value="' + data[i].BL + '">' + data[i].BL + '</option>';
                }
                $(".txtBlNo").html(_data);
                $('.txtBlNo').select2();
            }

        })
    });

});
function onChange_OrderType(item) {
    var value = $(item).val();
    if (value == "Import") {
        $("#txtCustomerName").parent().parent().show();
        $("#txtBlNo").parent().parent().show();
        $("#txtexportCustomerName").parent().parent().hide();
        $("#txtCRONo").parent().parent().hide();
        // $("#lbl_BL_CRO").text("BL");
    }
    else if (value == "Export") {
        $("#txtBlNo").parent().parent().hide();
        $("#txtCustomerName").parent().parent().hide();
        $("#txtCRONo").parent().parent().show();
        $("#txtexportCustomerName ").parent().parent().show();
    }
    else {
        $("#txtBlNo").parent().parent().hide();
        $("#txtCustomerName").parent().parent().hide();
        $("#txtCRONo").parent().parent().hide();
        $("#txtexportCustomerName ").parent().parent().hide();
    }
}

function onChange_Type(item) {
    var value = $(item).val();
    if (value == "ContainerWise") {
        $(".BLWise").hide();
        $(".ContainerWise").show();
    }
    else if (value == "BlWise") {
        $(".BLWise").show();
        $(".ContainerWise").hide();
    }
    else {
        $(".BLWise").hide();
        $(".ContainerWise").hide();

    }
}



