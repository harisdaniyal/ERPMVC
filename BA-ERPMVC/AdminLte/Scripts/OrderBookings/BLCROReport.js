$(document).ready(function () {


    $(document).on('click', '#btn_print', function () {


        var OrderType = $('#txt_OrderType').val();
        var BL = $('#txtBlNo').val();

        if ($('#txt_OrderType').val() == '') {
            alert('Please select Order Type')
            return false;
        }
        else if (BL == '' || BL == undefined) {
            alert('Please select BL/CRO')
            return false;
        }

        window.location.href = '/OrderBooking/PrintImportBLReport?ordertype=' + OrderType + '&bl=' + BL;//+ '&type=' + Type ;
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
        $("#txtBlNo").parent().parent().show();
        $("#txtCRONo").parent().parent().hide();
        // $("#lbl_BL_CRO").text("BL");
    }
    else if (value == "Export") {
        $("#txtBlNo").parent().parent().hide();
        $("#txtCRONo").parent().parent().show();
        //$("#lbl_BL_CRO").text("CRO");
    }
}

