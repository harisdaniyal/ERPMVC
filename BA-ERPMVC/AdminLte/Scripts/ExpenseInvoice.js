function onChange_OrderType(item) {
    var value = $(item).val();
    if (value == "import") {
        $("#txt_importContainerNo").parent().parent().show();
    }
    else {
        $("#txt_importContainerNo").parent().parent().hide();
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
        var Id = row.find(".txt_ID").val()

        $.ajax({
            type: 'POST',
            url: '/Invoices/DeleteExpenseInvoice?Id=' + Id,
            async: false,
            success: function (response) {
                if (response.success) {
                    toastr.success("Deleted Successfully.")
                    hideLoader();
                    row.remove();
                }
                else showErrorMessage(response.message);
            }
        });
    });

    $("#txt_OrderType").change(function () {
        $.ajax({
            type: "GET",
            url: "/Invoices/GetImportContainer?orderType=" + $('#txt_OrderType').val(),
            async: false,
            success: function (data) {
                data = data.Data;
                var _data = '<option value="" selected>Please Select Container</option>';
                for (var i = 0; i < data.length; i++) {
                    _data += '<option value="' + data[i].ContainerNo + '" data-order-no= "' + data[i].OrderNo+'">' + data[i].ContainerNoAndOrderNo + '</option>';
                }
                $("#txt_importContainerNo ").html(_data);
                $('#txt_importContainerNo').select2();
                $('#txt_importContainerNo').parent().parent().show();
            }

        })
   });


    $("#txt_importContainerNo").change(function () {
        var orderNo = $("#txt_importContainerNo").find(':selected').attr('data-order-no')
        var containerNo = $("#txt_importContainerNo option:selected").val()

        $.ajax({
            type: "GET",
            url: "/Invoices/GetExpenseInvoice?orderNo=" + orderNo + "&containerNo=" + containerNo,
            async: false,
            success: function (data) {
                if (data != null) {
                    $("#example tbody").find("tr:gt(0)").remove();
                    data.forEach(function (_data, index) {
                        $('#example tbody').append(`<tr class="bg-light tbl-valign-top">
                         <td>
                            <input type="hidden" value="`+ _data.ID + `" class="form-control txt_ID" />

                            <select id="txt_HeadType" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0" style="width: 100px;">
                                <option value="">Select Head Type</option>
                                <option value="Expense">Expense</option>
                            </select>
                        </td>
                        <td>
                               `+ $("#txt_HeadName").parent().html() + `

                        </td>

                        <td>
                            <input type="number" style="width: 150px;" value="`+ _data.Amount + `" class="form-control" id="txt_Amount" />
                        </td>

                         <td>
                               `+ $("#txt_userName").parent().html() + `
                               
                        </td>

                         <td>
                         <textarea class="form-control" id="txt_Remarks" rows="1"></textarea>
                        </td>
                        
                        <td class="btn-group">
                            <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
                            <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                        </td>
                    </tr>`)
                        $('#example tbody tr:last').find('#txt_HeadType').val(_data.HeadType)
                        $('#example tbody tr:last').find('#txt_HeadName').val(_data.HeadID)
                        $('#example tbody tr:last').find('#txt_userName').val(_data.UserID)
                        $('#example tbody tr:last').find('#txt_Remarks').val(_data.Remarks)

                    });
                }
                else toastr.error("Unable to get data");
                hideLoader();
                /*    toastr.success("Data Fetched Successfully.")*/
            }
        })


    });


    function save(row, IsActive) {
        var OrderType = $('#txt_OrderType').val();
        //var ImportOrderNo = $('#txt_importorderNo').val();
        //var ExportOrderNo = $('#txt_exportorderNo').val();
        var ContainerNo = $('#txt_importContainerNo').val();

        if (OrderType == '') {
            toastr.error('Please select Order Type')
            return false;
        }
        //else if ((ImportOrderNo == '' || ImportOrderNo == undefined) && OrderType == 'Import') {
        //    toastr.error('Please select OrderNo')
        //    return false;
        //}
        //else if ((ExportOrderNo == '' || ExportOrderNo == undefined) && OrderType == 'Export') {
        //    toastr.error('Please select OrderNo')
        //    return false;
        //}
        else if ((ContainerNo == '' || ContainerNo == undefined)) {
            toastr.error('Please select ContainerNo')
            return false;
        }
        else if (row.find(".txt_ID").val() == 0 && IsActive == true) {
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
        else if (row.find("#txt_Remarks").val() == '') {
            toastr.error('Please Enter Remarks.')
            return false;
        }
        else if (row.find("#txt_userName").val() == '') {
            toastr.error('Please Select UserName.')
            return false;
        }

        var headName = row.find("#txt_HeadName").parent().html()
        var userName = row.find("#txt_userName").parent().html()
        dataObject = []
        dataObject.push(JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsActive': IsActive,
            'OrderType': $("#txt_OrderType option:selected").val(),
            'OrderNo': $("#txt_importContainerNo").find(':selected').attr('data-order-no'),
            'ContainerNo': $("#txt_importContainerNo option:selected").val(),
            'HeadType': row.find("#txt_HeadType option:selected").text(),
            'HeadID': row.find("#txt_HeadName option:selected").val(),
            'HeadName': row.find("#txt_HeadName option:selected").text(),
            'UserID': row.find("#txt_userName option:selected").val(),
            'UserName': row.find("#txt_userName option:selected").text(),
            'Amount': row.find("#txt_Amount").val(),
            'Remarks': row.find("#txt_Remarks").val(),
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
                if (IsActive) {
                    row.remove();
                }
                else {
                    if (row.find(".txt_ID").val() == 0) {
                        $('#example tbody').prepend(`
                        <tr class="bg-light tbl-valign-top">
                         <td>
                            <input type="hidden" value="0" class="form-control txt_ID" />

                            <select id="txt_HeadType" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0" style="width: 100px;">
                                <option value="">Select HeadType</option>
                                <option value="Expense">Expense</option>
                            </select>
                        </td>
                        <td>
                               `+ headName + `
                        </td>
                          
                        <td>
                            <input type="number" style="width: 150px;" value="" class="form-control" id="txt_Amount" />
                        </td>

                         <td>
                               `+ userName + `
                        </td>   

                        <td>
                          <textarea class="form-control" id="txt_Remarks" rows="1"></textarea>
                        </td>


                        <td class="btn-group">
                            <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
                            <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                        </td>
                    </tr>`)
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




});