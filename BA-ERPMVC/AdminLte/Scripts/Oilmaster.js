







function editClick(id) {

    var referenceNum = id;
    window.location.href = "Oil?id=" + referenceNum + "&edit=1";
}








$(document).ready(function () {
    var services = new Services();


$('#txtCompany').on('change', function() {
 $("#OTY").removeClass("d-none");
 $("#OC").removeClass("d-none");
 $("#QU").removeClass("d-none");
 $("#DN").removeClass("d-none");
 $("#RD").removeClass("d-none");
 $("#RM").removeClass("d-none");

});



$.ajax({
        type: "GET",
        url: "/Setup/GetCompany",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a OilType</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName + '</option>';
            }
            $("#txtCompany").html(s);
        }
    });



  $.ajax({
        type: "GET",
        url: "/Setup/GetOilType",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a OilType</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].OID + '">' + data[i].OName + '</option>';
            }
            $("#txtOilType").html(s);
        }
    });

 $.ajax({
        type: "GET",
        url: "/Setup/GetCompanyOil",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a Company</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].OCOMP + '</option>';
            }
            $("#txtOilCompany").html(s);
        }
    });



 
// edite function start

 var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {
        $("#lloForm").show();


   function getOilById(empid) {
            services.getOilById(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtQuntity").val(data[0].QUANTITY),
                $("#txtDeilveryNo").val(data[0].DeliveryNo),
                $("#txtRec").val(data[0].Rec),
                $("#txtRemake").val(data[0].REMARKS),

                $("#txtCompany").val(data[0].CompanyID).change(),
                $("#txtOilType").val(data[0].OiltypeID).change(),
                $("#txtOilCompany").val(data[0].OTID).change()
            });
        } getOilById(empid);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "Oil";
        });




// Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Setup/AddOrEditeOil", // Controller/View   
                    data: { //Passing data
                        OilID: empid,  
                        CompanyID: $("#txtCompany option:selected").val(),
                        OiltypeID: $("#txtOilType option:selected").val(),
                        OilCompany: $("#txtOilCompany option:selected").val(),
                        Quantity: $("#txtQuntity").val(),
                        DeliveryNo: $("#txtDeilveryNo").val(),
                        ReceivedDate: $("#txtRec").val(),
                        Remarks: $("#txtRemake").val(),

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                            window.location.href = "Oil";
                            $("#txtCompany").val("-1");
                            $("#txtOilType").val("-1");
                            $("#txtOilCompany").val("-1");
                            $("#txtQuntity").val("");
                            $("#txtDeilveryNo").val("");
                            $("#txtRec").val("");
                            $("#txtRemake").val("");
                           
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
    else
    {
       $("#gridShow").removeClass("d-none");




//Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
    });



  function getOilGridDetail() {
            services.getOilGridDetail(JSON.stringify({
            })).then(function (response) {

                $('#OilGride').dataTable().fnClearTable();
                $('#OilGride').dataTable().fnDestroy();
                $('#OilGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,


                    data: response.OIL,

                    columns: [
                         {
                            "render": function (data, type, OIL, row) {


                                return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + OIL.oilID + ')" >Edit</button>';
                            }
                        },
                        
                         {'data': 'OID'},
                        { 'data': 'OTID'},
                        { 'data': 'QUANTITY'},
                        { 'data': 'DeliveryNo'},
                        { 'data': 'Rec',
                              
                        'render': function (jsonDate) {  
                            var date = new Date(parseInt(jsonDate.substr(6)));  
                            var month = ("0" + (date.getMonth() + 1)).slice(-2);  
                            return ("0" + date.getDate()).slice(-2) + '-' + month + '-' + date.getFullYear();  
                        }  
                        },
                        { 'data': 'REMARKS'},
                        
                       
                    ],
                    buttons: []
                });

            });
        }
        getOilGridDetail();







 //Add Button
    $("#btnADD").click(function () {
        // Remove this line if it worked
        $("#gridShow").hide();
        $("#lloForm").show();
    });




 $('#txtCompany').on('change', function() {
 $("#OTY").removeClass("d-none");
 $("#OC").removeClass("d-none");
 $("#QU").removeClass("d-none");
 $("#DN").removeClass("d-none");
 $("#RD").removeClass("d-none");
 $("#RM").removeClass("d-none");

});







        // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
         //  ValidateAll();
           //                return false;
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Setup/AddOrEditeOil", // Controller/View   
                    data: { //Passing data  
                        CompanyID: $("#txtCompany option:selected").val(),
                        OiltypeID: $("#txtOilType option:selected").val(),
                        OilCompany: $("#txtOilCompany option:selected").val(),
                        Quantity: $("#txtQuntity").val(),
                        DeliveryNo: $("#txtDeilveryNo").val(),
                        ReceivedDate: $("#txtRec").val(),
                        Remarks: $("#txtRemake").val(),

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                            getOilGridDetail();
                            $("#txtCompany").val("-1").change();
                            $("#txtOilType").val("-1").change();
                            $("#txtOilCompany").val("-1").change();
                            $("#txtQuntity").val("");
                            $("#txtDeilveryNo").val("");
                            $("#txtRec").val("");
                            $("#txtRemake").val("");
                           
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

// edite function end 







    
    
});
