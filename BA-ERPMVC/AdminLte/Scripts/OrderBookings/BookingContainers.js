$(document).ready(function myfunction() {

    $(document).on("click", ".btnSaveEdit", function () {
        row = $(this).closest("tr")

        if (row.find(".txt_container").val() == '') {
            alert('Please enter Container No#')
            return false;
        }
        if (row.find(".ddl_ContainerSize").val() == '') {
            alert('Please select Container Size')
            return false;
        }
        if (row.find(".txt_container_weight").val() == '') {
            alert('Please select Container Weight')
            return false;
        }
        save(row, false)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    function save(row, IsDeleted) {
        if (IsDeleted) {
            if ($('#example tbody tr').length != 1) {
                row.remove();
            }
        }
        else {
            $('#example').prepend(`<tr class="bg-light tbl-valign-top">
                         <td>
                            <input type="text" class="form-control  txt_container" />
                            <input type="hidden" class="form-control  txt_container_id" />
                        </td>
                        <td>
                            <select class="form-control form-control-v1 form-control-sm border-dark mt-1 mb-0 ddl_ContainerSize">
                                <option value="">Container Size</option>
                                    <option value="20 DR">20 DR</option>
                                    <option value="40 DR">40 DR</option>
                            </select>
                        </td>
                        <td>
                            <input type="number" class="form-control  txt_container_weight" />
                        </td>
                        <td class="btn-group">
                            <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Add/Update</button>&ensp;
                            <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                        </td>
                    </tr>`)
        }
        //if (row.find(".txt_ID").val() == 0 && IsDeleted == true) {
        //    alert('You can not delete to non existing record !!')
        //    return false;
        //}
        //var dataObject = JSON.stringify({
        //    'ShippingLineId': row.find(".txt_ID").val(),
        //    'IsDeleted': IsDeleted,
        //    'ShippingLineName': row.find(".txt_shippingline").val()

        //});
        //showLoader();
        //fetch('/DropDownMenu/ShippingLine', {
        //    method: 'POST',
        //    body: dataObject,
        //    headers: {
        //        'Content-Type': 'application/json;charset=utf-8'
        //    },
        //}).then(res => res.json()).then(function (response) {
        //    if (response.success) {
        //        if (IsDeleted) {
        //            row.remove();
        //        }
        //        else {
        //            if (row.find(".txt_ID").val() == 0) {
        //                $('#example').prepend(`<tr class="bg-light tbl-valign-top">
        //                    <td>
        //                        <input type="hidden" value="" class="form-control txt_ID" />

        //                        <input type="text" style="width: 500px;" value="" class="form-control  txt_shippingline" />
        //                    </td>


        //                    <td class="btn-group">
        //                        <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
        //                        <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
        //                    </td>
        //                </tr>`)
        //            }

        //            row.find(".txt_ID").val(response.Id)

        //        }


        //        hideLoader();
        //    }
        //    else showErrorMessage(response.message);
        //});
    }

})