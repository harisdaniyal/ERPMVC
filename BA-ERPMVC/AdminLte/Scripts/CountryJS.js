
function editClick(id) {

    var referenceNum = id;
    window.location.href = "Index?id=" + referenceNum + "&edit=1";
}





$(document).ready(function () {
    var services = new Services();




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

        function getCountryByid(empid) {
            services.getCountryByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtCountryCode").val(data[0].Countrycode);
                $("#txtCountryName").val(data[0].CCountryName);
                $("#txtCountryPhoneCode").val(data[0].CCountryPhoneCode);
                $("#txtStatus").val(data[0].CStatus).change(); //Reading text box values using Jquery
            });
        } getCountryByid(empid);




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
                    url: "/City/AddOrEditeCountry", // Controller/View   
                    data: { //Passing data  
                        ID: empid,
                        CountryCode: $("#txtCountryCode").val(),
                        CountryName: $("#txtCountryName").val(),
                        CountryPhoneCode: $("#txtCountryPhoneCode").val(),
                        Status: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                        //   getLocDropGridDetail();
                             window.location.href = "Index";
                            
                           $("#txtCountryCode").val("");
                           $("#txtCountryName").val("");
                           $("#txtCountryPhoneCode").val("");

                                  
                  toastr.success("Country Detail has been inserted successfully");
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
else{

 $("#gridShow").removeClass("d-none");


function getCountryGride() {
        services.getCountryGride().then(function (response) {

            $('#CountryGride').dataTable().fnClearTable();
            $('#CountryGride').dataTable().fnDestroy();
            $('#CountryGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.Country,

                columns: [{
                    data: 'CCountryCode',
                    width: 10,
                }, {
                    data: 'CCountryName',
                    width: 10,
                },{
                    data: 'CCountryPhoneCode',
                    width: 10,
                },{
                    data: 'CStatus',
                    width: 10,
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
    getCountryGride();

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
        window.location.href = "/Country/Index?id=" + ID + "&edit=1";
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
            txtCountryCode: "required",
            txtCountryName: "required",
            txtCountryPhoneCode: "required"
        },
        messages: {
            txtCityCode: "*",
            txtCityName: "*",
            txtCityPhoneCode: "*"

        },
        submitHandler: function (form) {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Country/AddOrEditeCountry", // Controller/View   
                    data: { //Passing data  
                        CountryCode: $("#txtCountryCode").val(),
                        CountryName: $("#txtCountryName").val(),
                        CountryPhoneCode: $("#txtCountryPhoneCode").val(),
                        Status: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                           getCountryGride();
                            
                           $("#txtCountryCode").val("");
                           $("#txtCountryName").val("");
                           $("#txtCountryPhoneCode").val("");
                          // $("#txtCountryName").val("");

                                  
                  toastr.success("COuntry Detail has been inserted successfully");
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