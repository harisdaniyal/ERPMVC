$(document).ready(function myfunction() {
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

    $(document).on("click", ".btnSaveEdit", function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_ID").val())
        save(row, false)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        var Id = row.find(".txt_ID").val()

        $.ajax({
            type: 'POST',
            url: '/Invoices/DeleteInvoiceHead?Id=' + Id,
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

    function save(row, IsDeleted) {

        if (row.find(".txt_ID").val() == 0 && IsDeleted == true) {
            alert('You can not delete to non existing record !!')
            return false;
        }
            else if (row.find("#txt_HeadType").val() == '') {
                alert('Please select HeadType.')
                return false;
            }
        else if (row.find("#txt_HeadName").val() == '') {
                alert('Please Enter HeadName.....')
                return false;
        }
        dataObject = []
        dataObject.push(JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsDeleted': IsDeleted,
            'HeadType': row.find("#txt_HeadType option:selected").text(),
            'HeadName': row.find("#txt_HeadName").val(),

        }));
        
            showLoader();
        fetch('/Invoices/InvoiceHead', {
                method: 'POST',
                body: dataObject,
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
            }).then(res => res.json()).then(function (response) {
                if (response.success) {
                    if (IsDeleted) {
                        row.remove();
                    }
                    else {
                        if (row.find(".txt_ID").val() == 0) {
                            $('#example').prepend(`<tr class="bg-light tbl-valign-top">
                            <td>
                                <input type="hidden" value="0" class="form-control txt_ID" />

                               <select id="txt_HeadType" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0" style="width: 200px;">
                                    <option value="">Select HeadType</option>
                                    <option value="Expense">Expense</option>
                                </select>
                            </td>
                             <td>
                                <input type="text" style="width: 350px;" value="" class="form-control" id="txt_HeadName" />
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