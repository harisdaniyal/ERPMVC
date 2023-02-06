


 //Add Button
    $("#btnADD").click(function () {
        // Remove this line if it worked
        $("#gridShow").hide();
        $("#lloForm").show();
    });


 //Add Button
    $("#btnBack").click(function () {
        // Remove this line if it worked
        $("#gridShow").show();
        $("#lloForm").hide();
    });


$(function() {
    var 
    jqDdl = $('#txtPaymentMode'),
    onChange = function(event) {
        if ($(this).val() === '4') {
            $('#CheNo').show();
            $('#CheNo').focus().select();
        } else {
            $('#CheNo').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});

$(function() {
    var 
    jqDdl = $('#txtPaymentMode'),
    onChange = function(event) {
        if ($(this).val() === '5') {
            $('#PayOrder').show();
            $('#PayOrder').focus().select();
        } else {
            $('#PayOrder').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});


function multiply()
{

   
    a = Number(document.getElementById('txtQauntity').value);
    b = Number(document.getElementById('txtInvoiceAmount').value);
    c = b / a;

    document.getElementById('txtrate').value = c;
}


$.ajax({
        type: "GET",
        url: "/Setup/GetStpModel",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a PaymentMode</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].PMID + '">' + data[i].PMode + '</option>';
            }
            $("#txtPaymentMode").html(s);
        }
    });



$.ajax({
        type: "GET",
        url: "/Setup/GetDeliveryNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1">Please Select a Delivery No</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].OilID + '">' + data[i].DNo + '</option>';
            }
            $("#txtDekiveryNo").html(s);
        }
    });


$(document).ready(function () {
    var services = new Services();



function getOilInvoiceGridDetail() {
            services.getOilInvoiceGridDetail(JSON.stringify({
            })).then(function (response) {

                $('#OilInvoiceGride').dataTable().fnClearTable();
                $('#OilInvoiceGride').dataTable().fnDestroy();
                $('#OilInvoiceGride').dataTable({

                    dom: 'Bfrtip',
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,


                    data: response.OILInvoice,

                    columns: [
                         {
                            "render": function (data, type, OILInvoice, row) {


                                return '<button class="btn btn-primary" id="btnEdit" onclick="editClick(' + OILInvoice.oilID + ')" >Edit</button>';
                            }
                        },
                        
                         {'data': 'oilID', visible:false},
                       // { 'data': 'OIlRecD'},
                        { 'data': 'OilName'
                        ,
                    "defaultContent": "" 
                        },
                        { 'data': 'DeliverNo',"defaultContent": "" },
                        { 'data': 'OilName', "defaultContent": "" },
                        { 'data': 'Quantity', "defaultContent": "" },
                        { 'data': 'INvoiceNo', "defaultContent": "" },
                        { 'data': 'InvoiceDate', "defaultContent": "" },
                        { 'data': 'OilRate', "defaultContent": "" },
                        { 'data': 'OilPaymentMode', "defaultContent": "" },
                        { 'data': 'total', "defaultContent": "" },
                        { 'data': 'POREf', "defaultContent": "" },
                        { 'data': 'POAmount', "defaultContent": "" },
                        { 'data': 'Remake', "defaultContent": "" },
                     //   { 'data': 'REMARKS'},
                        
                       
                    ],
                    buttons: []
                });

            });
        }
        getOilInvoiceGridDetail();















 $('#txtDekiveryNo').on('change', function() {
 //$("#txtqt").removeClass("d-none");
function getoilInvoicebyid(id)
{
    
        services.getOilInvoicebyorder(JSON.stringify({
        id : id
        })).then(function(response){ 
         var data = response;
              if(data.length){
             
                  
                $("#txtQauntity").val(data[0].DNo);
                $("#txtOilCompany").val(data[0].OTID);
               
                }else
               {
                alert("No Data Found");
   //              $("#txtqt").addClass("d-none");
               }
                
                  });
          }getoilInvoicebyid($(this).val());


         });

});
















   // Submit Button
        var toastCount = 0;
        $("#btnSubmit").click(function () {
         //  ValidateAll();
           //                return false;
          $.ajax(
                {
                    type: "POST", //HTTP POST Method  
                    url: "/Setup/AddOrEditeOilInvoice", // Controller/View   
                    data: { //Passing data  
                        OilCompany: $("#txtOilCompany").val(),
                        DeliveryNo: $("#txtDekiveryNo option:selected").val(),
                        InvoiceDate: $("#txtInvoiceDate").val(),
                        InvoiceNumber: $("#txtInvoiceAmount").val(),
                        Quantity: $("#txtQauntity").val(),
                        Rate: $("#txtrate").val(),
                        PaymentModeID: $("#txtPaymentMode option:selected").val(),
                        PO_Ref_No: $("#txtChequeNO").val(),
                       // Ref_no: $("#txtPayOrderNo").val(),
                        PODate: $("#txtPayOrderDate").val(),
                        POAmount: $("#txtPayOrderAmount").val(),

                    },
                            
                    success: function (response) {
                          
                        if (response.success) {
                           // getOilGridDetail();

                        $("#txtDekiveryNo").val("-1");
                        $("#txtOilCompany").val("");
                        $("#txtInvoiceDate").val("");
                        $("#txtInvoiceAmount").val("");
                        $("#txtQauntity").val("");
                        $("#txtrate").val("");
                        $("#txtPaymentMode").val("-1");
                      //  $("#").val("-1");
                        $("#txtChequeNO").val("");
                        $("#txtPayOrderNo").val("");
                        $("#txtPayOrderDate").val("");
                        $("#txtPayOrderAmount").val("");
                           // $("#txtCompany").val("-1").change();
                           // $("#txtOilType").val("-1").change();
                           // $("#txtOilCompany").val("-1").change();
                           // $("#txtQuntity").val("");
                           // $("#txtDeilveryNo").val("");
                           // $("#txtRec").val("");
                           // $("#txtRemake").val("");
                           
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
