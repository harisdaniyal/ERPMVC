
/*
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

*/







function editClick(id) {

    var referenceNum = id;
    window.location.href = "Index?id=" + referenceNum + "&edit=1";
}





$(document).ready(function () {
    var services = new Services();


    //$.ajax({
    //    type: "GET",
    //    url: "/BLShippingLine/GetApproval",
    //    data: "{}",
    //    success: function (data) {
    //        var s = '<option value="">Please Select a Approval</option>';
    //        for (var i = 0; i < data.length; i++) {
    //            s += '<option value="' + data[i].SID + '">' + data[i].SStatus + '</option>';
    //        }
    //        $("#txtApproval").html(s);
    //    }

    //}, 5000);

    $.ajax({
        type: "GET",
        url: "/BLShippingLine/GetContainerNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="">Please Select Container</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].ContainerNo + '">' + data[i].ContainerNo + '</option>';
            }
            $("#txtContainerNo").html(s);
            $('.txtContainerNo').select2();
        }

    }, 5000);

    $.ajax({
        type: "GET",
        url: "/BLShippingLine/GetBlAgent",
        data: "{}",
        success: function (data) {
            var s = '<option value=""disable >Please Select Agent</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].BLAgent + '">' + data[i].BLAgent + '</option>';
            }
            $("#txtagent").html(s);
            //$('.txtContainerNo').select2();
        }

    }, 5000);


    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {

        $("#lloForm").show();


        //Back Button
        $("#btnBack").click(function () {
            // Remove this line if it worked
            //     $("#gridShow").show();
            //   $("#lloForm").hide();
            window.location.href = "Index";
        });


        function getBlShippingLineByid(empid) {
            services.getBlShippingLineByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;

                var data1 = data[0].DateOfIssue ? moment(data[0].DateOfIssue).format("YYYY-MM-DD") : "--";
                $("#txtblNo").val(data[0].bl);
                //$("#txtApproval").val(data[0].Approv).change();
                //$("#txtshipping").val(data[0].shipper);
                $("#txtConsignee").val(data[0].consignee);
                $("#txtNotifyParty").val(data[0].notifyParty);
                $("#txtprecarriageby").val(data[0].precarriageby);
                $("#txtCollect").val(data[0].Collect);
                $("#txtplaceofReceipt").val(data[0].placeofreceipt);
                $("#txtOceanVessel").val(data[0].oceanVessel);
                $("#txtVoyNo").val(data[0].voyNo);
                $("#txtPortOfLanding").val(data[0].portoflanding);
                $("#txtPortOfDischarge").val(data[0].portofDischarge);
                $("#txtPlaceofDeilvery").val(data[0].placeOfDelivery);
            /*    $("#txtContainerNo").val(data[0].ContainerNo);*/
                $(".txtContainerNo").select2().val([data[0].ContainerNo]).trigger("change");
                $("#txtSealNo").val(data[0].SealNo);
                $("#txtConatinerOrPackage").val(data[0].numberOfConatinerPack);
                $("#txtkindofpack").val(data[0].kindOfPackagesDescriptionOfGoods);
                $("#txtGrossWeight").val(data[0].grossWeight);
                $("#txtNetWeight").val(data[0].netWeight);
                $("#txtfreightandcharges").val(data[0].Frightandcharges);
                $("#txtagent").val(data[0].BLAgent);
                $("#txtypeofservice").val(data[0].TypeOfService);
                $("#txtNumberofOrignal").val(data[0].NumberOfOrignalBL);
                $("#txtforwardingagent").val(data[0].ForwardingAgent);
                $("#txtfinaldestination").val(data[0].FinalDestination);
                $("#txtfreightPayable").val(data[0].FrightPayable);
                $("#txtplaceofissue").val(data[0].PlaceOfIssue);
                $("#txtOperationDate").val(data1);

            });
        } getBlShippingLineByid(empid);




        $(document).on('click', '#btnSubmit', function () {
            $("#_addShippingLine").valid();
        });



        // Submit Button
        var toastCount = 0;
        $("#_addShippingLine").validate({
            rules: {
                /*
                txtCityCode: "required",
                txtCityName: "required",
                txtCityPhoneCode: "required",
                txtCountryName: { min: 1}
                */
            },
            messages: {
                /*
                txtCityCode: "*",
                txtCityName: "*",
                txtCityPhoneCode: "*",
                txtCountryName: "*"
                */
            },
            submitHandler: function (form) {
                $.ajax(
                    {
                        type: "POST", //HTTP POST Method  
                        url: "/BLShippingLine/AddOrEditeBLShippingLine", // Controller/View   
                        data: { //Passing data  
                            BLShippingID: empid,
                            BL: $("#txtblNo").val(),
                           // Approval: $("#txtApproval option:selected").val(),
                            Shipper: $("#txtshipping").val(),
                            Consignee: $("#txtConsignee").val(),
                            NotifyParty: $("#txtNotifyParty").val(),
                            precarriageby: $("#txtprecarriageby").val(),
                            Collect: $("#txtCollect").val(),
                            placeofreceipt: $("#txtplaceofReceipt").val(),
                            OceanVessel: $("#txtOceanVessel").val(),
                            VoyNo: $("#txtVoyNo").val(),
                            Portoflanding: $("#txtPortOfLanding").val(),
                            PortofDischarge: $("#txtPortOfDischarge").val(),
                            PlaceOfDelivery: $("#txtPlaceofDeilvery").val(),
                            ContainerNo: $(".txtContainerNo").select2("val").toString(),
                            SealNo: $("#txtSealNo").val(),
                            NumberOfConatinerPack: $("#txtConatinerOrPackage").val(),
                            KindOfPackagesDescriptionOfGoods: $("#txtkindofpack").val(),
                            GrossWeight: $("#txtGrossWeight").val(),
                            NetWeight: $("#txtNetWeight").val(),
                            Frightandcharges: $("#txtfreightandcharges option:selected").val(),
                            BLAgent: $("#txtagent option:selected").val(),
                            TypeOfService: $("#txtypeofservice").val(),
                            NumberOfOrignalBL: $("#txtNumberofOrignal").val(),
                            ForwardingAgent: $("#txtforwardingagent").val(),
                            FinalDestination: $("#txtfinaldestination").val(),
                            FrightPayable: $("#txtfreightPayable").val(),
                            PlaceOfIssue: $("#txtplaceofissue").val(),
                            DateofIssue: $("#txtOperationDate").val()

                        },

                        success: function (response) {

                            if (response.success) {
                                //   getLocDropGridDetail();
                                window.location.href = "Index";


                                //  $("#txtfreightPayable").val("");
                                //  $("#txtOperationDate").val("");


                                toastr.success("City Detail has been inserted successfully");
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



        //$("#DX").removeClass("d-none");



    }
    else {
        $("#DX").addClass("d-none");
        $("#gridShow").removeClass("d-none");
        //$("#DX").removeClass("d-none");


        function getblshippingGride() {
            services.getblshippingGride().then(function (response) {

                $('#BLShippingGride').dataTable().fnClearTable();
                $('#BLShippingGride').dataTable().fnDestroy();
                $('#BLShippingGride').dataTable({


                    dom: 'Bfrtip',


                    "buttons": [
                        /*
                        {  
                            extend: 'print',  
                            className: 'btn btn-primary rounded-0',  
                            text: '<i class="far fa-file-print"></i> Print'  
                        },
                        */
                        // 'excel'
                        {
                            extend: 'excel',
                            className: 'btn btn-success rounded-0',
                            text: '<i class=""></i> Excel'
                        },
                    ],
                    // "Sorting": false, 
                    "lengthChange": false,
                    "paging": true,
                    'searching': true,

                    data: response.BL,

                    columns: [{
                        data: 'Approv',
                        width: 10
                    }, {
                        data: 'bl',
                        width: 10
                    }, {
                        data: 'shipper',
                        width: 10
                    }, {
                        data: 'consignee',
                        width: 10
                    }, {
                        data: 'notifyParty',
                        width: 10
                    }, {
                        data: 'precarriageby',
                        width: 10
                    }, {
                        data: 'Collect',
                        width: 10
                    }, {
                        data: 'placeofreceipt',
                        width: 10
                    }, {
                        data: 'oceanVessel',
                        width: 10
                    }, {
                        data: 'voyNo',
                        width: 10
                    }, {
                        data: 'portoflanding',
                        width: 10
                    }, {
                        data: 'portofDischarge',
                        width: 10
                    }, {
                        data: 'placeOfDelivery',
                        width: 10
                    }, {
                        data: 'ContainerNo',
                        width: 10
                    }, {
                        data: 'SealNo',
                        width: 10
                    }, {
                        data: 'numberOfConatinerPack',
                        width: 10
                    }, {
                        data: 'kindOfPackagesDescriptionOfGoods',
                        width: 10
                    }, {
                        data: 'grossWeight',
                        width: 10
                    }, {
                        data: 'netWeight',
                        width: 10
                    }, {
                        data: 'Frightandcharges',
                        width: 10
                    }, {
                        data: 'BLAgent',
                        width: 10
                    }, {
                        data: 'TypeOfService',
                        width: 10
                    }, {
                        data: 'NumberOfOrignalBL',
                        width: 10
                    }, {
                        data: 'ForwardingAgent',
                        width: 10
                    },
                    {
                        data: 'FinalDestination',
                        width: 10
                    },
                    {
                        data: 'FrightPayable',
                        width: 10
                    }, {
                        data: 'PlaceOfIssue',
                        width: 10
                    }, {
                        data: 'DateOfIssue',
                        width: 10,
                        'render': function (date) {
                            //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                            var data = date ? moment(date).format("ll") : "--"
                            return data;
                        }
                    }, {
                        data: 'ID',
                        width: 5,
                        "render": function (data) {
                            var html = appendActionMenu(data);

                            return html;
                        }



                    }],

                    // dropDown Search Start

                    //initComplete: function () {
                    //    this.api().columns().every(function () {
                    //        var column = this;
                    //        var select = $('<select><option value=""></option></select>')
                    //            .appendTo($(column.footer()).empty())
                    //            .on('change', function () {
                    //                var val = $.fn.dataTable.util.escapeRegex(
                    //                    $(this).val()
                    //                );

                    //                column
                    //                    .search(val ? '^' + val + '$' : '', true, false)
                    //                    .draw();
                    //            });

                    //        column.data().unique().sort().each(function (d, j) {
                    //            select.append('<option value="' + d + '">' + d + '</option>')
                    //        });
                    //    });
                    //}
                    // dropDown Search End 

                });

            });
        }
        getblshippingGride();

        function appendActionMenu(id) {
            var html =
                //@if '(ViewContext.HttpContext.User.IsInRole("Admin"))'+
                // '{'+
                //'<div class="dropdown">' +
                // '<a class="dropdown-toggle"  href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >' +
                //     '<span class="vertical-icon"></span>' +
                //       '<span class="fa fa-ellipsis-v"></span>' +
                //     '</a>' +

                '<div class="row" style="margin-left:4px;">' +

                /*            '<a data-id="' + id + '" class="p-1 fa fa-eye _view" ></a>' +*/

                '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +

                '<a data-id="' + id + '" class="p-1 fa fa-print _remove" ></a>' +

                '</div>'

            //'</div>'
            return html;
        }
        //$(document).on("click", "._view", function (e) {

        //    var ID = $(this).attr('data-id');
        //    window.location.href = "/Account/Register?id=" + ID + "&edit=0";
        //});

        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/BLShippingLine/Index?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "/BLShippingLine/PrintGDReport?id=" + ID + "&edit=1";
        });






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









        $(document).on('click', '#btnSubmit', function () {
            $("#_addShippingLine").valid();
        });



        // Submit Button
        var toastCount = 0;
        $("#_addShippingLine").validate({
            rules: {

                txtblNo: "required",
                txtshipping: "required",
                txtConsignee: "required",
                txtNotifyParty: "required",
                // txtprecarriageby: "required",
                //  txtplaceofReceipt: "required",
                txtOceanVessel: "required",
                txtVoyNo: "required",
                txtPortOfLanding: "required",
                txtPortOfDischarge: "required",
                txtPlaceofDeilvery: "required",
                txtforwardingagent: "required",
                txtfinaldestination: "required",
                txtContainerNo: "required",
                txtSealNo: "required",
                txtConatinerOrPackage: "required",
                txtkindofpack: "required"


            },
            messages: {

                txtblNo: "*",
                txtshipping: "*",
                txtConsignee: "*",
                txtNotifyParty: "*",
                // txtprecarriageby: "*",
                //  txtplaceofReceipt: "*",
                txtOceanVessel: "*",
                txtVoyNo: "*",
                txtPortOfLanding: "*",
                txtPortOfDischarge: "*",
                txtPlaceofDeilvery: "*",
                txtContainerNo: "*",
                txtSealNo: "*",
                txtConatinerOrPackage: "*",


            },
            submitHandler: function (form) {
                $.ajax(
                    {
                        type: "POST", //HTTP POST Method  
                        url: "/BLShippingLine/AddOrEditeBLShippingLine", // Controller/View   
                        data: { //Passing data  
                            BL: $("#txtblNo").val(),
                            // Approval: $("#txtApproval option:selected").val(),
                            Shipper: $("#txtshipping").val(),
                            Consignee: $("#txtConsignee").val(),
                            NotifyParty: $("#txtNotifyParty").val(),
                            precarriageby: $("#txtprecarriageby").val(),
                            Collect: $("#txtCollect").val(),
                            placeofreceipt: $("#txtplaceofReceipt").val(),
                            OceanVessel: $("#txtOceanVessel").val(),
                            VoyNo: $("#txtVoyNo").val(),
                            Portoflanding: $("#txtPortOfLanding").val(),
                            PortofDischarge: $("#txtPortOfDischarge").val(),
                            PlaceOfDelivery: $("#txtPlaceofDeilvery").val(),
                            ContainerNo: $(".txtContainerNo").select2("val").toString(),
                            SealNo: $("#txtSealNo").val(),
                            NumberOfConatinerPack: $("#txtConatinerOrPackage").val(),
                            KindOfPackagesDescriptionOfGoods: $("#txtkindofpack").val(),
                            GrossWeight: $("#txtGrossWeight").val(),
                            NetWeight: $("#txtNetWeight").val(),
                            Frightandcharges: $("#txtfreightandcharges option:selected").val(),
                            BLAgent: $("#txtagent option:selected").val(),
                            TypeOfService: $("#txtypeofservice").val(),
                            NumberOfOrignalBL: $("#txtNumberofOrignal").val(),
                            ForwardingAgent: $("#txtforwardingagent").val(),
                            FinalDestination: $("#txtfinaldestination").val(),
                            FrightPayable: $("#txtfreightPayable").val(),
                            PlaceOfIssue: $("#txtplaceofissue").val(),
                            DateofIssue: $("#txtOperationDate").val()

                        },

                        success: function (response) {
                            if (response.success != null) {
                                if (response.success) {
                                    getblshippingGride();
                                    $("#txtblNo").val("");
                                    //$("#txtApproval").val("");
                                    $("#txtshipping").val("");
                                    $("#txtConsignee").val("");
                                    $("#txtNotifyParty").val("");
                                    $("#txtprecarriageby").val("");
                                    $("#txtCollect").val("");
                                    $("#txtplaceofReceipt").val("");
                                    $("#txtOceanVessel").val("");
                                    $("#txtVoyNo").val("");
                                    $("#txtPortOfLanding").val("");
                                    $("#txtPortOfDischarge").val("");
                                    $("#txtPlaceofDeilvery").val("");
                                    $("#txtContainerNo").val("");
                                    $("#txtSealNo").val("");
                                    $("#txtConatinerOrPackage").val("");
                                    $("#txtkindofpack").val("");
                                    $("#txtGrossWeight").val("");
                                    $("#txtNetWeight").val("");
                                    $("#txtfreightandcharges").val("");
                                    $("txtagent").val("");
                                    $("#txtypeofservice").val("");
                                    $("#txtNumberofOrignal").val("");
                                    $("#txtfreightPayable").val("");
                                    $("#txtforwardingagent").val("");
                                    $("#txtfinaldestination").val("");
                                    $("#txtplaceofissue").val("");
                                    $("#txtOperationDate").val("");
                                    toastr.success("BL Shipping Details has been inserted successfully.");
                                    returncondition = true;
                                } else {
                                    toastr.error("BL Detail Already inserted.");
                                    returncondition = false;
                                }
                            } else {
                                toastr.error("Kindly check your Internet Connection!");
                                returncondition = false;
                            }
                        },

                        /*
                                                if (response.success) {
                                                
                                                getblshippingGride();
                                                $("#txtblNo").val("");
                                                $("#txtApproval").val("");
                                                $("#txtshipping").val("");
                                                $("#txtConsignee").val("");
                                                $("#txtNotifyParty").val("");
                                                $("#txtprecarriageby").val("");
                                                $("#txtplaceofReceipt").val("");
                                                $("#txtOceanVessel").val("");
                                                $("#txtVoyNo").val("");
                                                $("#txtPortOfLanding").val("");
                                                $("#txtPortOfDischarge").val("");
                                                $("#txtPlaceofDeilvery").val("");
                                                $("#txtContainerNo").val("");
                                                $("#txtSealNo").val("");
                                                $("#txtConatinerOrPackage").val("");
                                                $("#txtkindofpack").val("");
                                                $("#txtGrossWeight").val("");
                                                $("#txtNetWeight").val("");
                                                $("#txtfreightandcharges").val("");
                                                $("#txtypeofservice").val("");
                                                $("#txtNumberofOrignal").val("");
                                                $("#txtfreightPayable").val("");
                                                $("#txtOperationDate").val("");
                        
                        
                                                          
                                          toastr.success("BL Shipping Detail has been inserted successfully");
                                        } else {
                                            // DoSomethingElse()
                                            toastr.warn("Kindly Check Your Detail");
                                        }
                                   }, */
                        error: function (response) {
                            toastr.error("Server error,Please check your internet connection");
                        }
                    });
            }

        });
        ///

    }


});


