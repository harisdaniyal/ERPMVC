$(document).ready(function () {
    var services = new Services();
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
        getInvoiceNumber();
    });






function getInvoiceGride() {
        services.getInvoiceGride().then(function (response) {

            $('#InvoiceGride').dataTable().fnClearTable();
            $('#InvoiceGride').dataTable().fnDestroy();
            $('#InvoiceGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.Invoice,

                columns: [{
                    data: 'Invoiceno',
                    width: 10
                }, {
                    data: 'orderID',
                    width: 10,
                    
                },{
                    data: 'INvoicedate',
                    width: 10,
                       'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                },{
                    data: 'INvoicefromdate',
                    width: 10,
                       'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                },{
                    data: 'INvoiceTodate',
                    width: 10,
                       'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                },{
                    data: 'isActive',
                    width: 10,    
                },{
                    data: 'status',
                    width: 10,
                }],
                buttons: []
            });

        });
    }
    getInvoiceGride();







    function getBusinessDivision() {
        services.getBusinessDevision(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="-1">Please Select Division</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].BusinessDivisionID + '">' + response.result[i].BusinessDivisionName + '</option>';
            }
            $("#_txtBusinessDevision").html(s);

        });
    }
    getBusinessDivision();
    $(document).on('change', '#_txtBusinessDevision', function () {
        var devisionId = $(this).val();
        if (devisionId > 0)
        {
            $("#_txtOrderNo").prop("disabled", false);
        }
        else
        {
            $("#_txtOrderNo").prop("disabled", true);
        }
        GetOrderNoByDivID(devisionId)

    });

    function GetOrderNoByDivID(BusinessDivisionID){
        services.GetOrderNoByDivID(JSON.stringify({
            BusinessDevisionID: BusinessDivisionID
        })).then(function (response) {

            var s = '<option value="-1">Please Select Order No</option>';
            for (var i = 0; i < response.length; i++) {

                s += '<option value="' + response[i].OrderID + '">' + response[i].OrderNo + '</option>';
            }
            $("#_txtOrderNo").html(s);

        });
    }

    $(document).on('change', '#_txtOrderNo', function () {
        var OrderID = $(this).val();
        GetOrderDetailByOrderNo(OrderID)
    });
    function GetOrderDetailByOrderNo(OrderID) {
        services.GetOrderDetailByOrderNo(JSON.stringify({
            OrderID: OrderID
        })).then(function (response) {
            var data = response[0].OrderDate ? moment(response[0].OrderDate).format("ll") : "--";
            $("#_txtCustomer").val(response[0].Customer_Name);
            $("#_txtOrderDate").val(data);
            $("#_txtOrderType").val(response[0].OrderType); //Reading text box values using Jquery
            $("#_txtBLCRO").val(response[0].BL);
            $("#_txtInBondNo").val(response[0].InBond_Number);
            $("#_txtDeliveryNo").val(response[0].DeliveryNo).change();
           
        });
    }
    $(document).on('click', '#_btnGenerateInvoice', function () {
        var Orderparams = {
            InvoiceNumber: $("#_txtInvoiceNo").val(),
            OrderID: $("#_txtOrderNo option:selected").val(),
            InvoiceDataFromDate: $("#_txtFromDate").val(),
            InvoiceDataToDate: $("#_txtToDate").val(),
        }



        services.addInvoiceDetail(JSON.stringify(Orderparams)).then(response => {
            
            
            if (response == "00") {
                        toastr.success("Invoice has been generated successfully");
                         getInvoiceNumber();
                         getInvoiceGride();
                        returncondition = true;
                       
            }      
            else {
                toastr.error("Invoice Creation has been Failed");
                returncondition = false;
            }

        }).catch(e => {
            toastr.error("server error,please check your internet connection");
            returncondition = false;
        });
    });


  $.ajax({
        type: "GET",
        url: "/Invoices/GetInvoiceNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select a Invoice No</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].INo + '">' + data[i].INo + '</option>';
            }
            $("#_txtInvNo").html(s);
        }
 
    }, 5000);
    

 $.ajax({
        type: "GET",
        url: "/Invoices/GetCustomerName",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].INo + '">' + data[i].INo + '</option>';
            }
            $("#_txtCustomerName").html(s);
        }
 
    }, 5000);



    function getInvoiceNumber() {
        services.getInvoiceNumber(JSON.stringify({
        })).then(function (response) {            
            $("input[name='_txtInvoiceNo']").val(response);
      });
    }
    getInvoiceNumber();
    $(document).on('click', '#_btnPrintInvoice', function () {
        var invNo = $('#_txtInvNo').val();

       window.location.href = 'PrintinvoiceByInvoiceNo?invoiceNo=' + invNo;

    })

   $(document).on('click', '#_btnPrintInvoiceReport', function () {


        var CustomerName = $('#_txtCustomerName').val();
        var fromDate = $('#_invoiceFromdate').val();
        var ToDate = $('#_invoiceTodate').val();

       window.location.href = 'PrintinvoiceReportByInvoiceNo?CustomerName=' + CustomerName + '&fromDate=' + fromDate + '&ToDate=' + ToDate; 
  
    })



  //  today = new Date();
   // day = today.getDate()
   // month = today.getMonth() + 1
   // year = today.getFullYear();

   // day = day < 10 ? '0' + day : day;
   // month =  month < 10 ? '0' + month : month;
   // today = new String(year + '-' + month + '-' + day)
   // $("#_invoiceTodate")[0].min = today;

   // $('#_invoiceFromdate').on('change', function(e){
     //   date = new Date($('#_invoiceFromdate').val());
       // $('#_invoiceTodate')[0].valueAsNumber = date.setDate(date.getDate())
     //   $("#_invoiceTodate")[0];
   // })






})







