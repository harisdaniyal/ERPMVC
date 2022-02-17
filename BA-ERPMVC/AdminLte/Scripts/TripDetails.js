function showtextbox(Expenseid) {
    var a = "#txt" + Expenseid;
    var b = "#txt2" + Expenseid;
    var status = $(a);
    if ($(a).prop("disabled") && $(b).prop("disabled")) {
        ($(a).prop("disabled", false) && $(b).prop("disabled", false));
    } else {
        ($(a).prop("disabled", true) && $(b).prop("disabled", true));
    }
}
function showtextbox1(ID) {
    var a = "#txt12" + ID;
    var b = "#txt13" + ID;
    var status = $(a);
    if ($(a).prop("disabled") && $(b).prop("disabled")) {
        ($(a).prop("disabled", false) && $(b).prop("disabled", false));
    } else {
        ($(a).prop("disabled", true) && $(b).prop("disabled", true));
    }
}



function editClick(a) {
    var referenceNum = a;
    window.location.href = "TripDetails?id=" + referenceNum + "&edit=1";
}


$(document).ready(function () {
    var services = new Services();


    function getExpensesTripByid(id) {
        var html = "";
        var orderList = $("#dvCheckBoxListControl1");
        services.getExpensesTripByid(JSON.stringify({
            id: id
        })).then(function (response) {
            console.log(response);
            if (response == 0) {

                $("#HoHeadTxt").addClass("d-none");
            } else {
                $(response).each(function () {
                    html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox1(' + this.ID + ')" type="checkbox" name="_ExpenseCheckList1" class="_ExpenseCheckList1" value="' + this.ID + '" id="_ExpenseCheckList1' + this.ID + '"><label class="form-check-label" for="" >' + this.expensename + '</label></div></div><div class="col-sm-2 form-control-sm"><div class="form-group"><input type="text" id="txt12' + this.ID + '" name="txt"   value="' + this.expenseprice + '" class="_ExpenseCheckList1" disabled="disabled"></div></div>      <div class="row"><div style="margin-left:40px;" class="col-md-3"><div class="form-group"><label class="form-check-label" for="">' + "Remarks" + '</label></div></div>               <div class="col-md-3 form-control-sm"><div class="form-group"><input type="text" id="txt13' + this.ID + '" name="txt13" value="" class="txtclass2" disabled="disabled"></div></div>          </div></li>';
                });
            }

            orderList.append(html);
        });
    }



    //function getExpensesTripByid(id) {
    //    var html = "";
    //    var orderList = $("#dvCheckBoxListControl1");
    //    services.getExpensesTripByid(JSON.stringify({
    //        id: id
    //    })).then(function (response) {
    //        console.log(response);
    //        $(response).each(function () {
    //            html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox1(' + this.ID + ')" type="checkbox" name="_ExpenseCheckList1" class="_ExpenseCheckList1" value="' + this.ID + '" id="_ExpenseCheckList1' + this.ID + '"><label class="form-check-label" for="" >' + this.expensename + '</label></div></div><div class="col-sm-2 form-control-sm"><div class="form-group"><input type="text" id="txt12' + this.ID + '" name="txt"   value="' + this.expenseprice + '" class="_ExpenseCheckList1" disabled="disabled"></div></div>      <div class="row"><div style="margin-left:40px;" class="col-md-3"><div class="form-group"><label class="form-check-label" for="">' + "Remarks" + '</label></div></div>               <div class="col-md-3 form-control-sm"><div class="form-group"><input type="text" id="txt13' + this.ID + '" name="txt13" value="" class="txtclass2" disabled="disabled"></div></div>          </div></li>';
    //        });
    //        orderList.append(html);
    //    });
    //}


    function getordernumber() {
        services.getlogisticsorders(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="-1">--Select Order Number--</option>';
            for (var i = 0; i < data.result.length; i++) {
                s += '<option value="' + data.result[i].Orderid + '">' + data.result[i].OrderNo + '</option>';

            }
            $("#ddlOrderID").html(s);

        });
    } getordernumber();



    function getContainerStatus() {
        services.getContainerStatus(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="-1">--Select Conatiner Status--</option>';
            for (var i = 0; i < data.result.length; i++) {
                s += '<option value="' + data.result[i].CID + '">' + data.result[i].CConatinerStatus + '</option>';

            }
            $("#txtContainerStatus").html(s);

        });
    } getContainerStatus();






    function getDriver() {
        services.getdriver(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="-1">--Select Driver--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].Eid + '">' + data[i].Ename + '</option>';

            }
            $("#ddlDriverID").html(s);

        });
    } getDriver();


    function getVendor() {
        var typeId = 2;
        services.getVendor(typeId).then(function (data) {
            var s = '<option value="-1">--Select Vendor--</option>';
            s += '<option value="Own">Own</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].PartyId + '">' + data[i].PartyName + '</option>';
            }
            $("#ddlVendor").html(s);
        })
    } getVendor();


    function getExpenseDrop() {
        services.getExpenseDrop(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="-1">--Select Driver--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].Expenseid + '">' + data[i].expensename + '</option>';

            }
            $("#txtExpenseID").html(s);

        });
    } //getExpenseDrop();



    function getdriver2nd() {
        services.getdriver2nd(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="">--Select Driver--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].Eid + '">' + data[i].Ename + '</option>';

            }
            $("#ddlDriverID2nd").html(s);

        });
    } getdriver2nd();

    function getVehicle() {
        services.getVehicle(JSON.stringify({
        })).then(function (data) {
            var s = '<option value="-1">--Select Vehicle--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].vehicleid + '">' + data[i].vehicleno + '</option>';

            }
            $("#ddlVechilID").html(s);

        });
    } getVehicle();



    function getExpenses() {
        var html = "";
        var orderList = $("#dvCheckBoxListControl");
        services.getExpenses(JSON.stringify({
        })).then(function (response) {
            console.log(response);
            $(response).each(function () {
                //  html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox(' + this.Expenseid + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.Expenseid + '" id="_ExpenseCheckList' + this.Expenseid + '"><label class="form-check-label" for="">' + this.expensename + '</label></div></div><div class="col-md-3 form-control-sm"><div class="form-group"><input type="text" id="txt' + this.Expenseid + '" value="' + this.expenseprice + '" class="form-control" disabled="disabled"></div></div></div></li>';
                html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" onchange="showtextbox(' + this.Expenseid + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.Expenseid + '" id="_ExpenseCheckList' + this.Expenseid + '"><label class="form-check-label" for="">' + this.expensename + '</label></div></div><div class="col-sm-2 form-control-sm"><div class="form-group"><input type="text" id="txt' + this.Expenseid + '" name="txt" value="" class="txtclass" disabled="disabled"></div></div>      <div class="row"><div style="margin-left:40px;" class="col-md-3"><div class="form-group"><label class="form-check-label" for="">' + "Remarks" + '</label></div></div>               <div class="col-md-3 form-control-sm"><div class="form-group"><input type="text" id="txt2' + this.Expenseid + '" name="txt2" value="" class="txtclass2" disabled="disabled"></div></div>          </div></li>';
            });

            orderList.append(html);
        });
    } getExpenses();






    var Tripid = $.url().param("id");
    var isEdit = $.url().param("edit");
    var isView = $.url().param("view");
    var isDeilverd = $.url().param("deilverd");
    var TripDetails = $.url().param("tripdetails");

    if (isView == 0) {
        $("#lloForm").removeClass("d-none");
        $("#hideCheckboxContainerCurrent").addClass("d-none");
        $("#ddlContainerNo").prop("disabled", true);
        //  $("#Containerhide").addClass("d-none");
        $("#_btnReset").addClass("d-none");
        $("#hideTripeDetals").addClass("d-none");
        $("#txtDate").prop("disabled", true);
        $("#ddlOrderID").prop("disabled", true);
        $("#editeContainerNo").prop("disabled", true);
        $("#ddlDriverID").prop("disabled", true);
        $("#ddlVechilID").prop("disabled", true);
        $("#currentFromLocation").prop("disabled", true);
        $("#currentToLoaction").prop("disabled", true);
        $("#txtReceivedDate").prop("disabled", true);
        $("#ddlDriverID2nd").prop("disabled", true);
        $("#txtContainerStatus").prop("disabled", true);
        $("#hidetxtContainerStatus").removeClass("d-none");
        $("#hideRecivedDate").removeClass("d-none");
        $("#PrintSlipbtn").removeClass("d-none");


        $(document).on('click', '#PrintSlipbtn', function () {
            var invNo = $('#TripID').val();

            window.location.href = '/ReportLogistics/PrintSlipReportByNo?invoiceNo=' + invNo;

        })


        function getContainer() {
            services.getContainer(JSON.stringify({
            })).then(function (data) {
                var s = '<option value="-1">--Select Container No--</option>';
                for (var i = 0; i < data.length; i++) {
                    s += '<option value="' + data[i].logisID + '">' + data[i].ContainerNo1 + '</option>';

                }
                $("#ddlContainerNo").html(s);

            });
        } getContainer();

        function getTripById(Tripid) {
            services.getTripById(JSON.stringify({
                id: Tripid
            })).then(function (response) {
                var data = response.result;

                setTimeout(function () {

                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var val = data[i].ETripID;
                            var status = data[i].EPrice;
                            var Remarks = data[i].ERemarks;
                            $('#_ExpenseCheckList' + val).prop("checked", true);
                            $('#txt' + val).val(status).prop("disabled", false);
                            $('#txt2' + val).val(Remarks).prop("disabled", false);
                        }
                    }
                    else {
                        $('input:text').removeAttr('disabled')
                    }
                    $("#txtReceivedDate").val(moment(data[0].TRecivedDate).format("YYYY-MM-DD"));
                    $("#TripID").val(data[0].TCode);
                    $("#txtDate").val(moment(data[0].TOperation).format("YYYY-MM-DD"));
                    $("#ddlOrderID").val(data[0].TOrderId).change();
                    getExpensesTripByid(data[0].TOrderId);
                    $("#ddlContainerNo").val(data[0].TContainerNo1).change();
                    $("#ddlContainerNo2").val(data[0].TContainer2);
                    $("#Fromlocation").val(data[0].TFromLoc);
                    $("#Tolocation").val(data[0].TToLoc);
                    $("#currentFromLocation").val(data[0].TCurrentFromloc);
                    $("#currentToLoaction").val(data[0].TCurrentToLoc);
                    $("#ddlDriverID").val(data[0].TDrive).change();
                    $("#ddlDriverID2nd").val(data[0].TDriverID2).change();
                    $("#ddlVechilID").val(data[0].TVecheilId).change();
                    $("#txtContainerStatus").val(data[0].CContainerStatus).change();
                }, 3000)



            });
        } getTripById(Tripid);


        $(document).on('click', '#btnBack', function () {
            window.location.href = "/sales/TripDetails";
        });

    }
    else if (isEdit == 1) {
        $("#lloForm").removeClass("d-none");
        $("#hideCheckboxContainerCurrent").addClass("d-none");
        //  $("#ContainerNo").addClass("d-none");
        //  $("#Containerhide").addClass("d-none");
        $("#hidetxtContainerStatus").removeClass("d-none");
        $("#hideRecivedDate").removeClass("d-none");
        //  $("#hidetxtContainerStatus").addClass("d-none");
        $("#_btnReset").addClass("d-none");
        $("#hideTripeDetals").addClass("d-none");
        $("#ddlContainerNo2").prop("disabled", false);
        $("#editeContainerNo").prop("disabled", false);
        $("#Fromlocation").prop("disabled", false);
        $("#Tolocation").prop("disabled", false);
        $("#PrintSlipbtn").addClass("d-none");
        $(document).on('click', '#btnBack', function () {
            window.location.href = "/sales/TripDetails";
        });

        //  $('#ddlOrderID').on('change', function () {
        //         function getContainerbyid(id) {
        //           services.getContainerByOrder(JSON.stringify({
        //             id: id
        //       })).then(function (data) {
        //         var s = '<option value="-1">--Select Contianer No--</option>';
        //       for (var i = 0; i < data.length; i++) {
        //         s += '<option value="' + data[i].logi + '">' + data[i].CNo + '</option>';
        //   }
        //   $("#ddlContainerNo").html(s);
        // });
        //  }
        //  getContainerbyid($(this).val());
        // });






        function getContainer() {
            services.getContainer(JSON.stringify({
            })).then(function (data) {
                var s = '<option value="-1">--Select Container No--</option>';
                for (var i = 0; i < data.length; i++) {
                    s += '<option value="' + data[i].logisID + '">' + data[i].ContainerNo1 + '</option>';

                }
                $("#ddlContainerNo").html(s);

            });
        } getContainer();



        $('#ddlContainerNo').on('change', function () {
            //$("#ddlContinerNo").removeClass("d-none");

            function getContainer2byid(id) {
                services.getContainer2ByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    //var s = '<option value="-1">--Select Contianer No2--</option>';
                    //for (var i = 0; i < data.length; i++) {
                    //   s += '<option value="' + data[i].CNo2 + '">' + data[i].CNo2 + '</option>';
                    // }
                    if (data[0].CNo2 != null) {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);

                    } else {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);
                        //    alert("No Data Found");
                    }



                    //   $("#ddlContainerNo2").html(s);

                });
            }
            getContainer2byid($(this).val());


        });




        function getTripById(Tripid) {
            services.getTripById(JSON.stringify({
                id: Tripid
            })).then(function (response) {
                var data = response.result;

                setTimeout(function () {



                    // var valid = data[0].TOrderId;
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var val = data[i].ETripID;
                            var status = data[i].EPrice;
                            var Remarks = data[i].ERemarks;
                            $('#_ExpenseCheckList' + val).prop("checked", true);
                            $('#txt' + val).val(status).prop("disabled", false);
                            $('#txt2' + val).val(Remarks).prop("disabled", false);
                        }
                    }
                    else {
                        $('input:text').removeAttr('disabled')
                    }


                    $("#TripID").val(data[0].TCode);
                    $("#txtReceivedDate").val(moment(data[0].TRecivedDate).format("YYYY-MM-DD"));
                    $("#txtDate").val(moment(data[0].TOperation).format("YYYY-MM-DD"));
                    $("#ddlOrderID").val(data[0].TOrderId).change();
                    getExpensesTripByid(data[0].TOrderId);
                    $("#ddlContainerNo").val(data[0].TContainerNo1).change();
                    //   $("#editeContainerNo").val(data[0].TContainerNo1);
                    $("#ddlContainerNo2").val(data[0].TContainer2);
                    $("#Fromlocation").val(data[0].TFromLoc);
                    $("#Tolocation").val(data[0].TToLoc);
                    $("#currentFromLocation").val(data[0].TCurrentFromloc);
                    $("#currentToLoaction").val(data[0].TCurrentToLoc);
                    $("#ddlDriverID").val(data[0].TDrive).change();
                    $("#ddlDriverID2nd").val(data[0].TDriverID2).change();
                    $("#ddlVechilID").val(data[0].TVecheilId).change();
                    $("#txtContainerStatus").val(data[0].CContainerStatus).change();
                }, 3000)



            });
        } getTripById(Tripid);






        //Update Query START
        $(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });
        $(document).on('click', '#_btnReset', function () {
            FieldClear();
        });
        $("#_addCustomerReg").validate({

            rules: {

            },
            messages: {

            },
            submitHandler: function (form) {

                var Orderparams = {
                    ID: Tripid,
                    Operation_Date: new Date($('#txtDate').val()),
                    RecivedDate: new Date($('#txtReceivedDate').val()),
                    Trip_ID: $('#TripID').val(), //Reading text box values using Jquery   
                    // Order_ID: $('#ddlOrderID option:selected').val(),
                    // CountainerNo_ID: $("#editeContainerNo").val(),
                    // CountainerNo2_ID: $("#ddlContainerNo2").val(),
                    // FromLocation: $("#Fromlocation").val(),
                    // Tolocation: $("#Tolocation").val(),
                    // CurrentFromLocation: $("#currentFromLocation").val(),
                    // CurrentToLocation: $("#currentToLoaction").val(),
                    Logistics_ID: $("#ddlContainerNo option:selected").val(),
                    Drive_ID: $("#ddlDriverID option:selected").val(),
                    Driver2_ID: $("#ddlDriverID2nd option:selected").val(),
                    Vechial_ID: $("#ddlVechilID option:selected").val(),
                }
                services.UpdateTripDetail(JSON.stringify(Orderparams)).then(response => {
                    var listcheck = [];
                    var listprice = [];
                    var listremarks = [];
                    $("input:checkbox[name='_ExpenseCheckList']:checked").each(function () {
                        var id = $(this).val();
                        var link = "#txt" + id;
                        var link2 = "#txt2" + id;
                        var price = $(link).val();
                        var Remarks = $(link2).val();
                        listcheck.push($(this).val());
                        listprice.push(price);
                        listremarks.push(Remarks);
                    });
                    var Facilityparams = {
                        Expenseid: listcheck,
                        price: listprice,
                        Remarks: listremarks,
                        TripID: Tripid,
                    }
                    services.UpdateExpenseListByTripID(JSON.stringify(Facilityparams)).then(response => {
                        if (response == "00") {
                            toastr.success("Trip Details has been generated successfully");
                            returncondition = true;
                            window.location.href = "/sales/TripDetails";
                        }
                        else {
                            toastr.error("please select required fields");
                            returncondition = false;
                            window.location.href = "/sales/TripDetails";
                        }
                    }).catch(e => {
                        toastr.error("Server error,Please check your internet connection");
                        returnCondition = false;
                    });

                }).catch(e => {
                    toastr.error("server error,please check your internet connection");
                    returncondition = false;
                });
            }
        });






        //Update Query END












    } else if (isDeilverd == 2) {
        $("#lloForm").removeClass("d-none");
        $("#hideCheckboxContainerCurrent").addClass("d-none");
        $("#ContainerNo").addClass("d-none");
        $("#Containerhide").addClass("d-none");
        $("#hidetxtContainerStatus").removeClass("d-none");
        $("#_btnReset").addClass("d-none");

        $("#divTipDetails").addClass("d-none");
        //$("#hiderow3").addClass("d-none");
        //$("#hiderow1").addClass("d-none");
        //$("#hiderow2").addClass("d-none");
        //$("#hiderow4").addClass("d-none");
        $("#hideDriverID2nd").addClass("d-none");
        $("#hideTripeDetals").addClass("d-none");

        // $("#ddlContainerNo2").prop("disabled", false);
        // $("#editeContainerNo").prop("disabled", false);
        // $("#Fromlocation").prop("disabled", false);
        //$("#Tolocation").prop("disabled", false);
        $("#txtDate").prop("disabled", true);
        $("#ddlOrderID").prop("disabled", true);
        $("#editeContainerNo").prop("disabled", true);
        $("#ddlDriverID").prop("disabled", true);
        $("#ddlVechilID").prop("disabled", true);
        $("#currentFromLocation").prop("disabled", true);
        $("#currentToLoaction").prop("disabled", true);

        $("#PrintSlipbtn").addClass("d-none");


        //function getOrderByIdTrip(Tripid) {
        //    services.getOrderByIdTrip(JSON.stringify({
        //        id: Tripid
        //    })).then(function (response) {
        //        var data = response.order;

        //        setTimeout(function () {



        //            $("#ddlOrderID").val(data[0].id).change();

        //            getExpensesTripByid(data[0].id);

        //        }, 2000)



        //    });
        //} getOrderByIdTrip(Tripid);


        $(document).on('click', '#btnBack', function () {
            window.location.href = "/sales/TripDetails";
        });

        $('#ddlOrderID').on('change', function () {
            function getContainerbyid(id) {
                services.getContainerByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    var s = '<option value="-1">--Select Contianer No--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].CNo + '">' + data[i].CNo + '</option>';
                    }
                    $("#ddlContainerNo").html(s);
                });
            }
            getContainerbyid($(this).val());
        });



        function getTripById(Tripid) {
            services.getTripById(JSON.stringify({
                id: Tripid
            })).then(function (response) {
                var data = response.result;

                setTimeout(function () {

                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var val = data[i].ETripID;
                            var status = data[i].EPrice;
                            var Remarks = data[i].ERemarks;
                            $('#_ExpenseCheckList' + val).prop("checked", true);
                            $('#txt' + val).val(status).prop("disabled", false);
                            $('#txt2' + val).val(Remarks).prop("disabled", false);
                        }
                    }
                    else {
                        $('input:text').removeAttr('disabled')
                    }
                    $("#TripID").val(data[0].TCode);
                    $("#txtDate").val(moment(data[0].TOperation).format("YYYY-MM-DD"));
                    $("#ddlOrderID").val(data[0].TOrderId).change();
                    getExpensesTripByid(data[0].TOrderId);
                    $("#editeContainerNo").val(data[0].TContainerNo1);
                    $("#ddlContainerNo2").val(data[0].TContainer2);
                    $("#Fromlocation").val(data[0].TFromLoc);
                    $("#Tolocation").val(data[0].TToLoc);
                    $("#currentFromLocation").val(data[0].TCurrentFromloc);
                    $("#currentToLoaction").val(data[0].TCurrentToLoc);
                    $("#ddlDriverID").val(data[0].TDrive).change();
                    $("#ddlDriverID2nd").val(data[0].TDriverID2).change();
                    $("#ddlVechilID").val(data[0].TVecheilId).change();
                    $("#txtContainerStatus").val(data[0].CContainerStatus).change();
                }, 3000)



            });
        } getTripById(Tripid);






        //Update Query START
        $(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });
        $(document).on('click', '#_btnReset', function () {
            FieldClear();
        });
        $("#_addCustomerReg").validate({

            rules: {

            },
            messages: {

            },
            submitHandler: function (form) {

                var Orderparams = {
                    ID: Tripid,
                    Operation_Date: new Date($('#txtDate').val()),
                    Trip_ID: $('#TripID').val(), //Reading text box values using Jquery   
                    Logistics_ID: $("#ddlContainerNo option:selected").val(),
                    Drive_ID: $("#ddlDriverID option:selected").val(),
                    Driver2_ID: $("#ddlDriverID2nd option:selected").val(),
                    Vechial_ID: $("#ddlVechilID option:selected").val(),
                    ContainerStatus: $("#txtContainerStatus option:selected").val(),
                }
                services.UpdateTripDetailDelivery(JSON.stringify(Orderparams)).then(response => {
                    var listcheck = [];
                    var listprice = [];
                    var listremarks = [];
                    $("input:checkbox[name='_ExpenseCheckList']:checked").each(function () {
                        var id = $(this).val();
                        var link = "#txt" + id;
                        var link2 = "#txt2" + id;
                        var price = $(link).val();
                        var Remarks = $(link2).val();
                        listcheck.push($(this).val());
                        listprice.push(price);
                        listremarks.push(Remarks);
                    });
                    var Facilityparams = {
                        Expenseid: listcheck,
                        price: listprice,
                        Remarks: listremarks,
                        TripID: Tripid,
                    }
                    services.UpdateExpenseListByTripIDDeilvery(JSON.stringify(Facilityparams)).then(response => {
                        if (response == "00") {
                            toastr.success("Order has been generated successfully");
                            returncondition = true;
                            window.location.href = "/sales/UpcommingTrips";
                        }
                        else {
                            toastr.error("please select required fields");
                            returncondition = false;
                            window.location.href = "/sales/UpcommingTrips";
                        }
                    }).catch(e => {
                        toastr.error("Server error,Please check your internet connection");
                        returnCondition = false;
                    });

                }).catch(e => {
                    toastr.error("server error,please check your internet connection");
                    returncondition = false;
                });
            }
        });






        //Update Query END












    } else if (TripDetails == 3) {
        $("#currentToLoactionhide").addClass("d-none");
        $("#currentFromLocationhide").addClass("d-none");
        $("#hideContainerEditetxt").addClass("d-none");
        $("#ContainerHideedite").addClass("d-none");
        $("#gridShow").removeClass("d-none");
        // $("#ddlOrderID").removeClass("d-none");
        $("#ddlOrderID").prop("disabled", true);
        $("#PrintSlipbtn").addClass("d-none");





        $('#ddlOrderID').on('change', function () {
            //$("#ddlContinerNo").removeClass("d-none");

            function getContainerbyid(id) {
                services.getContainerByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    var s = '<option value="-1">--Select Contianer No--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].logi + '">' + data[i].CNo + '</option>';
                    }

                    $("#ddlContainerNo").html(s);

                });
            }
            getContainerbyid($(this).val());


        });







        $('#ddlContainerNo').on('change', function () {
            //$("#ddlContinerNo").removeClass("d-none");

            function getContainer2byid(id) {
                services.getContainer2ByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    //var s = '<option value="-1">--Select Contianer No2--</option>';
                    //for (var i = 0; i < data.length; i++) {
                    //   s += '<option value="' + data[i].CNo2 + '">' + data[i].CNo2 + '</option>';
                    // }
                    if (data[0].CNo2 != null) {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);
                    } else {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);
                        //    alert("No Data Found");
                    }



                    //   $("#ddlContainerNo2").html(s);

                });
            }
            getContainer2byid($(this).val());


        });


        $('#ddlVendor').on('change', function () {
            if ($('#ddlVendor').val() == 'Own' || $('#ddlVendor').val() == '') {
                $('.thirdPartyVendorDetail').addClass('d-none');
                $('.localTransportDetail').removeClass('d-none');
                $("#divExpenseList").removeClass('d-none');
            } else {
                $('.localTransportDetail').addClass('d-none');
                $('.thirdPartyVendorDetail').removeClass('d-none');
                $("#divExpenseList").addClass('d-none');
            }
        });





        function getOrderByIdTrip(Tripid) {
            services.getOrderByIdTrip(JSON.stringify({
                id: Tripid
            })).then(function (response) {
                var data = response.order;

                setTimeout(function () {



                    $("#ddlOrderID").val(data[0].id).change();


                    getExpensesTripByid(data[0].id);

                }, 2000)



            });
        } getOrderByIdTrip(Tripid);








        //end






        function getTripDetail(Tripid) {
            services.TripGrid(JSON.stringify({
                id: Tripid,
                //    ids2: empid2
            })).then(function (response) {
                // var data = response.result;


                //start


                var data1 = response.trip;

                setTimeout(function () {
                    $("#ddlOrderID").val(data1[0].OrderT).change();
                }, 3000)

                //end



                $('#tripGride').dataTable().fnClearTable();
                $('#tripGride').dataTable().fnDestroy();
                $('#tripGride').dataTable({
                    dom: 'Bfrtip',
                    //   "lengthChange": true,
                    "paging": true,
                    'searching': true,
                    //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                    "order": [[3, "desc"]],
                    'ordering': true,
                    "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]], //this is your new code
                    "iDisplayLength": 25, //this is your new code for number of records on page


                    data: response.trip,

                    columns: [{
                        data: 'tripid',
                        width: 10
                    },
                    {
                        data: 'orderno',
                        width: 10
                    },
                    {
                        data: 'contno',
                        width: 10
                    }, {
                        data: 'contno2',
                        width: 10
                    }, {
                        data: 'vehicleno',
                        width: 10
                    }, {
                        data: 'driver',
                        width: 10
                    }, {
                        data: 'fromloc',
                        width: 10
                    }, {
                        data: 'toloc',
                        width: 10
                    },
                    {
                        data: 'PartyDriverName',
                        width: 10
                    },
                    {
                        data: 'PartyDriverCNIC',
                        width: 10
                    },
                    {
                        data: 'PartyDriverContactNumber',
                        width: 10
                    },
                    {
                        data: 'PartyVehicleNo',
                        width: 10
                    },




                    //,{
                    // data: 'curentfromloc',
                    //  width: 10
                    // },{
                    //    data: 'currenttoloc',
                    //    width: 10
                    // },
                    {
                        data: 'CContainerStatus',
                        width: 10
                    }, {
                        data: 'total',
                        width: 10
                    },
                    {
                        data: 'id',
                        width: 10,
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }
                    ],
                    buttons: []
                });

            });
        }
        getTripDetail(Tripid);





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
            // '<div class="row" style="margin-left:4px;">'+

            // '<a data-id="' + id + '" class="p-1 fa fa-truck-loading _Recived" ></a>' +

            // '</div>'


            //'</div>'
            return html;
        }
        $(document).on("click", "._view", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&view=0";
        });
        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = $(this).attr('data-id');
            deleteTrip(ID);
        });
        $(document).on("click", "._Recived", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&deilverd=2";
        });



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





        GetOrder();

        function GetOrder() {

            var AppointmentsBody = $("#_MainGrideList");

            AppointmentsBody.empty();
            services.viewOrder().then(response => {

                var html = '';

                $("#MainGrid").dataTable().fnClearTable();
                $("#MainGrid").dataTable().fnDestroy();




                if (response) {
                    _.forEach(response.result, function (item, i) {
                        html += "<tr>" +
                            "<th> <a  href='TripDetails?id=" + (item.OrderID) + "&tripdetails=3'> " + (item.OrderNo) + " </a></th>" +
                            //"<th> <a href='AppointmentDetails' target='_blank'>" + (i + 1) + "</a></th>" +


                            "<td>" + moment(item.OrderDate).format("DD-MM-YYYY") + "</td>" +

                            "<td>" + item.BusinessDivisionName + "</td>" +
                            "<td>" + item.Customer_Name + "</td>" +
                            //"<td><button type='button'  style = 'color: #081344' title=''  class='btn btn-outline-primary btn-sm mx-1 btnEditService' data-id='" + item.PackageId + "' ></button></td>" +
                            "</tr>";
                        $("#gridShow").addClass("d-none");
                        $("#lloForm").removeClass("d-none");

                    })

                    AppointmentsBody.append(html);


                    getTripCode();
                    $('#MainGrid').DataTable({
                        "paging": true,
                        "searching": true,
                        "order": [[0, "desc"]],

                    })
                }


            });
        }

        function getTripCode() {
            services.getTripId().then(function (response) {

                $("#TripID").val(response).change();

            });
        }




        //Back Button
        $("#btnBack").click(function () {
            // Remove this line if it worked
            $("#gridShow").removeClass("d-none");
            $("#lloForm").addClass("d-none");
        });




        //$(document).on("change", ".txtprice", function () {



        //    if (this.checked) {
        //        price = price + Number($(this).attr("price"));

        //    }
        //    else {
        //        price = price - Number($(this).attr("price"));

        //    }

        //    $("#_totalPrice").html(price);

        //})




        $(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });
        // Submit Button
        var toastCount = 0;
        $("#_addCustomerReg").validate({
            rules: {
                txtDate: "required",
                ddlOrderID: { min: 1 },
                //   ddlContainerNo: { min: 1},
            },
            messages: {
                txtDate: "*",
                ddlOrderID: "*",
                //  ddlContainerNo: "*",
            },
            submitHandler: function (form) {
                var hasError = false;
                if ($('#ddlVendor').val() == '') {
                    toastr.error("Please select vendor first");
                    hasError = true;
                }

                if ($('#ddlContainerNo').val() == '-1') {
                    toastr.error("Please select alteast one container");
                    hasError = true;
                }

                if (hasError) {
                    return;
                }

                //if ($('#ddlVendor').val() != 'Own' && $("#VendorDriverName").val() == '') {
                //    toastr.error("Please enter Driver name");
                //    hasError = true;
                //}
                //if ($('#ddlVendor').val() != 'Own' && $("#VendorDriverCNIC").val() == '') {
                //    toastr.error("Please enter a valid CNIC");
                //    hasError = true;
                //}
                //if ($('#ddlVendor').val() != 'Own' && $("#VendorDriverContactNumber").val() == '') {
                //    toastr.error("Please enter vendor contact number");
                //    hasError = true;
                //}
                if ($('#ddlVendor').val() != 'Own' && $("#VendorVehicleNo").val() == '') {
                    toastr.error("Please enter vendor vehical number");
                    hasError = true;
                }
                if ($('#ddlVendor').val() != 'Own' && $("#VendorRate").val() == '') {
                    toastr.error("Please enter vendor vehical rate");
                    hasError = true;
                }
                if ($('#ddlVendor').val() == 'Own' && ($("#ddlVechilID").val() == '' || $("#ddlVechilID").val() == '-1')) {
                    toastr.error("Please select Vehical No");
                    hasError = true;
                }
                //if ($('#ddlVendor').val() == 'Own' && ($("#ddlDriverID").val() == '' || $("#ddlDriverID").val() == '-1')) {
                //    toastr.error("Please select a Driver");
                //    hasError = true;
                //}

                if (hasError) {
                    return;
                }                

                var tripparameter = {
                    Trip_ID: $("#TripID").val(),
                    Operation_Date: $("#txtDate").val(),
                    Logistics_ID: $("#ddlContainerNo option:selected").val(),
                    Drive_ID: $("#ddlDriverID option:selected").val(),
                    Driver2_ID: $("#ddlDriverID2nd option:selected").val(),
                    Vechial_ID: $("#ddlVechilID option:selected").val(),
                    PartyId: $('#ddlVendor').val(),
                    PartyDriverName: $("#VendorDriverName").val(),
                    PartyDriverCNIC: $("#VendorDriverCNIC").val(),
                    PartyDriverContactNumber: $("#VendorDriverContactNumber").val(),
                    PartyVehicleNo: $("#VendorVehicleNo").val(),
                    PartyRate: $("#VendorRate").val()
                }
                if ($('#ddlVendor').val() != 'Own') {
                    tripparameter.PartyDriverName = tripparameter.PartyDriverCNIC = tripparameter.PartyDriverContactNumber =
                        tripparameter.PartyVehicleNo = tripparameter.PartyRate = '';
                }
                else {
                    tripparameter.Drive_ID = tripparameter.Driver2_ID = tripparameter.Vechial_ID = 0;
                }
                services.Addtrip(JSON.stringify(tripparameter)).then(response => {
                    if ($("input[name='_ExpenseCheckList']:checked")[0] == undefined || (tripparameter.PartyId != "" && tripparameter.PartyId != "Own")) {
                        toastr.success("Order has been generated successfuly");
                        window.location.reload(1);
                        return;
                    }

                    var listcheck = [];
                    var listprice = [];
                    var listremarks = [];
                    var listcheck1 = [];
                    var listprice1 = [];
                    var listremarks1 = [];
                    if (response != null || response != 0) {
                        $("input[name='_ExpenseCheckList']:checked").each(function () {
                            var id = $(this).val();
                            var link = "#txt" + id;
                            var link2 = "#txt2" + id;
                            var price = $(link).val();
                            var Remarks = $(link2).val();
                            listcheck.push($(this).val());
                            listprice.push(price);
                            listremarks.push(Remarks);


                        });
                        //$("input[name='_ExpenseCheckList1']:checked").each(function () {
                        //            var id = $(this).val();
                        //            var link = "#txt12" + id;
                        //            var link2 = "#txt13" + id;
                        //            var price = $(link).val();
                        //            var Remarks = $(link2).val();
                        //            listcheck1.push($(this).val());
                        //            listprice1.push(price);
                        //            listremarks1.push(Remarks);
                        //        });
                        //var Facilityparams1 = {

                        //    Expenseid: listcheck1,
                        //    Price: listprice1,
                        //    Remarks: listremarks1,
                        //    OrderID: response,

                        //}

                        var Facilityparams = {

                            Expenseid: listcheck,
                            Price: listprice,
                            Remarks: listremarks,

                            OrderID: response,
                            //Expenseid: listcheck1,
                            //Price: listprice1,
                            //Remarks: listremarks1,
                            //OrderID: response,
                        }

                        //var Facilityparams1 = {

                        //    //Expenseid: listcheck,
                        //    //Price: listprice,
                        //    //Remarks: listremarks,

                        //    //OrderID: response,
                        //    Expenseid: listcheck1,
                        //    Price: listprice1,
                        //    Remarks: listremarks1,
                        //    OrderID: response,
                        //}


                        services.AddTripExpense(JSON.stringify(Facilityparams)).then(response => {
                            //if (response != null || response != 0) {
                            //    services.AddTripExpense(JSON.stringify(Facilityparams1)).then(response => {
                            //    });
                            //}
                            if (response == "00") {
                                getTripCode();
                                $("#TripID").val("");
                                $("#txtDate").val("");
                                //  $("#ddlOrderID").val("-1").change();
                                $("#ddlContainerNo").val("-1").change();
                                $("#ddlContainerNo2").val("");
                                $("#ddlDriverID").val("-1").change();
                                $("#ddlVechilID").val("-1").change();
                                $("input[name='_ExpenseCheckList']:checked").each(function () {
                                    var id = $(this).val();
                                    var link = "#txt" + id;
                                    var link2 = "#txt2" + id;
                                    $(link).val("").change();
                                    $(link2).val("").change();
                                    $(this).removeAttr('checked');
                                    showtextbox(id);
                                });
                                getTripDetail(Tripid);
                                window.location.reload(1);

                                // getTripDetail();
                                toastr.success("Order has been generated successfuly");
                                returncondition = true;
                                FieldClear();
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
                        toastr.error("Order Generation has been Failed");
                        returncondition = false;
                    }

                }).catch(e => {
                    toastr.error("server error,please check your internet connection");
                    returncondition = false;
                });
            }

        });



    } else {
        $("#currentToLoactionhide").addClass("d-none");
        $("#currentFromLocationhide").addClass("d-none");
        $("#hideContainerEditetxt").addClass("d-none");
        $("#ContainerHideedite").addClass("d-none");
        //$("#hideTripeDetals").addClass("d-none");



        $('#ddlOrderID').on('change', function () {
            //$("#ddlContinerNo").removeClass("d-none");

            function getContainerbyid(id) {
                services.getContainerByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    var s = '<option value="-1">--Select Contianer No--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].logi + '">' + data[i].CNo + '</option>';
                    }

                    $("#ddlContainerNo").html(s);

                });
            }
            getContainerbyid($(this).val());


        });



        $('#ddlContainerNo').on('change', function () {
            //$("#ddlContinerNo").removeClass("d-none");

            function getContainer2byid(id) {
                services.getContainer2ByOrder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    //var s = '<option value="-1">--Select Contianer No2--</option>';
                    //for (var i = 0; i < data.length; i++) {
                    //   s += '<option value="' + data[i].CNo2 + '">' + data[i].CNo2 + '</option>';
                    // }
                    if (data[0].CNo2 != null) {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);
                    } else {
                        $("#ddlContainerNo2").val(data[0].CNo2);
                        $("#Fromlocation").val(data[0].fromloc);
                        $("#Tolocation").val(data[0].toloc);
                        $("#txtContainerWeight").val(data[0].containerWeight);
                        //    alert("No Data Found");
                    }



                    //   $("#ddlContainerNo2").html(s);

                });
            }
            getContainer2byid($(this).val());


        });


        function getTripDetail(Tripid) {
            services.TripGrid(JSON.stringify({
                id: Tripid,
                //    ids2: empid2
            })).then(function (response) {
                // var data = response.result;


                $('#tripGride').dataTable().fnClearTable();
                $('#tripGride').dataTable().fnDestroy();
                $('#tripGride').dataTable({
                    dom: 'Bfrtip',
                    //   "lengthChange": true,
                    "paging": true,
                    'searching': true,
                    //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                    "order": [[3, "desc"]],
                    'ordering': true,
                    "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]], //this is your new code
                    "iDisplayLength": 25, //this is your new code for number of records on page


                    data: response.trip,

                    columns: [{
                        data: 'tripid',
                        width: 10
                    },
                    {
                        data: 'orderno',
                        width: 10
                    },
                    {
                        data: 'contno',
                        width: 10
                    }, {
                        data: 'contno2',
                        width: 10
                    }, {
                        data: 'vehicleno',
                        width: 10
                    }, {
                        data: 'driver',
                        width: 10
                    }, {
                        data: 'fromloc',
                        width: 10
                    }, {
                        data: 'toloc',
                        width: 10
                    }, {
                        data: 'toloc',
                        width: 10
                    }
                        , {
                        data: 'PartyDriverName',
                        width: 10
                    }, {
                        data: 'PartyDriverCNIC',
                        width: 10
                    }, {
                        data: 'PartyDriverContactNumber',
                        width: 10
                    }, {
                        data: 'PartyVehicleNo',
                        width: 10
                    },
                    {
                        data: 'CContainerStatus',
                        width: 10
                    }, {
                        data: 'total',
                        width: 10
                    },
                    {
                        data: 'id',
                        width: 10,
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }
                    ],
                    buttons: []
                });

            });
        }
        getTripDetail(Tripid);





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
            // '<div class="row" style="margin-left:4px;">'+

            // '<a data-id="' + id + '" class="p-1 fa fa-truck-loading _Recived" ></a>' +

            // '</div>'


            //'</div>'
            return html;
        }
        $(document).on("click", "._view", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&view=0";
        });
        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = $(this).attr('data-id');
            deleteTrip(ID);
        });
        $(document).on("click", "._Recived", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/sales/TripDetails?id=" + ID + "&deilverd=2";
        });



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



        //test start




        GetOrder();
        //GetServices();

        function GetOrder() {

            var AppointmentsBody = $("#_MainGrideList");

            AppointmentsBody.empty();
            services.viewOrder().then(response => {

                var html = '';

                $("#MainGrid").dataTable().fnClearTable();
                $("#MainGrid").dataTable().fnDestroy();




                if (response) {
                    _.forEach(response.result, function (item, i) {
                        html += "<tr>" +
                            "<th> <a  href='TripDetails?id=" + (item.OrderID) + "&tripdetails=3'> " + (item.OrderNo) + " </a></th>" +
                            //"<th> <a href='AppointmentDetails' target='_blank'>" + (i + 1) + "</a></th>" +


                            "<td>" + moment(item.OrderDate).format("DD-MM-YYYY") + "</td>" +

                            "<td>" + item.BusinessDivisionName + "</td>" +
                            "<td>" + item.Customer_Name + "</td>" +
                            //"<td><button type='button'  style = 'color: #081344' title=''  class='btn btn-outline-primary btn-sm mx-1 btnEditService' data-id='" + item.PackageId + "' ></button></td>" +
                            "</tr>";
                        // $("#gridShow").addClass("d-none");
                        // $("#lloForm").removeClass("d-none");

                    })

                    AppointmentsBody.append(html);


                    getTripCode();
                    $('#MainGrid').DataTable({
                        "paging": true,
                        "searching": true,
                        "order": [[0, "desc"]],

                    })
                }


            });
        }


        function getTripCode() {
            services.getTripId().then(function (response) {

                $("#TripID").val(response).change();

            });
        }







        $("#gridShow").removeClass("d-none");


        //Back Button
        $("#btnBack").click(function () {
            // Remove this line if it worked
            $("#gridShow").removeClass("d-none");
            $("#lloForm").addClass("d-none");
        });


        //Back Button
        //  $("#btnADD").click(function () {
        // Remove this line if it worked
        //     $("#gridShow").addClass("d-none");
        //    $("#lloForm").removeClass("d-none");
        //   getTripCode();
        // });





        $(document).on('click', '#btnSubmit', function () {
            $("#_addCustomerReg").valid();
        });



        // Submit Button
        var toastCount = 0;
        $("#_addCustomerReg").validate({
            rules: {
                txtDate: "required",
                ddlOrderID: { min: 1 },
                //   ddlContainerNo: { min: 1},
                ddlDriverID: { min: 1 },
                ddlVechilID: { min: 1 }
            },
            messages: {
                txtDate: "*",
                ddlOrderID: "*",
                //  ddlContainerNo: "*",
                ddlDriverID: "*",
                ddlVechilID: "*"

            },
            submitHandler: function (form) {
                var tripparameter = {
                    Trip_ID: $("#TripID").val(),
                    Operation_Date: $("#txtDate").val(),
                    Logistics_ID: $("#ddlContainerNo option:selected").val(),
                    Drive_ID: $("#ddlDriverID option:selected").val(),
                    Driver2_ID: $("#ddlDriverID2nd option:selected").val(),
                    Vechial_ID: $("#ddlVechilID option:selected").val(),
                }

                services.Addtrip(JSON.stringify(tripparameter)).then(response => {
                    var listcheck = [];
                    var listprice = [];
                    var listremarks = [];
                    if (response != null || response != 0) {
                        $("input[name='_ExpenseCheckList']:checked").each(function () {
                            var id = $(this).val();
                            var link = "#txt" + id;
                            var link2 = "#txt2" + id;
                            var price = $(link).val();
                            var Remarks = $(link2).val();
                            listcheck.push($(this).val());
                            listprice.push(price);
                            listremarks.push(Remarks);
                        });

                        var Facilityparams = {

                            Expenseid: listcheck,
                            Price: listprice,
                            Remarks: listremarks,
                            OrderID: response,

                        }
                        services.AddTripExpense(JSON.stringify(Facilityparams)).then(response => {
                            if (response == "00") {
                                getTripCode();
                                $("#TripID").val("");
                                $("#txtDate").val("");
                                $("#ddlOrderID").val("-1").change();
                                $("#ddlContainerNo").val("-1").change();
                                $("#ddlContainerNo2").val("");
                                $("#ddlDriverID").val("-1").change();
                                $("#ddlVechilID").val("-1").change();
                                $("input[name='_ExpenseCheckList']:checked").each(function () {
                                    var id = $(this).val();
                                    var link = "#txt" + id;
                                    var link2 = "#txt2" + id;
                                    $(link).val("").change();
                                    $(link2).val("").change();
                                    $(this).removeAttr('checked');
                                    showtextbox(id);
                                });
                                // getTripDetail();
                                toastr.success("Order has been generated successfuly");
                                returncondition = true;

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
                        toastr.error("Order Generation has been Failed");
                        returncondition = false;
                    }

                }).catch(e => {
                    toastr.error("server error,please check your internet connection");
                    returncondition = false;
                });
            }

        });

    }//else


});