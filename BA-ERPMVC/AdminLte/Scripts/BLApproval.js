$(document).ready(function myfunction() {
    $(".btnSaveEdit").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_ID").val())
        save(row, false)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        save(row, true)
    })



    function save(row, isCompleted) {

        if (!row.find('.txt_SealNo').val()) {
            row.find('.txt_SealNo').addClass('error');
            return false;
        }
        var dataObject = JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsCompleted': isCompleted,
            'BLnumber': row.find(".txt_BLnumber").val(),
            'ContainerNo': row.find(".txt_ContainerNo").val(),
            'SealNo': row.find(".txt_SealNo").val(),
            'Approval': $("#txt_approval option:selected").val(),



        });
        showLoader();
        fetch('/BLShippingLine/BLApproval', {
            method: 'POST',
            body: dataObject,
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
        }).then(res => res.json()).then(function (response) {
            if (response.success) {
                if (IsCompleted) {
                    //row.remove();
                }
                else {
                    if (row.find(".txt_ID").val() == 0) {
                        $('#example').prepend(`<tr class="bg-light tbl-valign-top">
                           
                            
                            <td>
                                <input type="hidden" value="" class="form-control txt_ID" />
                                
                            </td>
                          
                            <td>
                                <input type="text" disabled style="width: 500px;" value="" class="form-control  txt_SealNo" />
                            </td>
                            <td>
                                <select id="txt_approval" class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0 txt_approval" style="width: 100px;">
                                    <option value="">Approval</option>
                                    <option value="ACCEPTED">ACCEPTED</option>
                                    <option value="REJECTED">REJECTED</option>
                                </select>
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
});