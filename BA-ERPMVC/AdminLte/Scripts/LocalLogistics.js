function editClick(id) {
    var referenceNum = id;
    window.location.href = "LocalLogisticOperation?id=" + referenceNum + "&edit=1";

}


$(document).ready(function () {
    var services = new Services();

    var logisticid = $.url().param("id");
    var isEdit = $.url().param("edit");
    var LogisticsDetails = $.url().param("details")
    function DisableFields() {
        $("._field").prop("disabled", true);
        $("#bteditUpdate").hide();
    }
    if (isEdit == 1) {
        $("#editdiv").removeClass("d-none");
        $("#hideContainerLogisticsGride").addClass("d-none");
        
        function getlogisticbyid(logisticid) {
            services.getlogisticbyid(JSON.stringify({
                id: logisticid
            })).then(function (response) {
                var data = response;
                var logisticid = data[0].logisticsid;
                if (data[0].service == "LOLO/Handling") {

                    $("#txteditfromlocation").attr('disabled', 'disabled');
                    $("#txtedittolocation").attr('disabled', 'disabled');
                    $("#txteditOrderNo").val(data[0].orderid);
                    $("#txtEditCustName").val(data[0].cname);
                    $("#ddleditjob").val(data[0].jobtype).change();
                    $("#txteditquantity").val(data[0].quantity);
                }
                else {
                    $("#txteditOrderNo").val(data[0].orderid);
                    $("#txtEditCustName").val(data[0].cname);
                    $("#ddleditjob").val(data[0].jobtype).change();
                    $("#txteditfromlocation").val(data[0].flocation);
                    $("#txtedittolocation").val(data[0].tlocation);
                    $("#txteditContainerno").val(data[0].cno);
                    $("#txteditContainerno2").val(data[0].cno2);
                    $("#txtediteContainerWeight").val(data[0].conWeight);
                    $("#txteditContSize").val(data[0].csize);
                    $("#txteditquantity").val(data[0].quantity);
                    $("#txteditquantity").attr('disabled', 'disabled');
                }

            });
        } getlogisticbyid(logisticid);

        $('#btneditback').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });

        $('#bteditUpdate').on('click', function () {
            $.ajax({
                type: "POST", //HTTP POST Method
                url: "/sales/UpdateLogistics", // Controller/View
                dataType: "json",
                data: { //Passing data
                    logisticsid: logisticid,
                    FromLocation: $("#txteditfromlocation").val(),
                    JobType: $("#ddleditjob option:selected").val(),
                    FromLocation: $("#txteditfromlocation").val(),
                    ToLocation: $("#txtedittolocation").val(),
                    ContainerNo: $("#txteditContainerno").val(),
                    ContainerNo2: $("#txteditContainerno2").val(),
                    ContainerWeight: $("#txtediteContainerWeight").val(),
                    ContainerSize: $("#txteditContSize").val(),
                    Qty: $("#txteditquantity").val()


                }, success: function (response) {
                    if (response.success) {
                        toastr.success("Detail has been Updated successfully");
                        setTimeout(function () {
                            window.location.href = "LocalLogisticOperation";
                        }, 2000);

                    } else {
                        // DoSomethingElse()
                        toastr.warning("Enter Correct Detail");
                    }
                },
                error: function (response) {
                    toastr.error("Server error,Please check your internet connection");


                }

            });

        });




        //edit here
    }
    else if (isEdit == 0) {
        $("#editdiv").removeClass("d-none");
        $("#hideContainerLogisticsGride").addClass("d-none");
        DisableFields();
        function getlogisticbyid(logisticid) {
            services.getlogisticbyid(JSON.stringify({
                id: logisticid
            })).then(function (response) {
                var data = response;
                var logisticid = data[0].logisticsid;
                if (data[0].service == "LOLO/Handling") {

                    $("#txteditfromlocation").attr('disabled', 'disabled');
                    $("#txtedittolocation").attr('disabled', 'disabled');
                    $("#txteditOrderNo").val(data[0].orderid);
                    $("#txtEditCustName").val(data[0].cname);
                    $("#ddleditjob").val(data[0].jobtype).change();
                    $("#txteditquantity").val(data[0].quantity);
                }
                else {
                    $("#txteditOrderNo").val(data[0].orderid);
                    $("#txtEditCustName").val(data[0].cname);
                    $("#ddleditjob").val(data[0].jobtype).change();
                    $("#txteditfromlocation").val(data[0].flocation);
                    $("#txtedittolocation").val(data[0].tlocation);
                    $("#txteditContainerno").val(data[0].cno);
                    $("#txteditContainerno2").val(data[0].cno2);
                    $("#txteditContSize").val(data[0].csize);
                    $("#txteditquantity").val(data[0].quantity);
                    $("#_txtContainerStatusTrip").val(data[0].ContainerTripStatus);
                    $("#txteditquantity").attr('disabled', 'disabled');
                }

            });
        } getlogisticbyid(logisticid);

        $('#btneditback').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });

        $('#bteditUpdate').on('click', function () {
            $.ajax({
                type: "POST", //HTTP POST Method
                url: "/sales/UpdateLogistics", // Controller/View
                dataType: "json",
                data: { //Passing data
                    logisticsid: logisticid,
                    FromLocation: $("#txteditfromlocation").val(),
                    JobType: $("#ddleditjob option:selected").val(),
                    FromLocation: $("#txteditfromlocation").val(),
                    ToLocation: $("#txtedittolocation").val(),
                    ContainerNo: $("#txteditContainerno").val(),
                    ContainerNo2: $("#txteditContainerno2").val(),
                    ContainerSize: $("#txteditContSize").val(),
                    Qty: $("#txteditquantity").val(),
                   // ContainerTripStatus: $("#_txtContainerStatusTrip").val()


                }, success: function (response) {
                    if (response.success) {
                        toastr.success("Detail has been Updated successfully");
                        setTimeout(function () {
                            window.location.href = "LocalLogisticOperation";
                        }, 2000);

                    } else {
                        // DoSomethingElse()
                        toastr.warning("Enter Correct Detail");
                    }
                },
                error: function (response) {
                    toastr.error("Server error,Please check your internet connection");


                }

            });

        });
    }
    else if (LogisticsDetails == 2)
    {
 $("#gridShow").addClass("d-none");
 $("#lloForm").removeClass("d-none");
 $("#hideContainerLogisticsGride").removeClass("d-none");
    $("#ddlOrderNo").prop("disabled", true);
//start




        function getOrderByIdTrip(logisticid) {
            services.getOrderByIdTrip(JSON.stringify({
                id: logisticid
            })).then(function (response) {
                var data = response.order;

                 setTimeout(function () {

               

                $("#ddlOrderNo").val(data[0].id).change();
          
                
           }, 2000)
                
             
               
            });
        } getOrderByIdTrip(logisticid);



//start demo






    //   $("#gridShow").removeClass("d-none");
        function getordernumber() {
            services.getlogisticsorders(JSON.stringify({
            })).then(function (data) {
                var s = '<option value="">--Select Order Number--</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].Orderid + '">' + data.result[i].OrderNo + '</option>';

                }
                $("#ddlOrderNo").html(s);

            });
        } getordernumber();


 function getContainerWieght() {
        services.getContainerWieght(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select ContainerWeight</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].CWwight + '">' + response.result[i].CWwight + '</option>';
            }
            if (s != null) {

                   $("#ddlWeihght").html(s);

             } else {
                        alert("No Service found Against orderid: " + id + "")
              }
          

        });
    }
    //getContainerWieght();



  $.ajax({
        type: "GET",
        url: "/sales/GetConatinerStatus",
        data: "{}",
        success: function (data) {
            var s = '<option value="">--Select Container Status--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CSTATUS + '">' + data[i].CSTATUS + '</option>';
            }
            $("#txtconStatus").html(s);
        }
 
    }, 5000);


