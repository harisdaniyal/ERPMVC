
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

        function getDesignationByid(empid) {
            services.getDesignationByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtDesignation").val(data[0].DesignationName);
               
            });
        } getDesignationByid(empid);



 //Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
window.location.href = "Index";
    });


$(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });



        // Submit Button
        var toastCount = 0;
          $("#_addCustomerReg").validate({
        rules: {
            txtDesignation: "required"
        },
        messages: {
            txtDesignation: "*"

        },
        submitHandler: function (form) {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/City/AddOrEditeDesignation", // Controller/View   
                    data: { //Passing data  
                        ID: empid,
                        Designation_Name: $("#txtDesignation").val()
                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                             window.location.href = "Index";
                            
                           $("#txtDesignation").val("");

                                  
                  toastr.success("Designation Detail has been inserted successfully");
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


function getDesignationGride() {
        services.getDesignationGride().then(function (response) {

            $('#DesignationGride').dataTable().fnClearTable();
            $('#DesignationGride').dataTable().fnDestroy();
            $('#DesignationGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.Desgnation,

                columns: [{
                    data: 'Designationname',
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
    getDesignationGride();

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
        window.location.href = "/Designation/Index?id=" + ID + "&edit=1";
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
            txtDesignation: "required"
        },
        messages: {
            txtDesignation: "*"

        },
        submitHandler: function (form) {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Country/AddOrEditeDesignation", // Controller/View   
                    data: { //Passing data  
                        Designation_Name: $("#txtDesignation").val(),
                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                           getCountryGride();
                            
                           $("#txtDesignation").val("");

                                  
                  toastr.success("Designations Detail has been inserted successfully");
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