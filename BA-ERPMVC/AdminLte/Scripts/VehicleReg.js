







/*

$("#txtEngineNo").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });


$("#txtChassisNo").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg1").html("Chasses No Only").show().fadeOut("slow");
               return false;
    }
   });

*/




 

function editClick(id) {

    var referenceNum = id;
    window.location.href = "VehicleRegistration?id=" + referenceNum + "&edit=1";
}



/// service 




$(document).ready(function () {
    var services = new Services();



// function myFunction() {
//$(function() {
  // Cache fields that you want to validate
 // var $fieldsToCheck = $('.registration-form .form-control');
   
  
  // Function to ensure fields are not empty
 // var checkFields = function() {
    // Get array of empty fields
   // var emptyFields = $fieldsToCheck.map(function() {
    //  return this.value;
   // }).get().filter(function(val) {
    //  return val.length === 0;
   // });
    
    // Disabled prop to be toggled based on length of empty fields
  //  $("#btnSubmit").prop('disabled', !!emptyFields.length);
 // };

  // Bind onInput event to all inputs you want to check
  //$fieldsToCheck.on('input', checkFields);

//}myFunction();


 




    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "/DropDown/GetVechicleType",
            data: "{}",
            success: function (data) {
                var s = '<option value="-1">Please Select a VehicleType</option>';
                for (var i = 0; i < data.length; i++) {
                    s += '<option value="' + data[i].VehicleTypeID + '">' + data[i].VehicleTypeDesc + '</option>';
                }
                $("#txtVehicleType").html(s);
            }
        });
    });

    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {
        $("#lloForm").show();

        function getVechialbyid(empid) {
            services.getVechialbyid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtVehicleNo").val(data[0].VNUMBER);
                $("#txtVehicleType").val(data[0].VTYPE).change();
                $("#txtEngineNo").val(data[0].VENGINE);
                $("#txtChassisNo").val(data[0].VCHASSIS);
                $("#txtVehicleName").val(data[0].VNAME);
                $("#txtStatus").val(data[0].VSTATUS).change();
            });
        } getVechialbyid(empid);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "VehicleRegistration";
        });



  // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
            $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/BVMS/AddorEditVehicle", // Controller/View   
                    data: { //Passing data  
                       VehicleID: empid,
                       Vehicle_Number: $("#txtVehicleNo").val(),
                       VehicleTypeID: $("#txtVehicleType option:selected").val(), //Reading text box values using Jquery  
                        /* 
                       VehicleEngineNo: parseInt(document.getElementById("txtEngineNo").value),
                       VehicleChassisNO: parseInt(document.getElementById("txtChassisNo").value), //Reading text box values using Jquery   
                        */
                        VehicleEngineNo: $('#txtEngineNo').val(),
                        VehicleChassisNO: $('#txtChassisNo').val(),
                        VehicleName: $('#txtVehicleName').val(),
                      
                       IsActive: document.getElementById("txtStatus").checked


                    },
                    success: function (response) {
                        if (response.success) {
                            window.location.href = "VehicleRegistration";
                            $("#txtVehicleNo").val("");
                            $("#txtVehicleType").val("-1");
                            $("#txtEngineNo").val("");
                            $("#txtChassisNo").val("");
                            $("#txtVehicleName").val("");
                            $("#txtStatus").val("-1");

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




      

    }
    else {
        $("#gridShow").removeClass("d-none");

// demo 

        function getVechialGridDetail() {
            services.getVechialGridDetail(JSON.stringify({
            })).then(function (response) {

                $('#VechialGride').dataTable().fnClearTable();
                $('#VechialGride').dataTable().fnDestroy();
                $('#VechialGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,


                    data: response.Vechial,

                    columns: [
                        {
                            "render": function (data, type, VehicleRegistrationDetails, row) {


                                return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + VehicleRegistrationDetails.VID + ')" >Edit</button>';
                            }
                        },

                        { 'data': 'VID', visible: false },
                        { 'data': 'VNUMBER' },
                        { 'data': 'VTYPE' },
                        { 'data': 'VENGINE' },
                        { 'data': 'VCHASSIS' },
                        { 'data': 'VNAME' },
                        { 'data': 'VSTATUS' },
                        { 'data': 'VUserID', visible: false },
                        { 'data': 'VUpdateBy', visible: false},
                        { 'data': 'VCreate', visible: false},
                        { 'data': 'VUpdateDate', visible: false },
                    ],
                    buttons: []
                });

            });
        }
        getVechialGridDetail();


    //Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
    });


    //Stylish Dropdown
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        

        $('.my-colorpicker2').on('colorpickerChange', function (event) {
            $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
        });

        $("input[data-bootstrap-switch]").each(function () {
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

    });


    //Add Button
    $("#btnADD").click(function () {
        // Remove this line if it worked
        $("#gridShow").hide();
        $("#lloForm").show();
    });


    //Function For UpperCase
    $(document).on('keyup', 'input', function (e) {
        if (e.target.id == 'pass1' || e.target.id == 'pass2') {

        }
        else {
            makeUpperCase(e);
        }
    });
    $(document).on('keyup', 'textarea', function (e) {
        if (e.target.id == 'pass1' || e.target.id == 'pass2') {

        }
        else {
            makeUpperCase(e);
        }
    });
    function makeUpperCase(e) {
        const cursorStart = e.target.selectionStart;
        const cursorEnd = e.target.selectionEnd;
        e.target.value = e.target.value.toUpperCase();
        e.target.setSelectionRange(cursorStart, cursorEnd);
    }



   

  // Submit Button
        var toastCount = 0;
 $("#_addCustomerReg").validate({
        rules: {
            txtVehicleNo: "required",
            txtVehicleType: { min: 1 },
            txtEngineNo: "required",
            txtChassisNo: "required",
            txtVehicleName: "required"
        },
        messages: {
            txtVehicleNo: "*",
            txtVehicleType: "*",
            txtEngineNo: "*",
            txtChassisNo: "*",
            txtVehicleName: "*"

        },
        submitHandler: function (form){
            $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/BVMS/AddorEditVehicle", // Controller/View   
                    data: { //Passing data  
                         Vehicle_Number: $("#txtVehicleNo").val(),
                         VehicleTypeID: $("#txtVehicleType option:selected").val(), //Reading text box values using Jquery   
                         VehicleEngineNo: $("#txtEngineNo").val(),
                        VehicleChassisNO: $("#txtChassisNo").val(), //Reading text box values using Jquery   
                        VehicleName: $('#txtVehicleName').val(),
                           IsActive: document.getElementById("txtStatus").checked


                    },
                    success: function (response) {
                        if (response.success) {
                            $("#txtVehicleType").val("-1");
                            getVechialGridDetail();
                            $("#txtVehicleNo").val("");
                            $("#txtEngineNo").val("");
                            $("#txtChassisNo").val("");
                            $("#txtVehicleName").val("");

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










// demo end 







      




      


    }








});
