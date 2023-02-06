








function editClick(id) {

    var referenceNum = id;
    window.location.href = "Facility?id=" + referenceNum + "&edit=1";
}







$(document).ready(function () {
    var services = new Services();



var empid = $.url().param("id");
var isEdit = $.url().param("edit");
if (isEdit == 1) {
    $("#lloForm").show();

  function getFacilityDropbyid(empid) {
            services.getFacilityDropbyid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtFacilityName").val(data[0].FNAME);
                $("#txtStatus").val(data[0].FActive).change();
            });
        } getFacilityDropbyid(empid);




        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "Facility";
        });


  // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
         //  ValidateAll();
           //                return false;
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/DropDownMenu/AddOrEditeFacilityDropDown", // Controller/View   
                    data: { //Passing data  
                        facilityID: empid,
                        FacilityName: $("#txtFacilityName").val(),
                        isActive: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                            window.location.href = "Facility";
                            $("#txtFacilityName").val("");
                           
                            var shortCutFunction = "success";
                            
                            var msg = response.responseText;
                            var title = $('#title').val() || '';
                            var $showDuration = 300;
                            var $hideDuration = 1000;
                            var $timeOut = 5000;
                            var $extendedTimeOut = 1000;
                            var $showEasing = "swing";
                            var $hideEasing = "linear";
                            var $showMethod = "fadeIn";
                            var $hideMethod = "fadeOut";
                            var toastIndex = toastCount++;
                            var addClear = $('#addClear').prop('checked');
                              

                            toastr.options = {
                                closeButton: $('#closeButton').prop('checked'),
                                debug: $('#debugInfo').prop('checked'),
                                newestOnTop: $('#newestOnTop').prop('checked'),
                                progressBar: true,
                                rtl: $('#rtl').prop('checked'),
                                positionClass: "toast-bottom-right",
                                preventDuplicates: $('#preventDuplicates').prop('checked'),
                                onclick: null
                            };

                            var $toast = toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists
                            $toastlast = $toast;

                            if (typeof $toast === 'undefined') {
                                return;

                                  
                            }
                        } else {
                            DoSomethingElse()
                            var shortCutFunction = "warning";
                            var msg = response.responseText;
                            var title = $('#title').val() || '';
                            var $showDuration = 300;
                            var $hideDuration = 1000;
                            var $timeOut = 5000;
                            var $extendedTimeOut = 1000;
                            var $showEasing = "swing";
                            var $hideEasing = "linear";
                            var $showMethod = "fadeIn";
                            var $hideMethod = "fadeOut";
                            var toastIndex = toastCount++;
                            var addClear = $('#addClear').prop('checked');

                            toastr.options = {
                                closeButton: $('#closeButton').prop('checked'),
                                debug: $('#debugInfo').prop('checked'),
                                newestOnTop: $('#newestOnTop').prop('checked'),
                                progressBar: true,
                                rtl: $('#rtl').prop('checked'),
                                positionClass: "toast-bottom-right",
                                preventDuplicates: $('#preventDuplicates').prop('checked'),
                                onclick: null
                            };

                            var $toast = toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists
                            $toastlast = $toast;

                            if (typeof $toast === 'undefined') {
                                return;
                            }
                        }
                    },
                    error: function (response) {
                        var shortCutFunction = "error";
                        var msg = "Error: Contact Your Developer";
                        var title = $('#title').val() || '';
                        var $showDuration = 300;
                        var $hideDuration = 1000;
                        var $timeOut = 5000;
                        var $extendedTimeOut = 1000;
                        var $showEasing = "swing";
                        var $hideEasing = "linear";
                        var $showMethod = "fadeIn";
                        var $hideMethod = "fadeOut";
                        var toastIndex = toastCount++;
                        var addClear = $('#addClear').prop('checked');

                        toastr.options = {
                            closeButton: $('#closeButton').prop('checked'),
                            debug: $('#debugInfo').prop('checked'),
                            newestOnTop: $('#newestOnTop').prop('checked'),
                            progressBar: true,
                            rtl: $('#rtl').prop('checked'),
                            positionClass: "toast-bottom-right",
                            preventDuplicates: $('#preventDuplicates').prop('checked'),
                            onclick: null
                        };

                        var $toast = toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists
                        $toastlast = $toast;

                        if (typeof $toast === 'undefined') {
                            return;
                        }
                    }

                });

        });
///







    





    }
    else
{

  $("#gridShow").removeClass("d-none");

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

  function getFacilityDropGridDetail() {
            services.getFacilityDropGridDetail(JSON.stringify({
            })).then(function (response) {

                $('#FacilityGride').dataTable().fnClearTable();
                $('#FacilityGride').dataTable().fnDestroy();
                $('#FacilityGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,


                    data: response.FacDrop,

                    columns: [
                         {
                            "render": function (data, type, FacDrop, row) {


                                return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + FacDrop.ID + ')" >Edit</button>';
                            }
                        },
                        //{'data': 'ID'},
                        { 'data': 'FNAME'},
                        { 'data': 'FActive'},
                    ],
                    buttons: []
                });

            });
        }
        getFacilityDropGridDetail();









        // Submit Button
        var toastCount = 0;


 $("#_addCustomerReg").validate({
        rules: {
            txtFacilityName: "required"
        },
        messages: {
            txtFacilityName: "*"

        },
       submitHandler: function (form) {
         //  ValidateAll();
           //                return false;
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/DropDownMenu/AddOrEditeFacilityDropDown", // Controller/View   
                    data: { //Passing data  
                        FacilityName: $("#txtFacilityName").val(),
                        isActive: document.getElementById("txtStatus").checked
                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                            getFacilityDropGridDetail();
                            $("#txtFacilityName").val("");
                           
                                       toastr.success("Customer Detail has been inserted successfully");
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








              
// });







}
    
    
});





   
                