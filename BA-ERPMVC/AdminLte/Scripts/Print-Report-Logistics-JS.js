


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
      //  getInvoiceNumberLogistics();
    });


  $(document).on('click', '#_btnPrintInvoiceReport', function () {


     //   var CustomerName = $('#_txtCustomerName').val();
    //    var fromDate = $('#_invoiceFromdate').val();
        var invNo = $('#_InvoiceNumber').val();

       window.location.href = '/ReportLogistics/PrintReportByInvoiceNo?invoiceNo=' + invNo;// + '&fromDate=' + fromDate + '&ToDate=' + ToDate; 
       
     
  
    });



  $(document).on('click', '#_btnPrintslipReport', function () {

        var invNo = $('#txtSliptripNo').val();

       window.location.href = '/ReportLogistics/PrintSlipReportByNo?invoiceNo=' + invNo;// + '&fromDate=' + fromDate + '&ToDate=' + ToDate; 
  
    });



  $.ajax({
        type: "GET",
        url: "/ReportLogistics/GetInvoiceNumber",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select a Invoice No</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].INo + '">' + data[i].INo + '</option>';
            }
            $("#_InvoiceNumber").html(s);
        }
 
    }, 5000);


 $.ajax({
        type: "GET",
        url: "/ReportLogistics/GetInvoiceNumber",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select a Trip No</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].INo + '">' + data[i].INo + '</option>';
            }
            $("#txtSliptripNo").html(s);
        }
 
    }, 5000);







$(document).on('change', '#txtReportFormation', function () {
        var OrderType = $(this).val();
        if (OrderType == "1") {
            $("#hideSlip").addClass("d-none");
            $("#_btnPrintslipReport").addClass("d-none");
            $("#hideSlip").val("");

            $("#hideTripNo").removeClass("d-none");
            $("#_btnPrintInvoiceReport").removeClass("d-none");
            
            $("#hideTripNo").val("");
        }
       else if (OrderType == "2")
        {
            $("#hideSlip").removeClass("d-none");
            $("#_btnPrintslipReport").removeClass("d-none");
            $("#hideSlip").val("");

            $("#hideTripNo").addClass("d-none");
            $("#_btnPrintInvoiceReport").addClass("d-none");
            $("#hideTripNo").val("");
          
       }
        else {
           $("#hideTripNo").addClass("d-none");
           // $("#facList").removeClass("d-none");
            $("#hideTripNo").val("");
        }


    });








});