   
// function isNumberKey(evt)
  //            {
    //             var charCode = (evt.which) ? evt.which : event.keyCode
      //           if (charCode > 31 && (charCode < 48 || charCode > 57))
        //            return true;

          //       return false;
            //  }

    function editClick(id) {
 
            var referenceNum =id;
           window.location.href = "EmployeeDetails?id=" + referenceNum + "&edit=1";
             }



$(document).ready(function () {
      var services = new Services();  



  
    
    
function getDepartmentDetail() {
        services.getDepartmentDetail(JSON.stringify({
        })).then(function (data) {
                var s = '<option value="-1">Please Select a Company</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].DepartmentID + '">' + data.result[i].DepartmentName + '</option>';
                }
                $("#ddlDepName").html(s);
            });
            }getDepartmentDetail();
function getDesigantionDetail() {
        services.getDesigantionDetail(JSON.stringify({
        })).then(function (data) {
                var s = '<option value="-1">Please Select a Company</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].DesignationID + '">' + data.result[i].DesignationName + '</option>';
                }
                $("#ddlDesignation").html(s);
            });
        }getDesigantionDetail();
 function getCompanyDetail() {
        services.getcompanyDetail(JSON.stringify({
        })).then(function (data) {
                var s = '<option value="-1">Please Select a Company</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].CompanyID + '">' + data.result[i].CompanyName + '</option>';
                }
                $("#ddlCmpName").html(s);
            });
            }getCompanyDetail();

 //$('#txtEmpPhno').keydown(function () {

        //allow  backspace, tab, ctrl+A, escape, carriage return
   //     if (event.keyCode == 8 || event.keyCode == 9
     //       || event.keyCode == 27 || event.keyCode == 13
       //     || (event.keyCode == 65 && event.ctrlKey === true))
       //     return;
       // if ((event.keyCode < 48 || event.keyCode > 57))
        //    event.preventDefault();

      //  var length = $(this).val().length;

        //if (length == 4)
         //   $(this).val($(this).val() + '-');

    //});
      //$('#txtEmpPhnoopt').keydown(function () {

        //allow  backspace, tab, ctrl+A, escape, carriage return
        //if (event.keyCode == 8 || event.keyCode == 9
          //  || event.keyCode == 27 || event.keyCode == 13
            //|| (event.keyCode == 65 && event.ctrlKey === true))
          //  return;
        //if ((event.keyCode < 48 || event.keyCode > 57))
          //  event.preventDefault();

//        var length = $(this).val().length;

  //      if (length == 4)
    //        $(this).val($(this).val() + '-');

    //});

