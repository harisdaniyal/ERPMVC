



$(document).ready(function(){
var services = new Services(); 



  $("#gridShow").removeClass("d-none");

function getBussinessDivisonGride() {
        services.BussinessDivisonGride().then(function (response) {

            $('#BusGride').dataTable().fnClearTable();
            $('#BusGride').dataTable().fnDestroy();
            $('#BusGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.Division,

                columns: [{
                    data: 'BCode',
                    width: 10
                }, {
                    data: 'BName',
                    width: 10
                },{
                    data: 'BCompany',
                    width: 10
                }, {
                    data: 'ID',
                    width: 5,
                    "render": function (data) {
                        var html = appendActionMenu(data);
                        return html;
                    }

                }],
                buttons: []
            });

        });
    }
    getBussinessDivisonGride();

    function appendActionMenu(id) {
        var html =
            //'<div class="dropdown">' +
            //    '<a class="dropdown-toggle"  href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >' +
            //        '<span class="vertical-icon"></span>' +
            //        //'<span class="fa fa-ellipsis-v"></span>' +
            //    '</a>' +
            '<div class="row" style="margin-left:4px;">' +

            '<a data-id="' + id + '" class="p-1 fa fa-eye _view" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
            '</div>'
        //'</div>'
        return html;
    }
    $(document).on("click", "._view", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "/Account/Register?id=" + ID + "&edit=0";
    });
    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "/CustomerPrice/Customer?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._remove", function (e) {
        var ID = $(this).attr('data-id');
        deleteUserDetail(ID);
    });






   $.ajax({
        type: "GET",
        url: "/DropDownMenu/GetCustomerName",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a CustomerName</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName + '</option>';
            }
            $("#txtCustomerName").html(s);
        }
    });







 //Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
    });




 //Add Button
    $("#btnADD").click(function () {
        // Remove this line if it worked
        $("#gridShow").hide();
        $("#lloForm").show();
    });





// start

$(document).on('click', '#btnSubmit', function () {
            $("#_addBussinessDivison").valid();
        });



        // Submit Button
        var toastCount = 0;
          $("#_addBussinessDivison").validate({
        rules: {
            txtbusDivisonCode: "required",
            txtbusDivisonName: "required",
            txtCustomerName: { min: 1} 
        },
        messages: {
            txtbusDivisonCode: "*",
            txtbusDivisonName: "*",
            txtCustomerName: "*"

        },
        submitHandler: function (form) {
         //  ValidateAll();
           //                return false;
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/BusinessDivision/AddOrEditeBusinessDivision", // Controller/View   
                    data: { //Passing data  
                        BusinessDivisionCode: $("#txtbusDivisonCode").val(),
                        BusinessDivisionName: $("#txtbusDivisonName").val(),
                        CompanyID: $("#txtCustomerName option:selected").val(),

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                           getBussinessDivisonGride();
                            
                           $("#txtCustomerName").val("-1");
                           $("#txtbusDivisonCode").val("");
                           $("#txtbusDivisonName").val("");

                                  
                  toastr.success("BusinessDivision Detail has been inserted successfully");
                } else {
                    // DoSomethingElse()
                    toastr.warn("Kindly Check Your Detail");
                }
           },
            error: function (response) {
                toastr.error("Server error,Please check your internet connection");
                }
            });
    }

    });
// END




});