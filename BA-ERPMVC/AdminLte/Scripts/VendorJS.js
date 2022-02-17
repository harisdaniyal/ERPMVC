


$(document).ready(function () {
    var services = new Services();

    setTimeout(function () {
        services.getStates().then(function (response) {
            var s = '<option value="-1">-- Select --</option>';
            for (var i = 0; i < response.length; i++) {
                s += '<option value="' + response[i].StateID + '">' + response[i].StateName + '</option>';
            }
            $("#ddlState").html(s);
        });
    }, 5000)




    $("#ddlState").change(function () {

        var val = $(this).val();
        if (val == "-1") {
            var s = '<option value="-1">-- Select --</option>';
            $("#ddlCity").html(s);
        }
        else {

            services.getCitiesByState(JSON.stringify({
                id: val
            })).then(function (response) {
                var s = '<option value="-1">-- Select --</option>';
                for (var i = 0; i < response.length; i++) {
                    s += '<option value="' + response[i].CityID + '">' + response[i].CityName + '</option>';
                }
                $("#ddlCity").html(s);

            });

        }

    });





    var venid = $.url().param("id");
    var isEdit = $.url().param("edit");



    function getVendorGrid() {
        services.getVendorGrid().then(function (response) {

            $('#VendorGrid').dataTable().fnClearTable();
            $('#VendorGrid').dataTable().fnDestroy();
            $('#VendorGrid').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response,

                columns: [{
                    data: 'PartyName',
                    width: 10
                }, {
                    data: 'Email',
                    width: 10
                }, {
                    data: 'Address',
                    width: 10
                }, {
                    data: 'Phone',
                    width: 10
                }, {
                    data: 'State',
                    width: 10
                }, {
                    data: 'City',
                    width: 10
                }, {
                    data: 'isActive',
                    width: 10,
                    "render": function (data) {
                        return data == true ? "Active" : "In-active";
                    }
                }, {
                    data: 'PartyId',
                    width: 5,
                    "render": function (data) {
                        var html = appendActionMenu(data);
                        return html;
                    }

                }],
                buttons: []
            });

        });
    }
    getVendorGrid();

    function appendActionMenu(id) {
        var html =
            '<div class="row" style="margin-left:4px;">' +
            '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +
            '<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
            '</div>'
        return html;
    }

    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        editClick(ID);
    });

    $(document).on("click", "._remove", function (e) {
        var ID = $(this).attr('data-id');
        deleteVendor(ID);
    });

    function deleteVendor(id) {

        services.deleteVendor(JSON.stringify({
            VendorID: id
        })).then(function (data) {
            if (data.Status == "1") {
                toastr.success(data.Message);
                getVendorGrid();
            }
            else {
                toastr.error(data.Message);
            }

        });

    }




    //Back Button
    $("#btnBack").click(function () {
        // Remove this line if it worked

        if ($("#isEdit").val() == "1") {
            $("#txtVendorname").val("")
            $("#ddlState").val("-1");
            $("#ddlState").change();
            $("#ddlCity").val("-1");
            $("#txtemail").val("");
            $("#txtAddress").val("");
            $("#txtPhone").val("");

            $("#isEdit").val("0");
            $("#VendorId").val("0");


            $("#_Addvendor").trigger("reset");

            $("#_reset").show();
            $("#btnSubmit").text("Submit");
            $("#statusrow").show();
        }

        $("#gridShow").removeClass("d-none")
        $("#gridShow").show();

        $("#lloForm").hide();
        $("#lloForm").addClass("d-none");
    });




    //Add Button
    $("#btnADD").click(function () {
        // Remove this line if it worked
        $("#gridShow").hide();
        $("#gridShow").addClass("d-none");
        $("#lloForm").removeClass("d-none");
        $("#lloForm").show();

    });









    $(document).on('click', '#btnSubmit', function () {
        $("#_Addvendor").valid();
    });



    // Submit Button
    var toastCount = 0;
    $("#_Addvendor").validate({
        rules: {
            txtVendorname: "required",
            txtemail: "required",
            txtAddress: "required",
            txtPhone: "required",
            ddlState: { min: 1 },
            ddlCity: { min: 1 },
            ddlType: { min: 1 }
        },
        messages: {
            txtVendorname: "*",
            txtemail: "*",
            txtAddress: "*",
            txtPhone: "*",
            ddlState: "*",
            ddlCity: "*",
            ddlType: "*"
        },
        submitHandler: function (form) {
            if ($("#isEdit").val() == "1") {

                var partyType = '';
                if ($("#Trucking").closest("label.btn.btn-v2").hasClass("active"))
                    partyType = 'Trucking';
                if ($("#Railway").closest("label.btn.btn-v2").hasClass("active"))
                    partyType = 'Railway';

                services.updateVendor(JSON.stringify({
                    PartyName: $("#txtVendorname").val(),
                    StateId: $("#ddlState").val(),
                    CityId: $("#ddlCity").val(),
                    Email: $("#txtemail").val(),
                    Address: $("#txtAddress").val(),
                    Phone: $("#txtPhone").val(),
                    PartyId: $("#VendorId").val(),
                    Type: $("#ddlType").val(),
                    isActive: document.getElementById("chkStatus").checked,
                    PartyType: partyType

                })).then(function (response) {
                    if (response.Status == "1") {
                        //   getLocDropGridDetail();
                        getVendorGrid();
                        $("#txtVendorname").val("")
                        $("#ddlState").val("-1");
                        $("#ddlState").change();
                        $("#ddlCity").val("-1");
                        $("#txtemail").val("");
                        $("#txtAddress").val("");
                        $("#txtPhone").val("");

                        $("#isEdit").val("0");
                        $("#VendorId").val("0");


                        $("#_Addvendor").trigger("reset");

                        $("#_reset").show();
                        $("#btnSubmit").text("Submit");
                        $("#statusrow").show();

                        $("#gridShow").removeClass("d-none")
                        $("#gridShow").show();

                        $("#lloForm").hide();
                        $("#lloForm").addClass("d-none");

                        toastr.success(response.Message);
                    } else {
                        // DoSomethingElse()
                        toastr.warning(response.Message);
                    }

                });



            }
            else {

                var partyType = '';
                if ($("#Trucking").closest("label.btn.btn-v2").hasClass("active"))
                    partyType = 'Trucking';
                if ($("#Railway").closest("label.btn.btn-v2").hasClass("active"))
                    partyType = 'Railway';

                services.addVendor(JSON.stringify({
                    PartyName: $("#txtVendorname").val(),
                    StateId: $("#ddlState").val(),
                    CityId: $("#ddlCity").val(),
                    Email: $("#txtemail").val(),
                    Address: $("#txtAddress").val(),
                    Phone: $("#txtPhone").val(),
                    Type: $("#ddlType").val(),
                    isActive: document.getElementById("chkStatus").checked,
                    PartyType: partyType

                })).then(function (response) {
                    if (response.Status == "1") {
                        //   getLocDropGridDetail();
                        getVendorGrid();
                        $("#txtVendorname").val("")
                        $("#ddlState").val("-1");
                        $("#ddlState").change();
                        $("#ddlCity").val("-1");
                        $("#txtemail").val("");
                        $("#txtAddress").val("");
                        $("#txtPhone").val("");

                        $("#_Addvendor").trigger("reset");

                        $("#gridShow").removeClass("d-none")
                        $("#gridShow").show();

                        $("#lloForm").hide();
                        $("#lloForm").addClass("d-none");

                        toastr.success(response.Message);
                    } else {
                        // DoSomethingElse()
                        toastr.warning(response.Message);
                    }

                });


            }

        }

    });
    ///

    $("#gridShow").removeClass("d-none")
    $("#gridShow").show();

    $("#lloForm").hide();
    $("#lloForm").addClass("d-none");

    function editClick(id) {

        var referenceNum = id;
        //window.location.href = "Index?id=" + referenceNum + "&edit=1";
        isEdit = 1;
        venid = referenceNum;

        if (isEdit == 1) {


            $("#isEdit").val("1");
            services.getVendorByID(JSON.stringify({
                VendorID: venid
            })).then(function (data) {
                $("#isEdit").val("1");
                $("#VendorId").val(data.PartyId);
                $("#txtVendorname").val(data.PartyName);
                $("#ddlState").val(data.StateId);
                $("#ddlState").change();
                setTimeout(function () {
                    $("#ddlCity").val(data.CityId);
                    $("#ddlCity").change();
                }, 1000);
                $("#txtemail").val(data.Email);
                $("#txtAddress").val(data.Address);
                $("#txtPhone").val(data.Phone);

                $("#_reset").hide();
                $("#btnSubmit").text("Update");
                $("#statusrow").hide();
                if (data.isActive == true) {
                    $("#chkStatus").prop('checked', true);
                }
                else {
                    $("#chkStatus").prop('checked', false);
                }

                if (data.PartyType == "Trucking") {
                    $("#Trucking").closest("label.btn.btn-v2").addClass("active");
                }
                if (data.partyType == "Railway") {
                    $("#Railway").closest("label.btn.btn-v2").addClass("active");
                }

                $("#gridShow").hide();
                $("#gridShow").addClass("d-none");
                $("#lloForm").removeClass("d-none");
                $("#lloForm").show();

            });





        }
        else {

            $("#isEdit").val("0");
            $("#gridShow").removeClass("d-none")
            $("#gridShow").show();

            $("#lloForm").hide();
            $("#lloForm").addClass("d-none");



        }
    }




});