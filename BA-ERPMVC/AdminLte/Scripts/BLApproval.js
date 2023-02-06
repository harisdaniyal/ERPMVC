$(document).ready(function myfunction() {


    $(".btnSave").click(function () {
        row = $(this).closest("tr")
        console.log(row.find(".txt_approval").val())

        if (!row.find('.txt_approval').val()) {
            row.find('.txt_approval').addClass('error');
            return false;
        }

        save(row, row.find(".txt_approval").val())

    })

    function save(row, isCompleted) {

        var dataObject = JSON.stringify({
            'BLShippingID': row.find(".txt_ID").val(),
            'Approval': row.find(".txt_approval").val()
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
                row.find(".txt_approval").prop("disabled", true);
                hideLoader();
            }
            else showErrorMessage(response.message);
        });
    }
});