var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
if (isEdit == 1) {
      $("#lloForm").show();
  
    
    function getEmployeebyid(empid)
     {
            services.getEmployeebyid(JSON.stringify({
            id : empid
            })).then(function(response){ 
                var data = response.result;
                $("#ddlDepName").val(data[0].DeptName).change();
                $("#ddlCmpName").val(data[0].CmpName).change();//Reading text box values using Jquery
                $("#txtEmpPhno").val(data[0].EmpPhoneNo).change();
                $("#ddlDesignation").val(data[0].design).change();
                $("#ddlgender").val(data[0].gender).change();
                   $("#Code").val(data[0].Ecode);
                 $("#txtFirstName").val(data[0].FirstName);
                 $("#txtLastName").val(data[0].LastName); //Reading text box values using Jquery
                 $("#txtEmpCnic").val(data[0].cnic);
                $("#txtEDoj").val(data[0].Doj);
           
                $("#txtEmpPhnoopt").val(data[0].EmpPhoneNoopt);
                $("#txtemail").val(data[0].emailaddress);
                $("#txtAddress").val(data[0].address);
                $("#txtEDob").val(data[0].dob);
                $("#ddlstatus").val(data[0].status).change();
                
                  });
          }getEmployeebyid(empid);
                   

    $("#btnBack").click(function () {
        // Remove this line if it worked
        window.location.href = "EmployeeDetails";
    });

    var toastCount = 0;
    $("#btnSubmit").click(function () {
          $.ajax({
            type: "POST", //HTTP POST Method
            url: "/HumanResourceManagment/AddorEditEmployee", // Controller/View
            dataType: "json",
            data: { //Passing data
                EmployeeID:  empid,
                Empcode:$("#Code").val(),
                Employee_FirstName: $("#txtFirstName").val(),
                Employee_LastName: $("#txtLastName").val(), //Reading text box values using Jquery
                Cnic: $("#txtEmpCnic").val(),
                Date_Of_Joining: $("#txtEDoj").val(),
                DeptID: $("#ddlDepName option:selected").val(),
                CompanyId: $("#ddlCmpName option:selected").val(),//Reading text box values using Jquery
                EmpPhoneno: $("#txtEmpPhno").val(),
                DesignationId: $("#ddlDesignation option:selected").val(),
                Gender: $("#ddlgender option:selected").val(),
                Empphonenoopt: $("#txtEmpPhnoopt").val(),
                EmailAddress: $("#txtemail").val(),
                Address: $("#txtAddress").val(),
                Date_Of_Birth: $("#txtEDob").val(),
                MaritalStatus: $("#ddlstatus").val()
                
            }, success: function (response) {
                if (response.success) {
                    
                    window.location.href = "EmployeeDetails";
                    $("#ddlgender").val("-1").change();
                    $("#ddlDesignation").val("-1").change();
                    $("#ddlstatus").val("-1").change();
                    $("#ddlDepName").val('-1').change();
                    $("#ddlCmpName").val("-1").change();
                    $("#txtFirstName").val("");
                    $("#txtLastName").val(""); //Reading text box values using Jquery
                    $("#txtEmpCnic").val("");
                    $("#txtEDoj").val("");
                    $("#txtEmpPhno").val("");
                    $("#txtEmpPhnoopt").val("");
                    $("#txtemail").val("");
                    $("#txtEDob").val("");
                    $("#txtAddress").val("");
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
                    // DoSomethingElse()
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

else 
{
  $("#gridShow").removeClass("d-none");    

$("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
    });
 //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()

        //Date range picker
        $('#reservationdate').datetimepicker({
            format: 'L'
        });
        $('#reservationdate1').datetimepicker({
            format: 'L'
        });
        $('#reservationdate2').datetimepicker({
            format: 'L'
        });
         $("#btnADD").click(function () {
                // Remove this line if it worked
                $("#gridShow").hide();
                $("#lloForm").show();
                getEmpCode();
            });

        function getHRMGridDetail() {
        services.getHRMGridDetail(JSON.stringify({
        })).then(function (response) {            
            
            $('#Employeegrid').dataTable().fnClearTable();
            $('#Employeegrid').dataTable().fnDestroy();
             $('#Employeegrid').dataTable({
                
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,
                
                
                data: response.employee,

                columns: [
                {
                    "render": function (data, type, Employee, row) {

                        return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + Employee.EID + ')" >Edit</button>';
                    }
                },
                { 'data': 'EID', visible:false },
                { 'data': 'Ecode'},
                { 'data': 'FirstName' },
                { 'data': 'LastName' },
                { 'data': 'status' },
               
                { 'data': 'cnic' },
                { 'data': 'Doj' },
                { 'data': 'DeptName' },
                { 'data': 'CmpName' },
                { 'data': 'design' },
                { 'data': 'EmpPhoneNo' },
                { 'data': 'EmpPhoneNoopt' },
                { 'data': 'emailaddress' },
                { 'data': 'address' }
                
            ],
                buttons: []
            });

        });
    }
    getHRMGridDetail();


   // $('#txtEmpCnic').keydown(function () {

        //allow  backspace, tab, ctrl+A, escape, carriage return
     //   if (event.keyCode == 8 || event.keyCode == 9
       //     || event.keyCode == 27 || event.keyCode == 13
         //   || (event.keyCode == 65 && event.ctrlKey === true))
          //  return;
        //if ((event.keyCode < 48 || event.keyCode > 57))
          //  event.preventDefault();

       // var length = $(this).val().length;

       // if (length == 5 || length == 13)
         //   $(this).val($(this).val() + '-');

 //   });
   

   
   

function getEmpCode() {
        services.getEmpCode(JSON.stringify({
        })).then(function (response) {            
            $("#Code").val(response);   
                    
        });
    }
// start
$(document).on('click', '#btnSubmit', function () {
            $("#_addEmployeeDetails").valid();
        });



        // Submit Button
        var toastCount = 0;
          $("#_addEmployeeDetails").validate({
        rules: {
            txtFirstName: "required",
         //   txtLastName: "required",
            txtEmpCnic: "required",
            txtEDoj: "required",
           // txtAddress: "required",
          //  txtEDob: "required",
            txtDepName: { min: 1}, 
            txtCmpName: { min: 1}, 
            txtDesignation: { min: 1}, 
            //ddlgender: { min: 1},
           // ddlstatus: {min : 1}

        },
        messages: {
            txtFirstName: "*",
           // txtLastName: "*",
            txtEmpCnic: "*",
            txtEDoj: "*",
          //  txtAddress: "*",
            //txtEDob: "*",
            txtDepName: "*",
            txtCmpName: "*",
            txtDesignation: "*",
          //  ddlgender: "*",
           // ddlstatus: "*"

        },
        submitHandler: function (form) {
               

         $.ajax({
            type: "POST", //HTTP POST Method
            url: "/HumanResourceManagment/AddorEditEmployee", // Controller/View
            dataType: "json",
            data: { //Passing data
                Empcode:$("#Code").val(),
                Employee_FirstName: $("#txtFirstName").val(),
                Employee_LastName: $("#txtLastName").val(), //Reading text box values using Jquery
                Cnic: $("#txtEmpCnic").val(),
                Date_Of_Joining: $("#txtEDoj").val(),
                DeptID: $("#ddlDepName option:selected").val(),
                CompanyId: $("#ddlCmpName option:selected").val(),//Reading text box values using Jquery
                EmpPhoneno: $("#txtEmpPhno").val(),
                DesignationId: $("#ddlDesignation option:selected").val(),
                Gender: $("#ddlgender option:selected").val(),
                Empphonenoopt: $("#txtEmpPhnoopt").val(),
                EmailAddress: $("#txtemail").val(),
                Address: $("#txtAddress").val(),
                Date_Of_Birth: $("#txtEDob").val(),
                MaritalStatus: $("#ddlstatus").val()
                
            }, success: function (response) {
                if (response.success) {
                    getHRMGridDetail();
                    getEmpCode();
                    
                    $("#ddlgender").val("-1").change();
                    $("#ddlDesignation").val("-1").change();
                    $("#ddlstatus").val("-1").change();
                    $("#ddlDepName").val('-1').change();
                    $("#ddlCmpName").val("-1").change();
                    $("#txtFirstName").val("");
                    $("#txtLastName").val(""); //Reading text box values using Jquery
                    $("#txtEmpCnic").val("");
                    $("#txtEDoj").val("");
                    $("#txtEmpPhno").val("");
                    $("#txtEmpPhnoopt").val("");
                    $("#txtemail").val("");
                    $("#txtEDob").val("");
                    $("#txtAddress").val("");


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
    

}

        
});