$(function() {
    var 
    jqDdl = $('#txtcontsize'),
    onChange = function(event) {
        if ($(this).val() === '20 DR') {
            $('#ddlCont2').show();
            $('#2ndddlJobType').show();
            $('#ddlCont2').focus().select();
            $('#2ndddlJobType').focus().select();
        } else {
            $('#ddlCont2').hide();
            $('#2ndddlJobType').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});








            GetOrder();
            //GetServices();

            function GetOrder() {

                var AppointmentsBody = $("#_logicgridlist");

                AppointmentsBody.empty();
                services.viewOrder().then(response => {

                    var html = '';

                    $("#logicgrid").dataTable().fnClearTable();
                    $("#logicgrid").dataTable().fnDestroy();
                    



                    if (response) {
                        _.forEach(response.result, function (item, i) {
                            html += "<tr>" +
                                "<th> <a  href='LocalLogisticOperation?id=" + (item.OrderID) + "&details=2'> "+(item.OrderNo)+" </a></th>" +
                                //"<th> <a href='AppointmentDetails' target='_blank'>" + (i + 1) + "</a></th>" +
     

                                "<td>" + moment(item.OrderDate).format("DD-MM-YYYY") + "</td>" +
                                
                                "<td>" + item.BusinessDivisionName + "</td>" +
                                "<td>" + item.Customer_Name + "</td>"+
                                //"<td><button type='button'  style = 'color: #081344' title=''  class='btn btn-outline-primary btn-sm mx-1 btnEditService' data-id='" + item.PackageId + "' ></button></td>" +
                                "</tr>";
                       // $("#gridShow").addClass("d-none");
                       // $("#lloForm").removeClass("d-none");

                        })

                        AppointmentsBody.append(html);
                       
                        
                       //  getTripCode();
                        $('#logicgrid').DataTable({
                            "paging": true,
                            "searching":true,
                            "order": [[ 0, "desc" ]],
                                
                        })
                    }


                });
            }





        //

        $(document).on('click', '#_btnPrintReport', function () {

            var fromDate = $('#_fromDate').val();
            var toDate = $('#_toDate').val();
            var win = "";
            // var ToDate = $('#_invoiceTodate').val();
            if (fromDate != "" && toDate != "") {
                  win = window.open('/Reports/LocalLogistics.aspx?FromDate=' + fromDate + '&ToDate=' + toDate, '_blank');
             //   window.location.href = '/Invoices/PrintLogisticsReports?FromDate=' + fromDate + '&ToDate=' + toDate;
            }
            else {
                win = window.open('/Reports/LocalLogistics.aspx?FromDate=' + moment(firstDay).format('DD-MMM-YYYY') + '&ToDate=' + moment(lastDay).format('DD-MMM-YYYY'), '_blank');
             //   window.location.href = '/Invoices/PrintLogisticsReports?FromDate=' + moment(firstDay).format('DD-MMM-YYYY') + '&ToDate=' + moment(lastDay).format('DD-MMM-YYYY');
            }

          if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }
        })
        //


        $(document).on("click", "#_btnSearch", function (e) {
            var FromDate = $("#_fromDate").val();
            var ToDate = $("#_toDate").val();
          //  getlogisticsDetail(FromDate, ToDate);
        })




        function getlogisticsDetail(logisticid) {
               
            services.getlogisticsDetail(JSON.stringify({
                id: logisticid,
               // ToDate: ToDate
            })).then(function (response) {


  //start


                var data1 = response.Results;

                 setTimeout(function () {
                       $("#ddlOrderNo").val(data1[0].OrderT).change();
                },3000)

            //end
            
               
                $('#detailslogicgrid').dataTable().fnClearTable();
                $('#detailslogicgrid').dataTable().fnDestroy();
                $('#detailslogicgrid').dataTable({
                    dom: 'Bfrtip',
                    "lengthChange": true,
                    "paging": true,
                    'searching': true,

                    data: response.Results,

                    columns: [{
                        data: 'OrderNo',
                        width: 10
                    }, {
                        data: 'Customer_Name',
                        width: 10
                    }, {
                        data: 'JobType',
                        width: 10
                    }, {
                        data: 'FacilityName',
                        width: 10
                    }//,{
                       // data: 'SingleDouble',
                       // width: 10
                    ,{
                        data: 'ContainerNo',
                        width: 10
                    }, {
                        data: 'ContainerNo2',
                        width: 10
                        
                    }, {
                        data: 'ContainerWeight',
                        width: 10
                        
                    }, {
                        data: 'ContainerSize',
                        width: 10
                    }, {
                        data: 'FromLocation',
                        width: 5
                    }, {
                        data: 'ToLocation',
                        width: 5
                    }, {
                        data: 'IsActive',
                        width: 10
                    }, {
                        data: 'Qty',
                        width: 10
                    }, {
                        data: 'logisticsid',
                        width: 10,
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }],
                    buttons: []
                });


            })
        }
      
        getlogisticsDetail(logisticid);

        function appendActionMenu(id) {
            var html =
              
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
            window.location.href = "LocalLogisticOperation?id=" + ID + "&edit=0";
        });
        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "LocalLogisticOperation?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = parseInt($(this).attr('data-id'));
            deleteLogisticDetail(ID);
        });

        function deleteLogisticDetail(ID) {
            $.confirm({
                title: 'Delete!',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                animation: 'scale',
                type: 'blue',
                buttons: {
                    yes: function () {
                        services.DeleteLogisticDetail(JSON.stringify({
                            LogisticID: ID
                        })).then(function (response) {
                            if (response == "00") {
                                toastr.success("Detail has been Deleted successfully");
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

        $('#btnADD').on('click', function () {
            $("#gridShow").addClass("d-none");
            $("#lloForm").removeClass("d-none");

        });



        $('#ddlOrderNo').on('change', function () {
            $("#orderdetails").removeClass("d-none");
            function getcustomerbyid(id) {
                services.getcustomerbyorder(JSON.stringify({
                    id: id
                })).then(function (response) {
                    var data = response;
                    if (data.length) {
                        if (data[0].BL != null) {
                            $("#ddlblNo").val(data[0].BL);
                            $("#bldiv").removeClass("d-none");
                        } else {
                            $("#bldiv").addClass("d-none");
                            $("#ddlblNo").val(data[0].BL);
                        }
                         if(data[0].CRO != null){
                          $("#ddlCRONo").val(data[0].CRO);
                            $("#CROdiv").removeClass("d-none");
                        }else{
                         $("#CROdiv").addClass("d-none");
                            $("#ddlCRONo").val(data[0].CRO);
                        }
                        var OrderDate = data[0].OrderDate ? moment(data[0].OrderDate).format("ll") : "--";
                        $("#txtCustName").val(data[0].Customer_Name);
                        $("#txtOrderDate").val(OrderDate); //Reading text box values using Jquery
                    } else {
                        alert("No Data Found");
                        $("#orderdetails").addClass("d-none");
                    }

                });
            } getcustomerbyid($(this).val());
            function GetContainerSize() {
                services.getContainerSize(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].ProductCatName + '">' + data[i].ProductCatName + '</option>';

                    }
                    if (s != null) {

                        $("#txtcontsize").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetContainerSize();
            function GetFromLocation() {
                services.getLocation(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].CityName + '">' + data[i].CityName + '</option>';

                    }
                    if (s != null) {

                        $("#txtFromLocation").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetFromLocation();
            function GetToLocation() {
                services.getLocation(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].CityName + '">' + data[i].CityName + '</option>';

                    }
                    if (s != null) {

                        $("#txtToLocation").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetToLocation();
            function getordernumber(id) {
                services.getservicebyorder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    var s = '<option value="-1">--Select Service--</option>';
                    for (var i = 0; i < data.result.length; i++) {
                        s += '<option value="' + data.result[i].serviceid + '">' + data.result[i].servicetype + '</option>';

                    }
                    if (s != null) {

                        $("#ddlServiceType").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            getordernumber($(this).val());
        });
        $('#ddlServiceType').on('change', function () {
            if ($("#ddlServiceType option:selected").text() == "LOLO/Handling") {
                $("#Transport").addClass("d-none");
                $("#Lolo").removeClass("d-none");
            }
            else if ($("#ddlServiceType option:selected").text() == "Hualage/Transportation") {
                $("#Transport").removeClass("d-none");
                $("#Lolo").addClass("d-none");
            }
            else {
                $("#Transport").addClass("d-none");
                $("#Lolo").addClass("d-none");
            }
        });

        var t = $("#TransportGrid").DataTable({
            "paging": false,
            "searching": false,
            "edit": true
        });
        $("#_addOrder").validate({

            rules: {
                txtcontno: "required",
                txtcontsize: "required",
                txtFromLocation: "required",
                txtToLocation: "required",
                ddlJobType: "required",
                ddlWeihght: "required",
            },
            messages: {
                txtcontno: "*",
                txtcontsize: "*",
                txtFromLocation: "*",
                txtToLocation: "*",
                ddlJobType: "*",
                ddlWeihght: "*",
            },
            submitHandler: function (form) {
               // var contStatus = $("#txtconStatus").val();
                var contno = $("#txtcontno").val();
                var contno2 = $("#txtcontno2").val();
                var contsize = $("#txtcontsize").val();
                var fromlocation = $("#txtFromLocation").val();
                var tolocation = $("#txtToLocation").val();
                var jobtype = $("#ddlJobType option:selected").val();
                var jobtype2 = $("#2ndddlJobType option:selected").val();
                var conWeight = $("#ddlWeihght").val();

                t.row.add([contno, contno2, contsize, fromlocation, tolocation, jobtype, jobtype2, conWeight]).draw(false);

               // $("#txtconStatus").val("").change();
                $("#txtcontno").val("");
                $("#txtcontno2").val("");
                $("#txtcontsize").val("").change();
                $("#txtFromLocation").val("").change();
                $("#txtToLocation").val("").change();
                $("#ddlJobType").val("").change();
                $("#2ndddlJobType").val("").change();
                $("#ddlWeihght").val("");
            }
        });
        //$('#btnitemAdd').on('click', function() {

        //var contno=$("#txtcontno").val();
        //var contsize=$("#txtcontsize").val();
        //var fromlocation=$("#txtFromLocation").val();
        //var tolocation=$("#txtToLocation").val();
        //var jobtype=$("#ddlJobType option:selected").val();

        //t.row.add([contno,contsize,fromlocation,tolocation,jobtype]).draw(false);

        //$("#txtcontno").val("");
        //$("#txtcontsize").val("");
        //$("#txtFromLocation").val("");
        //$("#txtToLocation").val("");
        //$("#ddlJobType").val("").change();

        // });


        //
        $("#submitbutton").removeClass("d-none");
        $("#manualentry").removeClass("d-none");
        $('#ddlentry').on('change', function () {
            var tableExcel = $('#ExcelGrid').DataTable();
            var tableTrasnport = $('#TransportGrid').DataTable();
            if ($(this).val() == "manual") {
                tableTrasnport.clear();
                tableExcel.clear();
                $("#excelimport").addClass("d-none");
                $("#manualentry").removeClass("d-none");
                $("#submitbutton").removeClass("d-none");
            }
            else if ($(this).val() == "Excel") {
                tableTrasnport.clear();
                tableExcel.clear();
                $("#excelimport").removeClass("d-none");
                $("#manualentry").addClass("d-none");
                $("#submitbutton").removeClass("d-none");
            }
        });//transport

        //lolo
        $("#lolomanual").removeClass("d-none");
        $('#ddlloloentry').on('change', function () {
            if ($(this).val() == "manual") {

                $("#loloexcel").addClass("d-none");
                $("#lolomanual").removeClass("d-none");
                var table = $('#ExcelloloGrid').DataTable();
                table.clear().draw();
                $('#input1').val(null);
            }
            else if ($(this).val() == "Excel") {
                $("#loloexcel").removeClass("d-none");
                $("#lolomanual").addClass("d-none");
                $('#ddlLoloJobType').val("").change();
                $('#txtQuantityLolo').val("");
            }
        });
        //.....lolo
        //backbutton
        $('#btnback').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });
        $('#btnbacklolo').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });


        //excellolo
        let selectedFilelolo;
        document.getElementById('input1').addEventListener("change", (event) => {
            selectedFilelolo = event.target.files[0];
        })

        let datalolo = [{
            "name": "jayanth",
            "data": "scd",
            "abc": "sdef"
        }]


        document.getElementById('uploadloloexcel').addEventListener("click", () => {
            $('#input1').val(null);
            XLSX.utils.json_to_sheet(datalolo, 'Lolo.xlsx');
            if (selectedFilelolo) {
                let fileReader = new FileReader();
                fileReader.readAsBinaryString(selectedFilelolo);
                fileReader.onload = (event) => {
                    let datalolo = event.target.result;
                    let workbook = XLSX.read(datalolo, { type: "binary" });

                    workbook.SheetNames.forEach(sheet => {
                        let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);


                        $('#ExcelloloGrid').dataTable().fnClearTable();
                        $('#ExcelloloGrid').dataTable().fnDestroy();
                        $('#ExcelloloGrid').on('click', 'tbody td', function (e) {
                            editor.inline(this);
                        });
                        $('#ExcelloloGrid').dataTable({

                            dom: 'Bfrtip',
                            "lengthChange": false,
                            "paging": false,
                            'searching': true,
                            'className': 'select-checkbox',
                            data: rowObject,

                            columns: [

                                { 'data': 'CONTAINER #' },
                                { 'data': 'SIZE' },
                                { 'data': 'STATUS' }
                            ],
                            buttons: []


                        });
                        // document.getElementById("jsondata").innerHTML = JSON.stringify(rowObject,undefined,4)
                    });
                }
            }
        });
        //excellolo

        //excel transport
        let selectedFile;
        document.getElementById('input').addEventListener("change", (event) => {
            selectedFile = event.target.files[0];
        })

        let data = [{
            "name": "jayanth",
            "data": "scd",
            "abc": "sdef"
        }]


        document.getElementById('uploadexcel').addEventListener("click", () => {
            $('#input').val(null);
            XLSX.utils.json_to_sheet(data, 'Logistic.xlsx');
            if (selectedFile) {
                let fileReader = new FileReader();
                fileReader.readAsBinaryString(selectedFile);
                fileReader.onload = (event) => {
                    let data = event.target.result;
                    let workbook = XLSX.read(data, { type: "binary" });

                    workbook.SheetNames.forEach(sheet => {
                        let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);


                        $('#ExcelGrid').dataTable().fnClearTable();
                        $('#ExcelGrid').dataTable().fnDestroy();

                        $('#ExcelGrid').on('click', 'tbody td', function (e) {
                            editor.inline(this);
                        });
                        $('#ExcelGrid').dataTable({

                            dom: 'Bfrtip',
                            "lengthChange": false,
                            "paging": false,
                            'searching': true,
                            'className': 'select-checkbox',
                            data: rowObject,

                            columns: [
                            //    { 'data': 'CONTAINER STATUS' },

                                { 'data': 'CONTAINER #' },
                               // { 'data': 'CONTAINER #2'},

                                { 'data': 'CONTAINER #2', "defaultContent":"",},

                                { 'data': 'SIZE' },
                                { 'data': 'LOADING PORT' },
                                { 'data': 'OFFLOAD' },
                                { 'data': 'STATUS' },
                                { 'data': 'STATUS2', "defaultContent":"", },
                                { 'data': 'CONTAINER WEIGHT', "defaultContent":"",},
                            ],
                            buttons: []


                        });
                        // document.getElementById("jsondata").innerHTML = JSON.stringify(rowObject,undefined,4)
                    });
                }
            }
        });//excel transport


        $('#btnloloSubmit').on('click', function () {

            if ($('#ddlloloentry').val() == "manual") {
                var TempOrder = new Array();



            }
            else if ($('#ddlloloentry').val() == "Excel") {
                var TempOrder = new Array();
                $("#ExcelloloGrid tbody tr").each(function () {
                    var row = $(this);
                    var temporder = {};
                    temporder.containerno = row.find("td").eq(0).html();
                    temporder.containersize = row.find("td").eq(1).html();
                    temporder.jobtype = row.find("td").eq(2).html();
                    TempOrder.push(temporder);
                });

            }
            $.ajax({
                type: "POST", //HTTP POST Method
                url: "/sales/Addlogistics", // Controller/View
                dataType: "json",
                data: { //Passing data
                    Qty: $("#txtQuantityLolo").val(),
                    JobType: $("#ddlLoloJobType option:selected").val(),
                    OrderId: $("#ddlOrderNo option:selected").val(),
                    OrderServiceId: $("#ddlServiceType option:selected").val(),
                    tp: TempOrder

                }, success: function (response) {
                    if (response.success) {
                       // getlogisticsDetail();
                        getlogisticsDetail(logisticid);
                       // window.location.href = "LocalLogisticOperation";
                     //   location.reload();
                        $("#txtQuantityLolo").val("");
                        if ($('#ddlloloentry').val() == "Excel") {
                            var table = $('#ExcelloloGrid').DataTable();
                            table.clear().draw();
                        }
                        $("#lolomanual").addClass("d-none");
                        $("#loloexcel").addClass("d-none");
                        $("#Lolo").addClass("d-none");
                        $('#ddlServiceType').val("").change();
                        $('#ddlLoloJobType').val("").change();
                        $('#ddlloloentry').val("manual").change();
                        $('#input1').val(null);

                        toastr.success("Logistic Detail has been inserted successfully");

                    } else {
                        // DoSomethingElse()
                        toastr.warning("Kindly Check Your Detail");
                    }
                },
                error: function (response) {

                    toastr.error("Server error,Please check your internet connection");

                }

            });
        });


        $('#btnmanualSubmit').on('click', function () {
           // var table = $('#ExcelGrid').DataTable();
           // if (!table.data().count()) {
            //    toastr.warning("Add Operation Detail");
           // }
           // else {
                if ($('#ddlentry').val() == "manual") {
                    var TempOrder = new Array();
                    $("#TransportGrid tbody tr").each(function () {
                        var row = $(this);
                        var temporder = {};
                      //  temporder.containerStatus = row.find("td").eq(0).html();
                        temporder.containerno = row.find("td").eq(0).html();
                        temporder.containerno2 = row.find("td").eq(1).html();
                        temporder.containersize = row.find("td").eq(2).html();
                        temporder.fromlocation = row.find("td").eq(3).html();
                        temporder.tolocation = row.find("td").eq(4).html();
                        temporder.jobtype = row.find("td").eq(5).html();
                        temporder.jobtype2 = row.find("td").eq(6).html();
                        temporder.containerWeight = row.find("td").eq(7).html();
                        TempOrder.push(temporder);
                    });

                }
                else if ($('#ddlentry').val() == "Excel") {
                    var TempOrder = new Array();
                    $("#ExcelGrid tbody tr").each(function () {
                        var row = $(this);
                        var temporder = {};
                     //   temporder.containerStatus = row.find("td").eq(0).html();
                        temporder.containerno = row.find("td").eq(0).html();
                        temporder.containerno2 = row.find("td").eq(1).html();
                        temporder.containersize = row.find("td").eq(2).html();
                        temporder.fromlocation = row.find("td").eq(3).html();
                        temporder.tolocation = row.find("td").eq(4).html();
                        temporder.jobtype = row.find("td").eq(5).html();
                        temporder.jobtype2 = row.find("td").eq(6).html();
                        temporder.containerWeight = row.find("td").eq(7).html();
                        TempOrder.push(temporder);
                    });

                }
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/sales/Addlogistics", // Controller/View
                    dataType: "json",
                    data: { //Passing data
                        OrderId: $("#ddlOrderNo option:selected").val(),
                        OrderServiceId: $("#ddlServiceType option:selected").val(),
                        tp: TempOrder

                    }, success: function (response) {
                        if (response.success) {
                           // getlogisticsDetail();
                           // window.location.href = "LocalLogisticOperation";
                            getlogisticsDetail(logisticid);
                            if ($('#ddlentry').val() == "manual") {
                                var table = $('#TransportGrid').DataTable();
                                table.clear().draw();
                            }
                            else if ($('#ddlentry').val() == "Excel") {
                                var table = $('#ExcelGrid').DataTable();
                                table.clear().draw();
                            }

                            $("#excelimport").addClass("d-none");
                            $("#manualentry").addClass("d-none");
                            $("#Transport").addClass("d-none");
                            $('#ddlentry').val("manual").change();
                            $('#ddlServiceType').val("").change();

                            toastr.success("Logistic Detail has been inserted successfully");
                        } else {
                            // DoSomethingElse()
                            toastr.warn("Kindly Check Your Detail");
                        }
                    },
                    error: function (response) {
                        toastr.error("Server error,Please check your internet connection");
                    }
                });
      //      }

        });
    


//end demo 













//end
    }
    else {


        $("#gridShow").removeClass("d-none");
        function getordernumber() {
            services.getlogisticsorders(JSON.stringify({
            })).then(function (data) {
                var s = '<option value="">--Select Order Number--</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].Orderid + '">' + data.result[i].OrderNo + '</option>';

                }
                $("#ddlOrderNo").html(s);

            });
        } getordernumber();


 function getContainerWieght() {
        services.getContainerWieght(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select ContainerWeight</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].CWwight + '">' + response.result[i].CWwight + '</option>';
            }
            if (s != null) {

                   $("#ddlWeihght").html(s);

             } else {
                        alert("No Service found Against orderid: " + id + "")
              }
          

        });
    }
    getContainerWieght();



  $.ajax({
        type: "GET",
        url: "/sales/GetConatinerStatus",
        data: "{}",
        success: function (data) {
            var s = '<option value="">--Select Container Status--</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CSTATUS + '">' + data[i].CSTATUS + '</option>';
            }
            $("#txtconStatus").html(s);
        }
 
    }, 5000);


