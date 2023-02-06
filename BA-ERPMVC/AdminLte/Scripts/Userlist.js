$(document).ready(function myfunction() {

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
            url: '/Setup/DeleteUser?Id=' + Id,
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
        else if (row.find(".txt_UserName").val() == '') {
            toastr.error('Please Enter User Name !!')
            return false;
        }
        else if (row.find(".txt_Cnic").val() == '') {
            toastr.error('Please Enter CNIC Number !!')
            return false;
        }
        var dataObject = JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsDeleted': IsDeleted,
            'UserName': row.find(".txt_UserName").val(),
            'CNIC': row.find(".txt_Cnic").val()
        });
        showLoader();
        fetch('/Setup/UserAsync', {
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
                                <input type="text" style="width: 250px;" value="" class="form-control txt_UserName" />
                            </td>
                            <td>
                                <input type="text" style="width: 250px;" value="" class="form-control txt_Cnic" />
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
                toastr.success("User Detail Has Been Saved Successfully..")

            }
            else showErrorMessage(response.message);
        });
    }

})