


function showtextbox(Expenseid) {
    var a = "#txt" + Expenseid;
   // var b = "#txt2" + Expenseid;
    var status = $(a);
    if ($(a).prop("disabled") ) {
        ($(a).prop("disabled", false));
    } else {
        ($(a).prop("disabled", true));
    }
}


function editClick(id) {
    var referenceNum = id;
    window.location.href = "OrderBooking?id=" + referenceNum + "&edit=1";

}




$(document).ready(function () {
    var services = new Services();



    $('#scales').change(function () {
        if ($(this).is(":checked")) {
            $('#hs').removeClass('d-none');
        } else {
            $('#hs').addClass('d-none');
        }
    });



    function getExpenses() {
        var html = "";
        var orderList = $("#dvCheckBoxListControl1");
        services.getExpenses(JSON.stringify({
        })).then(function (response) {
            console.log(response);
            $(response).each(function () {
              //  html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox(' + this.Expenseid + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.Expenseid + '" id="_ExpenseCheckList' + this.Expenseid + '"><label class="form-check-label" for="">' + this.expensename + '</label></div></div><div class="col-sm-2 form-control-sm"><div class="form-group"><input type="text" id="txt' + this.Expenseid + '" name="txt" value="" class="txtclass" disabled="disabled"></div></div>      <div class="row"><div style="margin-left:40px;" class="col-md-3"><div class="form-group"><label class="form-check-label" for="">' + "Remarks" + '</label></div></div>               <div class="col-md-3 form-control-sm"><div class="form-group"><input type="text" id="txt2' + this.Expenseid + '" name="txt2" value="" class="txtclass2" disabled="disabled"></div></div>          </div></li>';
                html += '<li class="list-group-item" ><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox(' + this.Expenseid + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.Expenseid + '" id="_ExpenseCheckList' + this.Expenseid + '"><label class="form-check-label" for="">' + this.expensename + '</label></div></div><div class="col-sm-2 form-control-sm"><div class="form-group"><input type="text" id="txt' + this.Expenseid + '" name="txt" value="" class="txtclass" disabled="disabled"></div></div>                      </div></li>';
            });

            orderList.append(html);
        });
    } getExpenses();

  function getFacilitiesList() {
        var html = "";
        var orderList = $("#dvCheckBoxListControl");
        services.getFacilitiesList(JSON.stringify({
        })).then(function (response) {

            $(response.result).each(function () {
                html += '<li class="list-group-item"><div class="col-md-4"> <div class="form-check"><input class="form-check-input" type="checkbox" name="FacilityCheckList" value="' + this.facilityID + '" id="FacilityCheckList' + this.facilityID + '"><label class="form-check-label" for="">' + this.FacilityName + '</label></div></div></li>';
            });

            orderList.append(html);
        });
    }
    getFacilitiesList();

 function getCustomerDetail() {
        services.getCustomerDetail(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select Customer</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].CustomerID + '">' + response.result[i].CustomerName + '</option>';
            }
            $("#_txtCustomerName").html(s);

        });
    }
    getCustomerDetail();

    function FieldClear() {
        $("._field").val("");
        $("#_txtCustomerName").val("").change();
    }
   
    function getBusinessDivision() {
        services.getBusinessDevision(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select Division</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].BusinessDivisionID + '">' + response.result[i].BusinessDivisionName + '</option>';
            }
            $("#_txtBusinessDevision").html(s);

        });
    }
    getBusinessDivision();




    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    var isView = $.url().param("view");
    if(isView == 0){

        $("#HideForm").removeClass("d-none");
        $("#divOT").removeClass("d-none");
        $("#divBL").removeClass("d-none");
        $("#_btnReset").addClass("d-none");
        $("#_btnOrderSubmit").addClass("d-none");
        $("#_viewOrder").addClass("d-none");
        $("#_txtBLedite").addClass("disabled");
        $("#_OrderDate").attr("disabled", true); 
        $("#_txtBusinessDevision").attr("disabled", true); 
        $("#_txtCustomerName").attr("disabled", true); 
        $("#_txtOrderType").attr("disabled", true); 
        $("#_txtBL").attr("disabled", true); 
        $("#_txtCRO").attr("disabled", true); 
        $("#_txtinBond").attr("disabled", true); 
        $("#_DeliveryNo").attr("disabled", true); 
        $("#FacilityCheckList").attr("disabled", true); 
      //  $('#_txtCustomerName').removeClass("select2"); 
    
        $('#hs').removeClass('d-none');
        $('#HoHideRate').addClass('d-none');

        function getOrderByid(empid) {
            services.getOrderByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;

                 setTimeout(function () {

                if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var val = data[i].OrderFacilityid;
                            $('#FacilityCheckList' + val).prop("checked", true);
                            //   start 
                            var val1 = data[i].OrderExpenseid;
                            var status = data[i].OrderRates;
                            //    var Remarks = data[i].ERemarks;
                            $('#_ExpenseCheckList' + val1).prop("checked", true);
                            $('#txt' + val1).val(status).prop("disabled", false);
                        //    $('#txt2' + val).val(Remarks).prop("disabled", false);
                            //end
                        }
                    }
                    else {
                        $('input:checkbox').removeAttr('checked')
                    }


                     //test start
                     //if (data.length > 0) {
                     //    for (var i = 0; i < data.length; i++) {
                     //        var val = data[i].ETripID;
                     //        var status = data[i].EPrice;
                     //        var Remarks = data[i].ERemarks;
                     //        $('#_ExpenseCheckList' + val).prop("checked", true);
                     //        $('#txt' + val).val(status).prop("disabled", false);
                     //        $('#txt2' + val).val(Remarks).prop("disabled", false);
                     //    }
                     //}
                     //else {
                     //    $('input:text').removeAttr('disabled')
                     //}
                     //test end 


        var devisionId = data[0].OBussinessDivision;
        if (devisionId == 1 || devisionId == 4 ) {
            $("#divOT").removeClass("d-none");
            //$("#divCRO").removeClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        else if (devisionId == 5 || devisionId == 10005) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        //else if (devisionId == 4 || devisionId == 5 || devisionId == 10005) {
          //  $("#divOT").addClass("d-none");
            //$("#divBL").addClass("d-none");
           // $("#divCRO").addClass("d-none");
           // $("#divBond").addClass("d-none");
           // $("#divDelivery").addClass("d-none");
       // }
        else if (devisionId == 10006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").removeClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        else if (devisionId == 20006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").removeClass("d-none");
          }else{
           $("#_txtOrderType").val("");
           $("#_txtBL").val("");
           $("#_txtCRO").val("");
           $("#_txtinBond").val("");
           $("#_DeliveryNo").val("");

        }
    
   var OrderType = data[0].OOrderType;;
        if (OrderType == "Import") {
            $("#divBL").removeClass("d-none");
            $("#divCRO").removeClass("d-none");
        
        }
        else {
            $("#divBL").addClass("d-none");
        }
        if (OrderType == "Export")
        {
        $("#divCRO").removeClass("d-none");
        }
        else {
            $("#divCRO").addClass("d-none");
        }






                 $("#_txtCRO").val(data[0].CRO);
                $("#_txtOrderNumber").val(data[0].OOrderNo);
                $("#_OrderDate").val(moment(data[0].OOrderDate).format("YYYY-MM-DD"));
                $("#_txtOrderType").val(data[0].OOrderType);
                $("#_txtCustomerName").val(data[0].OCustomerID).change();
                $("#_txtBusinessDevision").val(data[0].OBussinessDivision).change();
                $("#_txtBL").val(data[0].OBLCRo);
                $("#_txtinBond").val(data[0].OInbound);
                $("#_DeliveryNo").val(data[0].ODelivery);
                
           }, 2000)
                
             
               
            });
        } getOrderByid(empid);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "OrderBooking";
        });

    
    }
    else if (isEdit == 1) {
$("#HideForm").removeClass("d-none");
$("#divOT").removeClass("d-none");
$("#divBL").removeClass("d-none");
$("#_txtBLedite").addClass("disabled");
 $('#_txtCustomerName').removeClass("select2"); 
 $("#btnBack").addClass("d-none");

        $('#hs').removeClass('d-none');
        $('#HoHideRate').addClass('d-none');


        function getOrderByid(empid) {
            services.getOrderByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;

                 setTimeout(function () {

                if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var val = data[i].OrderFacilityid;
                            $('#FacilityCheckList' + val).prop("checked", true);

                            //   start 
                            var val1 = data[i].OrderExpenseid;
                            var status = data[i].OrderRates;
                            //    var Remarks = data[i].ERemarks;
                            $('#_ExpenseCheckList' + val1).prop("checked", true);
                            $('#txt' + val1).val(status).prop("disabled", false);
                        //    $('#txt2' + val).val(Remarks).prop("disabled", false);
                            //ends

                        }
                    }
                    else {
                        $('input:checkbox').removeAttr('checked')
                    }

                //test start



        var devisionId = data[0].OBussinessDivision;
        if (devisionId == 1 || devisionId == 4 ) {
            $("#divOT").removeClass("d-none");
            //$("#divCRO").removeClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        else if (devisionId == 5 || devisionId == 10005) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        //else if (devisionId == 4 || devisionId == 5 || devisionId == 10005) {
          //  $("#divOT").addClass("d-none");
            //$("#divBL").addClass("d-none");
           // $("#divCRO").addClass("d-none");
           // $("#divBond").addClass("d-none");
           // $("#divDelivery").addClass("d-none");
       // }
        else if (devisionId == 10006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").removeClass("d-none");
            $("#divDelivery").addClass("d-none");
        }
        else if (devisionId == 20006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").removeClass("d-none");
          }else{
           $("#_txtOrderType").val("");
           $("#_txtBL").val("");
           $("#_txtCRO").val("");
           $("#_txtinBond").val("");
           $("#_DeliveryNo").val("");

        }
    
   var OrderType = data[0].OOrderType;;
        if (OrderType == "Import") {
            $("#divBL").removeClass("d-none");
            $("#divCRO").removeClass("d-none");
        
        }
        else {
            $("#divBL").addClass("d-none");
        }
        if (OrderType == "Export")
        {
        $("#divCRO").removeClass("d-none");
        }
        else {
            $("#divCRO").addClass("d-none");
        }

                //test end 







                $("#_txtOrderNumber").val(data[0].OOrderNo);
                $("#_OrderDate").val(moment(data[0].OOrderDate).format("YYYY-MM-DD"));
                $("#_txtOrderType").val(data[0].OOrderType);
                $("#_txtCRO").val(data[0].CRO);
                $("#_txtCustomerName").val(data[0].OCustomerID).change();
                $("#_txtBusinessDevision").val(data[0].OBussinessDivision).change();
                $("#_txtBL").val(data[0].OBLCRo);
                $("#_txtinBond").val(data[0].OInbound);
                $("#_DeliveryNo").val(data[0].ODelivery);
                
           }, 2000)
                
               
               
            });
        } getOrderByid(empid);





