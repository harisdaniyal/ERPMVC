function onChange_OrderType(item) {
    var value = $(item).val();
    if (value == "Import") {
        $("#txt_importorderNo").parent().parent().show();
        $("#txt_exportorderNo").parent().parent().hide();

    }
    else if (value == "Export") {
        $("#txt_exportorderNo").parent().parent().show();
        $("#txt_importorderNo").parent().parent().hide();
    }
    else {
        $("#txt_importorderNo").parent().parent().hide();
        $("#txt_exportorderNo").parent().parent().hide();
    }
}

$(document).ready(function () {
    var dataObject = []


    $('#example').dataTable({
        buttons: [
            'copyHtml5',
            'excelHtml5'
        ],
        "columnDefs": [
            { "searchable": true, "targets": 0 }
        ],
        "ordering": false
    });

    $(document).on('click', '.btnSaveEdit', function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_ID").val())
        save(row, false)
    });

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        save(row, true)
    });

    $("#txt_importorderNo").change(function () {
        $.ajax({
            type: "GET",
            url: "/Invoices/GetImportContainer?orderID=" + $(this).val() + "&orderType=" + $('#txt_OrderType').val(),
            async: false,
            success: function (data) {
                var _data = '<option value="" selected>Please Select Container</option>';
                for (var i = 0; i < data.length; i++) {
                    _data += '<option value="' + data[i].ContainerNo + '">' + data[i].ContainerNo + '</option>';
                }
                $("#txt_importContainerNo").html(_data);
                $('#txt_importContainerNo').select2();
                $('#txt_importContainerNo').parent().parent().show();
            }

        })
    });




    $("#txt_importContainerNo").change(function () {
        var orderNo = $("#txt_importorderNo option:selected").text()
        var containerNo = $("#txt_importContainerNo option:selected").val()

        $.ajax({
            type: "GET",
            url: "/Invoices/GetExpenseInvoice?orderNo" + orderNo + "&containerNo" + containerNo,
            method: 'GET',
            async: false,
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
        }).then(res => res.json()).then(function (response) {

            if (response.data != null) {
                $('#example').prepend(` <tr class="bg-light tbl-valign-top">
                         <td>
                            <input type="hidden" value="0" class="form-control txt_ID" />

                            <select id="txt_HeadType" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0" style="width: 200px;">
                                <option value="">Select HeadType</option>
                                <option value="Expense">Expense</option>
                                <option value="Revenue">Revenue</option>
                            </select>
                        </td>
                        <td>
                               `+ headName + `
                        </td>
                          
                        <td>
                            <input type="number" style="width: 350px;" value="@expenseinvoice.Amount" class="form-control" id="txt_Amount" />
                        </td>
                        <td class="btn-group">
                            <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
                            <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                        </td> </tr>`)

                hideLoader();
                toastr.success("Saved Successfully.")
            }
            else toastr.error("Failed");
        });
    });




    function save(row, IsCompleted) {
        var OrderType = $('#txt_OrderType').val();
        var ImportOrderNo = $('#txt_importorderNo').val();
        var ExportOrderNo = $('#txt_exportorderNo').val();
        var ContainerNo = $('#txt_importContainerNo').val();

        if (OrderType == '') {
            toastr.error('Please select Order Type')
            return false;
        }
        else if ((ImportOrderNo == '' || ImportOrderNo == undefined) && OrderType == 'Import') {
            toastr.error('Please select OrderNo')
            return false;
        }
        else if ((ExportOrderNo == '' || ExportOrderNo == undefined) && OrderType == 'Export') {
            toastr.error('Please select OrderNo')
            return false;
        }
        else if ((ContainerNo == '' || ContainerNo == undefined)) {
            toastr.error('Please select ContainerNo')
            return false;
        }
        else if (row.find(".txt_ID").val() == 0 && IsCompleted == true) {
            toastr.error('You can not delete to non existing record !!')
            return false;
        }
        else if (row.find("#txt_HeadType").val() == '') {
            toastr.error('Please select HeadType.')
            return false;
        }
        else if (row.find("#txt_HeadName").val() == '') {
            toastr.error('Please Select HeadName.')
            return false;
        }
        else if (row.find("#txt_Amount").val() == '') {
            toastr.error('Please Enter Amount.')
            return false;
        }

        var headName = row.find("#txt_HeadName").parent().html()
        dataObject = []
        dataObject.push(JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsCompleted': IsCompleted,
            'OrderType': $("#txt_OrderType option:selected").val(),
            'OrderNo': $("#txt_importorderNo option:selected").text(),
            'ContainerNo': $("#txt_importContainerNo option:selected").val(),
            'HeadType': row.find("#txt_HeadType option:selected").text(),
            'HeadID': row.find("#txt_HeadName option:selected").val(),
            'HeadName': row.find("#txt_HeadName option:selected").text(),
            'Amount': row.find("#txt_Amount").val(),
        }));

        showLoader();
        fetch('/Invoices/ExpenseInvoice', {
            method: 'POST',
            body: dataObject,
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
        }).then(res => res.json()).then(function (response) {
            if (response.success) {
                if (IsCompleted) {
                    row.remove();
                }
                else {
                    if (row.find(".txt_ID").val() == 0) {
                        $('#example').prepend(` <tr class="bg-light tbl-valign-top">
                         <td>
                            <input type="hidden" value="0" class="form-control txt_ID" />

                            <select id="txt_HeadType" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0" style="width: 200px;">
                                <option value="">Select HeadType</option>
                                <option value="Expense">Expense</option>
                                <option value="Revenue">Revenue</option>
                            </select>
                        </td>
                        <td>
                               `+ headName + `
                        </td>
                          
                        <td>
                            <input type="number" style="width: 350px;" value="" class="form-control" id="txt_Amount" />
                        </td>
                        <td class="btn-group">
                            <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
                            <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                        </td> </tr>`)
                    }
                    row.find(".txt_ID").val(response.Id)

                }

                hideLoader();
                toastr.success("Saved Successfully.")
            }
            else toastr.error(response.message);
        });
    }
    showErrorMessage
    //window.onload = function () {
    //    let orderID = getUrlParameter("orderID");
    //    $(".txt_ID").val(orderID)
    //};

});


//$(".txt_ID").change(function () {

//    var orderID = $(".txt_ID").val()
//    window.location.href = "/Invoices/ExpenseInvoice?orderID=" + orderID
//});

//function getUrlParameter(name) {
//    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
//    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
//        results = regex.exec(location.search);
//    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
//}
