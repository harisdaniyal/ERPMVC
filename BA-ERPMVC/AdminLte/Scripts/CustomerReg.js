
 




        $('#txtPhoneNO').on('keydown', function (event) {
            if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39) {
                //   ignore if BKSPCE, left arrow, or right arrow
            } else {
                //validate if anything else
                inputval = $(this).val();
                var string = inputval.replace(/[^0-9]/g, "");
                var first3 = string.substring(0, 3);
                var next3 = string.substring(3, 6);
                var next4 = string.substring(6, 10);
                var string = ("" + first3 + "-" + next3 + "-" + next4);
                $(this).val(string);
            }
        });






        $('#txtPhoneNO').keydown(function () {


            //allow  backspace, tab, ctrl+A, escape, carriage return
            if (event.keyCode == 8 || event.keyCode == 9
                || event.keyCode == 27 || event.keyCode == 13
                || (event.keyCode == 65 && event.ctrlKey === true))
                return;
            if ((event.keyCode < 48 || event.keyCode > 57))
                event.preventDefault();


            var length = $(this).val().length;


            if (length == 4)
                $(this).val($(this).val() + '-');


        });




// $(function () {
  //      $("#btnSubmit").click(function () {
    //        var ddlFruits = $("#txtCustomerType");
      //      if (ddlFruits.val() == "") {
                //If the "Please Select" option is selected display error.
        //        alert("Please select an option!");
          //      return false;
            //}
           // return true;
       // });
   // });




$(document).ready(function(){
$("#txtCustomerEmail").keyup(function() {
    $('span.error-keyup-7').remove();
    var inputVal = $(this).val();
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if(!emailReg.test(inputVal)) {
        $(this).after('<span class="error error-keyup-7">Invalid Email Format.</span>');
    }
});
    });

//$(function(){

  // var regExp = /^\w*(\.\w*)?@\w*\.[a-z]+(\.[a-z]+)?$/;
  //var regExp = /^([\w\.\+]{1,})([^\W])(@)([\w]{1,})(\.[\w]{1,})+$/;

 // $("#txtCustomerEmail").on('keyup', function() {
  //  $('.message').hide();
   // regExp.test( $(this).val() ) ? $('.message.success').show() : $('.message.error').show();
  //});

//});




 





 //$(document).ready(function () {
    $.ajax({
        type: "GET",
        url: "/Customer/GetBusinessDivision",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a BusinessDivision</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].BusinessDivisionID + '">' + data[i].BusinessDivisionName + '</option>';
            }
            $("#txtBussniessDivsion").html(s);
        }
    });
    //   });

    $.ajax({
        type: "GET",
        url: "/Customer/GetCustomerType",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a CustomerType</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CustomerID + '">' + data[i].CustomerType + '</option>';
            }
            $("#txtCustomerType").html(s);
        }
    });








function editClick(id) {

    var referenceNum = id;
    window.location.href = "CustomerRegistration?id=" + referenceNum + "&edit=1";
}


$(document).ready(function () {
    var services = new Services();


 




   



    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {
        $("#lloForm").show();

        function getCustomerbyid(empid) {
//debugger;
            services.getCustomerbyid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;

                setTimeout(function () {

                $("#txtBussniessDivsion").val(data[0].CBusinessDivision).change();
                $("#txtStatus").val(data[0].CStatus).change();
                $("#CustomerCode").val(data[0].COrder);
                $("#txtCustomerName").val(data[0].CName);
                $("#txtCustomerAddress").val(data[0].CAddress); //Reading text box values using Jquery
                $("#txtCustomerEmail").val(data[0].CEmail);
                $("#txtCustomerType").val(data[0].CType).change();
                $("#txtPhoneNO").val(data[0].CPhoneNo);
                $("#txtCountry").val(data[0].CCountry);
                $("#txtCity").val(data[0].CCity);
              },2000)


            });
        } getCustomerbyid(empid);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "CustomerRegistration";
        });



        // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
            $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Customer/AddorEditCustomer", // Controller/View   
                    data: { //Passing data  
                        CustomerID: empid,
                        CustomerCode: $("#CustomerCode").val(),
                        Customer_Name: $("#txtCustomerName").val(),
                        Customer_Address: $("#txtCustomerAddress").val(),
                        Customer_Eamil: $("#txtCustomerEmail").val(),
                        Customer_type: $("#txtCustomerType option:selected").val(), //Reading text box values using Jquery 
                        Customer_Phone_Number: $("#txtPhoneNO").val(),
                        Customer_Country: $("#txtCountry").val(),
                        Customer_City: $("#txtCity").val(),
                        BusinessDivisionID: $("#txtBussniessDivsion option:selected").val(),
                        Customer_Status: document.getElementById("txtStatus").checked

                    },
                    success: function (response) {
                        if (response.success) {

                            window.location.href = "CustomerRegistration";
                            //  $("#CustomerCode").val("");
                            $("#txtCustomerName").val("");
                            $("#txtCustomerAddress").val("");
                            $("#txtCustomerEmail").val("");
                            $("#txtCustomerType").val("-1"); //Reading text box values using Jquery 
                            $("#txtPhoneNO").val("");
                            $("#txtCountry").val("");
                            $("#txtCity").val("");
                            $("#txtBussniessDivsion").val("-1");
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



        function getCustomerGridDetail() {
            services.getCustomerGridDetail(JSON.stringify({
            })).then(function (response) {

                $('#CustomerGride').dataTable().fnClearTable();
                $('#CustomerGride').dataTable().fnDestroy();
                $('#CustomerGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": true,
                    "paging": true,
                    'searching': true,


                    data: response.Customer,

                    columns: [
                        
                        { 'data': 'COrder' },
                        { 'data': 'CName' },
                        { 'data': 'CAddress' },
                        { 'data': 'CEmail' },
                        { 'data': 'CType' },
                        { 'data': 'CPhoneNo' },
                        { 'data': 'CCountry' },
                        { 'data': 'CCity' },
                        { 'data': 'CBusinessDivision' },
                        { 'data': 'CStatus' },
                        {
                           data: 'CID',
                           width: 10,
                           "render": function (data) {
                           var html = appendActionMenu(data);
                           return html;
                           }
                         },
                        
                        { 'data': 'UserID', visible: false },
                        { 'data': 'UpdateBy', visible: false },
                        { 'data': 'CreateDate', visible: false },
                        { 'data': 'UpdateDate', visible: false },
                      
                    ],
                    buttons: []
                });

            });
        }
        getCustomerGridDetail();


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
                //'<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
                '</div>'
            //'</div>'
            return html;
        }
        $(document).on("click", "._view", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/OrderBooking?id=" + ID + "&view=0";
        });
        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/Customer/CustomerRegistration?id=" + ID + "&edit=1";
        });

      //  $(document).on("click", "._remove", function (e) {
        //    var ID = parseInt($(this).attr('data-id'));
         //   deleteLogisticDetail(ID);
       // });
