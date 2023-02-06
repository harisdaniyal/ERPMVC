
function editClick(id) {

    var referenceNum = id;
    window.location.href = "Index?id=" + referenceNum + "&edit=1";
}





$(document).ready(function () {
    var services = new Services();


  $.ajax({
        type: "GET",
        url: "/City/GetCountry",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select a CityName</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName + '</option>';
            }
            $("#txtCountryName").html(s);
        }
 
    }, 5000);


   var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {

    $("#lloForm").show();


 //Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
   //     $("#gridShow").show();
     //   $("#lloForm").hide();
         window.location.href = "Index";
    });


        function getInvoiceByid(empid) {
            services.getInvoiceByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtCityCode").val(data[0].Citycode);
                $("#txtCityName").val(data[0].CCityName);
                $("#txtCityPhoneCode").val(data[0].CCityPhoneCode);
                $("#txtCountryName").val(data[0].CCountryName).change();
                $("#txtStatus").val(data[0].CStatus).change(); //Reading text box values using Jquery
            });
        } getInvoiceByid(empid);




$(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });



        // Submit Button
        var toastCount = 0;
          $("#_addCustomerReg").validate({
        rules: {
            txtCityCode: "required",
            txtCityName: "required",
            txtCityPhoneCode: "required",
            txtCountryName: { min: 1}
        },
        messages: {
            txtCityCode: "*",
            txtCityName: "*",
            txtCityPhoneCode: "*",
            txtCountryName: "*"

        },
        submitHandler: function (form) {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/City/AddOrEditeCity", // Controller/View   
                    data: { //Passing data  
                        CityID: empid,
                        CityCode: $("#txtCityCode").val(),
                        CityName: $("#txtCityName").val(),
                        CityPhoneCode: $("#txtCityPhoneCode").val(),
                        CountryID: $("#txtCountryName option:selected").val(),
                        Status: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                        //   getLocDropGridDetail();
                             window.location.href = "Index";
                            
                           $("#txtCityCode").val("");
                           $("#txtCityName").val("");
                           $("#txtCityPhoneCode").val("");
                           $("#txtCountryName").val("");

                                  
                  toastr.success("City Detail has been inserted successfully");
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
///



//$("#DX").removeClass("d-none");



}
else{

 $("#gridShow").removeClass("d-none");
//$("#DX").removeClass("d-none");

function getCityGride() {
        services.getCityGride().then(function (response) {

            $('#CityGride').dataTable().fnClearTable();
            $('#CityGride').dataTable().fnDestroy();
            $('#CityGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.City,

                columns: [{
                    data: 'Citycode',
                    width: 10
                }, {
                    data: 'CCityName',
                    width: 10
                },{
                    data: 'CCityPhoneCode',
                    width: 10
                },{
                    data: 'CCountryName',
                    width: 10
                },{
                    data: 'CStatus',
                    width: 10 
                },{
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
    getCityGride();

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
        window.location.href = "/City/Index?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._remove", function (e) {
        var ID = $(this).attr('data-id');
        deleteUserDetail(ID);
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



        





$(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });



        // Submit Button
        var toastCount = 0;
          $("#_addCustomerReg").validate({
        rules: {
            txtCityCode: "required",
            txtCityName: "required",
            txtCityPhoneCode: "required",
            txtCountryName: { min: 1}
        },
        messages: {
            txtCityCode: "*",
            txtCityName: "*",
            txtCityPhoneCode: "*",
            txtCountryName: "*"

        },
        submitHandler: function (form) {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/City/AddOrEditeCity", // Controller/View   
                    data: { //Passing data  
                        CityCode: $("#txtCityCode").val(),
                        CityName: $("#txtCityName").val(),
                        CityPhoneCode: $("#txtCityPhoneCode").val(),
                        CountryID: $("#txtCountryName option:selected").val(),
                        Status: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                        //   getLocDropGridDetail();
                            getCityGride();
                           $("#txtCityCode").val("");
                           $("#txtCityName").val("");
                           $("#txtCityPhoneCode").val("");
                           $("#txtCountryName").val("");

                                  
                  toastr.success("City Detail has been inserted successfully");
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
///

}


});