//Update Query START


//Insertquery
    $("#_addOrder").validate({

        rules: {
     
        },
        messages: {

        },
        submitHandler: function (form) {

            var Orderparams = {
                OrderID: empid,
                OrderDate: new Date($('#_OrderDate').val()),
                OrderNo: $('#_txtOrderNumber').val(), //Reading text box values using Jquery   
                BusinessDevisionID: $('#_txtBusinessDevision option:selected').val(),
                DeliveryNo: $("#_DeliveryNo").val(),
                InBond_Number: $("#_txtinBond").val(),
                CustomerID: $("#_txtCustomerName option:selected").val(),
                BL: $("#_txtBL").val(),
                CRO: $("#_txtCRO").val(),
                OrderType: $("#_txtOrderType option:selected").val(),

            }
            services.UpdateOrderDetail(JSON.stringify(Orderparams)).then(response => {
                var listcheck = [];
                    $("input:checkbox[name='FacilityCheckList']:checked").each(function () {
                         listcheck.push($(this).val());
                    });

                    var Facilityparams = {
                        FacilityID: listcheck,
                        OrderID: empid,

                    }
                    services.UpdateFacilityListByOrderID(JSON.stringify(Facilityparams)).then(response => {
                        if (response == "00") {
                            toastr.success("Order has been generated successfully");
                             returncondition = true;
                            window.location.href = "/sales/OrderBooking";
                        }
                        else {
                            toastr.error("please select required fields");
                            returncondition = false;
                            window.location.href = "/sales/OrderBooking";
                        }
                    }).catch(e => {
                        toastr.error("Server error,Please check your internet connection");
                        returnCondition = false;
                    });

            }).catch(e => {
                toastr.error("server error,please check your internet connection");
                returncondition = false;
            });
            FieldClear();
        }
    });






