$(document).ready(function myfunction() {

    $(document).on("click", ".btnSaveEdit", function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_ID").val())
        save(row, false)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    $('#example').dataTable({
        "paging": true
    });

    function save(row, IsDeleted) {

        if (row.find(".txt_ID").val() == 0 && IsDeleted == true) {
            alert('You can not delete to non existing record !!')
            return false;
        }
        var dataObject = JSON.stringify({
            'ShippingAgentId': row.find(".txt_ID").val(),
            'IsDeleted': IsDeleted,
            'Name': row.find(".txt_shippingagent").val()

        });
        showLoader();
        fetch('/DropDownMenu/ShippingAgent', {
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
                                <input type="hidden" value="" class="form-control txt_ID" />

                                <input type="text" style="width: 500px;" value="" class="form-control  txt_shippingagent" />
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
            }
            else showErrorMessage(response.message);
        });
    }

})