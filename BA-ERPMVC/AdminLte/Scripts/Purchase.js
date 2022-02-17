$(document).ready(function () {
    //$('#_tblTicketList').DataTable({
    //})
    var services = new Services();
    var TotalAmount = 0;
    getParty();
    getPurchaseNo();
    var PurchaseId = $.url().param('id');
    var isEdit = $.url().param('edit');
    if (isEdit == "1") {
        $("#FormDetail").removeClass("d-none");
        $("#TableView").addClass("d-none");
        getPurchaseMasterById(PurchaseId, isEdit);
    }
    else if (isEdit == "0") {
        $("#FormDetail").removeClass("d-none");
        $("#TableView").addClass("d-none");
        $("._field").prop("disabled", true);
        //hide the first column

        getPurchaseMasterById(PurchaseId, isEdit);

    }

    var form = $('#form1');
    $("#form1").validate({
        rules: {
            _purchaseNo: "required",
            _date: "required",
            _creditDay: "required",
            _dueDate: "required",
            _billNo: "required",
            _vendorList: "required",
            //_amount: "required",
            //_remarks: "required",
        }

    });
    function getPurchaseMasterById(ID, isEdit) {
        services.getPurchaseMasterbyId(JSON.stringify({
            PurchaseId: ID
        })).then(function (response) {
            $("#_tblTicketList").dataTable().fnDestroy();
            for (var i = 0; i < response.length; i++) {
                var html = "";

                html += "<tr>" +
                    "<td>" + response[i].PurchaseDetailId + "</td>" +
                    "<td>" + response[i].ItemName + "_" + response[i].ItemId + "</td>" +
                    "<td>" + response[i].Quantity + "</td>" +
                    //"<td>" + response[i].UnitIn + "</td>" +
                    "<td>" + response[i].Rate + "</td>" +
                    "<td>" + response[i].Amount + "</td>" +
                    "<td>" + response[i].Remarks + "</td>" +
                    "<td><a data-id='" + response[i].PurchaseDetailId + "' class='p-1 fa fa-edit _editDetail'' ></a><a data-PurchaseId='" + response[i].PurchaseDetailId + "' class='p-1 fa fa-trash _deletePurchaseDetail' ></a></td>" +
                    "</tr>";
                $("#_ticketList").append(html)
            }

            var dt = $('#_tblTicketList').DataTable({

                "footerCallback": function (row, data, start, end, display) {
                    FooterData(this);
                },
            })
            if (isEdit == 0) {
                dt.column(6).visible(false);
            }
            $("#_purchaseId").val(response[0].PurchaseId);
            $("#_purchaseNo").val(response[0].PurchaseNo);
            $("#_purchaseType").val(response[0].PurchaseTypeId);
            $("#_date").val(moment(response[0].Date).format("YYYY-MM-DD"));
            $("#_creditDay").val(response[0].CreditDay);
            $("#_dueDate").val(moment(response[0].DueDate).format("YYYY-MM-DD"));
            $("#_vendorList").val(response[0].PartyId);
            $("#_billNo").val(response[0].BillNo);

        })
    }
    $("#_date").focusout(function () {
        IncreamentOnDate();


    });
    $("#_creditDay").focusout(function () {
        IncreamentOnDate();

    });

    function IncreamentOnDate() {
        if ($("#_creditDay").val() != "" && $("#_date").val() != "") {
            var date = new Date($("#_date").val());
            date.setDate(date.getDate() + parseInt($("#_creditDay").val()));
            $("#_dueDate").val(moment(date).format("YYYY-MM-DD"));
        }
        else {
            $("#_dueDate").val("");
        }
    }
    $("#_quantity").focusout(function () {
        CalculateTotalAmount();

    });
    $("#_rate").focusout(function () {
        CalculateTotalAmount();

    });
    function CalculateTotalAmount() {
        var qty = $("#_quantity").val();
        var rate = $("#_rate").val();
        var total = 0;
        if (qty != "" && rate != "") {
            total = parseInt(qty) * parseInt(rate);
            $("#_amount").val(total);
        }
        else if (qty != "") {
            total = parseInt(qty) * 0;
            $("#_amount").val(total);
        }
        else if (rate != "") {
            total = 0 * parseInt(rate);
            $("#_amount").val(total);
        }
        else {
            $("#_amount").val(0);
        }
    }

    function getPurchaseNo() {
        services.getPurchaseNo().then(function (response) {
            $("#_purchaseNo").val(response).change();
            $("#_purchaseNo").prop("disabled", true);
        })
    }
    function getItem() {
        services.getItemList().then(function (response) {
            var documentlist = $("#_itemList");
            var html = '';
            documentlist.empty();
            html += '<option value=""> Select Item </option>';
            _.forEach(response, function (item, i) {
                html += '<option value="' + item.ItemId + '" data-Unit ="' + item.Unit + '"> ' + item.ItemName + ' </option>';
            });
            documentlist.append(html);
        })

    }
    getItem();

    //$(document).on('change', '#_itemList', function () {
    //    let unit = $('option:selected', this).attr('data-Unit');
    //    $("#_unit").val(unit);
    //})
    function getParty() {
        services.getPartybyId(JSON.stringify({
            PartyId: 0
        })).then(function (response) {
            var documentlist = $("#_vendorList");
            var partylist = $("#_partyId");
            var html = '';
            documentlist.empty();
            html += '<option value=""> Select Account </option>';
            _.forEach(response, function (item, i) {
                html += '<option value="' + item.PartyId + '"> ' + item.PartyName + ' </option>';
            });
            documentlist.append(html);
            partylist.append(html);
        })

    }

    $(document).on("click", "#_addPurchaseDetail", function (e) {

        $("#FormDetail").removeClass("d-none");
        $("#TableView").addClass("d-none");
        getPurchaseNo();

    });
    $(document).on("click", "#_back", function (e) {
        // if (isEdit == 0 || isEdit == 1) {
        //    window.location = "PurchaseForm";
        // }
        // else {
        //  getPurchaseMaster();
        $("#FormDetail").addClass("d-none");
        $("#TableView").removeClass("d-none");
        //  Clear();
        //   ClearTable();
        // }

    });
    $(document).on("click", "#_reset", function (e) {

        Clear();

    });
    $(document).on("click", "#_cancel", function (e) {

        Clear();
        ClearTable();

    });

    $(document).on("click", "#_btnSubmit", function (e) {
        var formValid = form.valid();
        var table = $('#_tblTicketList').DataTable();
        if (formValid && table.data().any()) {

            var PurchaseDetail = [];
            $("#_tblTicketList tbody tr").each(function () {
                var row = $(this);
                var PurchaseData = {
                    PurchaseDetailId: row.find("td").eq(0).html(),
                    ItemId: row.find("td").eq(1).html().split("_")[1],
                    Quantity: row.find("td").eq(2).html(),
                    UnitIn: row.find("td").eq(3).html(),
                    Rate: row.find("td").eq(4).html(),
                    Amount: row.find("td").eq(5).html(),
                    Remarks: row.find("td").eq(6).html(),
                    PurchaseId: $("#_purchaseId").val(),
                }

                PurchaseDetail.push(PurchaseData);
            });
            var PurchaseMaster = {
                PurchaseId: $("#_purchaseId").val(),
                PurchaseNo: $("#_purchaseNo").val(),
                Date: $("#_date").val(),
                CreditDay: $("#_creditDay").val(),
                DueDate: $("#_dueDate").val(),
                PartyId: $("#_vendorList").val(),
                BillNo: $("#_billNo").val(),
                TotalAmount: TotalAmount,
                purchaseDetailViewModels: PurchaseDetail,
            }

            services.AddPurchaseMasterAndDetail(JSON.stringify(PurchaseMaster)).then(function (response) {
                if (response.statusCode == "00") {
                    toastr.success(response.message);
                    setTimeout(function () {
                        Clear();
                        ClearTable();
                    }, 2000)
                }
                else if (response.statusCode == "000") {
                    toastr.success(response.message);
                    setTimeout(function () {
                        window.location = "/Inventory/Purchase";
                    }, 1000)
                }
                else {
                    toastr.error("Server error,Please check your internet connection");
                }
            })
        }
        else {
            alert('Empty table');
        }

    });


    function ClearTable() {
        $("#_tblTicketList").dataTable().fnClearTable();
    }
    function Clear() {
        $("#_purchaseType").val("1");
        $("#_date").val("");
        $("#_DueDate").val("");
        $("#_creditDay").val("");
        $("#_vendorList").val("");
        $("#_itemId").val("");
        $("#_quantity").val("");
        //$("#_unitIn").val("");
        $("#_rate").val("");
        $("#_amount").val("");
        $("#_remarks").val("");
        getPurchaseNo();
    }
    $(document).on("click", "#_addCash", function (e) {

        var formValid = form.valid();
        if (formValid) {
            if ($("#_purchaseDetailId").val() == 0) {
                if ($("#_itemList").val() != "" && $("#_quantity").val() != "" && $("#_unit").val() != "" && $("#_rate").val() != "" && $("#_amount").val() != "") {
                    $("#_tblTicketList").dataTable().fnDestroy();
                    var html = "";

                    html += "<tr>" +
                        "<td>0</td>" +
                        "<td>" + $("#_itemList option:selected").text() + "_" + $("#_itemList").val() + "</td>" +
                        "<td>" + $("#_quantity").val() + "</td>" +
                        "<td>" + $("#_unit").val() + "</td>" +
                        "<td>" + $("#_rate").val() + "</td>" +
                        "<td>" + $("#_amount").val() + "</td>" +
                        "<td>" + $("#_remarks").val() + "</td>" +

                        "<td><a data-id='0' class='p-1 fa fa-edit _editDetail'' ><a class='p-1 fa fa-trash _remove' ></a></td>" +
                        "</tr>";
                    $("#_ticketList").append(html)
                    $('#_tblTicketList').DataTable({

                        "footerCallback": function (row, data, start, end, display) {
                            FooterData(this);
                        },
                    })
                }
                else {
                    toastr.warning("Please Fill Required Fields");
                }
            }
            else {
                var PurchaseData = {
                    PurchaseDetailId: $("#_purchaseDetailId").val(),
                    ItemId: $("#_itemList").val(),
                    Quantity: $("#_quantity").val(),
                    UnitIn: $("#_unit").val(),
                    Rate: $("#_rate").val(),
                    Amount: $("#_amount").val(),
                    Remarks: $("#_remarks").val(),
                    PurchaseId: $("#_purchaseId").val(),
                }
                services.UpdatePurchaseDetail(JSON.stringify(PurchaseData)).then(function (response) {
                    if (response.statusCode == "000") {
                        toastr.success(response.message);
                        setTimeout(function () {
                            window.location = "Purchase?id=" + $("#_purchaseId").val() + "&edit=1";
                        }, 1000);
                    }
                    else {
                        toastr.error("Server error,Please check your internet connection");
                    }
                })
            }
            ClearAddFields()

        }
        else {
            toastr.warning("Please Fill Required Fields");
        }


    })

    function FooterData(current) {
        var api = current.api(), data;

        var intVal = function (i) {
            return typeof i === 'string' ?
                i.replace(/[\$,]/g, '') * 1 :
                typeof i === 'number' ?
                    i : 0;
        };

        // Total over all pages

        amount = api
            .column(5)
            .data()
            .reduce(function (a, b) {
                return intVal(a) + intVal(b);
            }, 0);
        // Total over this page


        // Update footer
        TotalAmount = Math.round(amount);
        $(api.column(5).footer()).html(
            formatCurrency(Math.round(amount))
        );
    }
    $(document).on("click", "._remove", function (e) {
        var rowId = $(this).parents('tr');

        $.confirm({
            title: 'Delete!',
            icon: 'fa fa-question',
            theme: 'modern',
            closeIcon: true,
            animation: 'scale',
            type: 'blue',
            buttons: {
                yes: function () {
                    $('#_tblTicketList').DataTable().row(rowId)
                        .remove()
                        .draw();
                },
                no: function () {

                }
            }
        })

    });

    $(document).on("click", "._deletePurchaseDetail", function (e) {
        var rowId = $(this).parents('tr');
        var ID = $(this).attr('data-PurchaseId')
        $.confirm({
            title: 'Delete!',
            icon: 'fa fa-question',
            theme: 'modern',
            closeIcon: true,
            animation: 'scale',
            type: 'blue',
            buttons: {
                yes: function () {
                    services.DeletePurchaseDetailById(JSON.stringify({
                        PurchaseDetailId: ID
                    })).then(function (response) {

                        if (response.statusCode == "00") {
                            toastr.success("Purchase Detail has been Deleted successfully");
                            $('#_tblTicketList').DataTable().row(rowId)
                                .remove()
                                .draw();
                            var table = $('#_tblTicketList').DataTable();
                            if (!(table.data().any())) {
                                services.DeletePurchaseMasterById(JSON.stringify({
                                    PurchaseId: PurchaseId
                                })).then(function (response) {
                                    window.location = "/Inventory/Purchase";
                                })
                            }
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

    });

    function getPurchaseMaster() {
        services.getPurchaseMaster().then(function (response) {
            $("#_tblPurchaseList").dataTable().fnClearTable();
            $("#_tblPurchaseList").dataTable().fnDestroy();
            $('#_tblPurchaseList').DataTable({
                data: response,
                columns: [
                    {
                        'data': 'PurchaseNo',
                    },
                    {
                        'data': 'Date',
                        'render': function (date) {
                            //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                            var data = date ? moment(date).format("DD-MM-YYYY") : "--"
                            return data;
                        }
                    },
                    {
                        'data': 'CreditDay',

                    },

                    {
                        'data': 'DueDate',
                        'render': function (date) {
                            //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                            var data = date ? moment(date).format("DD-MM-YYYY") : "--"
                            return data;
                        }
                    },
                    {
                        'data': 'PartyName',
                    },
                    {
                        'data': 'BillNo',
                    },
                    {
                        'data': 'CreatedBy',
                    },
                    {
                        'data': 'CreatedDate',
                        'render': function (date) {
                            //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                            var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                            return data;
                        }
                    },

                    {
                        data: 'PurchaseId',
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }
                ],


                //});

            })
        })
    }
    getPurchaseMaster()

    function appendActionMenu(id) {
        var html =
            '<div class="row" style="margin-left:4px;">' +
            '<a data-id="' + id + '" class="p-1 fa fa-plus _purchaseDetailView" data-toggle="modal" data-target="#responsibility" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-eye _view" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-trash _delete" ></a>' +
            '</div>'
        //'</div>'
        return html;
    }

    $(document).on("click", "._view", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "Purchase?id=" + ID + "&edit=0";
    });

    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "Purchase?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._delete", function (e) {
        var ID = parseInt($(this).attr('data-id'));
        deletePurchaseMaster(ID);
    });

    $(document).on("click", "._purchaseDetailView", function (e) {
        var ID = parseInt($(this).attr('data-id'));
        GetPurchaseDetailById(ID);
    });
    $(document).on("click", "._editDetail", function (e) {

        var ID = $(this).attr('data-id');
        if (ID != '0') {
            services.GetPurchaseDetailByDetailId(JSON.stringify({
                PurchaseDetailId: ID
            })).then(function (response) {
                console.log(response)
                $("#_purchaseDetailId").val(response[0].PurchaseDetailId)
                $("#_itemList").val(response[0].ItemId)
                $("#_remarks").val(response[0].Remarks)
                $("#_quantity").val(response[0].Quantity)
                $("#_unit").val(response[0].UnitIn)
                $("#_rate").val(response[0].Rate)
                $("#_amount").val(response[0].Amount)
            })
        }
        else {

            var rowId = $(this).parents('tr');
            $("#_itemList").val(rowId.find("td").eq(1).html().split("_")[1]);

            $("#_quantity").val(rowId.find("td").eq(2).html());
            $("#_unit").val(rowId.find("td").eq(3).html());
            $("#_rate").val(rowId.find("td").eq(4).html());
            $("#_amount").val(rowId.find("td").eq(5).html());
            $("#_remarks").val(rowId.find("td").eq(6).html());

            $('#_tblTicketList').DataTable().row(rowId)
                .remove()
                .draw();
        }
    });
    function ClearAddFields() {
        $("#_itemList").val("");
        $("#_remarks").val("");
        $("#_quantity").val("");
        $("#_unit").val("");
        $("#_rate").val("");
        $("#_amount").val("");

    }
    function deletePurchaseMaster(ID) {
        $.confirm({
            title: 'Delete!',
            icon: 'fa fa-question',
            theme: 'modern',
            closeIcon: true,
            animation: 'scale',
            type: 'blue',
            buttons: {
                yes: function () {
                    services.DeletePurchaseMasterById(JSON.stringify({
                        PurchaseId: ID
                    })).then(function (response) {
                        if (response.statusCode == "00") {
                            toastr.success("Purchase has been Deleted successfully");
                            setTimeout(function () {
                                getPurchaseMaster();
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
    function GetPurchaseDetailById(ID) {
        services.GetPurchaseDetailById(JSON.stringify({
            PurchaseId: ID
        })).then(function (response) {
            console.log(response)
            var html = "";
            var TotalDetailAmount = 0;
            var TotalDetailQuantity = 0;
            $("#_purchaseDetailList").empty();
            for (let i = 0; i < response.length; i++) {
                html += "<tr>" +
                    "<td>" + response[i].ItemName + "</td>" +
                    "<td>" + response[i].Quantity + "</td>" +
                    "<td>" + response[i].UnitIn + "</td>" +
                    "<td>" + response[i].Rate + "</td>" +
                    "<td>" + response[i].Amount + "</td>" +
                    "<td>" + response[i].Remarks + "</td>" +

                    "</tr>";
                TotalDetailAmount = TotalDetailAmount + parseInt(response[i].Amount);
                TotalDetailQuantity = TotalDetailQuantity + parseInt(response[i].Quantity);
            }
            html += "<tr>" +

                "<td><b>Total</b></td>" +
                "<td><b>" + TotalDetailQuantity + "</b></td>" +
                "<td></td>" +
                "<td></td>" +
                "<td><b>" + TotalDetailAmount + "</b></td>" +
                "<td></td>" +
                "</tr>";
            $("#_purchaseDetailList").append(html)
        })

    }
})