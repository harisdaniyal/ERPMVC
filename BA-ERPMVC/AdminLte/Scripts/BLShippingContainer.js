$(document).ready(function myfunction() {
    var dataObject = []
    $(document).on("click", ".btnSaveEdit", function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_ID").val())
        save(row, false)

    })

    $(document).on("click", ".btndlt", function () {
        var row = $(this).closest("tr")
        save(row, true)
    })

    function save(row, IsDeleted) {

        if (row.find(".txt_ID").val() == 0 && IsDeleted == true) {
            alert('You can not delete to non existing record !!')
            return false;
        }
        else if (row.find(".txt_ContainerType").val() == '' ) {
            alert('Please select Container Type.')
            return false;
        }
        else if (row.find(".txt_ContainerSize").val() == '') {
            alert('Please select Container Size.')
            return false;
        }

        dataObject = []
        dataObject.push(JSON.stringify({
            'ID': row.find(".txt_ID").val(),
            'IsDeleted': IsDeleted,
            'ContainerNo': row.find(".txt_containerno").val(),
            'ContainerType': row.find(".txt_ContainerType").val(),
            'ContainerSize': row.find(".txt_ContainerSize").val()
        }));

        showLoader();
        fetch('/DropDownMenu/BLShippingContainer', {
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
                        $('#example tbody').prepend(` <tr class="bg-light tbl-valign-top">` + row.html().trim() + ` </tr>`)
                    }
                    row.find(".txt_ID").val(response.Id)

                }


                hideLoader();
            }
            else showErrorMessage(response.message);
        });
    }

})