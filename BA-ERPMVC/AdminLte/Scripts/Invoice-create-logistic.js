

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
        getInvoiceNumberLogistics();
    });






function getReportGride() {
        services.getReportGride().then(function (response) {

            $('#ReportGride').dataTable().fnClearTable();
            $('#ReportGride').dataTable().fnDestroy();
            $('#ReportGride').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.Invoice,

                columns: [{
                    data: 'Invoiceno',
                    width: 10
                },{
                    data: 'orderID',
                    width: 10,
                    
                },{
                    data: 'tripId',
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
    getReportGride();



    function getInvoiceNumberLogistics() {
        services.getInvoiceNumberLogistics(JSON.stringify({
        })).then(function (response) {            
            $("input[name='_txtInvoiceNo']").val(response);
      });
    }
    getInvoiceNumberLogistics();


    function getOrderNo() {
        services.getOrderNo(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="-1">Please Select OrderNo</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].orderID + '">' + response.result[i].orderNo + '</option>';
            }
            $("#_txtOrderNo").html(s);

        });
    }
    getOrderNo();

    $(document).on('change', '#_txtOrderNo', function () {
        var orderID = $(this).val();
        if (orderID > 0)
        {
            $("#_txtTripNo").prop("disabled", false);
        }
        else
        {
            $("#_txtTripNo").prop("disabled", true);
        }
        GetOrderNoByTripID(orderID)

    });

    function GetOrderNoByTripID(Order_ID){
        services.GetOrderNoByTripID(JSON.stringify({
            Order_ID: Order_ID
        })).then(function (response) {

            var s = '<option value="-1">Please Select Trip Number</option>';
            for (var i = 0; i < response.length; i++) {

                s += '<option value="' + response[i].ID + '">' + response[i].Trip_ID + '</option>';
            }
            $("#_txtTripNo").html(s);

        });
    }





 $('#_txtTripNo').on('change', function () {
         //   $("#orderdetails").removeClass("d-none");
            function getTripBydata(id) {
                services.getTripBydata(JSON.stringify({
                    id: id
                })).then(function (response) {
                    var data = response;
                    if (data.length) {
                     
                        var OrderDate = data[0].OrderDate ? moment(data[0].OrderDate).format("ll") : "--";
                        $("#_txtEmployee").val(data[0].OTID);
                        $("#_txtContainerNo1").val(data[0].DNo);
                        $("#_txtContainerNo2").val(data[0].Cno2);
                        $("#_txtVechilceNumber").val(data[0].VechelID);
                        $("#_txtCustomerName").val(data[0].oID);
                        $("#_txtOrderDate").val(OrderDate); 
                        $("#_txtFromLocation").val(data[0].fromLocation); //Reading text box values using Jquery
                        $("#_txtToLocation").val(data[0].toLocation); //Reading text box values using Jquery
                    } else {
                        alert("No Data Found");
                    }

                });
            } getTripBydata($(this).val());
});




  $(document).on('click', '#_btnGenerateInvoice', function () {
        var Orderparams = {
            InvoiceNumber: $("#_txtInvoiceNo").val(),
            OrderID: $("#_txtOrderNo option:selected").val(),
            TripID: $("#_txtTripNo option:selected").val(),
         //   InvoiceDataFromDate: $("#_txtFromDate").val(),
          //  InvoiceDataToDate: $("#_txtToDate").val(),
        }



        services.addInvoiceDetailReport(JSON.stringify(Orderparams)).then(response => {
            
            
            if (response == "00") {
                        toastr.success("Invoice has been generated successfully");
                         getInvoiceNumberLogistics();
                         getReportGride();
                         $("#_txtOrderDate").val("");
                         $("#_txtTripNo").val("");
                         $("#_txtContainerNo1").val("");
                         $("#_txtContainerNo2").val("");
                         $("#_txtEmployee").val("");
                         $("#_txtVechilceNumber").val("");
                         $("#_txtCustomerName").val("");
                         $("#_txtFromLocation").val("");
                         $("#_txtToLocation").val("");
                         $("#_txtOrderNo").val("-1").change();   
                         $("#_txtTripNo").val("-1").change();   
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





});