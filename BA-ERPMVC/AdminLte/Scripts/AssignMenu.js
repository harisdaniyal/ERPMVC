$(document).ready(function myfunction() {

    $(document).on("click", ".btnSave", function () {
        if ($(".ddl_UserName").val() == '') {
            toastr.error('Please Select UserName')
            return false;
        }
        save()
    })

    window.onload = function () {
        let userID = getUrlParameter("userID");
        $(".ddl_UserName").val(userID)
    };

    $('#checkall').change(function () {                         /// For Checked All Checkboxes ///
        $('.IsView').prop('checked', this.checked);

        if ($('.IsView:checked').length == $('.IsView').length) {
            $('#checkall').prop('checked', true);
        }
        else {
            $('#checkall').prop('checked', false);
        }
    });

    //$('.IsView').change(function () {
        
    //});

})

$(".ddl_UserName").change(function () {

    var userID = $(".ddl_UserName").val()
    window.location.href  = "/Role/AssignMenu?userID=" + userID
});

function getUrlParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


function save() {
    var menuArray = []
    $('#tbl_Menu tbody tr').each(function (index, row) {
        menuArray.push({
            'MenuId': $(row).find(".txt_MenuId").val(),
            'IsDeleted': false,
            'IsView': $(row).find(".IsView").is(":checked"),
            'UserId': $(".ddl_UserName").val()
        });
    });

    showLoader();

    $.ajax({
        method: "POST",
        url: "/Role/AssignMenu",
        data: { UserMenuVM: menuArray },
        success: function (data) {
            if (data.success) {
                toastr.success(data.message);
                location.reload();
            } else {
                toastr.error(data.message);
            }

        }

    })
}
 