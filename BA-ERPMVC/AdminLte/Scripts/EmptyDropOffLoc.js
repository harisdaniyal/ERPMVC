







var delay = 5;
setTimeout(delay * 2000);



function editClick(id) {

    var referenceNum = id;
    window.location.href = "EmptyDropOffLoc?id=" + referenceNum + "&edit=1";
}




$(document).ready(function () {
    $('.row').hover(
        function () {
            $(this).children('.form-group')
                .delay(1000) // set duration of delay in milliseconds here
                .slideDown(200);
        },
        function () {
            $(this).children('.form-group')
                .clearQueue()
                .slideUp(0);
        })
});






$(document).ready(function () {
    var services = new Services();



    //$.ajax({
    //    type: "GET",
    //    url: "/DropDownMenu/GetCustomerName",
    //    data: "{}",
    //    success: function (data) {
    //        var s = '<option value="-1">Please Select a CustomerName</option>';
    //        for (var i = 0; i < data.length; i++) {
    //            s += '<option value="' + data[i].CID + '">' + data[i].CName + '</option>';
    //        }
    //        $("#txtCustomerName").html(s);
    //    }
    //});

    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {
        $("#lloForm").show();

        function getLocDropbyid(empid) {
            services.getEmptyDropOffLocById(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtfromLoc").val(data[0].FromLoc).delay(100);
                // $("#txtCustomerName").val(data[0].CompanyID).change().delay(100);
            });

        }
        getLocDropbyid(empid);


        //$.ajax({
        //    type: "GET",
        //    url: "/DropDownMenu/GetCustomerName",
        //    data: "{}",
        //    success: function (data) {
        //        var s = '<option value="-1">Please Select a CustomerName</option>';
        //        for (var i = 0; i < data.length; i++) {
        //            s += '<option value="' + data[i].CID + '">' + data[i].CName + '</option>';
        //        }
        //        $("#txtCustomerName").html(s);
        //        //setTimeout(4000);
        //    }

        //}, 5000);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "EmptyDropOffLoc";
        });


        // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
            //  ValidateAll();
            //                return false;
            $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/DropDownMenu/AddOrEditEmptyDropOffLocation", // Controller/View
                    data: { //Passing data  
                        ID: empid,
                        LocationName: $("#txtfromLoc").val(),
                        //CompanyID: $("#txtCustomerName option:selected").val(),
                    },

                    success: function (response) {

                        if (response.success) {
                            window.location.href = "EmptyDropOffLoc";
                            $("#txtfromLoc").val("");
                            //$("#txtCustomerName").val("-1");

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
    else {

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

        function getLocDropGridDetail() {
            services.getEmptyDropOffLoc(JSON.stringify({
            })).then(function (response) {

                $('#LocGride').dataTable().fnClearTable();
                $('#LocGride').dataTable().fnDestroy();
                $('#LocGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,


                    data: response.LocDrop,

                    columns: [
                        {
                            "render": function (data, type, FromLocOil, row) {


                                return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + FromLocOil.ID + ')" >Edit</button>';
                            }
                        },
                        { 'data': 'ID', visible: false },
                        { 'data': 'FromLoc' },
                        // { 'data': 'CompanyID' },
                    ],
                    buttons: []
                });

            });
        }
        getLocDropGridDetail();






        $(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });



        // Submit Button
        var toastCount = 0;
        $("#_addCustomerReg").validate({
            rules: {
                txtfromLoc: "required",
                //txtCustomerName: { min: 1 }
            },
            messages: {
                txtfromLoc: "*",
                //txtCustomerName: "*"

            },
            submitHandler: function (form) {
                //  ValidateAll();
                //                return false;
                $.ajax(
                    {
                        type: "POST", //HTTP POST Method  
                        url: "/DropDownMenu/AddOrEditEmptyDropOffLocation", // Controller/View
                        data: { //Passing data  
                            LocationName: $("#txtfromLoc").val(),
                            //CompanyID: $("#txtCustomerName option:selected").val(),

                        },

                        success: function (response) {

                            if (response.success) {
                                getLocDropGridDetail();

                                //$("#txtCustomerName").val("-1");
                                $("#txtfromLoc").val("");


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






