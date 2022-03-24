function editClick(id) {

    var referenceNum = id;
    window.location.href = "Index?id=" + referenceNum + "&edit=1";
}



$("#btnDraft").click(function () {
    save(true)
})

$(document).ready(function () {
    var services = new Services();

    $.ajax({
        type: "GET",
        url: "/BLShippingLine/GetContainerNo",
        data: "{}",
        async: false,
        success: function (data) {
            var _data = '<option value="">Please Select Container</option>';
            for (var i = 0; i < data.length; i++) {
                _data += '<option value="' + data[i].ContainerNo + '">' + data[i].ContainerNo + '</option>';
            }
            $(".txtContainerNo").html(_data);
            $('.txtContainerNo').select2();
        }

    });

    $.ajax({
        type: "GET",
        url: "/BLShippingLine/GetBlAgent",
        data: "{}",
        async: false,
        success: function (data) {
            var s = '<option value=""disable >Please Select Agent</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].BLAgent + '">' + data[i].BLAgent + '</option>';
            }
            $("#txtagent").html(s);

        }

    });


    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");
    if (isEdit == 1) {

        $("#lloForm").show();

        //Back Button
        $("#btnBack").click(function () {
            window.location.href = "Index";
        });


        function getBlShippingLineByid(empid) {
            services.getBlShippingLineByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;

                var data1 = data[0].DateOfIssue ? moment(data[0].DateOfIssue).format("YYYY-MM-DD") : "--";
                $("#txtblNo").val(data[0].bl);
                $("#txtIsCompleted").val(data[0].IsCompleted);
                $("#txtBLShippingID").val(empid);
                $("#txtshipping").val(data[0].shipper);
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
                $(".txtContainerNo").select2().val(data[0].ContainerNo.split(',')).trigger("change");
                $("#txtSealNo").val(data[0].SealNo);
                $("#txtConatinerOrPackage").val(data[0].numberOfConatinerPack);
                $("#txtkindofpack").val(data[0].kindOfPackagesDescriptionOfGoods);
                $("#txtGrossWeight").val(data[0].grossWeight);
                $("#txtNetWeight").val(data[0].netWeight);
                $("#txtfreightandcharges").val(data[0].Frightandcharges);
                $("#txtagent").val(data[0].BLAgent);
                $("#txtagentdetail").val(data[0].BLAgentDetail);
                $("#txtypeofservice").val(data[0].TypeOfService);
                $("#txtNumberofOrignal").val(data[0].NumberOfOrignalBL);
                $("#txtforwardingagent").val(data[0].ForwardingAgent);
                $("#txtfinaldestination").val(data[0].FinalDestination);
                $("#txtfreightPayable").val(data[0].FrightPayable);
                $("#txtplaceofissue").val(data[0].PlaceOfIssue);
                $("#txtOperationDate").val(data1);

            });
        } getBlShippingLineByid(empid);

        $(document).on('click', '#btnDraft', function () {
            $("#txtIsCompleted").val(false)
            $("#_addShippingLine").valid();
        });

        $(document).on('click', '#btnSubmit', function () {
            $("#txtIsCompleted").val(true)
            $("#_addShippingLine").valid();
        });

        $(document).on("click", "#btnPrint", function (e) {
            var ID = $("#txtBLShippingID").val();
            let url = "/BLShippingLine/PrintGDReport?id=" + ID;
            let link = document.createElement("a");
            link.href = url;
            link.click();
        });

        // Submit Button
        var toastCount = 0;
        $("#_addShippingLine").validate({
            rules: {
            },
            messages: {
            },
            submitHandler: function (form) {
                $.ajax(
                    {
                        type: "POST", //HTTP POST Method  
                        url: "/BLShippingLine/AddOrEditeBLShippingLine", // Controller/View   
                        data: { //Passing data  
                            BLShippingID: empid,
                            BL: $("#txtblNo").val(),
                            IsCompleted: $("#txtIsCompleted").val(),
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
                            ContainerNo: $(".txtContainerNo").val().toString(),
                            SealNo: $("#txtSealNo").val(),
                            NumberOfConatinerPack: $("#txtConatinerOrPackage").val(),
                            KindOfPackagesDescriptionOfGoods: $("#txtkindofpack").val(),
                            GrossWeight: $("#txtGrossWeight").val(),
                            NetWeight: $("#txtNetWeight").val(),
                            Frightandcharges: $("#txtfreightandcharges option:selected").val(),
                            BLAgent: $("#txtagent option:selected").val(),
                            BLAgentDetail: $("#txtagentdetail").val(),
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

    }
    else {
        $("#DX").addClass("d-none");
        $("#gridShow").removeClass("d-none");

        function getblshippingGride() {
            services.getblshippingGride().then(function (response) {

                $('#BLShippingGride').dataTable().fnClearTable();
                $('#BLShippingGride').dataTable().fnDestroy();
                $('#BLShippingGride').dataTable({
                    dom: 'Bfrtip',
                    "buttons": [
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

                    columns: [
                        {
                            data: 'ID',
                            width: 5,
                            "render": function (data, type, row) {
                                var html = appendActionMenu(row);
                                return html;
                            }
                        },
                        {
                            data: 'Approval',
                            width: 10,
                            'render': function (data) {
                                if (data == null) {
                                    return 'N/A'
                                } else {
                                    return data == true ? "ACCEPTED" : "REJECTED";
                                }
                            }
                        },
                        {
                            data: 'bl',
                            width: 10
                        },

                        {
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
                        }],
                });

            });
        }

        getblshippingGride();

        function appendActionMenu(row) {
            var html = `<div class="row" style="margin-left:4px;">`;
            if (row.IsCompleted == false) {
                html = html + `<a data-id="` + row.ID + `" class="p-1 fa fa-edit _edit" ></a>`;
            }
            html = html + `<a data-id="` + row.ID + `" class="p-1 fa fa-print _remove" ></a>
                </div>`
            return html;
        }

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


        $(document).on('click', '#btnDraft', function () {
            $("#txtIsCompleted").val(false)
            $("#_addShippingLine").valid();
        });

        $(document).on('click', '#btnSubmit', function () {
            $("#txtIsCompleted").val(true)
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
                txtOceanVessel: "required",
                txtVoyNo: "required",
                txtPortOfLanding: "required",
                txtPortOfDischarge: "required",
                txtPlaceofDeilvery: "required",
                txtContainerNo: "required",
                txtSealNo: "required",
                txtConatinerOrPackage: "required",
                txtkindofpack: "required",
                txtGrossWeight: "required",
                txtNetWeight: "required",
                txtfreightandcharges: "required",
                txtCollect: "required",
                txtNumberofOrignal: "required",
                txtEDob: "required",
                txtplaceofissue: "required",
            },
            messages: {

                txtblNo: "*",
                txtshipping: "*",
                txtConsignee: "*",
                txtNotifyParty: "*",
                txtOceanVessel: "*",
                txtVoyNo: "*",
                txtPortOfLanding: "*",
                txtPortOfDischarge: "*",
                txtPlaceofDeilvery: "*",
                txtContainerNo: "*",
                txtSealNo: "*",
                txtVoyNo: "*",
                txtConatinerOrPackage: "*",
                txtkindofpack: "*",
                txtGrossWeight: "*",
                txtNetWeight: "*",
                txtfreightandcharges: "*",
                txtCollect: "*",
                txtNumberofOrignal: "*",
                txtEDob: "*",
                txtplaceofissue: "*",


            },
            submitHandler: function (form) {
                $.ajax(
                    {
                        type: "POST", //HTTP POST Method  
                        url: "/BLShippingLine/AddOrEditeBLShippingLine", // Controller/View   
                        data: { //Passing data  
                            BL: $("#txtblNo").val(),
                            IsCompleted: $("#txtIsCompleted").val(),
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
                            BLAgentDetail: $("#txtagentdetail").val(),
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
                                    //$("txtagentdetail").val("");
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
                        error: function (response) {
                            toastr.error("Server error,Please check your internet connection");
                        }
                    });
            }

        });

    }

});