//end insert query














        function getCustomerCode() {
            services.getCustomerCode(JSON.stringify({
            })).then(function (response) {
                $("#CustomerCode").val(response);

            });
        }
        getCustomerCode();




  $(document).on('click', '#_viewOrder', function () {
        $("#HideForm").addClass("d-none");
        $("#OrderTableHide").removeClass("d-none");
    });
    $(document).on('click', '#_btnBack', function () {
        $("#HideForm").removeClass("d-none");
        $("#OrderTableHide").addClass("d-none");
    });

 


        //Back Button
    //    $("#btnBack").click(function () {
            // Remove this line if it worked
      //      $("#gridShow").show();
       //     $("#lloForm").hide();
      //  });


        //Add Button
       // $("#btnADD").click(function () {
            // Remove this line if it worked
         //   $("#gridShow").hide();
          //  $("#lloForm").show();
           // getCustomerCode();
       // });







$(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });





        // Submit Button
        var toastCount = 0;

  $("#_addCustomerReg").validate({
        rules: {
            txtCustomerName: "required",
            txtCustomerAddress: "required",
            txtCustomerEmail: "required",
            txtCustomerType: { min: 1 },
            txtPhoneNO: "required",
            txtCountry: "required",
            txtCity: "required",
            txtBussniessDivsion: { min: 1} 
        },
        messages: {
            txtCustomerName: "*",
            txtCustomerAddress: "*",
            txtCustomerEmail: "*",
            txtCustomerType: "*",
            txtPhoneNO: "*",
            txtCountry: "*",
            txtCity: "*",
            txtBussniessDivsion: "*"

        },
        submitHandler: function (form){
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Customer/AddorEditCustomer", // Controller/View   
                    data: { //Passing data  
                        
                        CustomerCode: $("#CustomerCode").val(),
                        Customer_Name: $("#txtCustomerName").val(),
                        Customer_Address: $("#txtCustomerAddress").val(),
                        Customer_Eamil: $("#txtCustomerEmail").val(),
                        Customer_type: $("#txtCustomerType option:selected").val(), //Reading text box values using Jquery 
                        Customer_Phone_Number: $("#txtPhoneNO").val(),
                        Customer_Country: $("#txtCountry").val(),
                        Customer_City: $("#txtCity").val(),
                        BusinessDivisionID: $("#txtBussniessDivsion option:selected").val(),
                        Customer_Status: document.getElementById("txtStatus").checked

                    },
                            
                    success: function (response) {
                          
                if (response.success != null) {
                    if(response.success){
                        getCustomerGridDetail();
                        getCustomerCode();
                        $("#txtCustomerName").val("");
                        $("#txtCustomerAddress").val("");
                        $("#txtCustomerEmail").val("");
                        $("#txtCustomerType").val("-1").change(); //Reading text box values using Jquery 
                        $("#txtPhoneNO").val("");
                        $("#txtCountry").val("");
                        $("#txtCity").val("");
                        $("#txtBussniessDivsion").val("-1").change();
                        toastr.success("Customer Details has been inserted successfully.");
                        returncondition = true;
                     }else{
                        toastr.error("Customer Detail Already inserted.");
                        returncondition = false;
                     }
                } else {
                    toastr.error("Kindly check your Internet Connection!");
                    returncondition = false;
                }
           },
            error: function (response) {
                toastr.error("Server error,Please check your internet connection");
                }
            });
    }

    });





    }








});