$(function() {
    var 
    jqDdl = $('#txtcontsize'),
    onChange = function(event) {
        if ($(this).val() === '20 DR') {
            $('#ddlCont2').show();
            $('#ddlCont2').focus().select();
        } else {
            $('#ddlCont2').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});










            GetOrder();
            //GetServices();

            function GetOrder() {

                var AppointmentsBody = $("#_logicgridlist");

                AppointmentsBody.empty();
                services.viewOrder().then(response => {

                    var html = '';

                    $("#logicgrid").dataTable().fnClearTable();
                    $("#logicgrid").dataTable().fnDestroy();
                    



                    if (response) {
                        _.forEach(response.result, function (item, i) {
                            html += "<tr>" +
                                "<th> <a  href='LocalLogisticOperation?id=" + (item.OrderID) + "&details=2'> "+(item.OrderNo)+" </a></th>" +
                                //"<th> <a href='AppointmentDetails' target='_blank'>" + (i + 1) + "</a></th>" +
     

                                "<td>" + moment(item.OrderDate).format("DD-MM-YYYY") + "</td>" +
                                
                                "<td>" + item.BusinessDivisionName + "</td>" +
                                "<td>" + item.Customer_Name + "</td>"+
                                //"<td><button type='button'  style = 'color: #081344' title=''  class='btn btn-outline-primary btn-sm mx-1 btnEditService' data-id='" + item.PackageId + "' ></button></td>" +
                                "</tr>";
                       // $("#gridShow").addClass("d-none");
                       // $("#lloForm").removeClass("d-none");

                        })

                        AppointmentsBody.append(html);
                       
                        
                       //  getTripCode();
                        $('#logicgrid').DataTable({
                            "paging": true,
                            "searching":true,
                            "order": [[ 0, "desc" ]],
                                
                        })
                    }


                });
            }





        //

        $(document).on('click', '#_btnPrintReport', function () {

            var fromDate = $('#_fromDate').val();
            var toDate = $('#_toDate').val();
            var win = "";
            // var ToDate = $('#_invoiceTodate').val();
            if (fromDate != "" && toDate != "") {
                  win = window.open('/Reports/LocalLogistics.aspx?FromDate=' + fromDate + '&ToDate=' + toDate, '_blank');
             //   window.location.href = '/Invoices/PrintLogisticsReports?FromDate=' + fromDate + '&ToDate=' + toDate;
            }
            else {
                win = window.open('/Reports/LocalLogistics.aspx?FromDate=' + moment(firstDay).format('DD-MMM-YYYY') + '&ToDate=' + moment(lastDay).format('DD-MMM-YYYY'), '_blank');
             //   window.location.href = '/Invoices/PrintLogisticsReports?FromDate=' + moment(firstDay).format('DD-MMM-YYYY') + '&ToDate=' + moment(lastDay).format('DD-MMM-YYYY');
            }

          if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }
        })
        //


        $(document).on("click", "#_btnSearch", function (e) {
            var FromDate = $("#_fromDate").val();
            var ToDate = $("#_toDate").val();
          //  getlogisticsDetail(FromDate, ToDate);
        })



/*
        function getlogisticsDetail(FromDate, ToDate) {
               
            services.getlogisticsDetail(JSON.stringify({
                FromDate: FromDate,
                ToDate: ToDate
            })).then(function (response) {
               
                $('#logicgrid').dataTable().fnClearTable();
                $('#logicgrid').dataTable().fnDestroy();
                $('#logicgrid').dataTable({
                    dom: 'Bfrtip',
                    "lengthChange": true,
                    "paging": true,
                    'searching': true,

                    data: response.Results,

                    columns: [{
                        data: 'OrderNo',
                        width: 10
                    }, {
                        data: 'Customer_Name',
                        width: 10
                    }, {
                        data: 'JobType',
                        width: 10
                    }, {
                        data: 'FacilityName',
                        width: 10
                    }//,{
                       // data: 'SingleDouble',
                       // width: 10
                    ,{
                        data: 'ContainerNo',
                        width: 10
                    }, {
                        data: 'ContainerNo2',
                        width: 10
                        
                    }, {
                        data: 'ContainerWeight',
                        width: 10
                        
                    }, {
                        data: 'ContainerSize',
                        width: 10
                    }, {
                        data: 'FromLocation',
                        width: 5
                    }, {
                        data: 'ToLocation',
                        width: 5
                    }, {
                        data: 'IsActive',
                        width: 10
                    }, {
                        data: 'Qty',
                        width: 10
                    }, {
                        data: 'logisticsid',
                        width: 10,
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }],
                    buttons: []
                });


            })
        }
        var date = new Date();
        var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
        var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        getlogisticsDetail(firstDay, lastDay);

        function appendActionMenu(id) {
            var html =
              
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
            window.location.href = "LocalLogisticOperation?id=" + ID + "&edit=0";
        });
        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "LocalLogisticOperation?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = parseInt($(this).attr('data-id'));
            deleteLogisticDetail(ID);
        });

        function deleteLogisticDetail(ID) {
            $.confirm({
                title: 'Delete!',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                animation: 'scale',
                type: 'blue',
                buttons: {
                    yes: function () {
                        services.DeleteLogisticDetail(JSON.stringify({
                            LogisticID: ID
                        })).then(function (response) {
                            if (response == "00") {
                                toastr.success("Detail has been Deleted successfully");
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
*/
        $('#btnADD').on('click', function () {
            $("#gridShow").addClass("d-none");
            $("#lloForm").removeClass("d-none");

        });



        $('#ddlOrderNo').on('change', function () {
            $("#orderdetails").removeClass("d-none");
            function getcustomerbyid(id) {
                services.getcustomerbyorder(JSON.stringify({
                    id: id
                })).then(function (response) {
                    var data = response;
                    if (data.length) {
                        if (data[0].BL != null) {
                            $("#ddlblNo").val(data[0].BL);
                            $("#bldiv").removeClass("d-none");
                        } else {
                            $("#bldiv").addClass("d-none");
                            $("#ddlblNo").val(data[0].BL);
                        }
                         if(data[0].CRO != null){
                          $("#ddlCRONo").val(data[0].CRO);
                            $("#CROdiv").removeClass("d-none");
                        }else{
                         $("#CROdiv").addClass("d-none");
                            $("#ddlCRONo").val(data[0].CRO);
                        }
                        var OrderDate = data[0].OrderDate ? moment(data[0].OrderDate).format("ll") : "--";
                        $("#txtCustName").val(data[0].Customer_Name);
                        $("#txtOrderDate").val(OrderDate); //Reading text box values using Jquery
                    } else {
                        alert("No Data Found");
                        $("#orderdetails").addClass("d-none");
                    }

                });
            } getcustomerbyid($(this).val());
            function GetContainerSize() {
                services.getContainerSize(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].ProductCatName + '">' + data[i].ProductCatName + '</option>';

                    }
                    if (s != null) {

                        $("#txtcontsize").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetContainerSize();
            function GetFromLocation() {
                services.getLocation(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].CityName + '">' + data[i].CityName + '</option>';

                    }
                    if (s != null) {

                        $("#txtFromLocation").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetFromLocation();
            function GetToLocation() {
                services.getLocation(JSON.stringify({

                })).then(function (data) {
                    var s = '<option value="">--Select Service--</option>';
                    for (var i = 0; i < data.length; i++) {
                        s += '<option value="' + data[i].CityName + '">' + data[i].CityName + '</option>';

                    }
                    if (s != null) {

                        $("#txtToLocation").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            GetToLocation();
            function getordernumber(id) {
                services.getservicebyorder(JSON.stringify({
                    id: id
                })).then(function (data) {
                    var s = '<option value="-1">--Select Service--</option>';
                    for (var i = 0; i < data.result.length; i++) {
                        s += '<option value="' + data.result[i].serviceid + '">' + data.result[i].servicetype + '</option>';

                    }
                    if (s != null) {

                        $("#ddlServiceType").html(s);

                    } else {
                        alert("No Service found Against orderid: " + id + "")
                    }

                });
            }
            getordernumber($(this).val());
        });
        $('#ddlServiceType').on('change', function () {
            if ($("#ddlServiceType option:selected").text() == "LOLO/Handling") {
                $("#Transport").addClass("d-none");
                $("#Lolo").removeClass("d-none");
            }
            else if ($("#ddlServiceType option:selected").text() == "Hualage/Transportation") {
                $("#Transport").removeClass("d-none");
                $("#Lolo").addClass("d-none");
            }
            else {
                $("#Transport").addClass("d-none");
                $("#Lolo").addClass("d-none");
            }
        });

        var t = $("#TransportGrid").DataTable({
            "paging": false,
            "searching": false,
            "edit": true
        });
        $("#_addOrder").validate({

            rules: {
                txtcontno: "required",
                txtcontsize: "required",
                txtFromLocation: "required",
                txtToLocation: "required",
                ddlJobType: "required",
                ddlWeihght: "required",
            },
            messages: {
                txtcontno: "*",
                txtcontsize: "*",
                txtFromLocation: "*",
                txtToLocation: "*",
                ddlJobType: "*",
                ddlWeihght: "*",
            },
            submitHandler: function (form) {
               // var contStatus = $("#txtconStatus").val();
                var contno = $("#txtcontno").val();
                var contno2 = $("#txtcontno2").val();
                var contsize = $("#txtcontsize").val();
                var fromlocation = $("#txtFromLocation").val();
                var tolocation = $("#txtToLocation").val();
                var jobtype = $("#ddlJobType option:selected").val();
                var conWeight = $("#ddlWeihght option:selected").val();

                t.row.add([contno, contno2, contsize, fromlocation, tolocation, jobtype, conWeight]).draw(false);

               // $("#txtconStatus").val("").change();
                $("#txtcontno").val("");
                $("#txtcontno2").val("");
                $("#txtcontsize").val("").change();
                $("#txtFromLocation").val("").change();
                $("#txtToLocation").val("").change();
                $("#ddlJobType").val("").change();
                $("#ddlWeihght").val("").change();
            }
        });
        //$('#btnitemAdd').on('click', function() {

        //var contno=$("#txtcontno").val();
        //var contsize=$("#txtcontsize").val();
        //var fromlocation=$("#txtFromLocation").val();
        //var tolocation=$("#txtToLocation").val();
        //var jobtype=$("#ddlJobType option:selected").val();

        //t.row.add([contno,contsize,fromlocation,tolocation,jobtype]).draw(false);

        //$("#txtcontno").val("");
        //$("#txtcontsize").val("");
        //$("#txtFromLocation").val("");
        //$("#txtToLocation").val("");
        //$("#ddlJobType").val("").change();

        // });


        //
        $("#submitbutton").removeClass("d-none");
        $("#manualentry").removeClass("d-none");
        $('#ddlentry').on('change', function () {
            var tableExcel = $('#ExcelGrid').DataTable();
            var tableTrasnport = $('#TransportGrid').DataTable();
            if ($(this).val() == "manual") {
                tableTrasnport.clear();
                tableExcel.clear();
                $("#excelimport").addClass("d-none");
                $("#manualentry").removeClass("d-none");
                $("#submitbutton").removeClass("d-none");
            }
            else if ($(this).val() == "Excel") {
                tableTrasnport.clear();
                tableExcel.clear();
                $("#excelimport").removeClass("d-none");
                $("#manualentry").addClass("d-none");
                $("#submitbutton").removeClass("d-none");
            }
        });//transport

        //lolo
        $("#lolomanual").removeClass("d-none");
        $('#ddlloloentry').on('change', function () {
            if ($(this).val() == "manual") {

                $("#loloexcel").addClass("d-none");
                $("#lolomanual").removeClass("d-none");
                var table = $('#ExcelloloGrid').DataTable();
                table.clear().draw();
                $('#input1').val(null);
            }
            else if ($(this).val() == "Excel") {
                $("#loloexcel").removeClass("d-none");
                $("#lolomanual").addClass("d-none");
                $('#ddlLoloJobType').val("").change();
                $('#txtQuantityLolo').val("");
            }
        });
        //.....lolo
        //backbutton
        $('#btnback').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });
        $('#btnbacklolo').on('click', function () {
            window.location.href = "LocalLogisticOperation";
        });


        //excellolo
        let selectedFilelolo;
        document.getElementById('input1').addEventListener("change", (event) => {
            selectedFilelolo = event.target.files[0];
        })

        let datalolo = [{
            "name": "jayanth",
            "data": "scd",
            "abc": "sdef"
        }]


        document.getElementById('uploadloloexcel').addEventListener("click", () => {
            $('#input1').val(null);
            XLSX.utils.json_to_sheet(datalolo, 'Lolo.xlsx');
            if (selectedFilelolo) {
                let fileReader = new FileReader();
                fileReader.readAsBinaryString(selectedFilelolo);
                fileReader.onload = (event) => {
                    let datalolo = event.target.result;
                    let workbook = XLSX.read(datalolo, { type: "binary" });

                    workbook.SheetNames.forEach(sheet => {
                        let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);


                        $('#ExcelloloGrid').dataTable().fnClearTable();
                        $('#ExcelloloGrid').dataTable().fnDestroy();
                        $('#ExcelloloGrid').on('click', 'tbody td', function (e) {
                            editor.inline(this);
                        });
                        $('#ExcelloloGrid').dataTable({

                            dom: 'Bfrtip',
                            "lengthChange": false,
                            "paging": false,
                            'searching': true,
                            'className': 'select-checkbox',
                            data: rowObject,

                            columns: [

                                { 'data': 'CONTAINER #' },
                                { 'data': 'SIZE' },
                                { 'data': 'STATUS' }
                            ],
                            buttons: []


                        });
                        // document.getElementById("jsondata").innerHTML = JSON.stringify(rowObject,undefined,4)
                    });
                }
            }
        });
        //excellolo

        //excel transport
        let selectedFile;
        document.getElementById('input').addEventListener("change", (event) => {
            selectedFile = event.target.files[0];
        })

        let data = [{
            "name": "jayanth",
            "data": "scd",
            "abc": "sdef"
        }]


        document.getElementById('uploadexcel').addEventListener("click", () => {
            $('#input').val(null);
            XLSX.utils.json_to_sheet(data, 'Logistic.xlsx');
            if (selectedFile) {
                let fileReader = new FileReader();
                fileReader.readAsBinaryString(selectedFile);
                fileReader.onload = (event) => {
                    let data = event.target.result;
                    let workbook = XLSX.read(data, { type: "binary" });

                    workbook.SheetNames.forEach(sheet => {
                        let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);


                        $('#ExcelGrid').dataTable().fnClearTable();
                        $('#ExcelGrid').dataTable().fnDestroy();

                        $('#ExcelGrid').on('click', 'tbody td', function (e) {
                            editor.inline(this);
                        });
                        $('#ExcelGrid').dataTable({

                            dom: 'Bfrtip',
                            "lengthChange": false,
                            "paging": false,
                            'searching': true,
                            'className': 'select-checkbox',
                            data: rowObject,

                            columns: [
                            //    { 'data': 'CONTAINER STATUS' },

                                { 'data': 'CONTAINER #' },
                               // { 'data': 'CONTAINER #2'},

                                { 'data': 'CONTAINER #2', "defaultContent":"",},

                                { 'data': 'SIZE' },
                                { 'data': 'LOADING PORT' },
                                { 'data': 'OFFLOAD' },
                                { 'data': 'STATUS' },
                                { 'data': 'CONTAINER WEIGHT', "defaultContent":"",},
                            ],
                            buttons: []


                        });
                        // document.getElementById("jsondata").innerHTML = JSON.stringify(rowObject,undefined,4)
                    });
                }
            }
        });//excel transport


        $('#btnloloSubmit').on('click', function () {

            if ($('#ddlloloentry').val() == "manual") {
                var TempOrder = new Array();



            }
            else if ($('#ddlloloentry').val() == "Excel") {
                var TempOrder = new Array();
                $("#ExcelloloGrid tbody tr").each(function () {
                    var row = $(this);
                    var temporder = {};
                    temporder.containerno = row.find("td").eq(0).html();
                    temporder.containersize = row.find("td").eq(1).html();
                    temporder.jobtype = row.find("td").eq(2).html();
                    TempOrder.push(temporder);
                });

            }
            $.ajax({
                type: "POST", //HTTP POST Method
                url: "/sales/Addlogistics", // Controller/View
                dataType: "json",
                data: { //Passing data
                    Qty: $("#txtQuantityLolo").val(),
                    JobType: $("#ddlLoloJobType option:selected").val(),
                    OrderId: $("#ddlOrderNo option:selected").val(),
                    OrderServiceId: $("#ddlServiceType option:selected").val(),
                    tp: TempOrder

                }, success: function (response) {
                    if (response.success) {
                       // getlogisticsDetail();
                        window.location.href = "LocalLogisticOperation";
                        $("#txtQuantityLolo").val("");
                        if ($('#ddlloloentry').val() == "Excel") {
                            var table = $('#ExcelloloGrid').DataTable();
                            table.clear().draw();
                        }
                        $("#lolomanual").addClass("d-none");
                        $("#loloexcel").addClass("d-none");
                        $("#Lolo").addClass("d-none");
                        $('#ddlServiceType').val("").change();
                        $('#ddlLoloJobType').val("").change();
                        $('#ddlloloentry').val("manual").change();
                        $('#input1').val(null);

                        toastr.success("Logistic Detail has been inserted successfully");

                    } else {
                        // DoSomethingElse()
                        toastr.warning("Kindly Check Your Detail");
                    }
                },
                error: function (response) {

                    toastr.error("Server error,Please check your internet connection");

                }

            });
        });


        $('#btnmanualSubmit').on('click', function () {
           // var table = $('#ExcelGrid').DataTable();
           // if (!table.data().count()) {
            //    toastr.warning("Add Operation Detail");
           // }
           // else {
                if ($('#ddlentry').val() == "manual") {
                    var TempOrder = new Array();
                    $("#TransportGrid tbody tr").each(function () {
                        var row = $(this);
                        var temporder = {};
                      //  temporder.containerStatus = row.find("td").eq(0).html();
                        temporder.containerno = row.find("td").eq(0).html();
                        temporder.containerno2 = row.find("td").eq(1).html();
                        temporder.containersize = row.find("td").eq(2).html();
                        temporder.fromlocation = row.find("td").eq(3).html();
                        temporder.tolocation = row.find("td").eq(4).html();
                        temporder.jobtype = row.find("td").eq(5).html();
                        temporder.containerWeight = row.find("td").eq(6).html();
                        TempOrder.push(temporder);
                    });

                }
                else if ($('#ddlentry').val() == "Excel") {
                    var TempOrder = new Array();
                    $("#ExcelGrid tbody tr").each(function () {
                        var row = $(this);
                        var temporder = {};
                     //   temporder.containerStatus = row.find("td").eq(0).html();
                        temporder.containerno = row.find("td").eq(0).html();
                        temporder.containerno2 = row.find("td").eq(1).html();
                        temporder.containersize = row.find("td").eq(2).html();
                        temporder.fromlocation = row.find("td").eq(3).html();
                        temporder.tolocation = row.find("td").eq(4).html();
                        temporder.jobtype = row.find("td").eq(5).html();
                        temporder.containerWeight = row.find("td").eq(6).html();
                        TempOrder.push(temporder);
                    });

                }
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/sales/Addlogistics", // Controller/View
                    dataType: "json",
                    data: { //Passing data
                        OrderId: $("#ddlOrderNo option:selected").val(),
                        OrderServiceId: $("#ddlServiceType option:selected").val(),
                        tp: TempOrder

                    }, success: function (response) {
                        if (response.success) {
                           // getlogisticsDetail();
                            window.location.href = "LocalLogisticOperation";
                            if ($('#ddlentry').val() == "manual") {
                                var table = $('#TransportGrid').DataTable();
                                table.clear().draw();
                            }
                            else if ($('#ddlentry').val() == "Excel") {
                                var table = $('#ExcelGrid').DataTable();
                                table.clear().draw();
                            }

                            $("#excelimport").addClass("d-none");
                            $("#manualentry").addClass("d-none");
                            $("#Transport").addClass("d-none");
                            $('#ddlentry').val("manual").change();
                            $('#ddlServiceType').val("").change();

                            toastr.success("Logistic Detail has been inserted successfully");
                        } else {
                            // DoSomethingElse()
                            toastr.warn("Kindly Check Your Detail");
                        }
                    },
                    error: function (response) {
                        toastr.error("Server error,Please check your internet connection");
                    }
                });
      //      }

        });
    }
    //end of file
});
