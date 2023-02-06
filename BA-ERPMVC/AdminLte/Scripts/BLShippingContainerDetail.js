$(document).ready(function myfunction() {

    $(document).on("click", ".btnSaveEdit", function () {
        row = $(this).closest("tr")
        if (row.find(".txt_ContainerNo").val() == '') {
            alert('Please Select Container No')
            return false;
        }

        if (row.find(".txt_sealno").val() == '') {
            alert('Please Enter Seal No')
            return false;
        }
        if (row.find(".txtkindofpack").val() == '') {
            alert('Please Enter Kind Of Goods Description')
            return false;
        }
        if (row.find(".txtGrossWeight").val() == '') {
            alert('Please Enter GrossWeight')
            return false;
        }
        if (row.find(".txtNetWeight").val() == '') {
            alert('Please Enter NetWeight')
            return false;
        }

        var containersList = row.find(".txt_ContainerNo").parent().html()
        $('#example').prepend(`<tr class="bg-light tbl-valign-top">
                                 <td style="display:none">
                                 <input type="hidden" value="0" class="form-control txt_ID" />
                                 </td>
                                 <td>
                                `+ containersList + `
                                </td>
                                <td>
                                 <input oninput="this.value= this.value.toUpperCase()" UPO type="text" style="width: 200px;" value="" class="form-control  txt_sealno" />
                                </td>
                                <td>
                                  <textarea oninput="this.value= this.value.toUpperCase()" type="text" name="txtkindofpack" class="form-control txtkindofpack"></textarea>
                                </td>
                                <td>
                                 <input oninput="this.value= this.value.toUpperCase()" type="text" name="txtGrossWeight" class="form-control txtGrossWeight">
                                </td>
                                <td>
                                 <input oninput="this.value= this.value.toUpperCase()" type="text" name="txtNetWeight" class="form-control txtNetWeight">
                                </td>
                                 <td class="btn-group">
                                <button type="button" class="btn btn-sm btn-block btn-success btn-v2 fs-8 text-nowrap mt-1 mb-0 btnSaveEdit">Save/Update</button>&ensp;
                                <button type="button" class="btn btn-sm btn-block btn-danger btn-v2 fs-8 text-nowrap mt-1 mb-0 btndlt">Delete</button>
                                </td>
                               </tr>`)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        row.remove();
    })

    //$('#example').dataTable({
    //    "paging": false
    //});

    function save(row, IsDeleted) {

        if (row.find(".txt_ID").val() == 0 && IsDeleted == true) {
            alert('You can not delete to non existing record !!')
            return false;
        }
        var containersList = row.find(".txt_ContainerNo").parent().html()
        var dataObject = JSON.stringify({
            'Id': row.find(".txt_ID").val(),
            'IsDeleted': IsDeleted,
            'Bl': row.find(".txtblNo").val(),
            'ContainerNo': row.find(".txt_ContainerNo").val(),
            'SealNo': row.find(".txt_sealno").val()
        });
        showLoader();
        fetch('/BLShippingLine/BlShippingContainerDetail', {
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
                           <td style="display:none">
                                        <input type="hidden" value="0" class="form-control txt_ID" />
                                    </td>
                                 <td>
                                `+ containersList + `
                            </td>
                                <td>
                                        <input oninput="this.value= this.value.toUpperCase()" UPO type="text" style="width: 200px;" value="" class="form-control  txt_sealno" />
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