//Update Query END



}else{



        $("#HoHideRate").addClass("d-none");

        $("#btnBack").addClass("d-none");









//Insertquery
    $("#_addOrder").validate({

        rules: {
            FacilityCheckList: "required",
            DeliveryNo: {
                required: function () {
                    return $("#_txtBusinessDevision").val() == "20006";
                }
            },
            inBond: {
                required: function () {
                    return $("#_txtBusinessDevision").val() == "10006";
                }
            },
           // BL: {
             //   required: function () {
               //     return $("#_txtOrderType").val() == "Import";
               // }
           // },
         //   CRO: {
           //     required: function () {
             //       return $("#_txtOrderType").val() == "Export";
              //  }
            //},
            OrderType: {
                required: function () {
                    if ($("#_txtBusinessDevision").val() == "1") {
                        return true;
                    }
                }
            },
            CustomerName: "required",
            BusinessDevision: "required",
            OrderNumber: "required",
            OrderDate: "required"
        },
        messages: {
            FacilityCheckList: "*",
            DeliveryNo: "*",
            inBond: "*",
           // BLCRO: "*",
            OrderType: "*",
            CustomerName: "*",
            BusinessDevision: "*",
            OrderNumber: "*",
            OrderDate: "*"

        },
        submitHandler: function (form) {

            var Orderparams = {

                OrderDate: new Date($('#_OrderDate').val()),
                OrderNo: $('#_txtOrderNumber').val(), //Reading text box values using Jquery   
                BusinessDevisionID: $('#_txtBusinessDevision option:selected').val(),
                DeliveryNo: $("#_DeliveryNo").val(),
                InBond_Number: $("#_txtinBond").val(),
                CustomerID: $("#_txtCustomerName option:selected").val(),
                BL: $("#_txtBL").val(),
                CRO: $("#_txtCRO").val(),
                OrderType: $("#_txtOrderType option:selected").val(),

            }



            services.addOrderDetail(JSON.stringify(Orderparams)).then(response => {
                var listcheck = [];
                var ExpenseListCheck = [];
                var ExpenseListRates = [];
                if (response.statusCode != "11") {
                    $("input[name='FacilityCheckList']:checked").each(function () {
                        listcheck.push($(this).val());
                    });

                    var Facilityparams = {

                        FacilityID: listcheck,
                        OrderID: response.data,

                    }
                    services.addFacilityListByOrderID(JSON.stringify(Facilityparams)).then(response => {
                        if (response == "00") {
                         //   toastr.success("Order has been generated successfully");
                            returncondition = true;
                            getOrderNumber();
                            viewOrderTable();
                        }
                        else {
                            toastr.error("please select required fields");
                            returncondition = false;
                        }
                    }).catch(e => {
                        toastr.error("Server error,Please check your internet connection");
                        returnCondition = false;
                    });

                }
                else {
                    toastr.error(response.message);
                   returncondition = false;
                }
               //else if (response.statusCode != "11") {


                    $("input[name='_ExpenseCheckList']:checked").each(function () {
                      var id =  ExpenseListCheck.push($(this).val());
                        var link2 = "#txt" + id;
                        var Rates = $(link2).val();
                        ExpenseListRates.push(Rates);
                    });

                    var Facilityparams = {

                        ExpenseID: ExpenseListCheck,
                        Rates: ExpenseListRates,
                        OrderID: response.data,

                    }
                    services.addExpenseListByOrderID(JSON.stringify(Facilityparams)).then(response => {
                       // if (response == "00") {
                            toastr.success("Order has been generated successfully");
                            returncondition = true;
                         //   getOrderNumber();
                          //  viewOrderTable();
                        //}
                       // else {
                         //   toastr.error("please select required fields");
                          //  returncondition = false;
                      //  }
                    }).catch(e => {
                        toastr.error("Server error,Please check your internet connection");
                        returnCondition = false;
                    });




                //} else {
                //    toastr.error(response.message);
                //    returncondition = false;
                //}

            }).catch(e => {
                toastr.error("server error,please check your internet connection");
                returncondition = false;
            });
            FieldClear();
        }
    });
    $('#_OtherServices').change(function () {
        if (this.checked) {
            $('#ServiceRemarks').removeClass('d-none');
        }
        else {
            $('#ServiceRemarks').addClass('d-none');
        }

    });
    //ORDER NUMBER FIELD
    function getOrderNumber() {
        services.getOrderNumber(JSON.stringify({
        })).then(function (response) {
            $("input[name='_txtOrderNumber']").val(response);
        });
    }
    getOrderNumber();

  /*  function getCustomerDetail() {
        services.getCustomerDetail(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select Customer</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].CustomerID + '">' + response.result[i].CustomerName + '</option>';
            }
            $("#_txtCustomerName").html(s);

        });
    }
    getCustomerDetail(); */

    function FieldClear() {
        $("._field").val("");
        $("#_txtCustomerName").val("").change();
    }
  
  /*  function getBusinessDivision() {
        services.getBusinessDevision(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select Division</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].BusinessDivisionID + '">' + response.result[i].BusinessDivisionName + '</option>';
            }
            $("#_txtBusinessDevision").html(s);

        });
    }
    getBusinessDivision(); */

    $(document).on('change', '#_txtBusinessDevision', function () {
        var devisionId = $(this).val();
        if (devisionId == 1 || devisionId == 4 ) {
            $("#divOT").removeClass("d-none");
            //$("#divCRO").removeClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
            $("#HoHideRate").removeClass("d-none");

        }
        else if (devisionId == 5 || devisionId == 10005) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").addClass("d-none");
            $("#HoHideRate").addClass("d-none");
        }
        //else if (devisionId == 4 || devisionId == 5 || devisionId == 10005) {
          //  $("#divOT").addClass("d-none");
            //$("#divBL").addClass("d-none");
           // $("#divCRO").addClass("d-none");
           // $("#divBond").addClass("d-none");
           // $("#divDelivery").addClass("d-none");
       // }
        else if (devisionId == 10006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").removeClass("d-none");
            $("#divDelivery").addClass("d-none");
            $("#HoHideRate").addClass("d-none");
        }
        else if (devisionId == 20006) {
            $("#divOT").addClass("d-none");
            $("#divBL").addClass("d-none");
            $("#divCRO").addClass("d-none");
            $("#divBond").addClass("d-none");
            $("#divDelivery").removeClass("d-none");
            $("#HoHideRate").addClass("d-none");
        }
        $("#_txtOrderType").val("");
        $("#_txtBL").val("");
        $("#_txtCRO").val("");
        $("#_txtinBond").val("");
        $("#_DeliveryNo").val("");
        $("#HoHideRate").removeAttr("checked");
    });
    $(document).on('change', '#_txtOrderType', function () {
        var OrderType = $(this).val();
        if (OrderType == "Import") {
            $("#divBL").removeClass("d-none");
            $("#divCRO").removeClass("d-none");
        
        }
        else {
            $("#divBL").addClass("d-none");
        }
        if (OrderType == "Export")
        {
        $("#divCRO").removeClass("d-none");
        }
        else {
            $("#divCRO").addClass("d-none");
        }

    });
    $(document).on('click', '#_btnOrderSubmit', function () {
        $("#_addOrder").valid();
    });


    $(document).on('click', '#_btnReset', function () {
        FieldClear();
    });
    $(document).on('click', '#_viewOrder', function () {
        $("#HideForm").addClass("d-none");
        $("#_btnBack").removeClass("d-none");
        $("#OrderTableHide").removeClass("d-none");
    });
    $(document).on('click', '#_btnBack', function () {
        $("#HideForm").removeClass("d-none");
        $("#_btnBack").addClass("d-none");
        $("#OrderTableHide").addClass("d-none");
    });
    function viewOrderTable() {
        services.viewOrder(JSON.stringify({

        })).then(function (response) {



            $('#_orderTable').dataTable().fnClearTable();
            $('#_orderTable').dataTable().fnDestroy();



            console.log(response.result);
            $('#_orderTable').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': true,
                "order": [[ 2, "desc" ]],

                data: response.result,

                columns: [{
                    data: 'OrderID',
                    width: 10
                }, {
                    data: 'OrderDate',
                    width: 10,
                    'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                }, {
                    data: 'OrderNo',
                    width: 10
                }, {
                    data: 'BusinessDivisionName',
                    width: 10
                }, {
                    data: 'Customer_Name',
                    width: 10
                }, {
                    data: 'OrderType',
                    width: 10
                }, {
                    data: 'BL',
                    width: 5
                },{
                    data: 'CRO',
                    width: 5
                },{
                    data: 'DeliveryNo',
                    width: 5
                }, {
                    data: 'InBond_Number',
                    width: 10
                }, {
                    data: 'CreatedDate',
                    width: 10,
                    'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                }, {
                    data: 'OrderID',
                    width: 10,
                    "render": function (data) {
                        var html = appendActionMenu(data);
                        return html;
                        }

                    }],
                buttons: []
            });

        });

    }viewOrderTable();



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
                '<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
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
            window.location.href = "OrderBooking?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = parseInt($(this).attr('data-id'));
            deleteLogisticDetail(ID);
        });
//end insert query


//Delete Function START
function deleteTrip(ID) {
            $.confirm({
                title: 'Delete!',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                animation: 'scale',
                type: 'blue',
                buttons: {
                    yes: function () {
                        services.DeleteTripDetail(JSON.stringify({
                            TripId: ID
                        })).then(function (response) {
                            console.log(response);  

                            if (response.statusCode == "00") {
                                toastr.success("Trip Details has been Deleted successfully");
                                setTimeout(function () {
                                    location.reload();
                                }, 2000)

                            }
                            else {
                                toastr.error("Server error,Please check your internet connection");
                            }
                        });
                    },
                    no: function () {

                    }
                }
            })

        }

//Delete Function END






}






})