
function editClick(id) {

    var referenceNum = id;
    window.location.href = "Index?id=" + referenceNum + "&edit=1";
}

$(document).ready(function(){
var services = new Services(); 


 var empid = $.url().param("id");
 var empid1 = $.url().param("ids");
 var empid2 = $.url().param("ids2");
    var isEdit = $.url().param("edit");
    var isView = $.url().param("view");
    if(isView == 0){
    $("#lloForm").removeClass("d-none");
    $("#containerhide").addClass("d-none");
    $("#lolohide").addClass("d-none");
    $("#WeightChrgeshide").addClass("d-none");
    $("#facList").addClass("d-none");
    $("#_reset").addClass("d-none");
    $("#btnSubmit").addClass("d-none");
    $("#RecentHideLolo").removeClass("d-none");
    $('#txtfacility').attr("disabled", true);    
    $("#txtCustname").attr("disabled", true);
    $("#txtfacility").attr("disabled", true);
    $("#txtloloLaden").attr("disabled", true);
    $("#txtloloEmpty").attr("disabled", true);
    $("#txtContainer20laden").attr("disabled", true);
    $("#txtContainer40laden").attr("disabled", true);
    $("#txtContainer20Empty").attr("disabled", true);
    $("#txtContainer40Empty").attr("disabled", true);
    $("#txtweightmentchargesladen").attr("disabled", true);
    $("#txtweightmentchargesempty").attr("disabled", true);



//check
 function getRecentPrice(empid1,empid2) {
            services.getRecentPrice(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#ResecntGrid').dataTable().fnClearTable();
            $('#ResecntGrid').dataTable().fnDestroy();
            $('#ResecntGrid').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'container1',
                    width: 10
                }, {
                    data: 'container2',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPrice(empid1, empid2);
//check


 function getRecentPricelolo(empid1,empid2) {
            services.getRecentPricelolo(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#LOlOGrideByID').dataTable().fnClearTable();
            $('#LOlOGrideByID').dataTable().fnDestroy();
            $('#LOlOGrideByID').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'FPrice',
                    width: 10
                }, {
                    data: 'FPriceEmpty',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                    visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                    visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPricelolo(empid1, empid2);




 function getRecentPriceWeight(empid1,empid2) {
            services.getRecentPriceWeight(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#WeightGrideByID').dataTable().fnClearTable();
            $('#WeightGrideByID').dataTable().fnDestroy();
            $('#WeightGrideByID').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'FWeightmentCharges20',
                    width: 10
                }, {
                    data: 'FWeightmentCharges40',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                    visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                    visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPriceWeight(empid1, empid2);








 $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetCustomerNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName+'</option>';
            }
            $("#txtCustname").html(s);
        }
    });



  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetFacilitylist",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].FID + '">' + data[i].FName+'</option>';
            }
            $("#txtfacility").html(s);
        }
    });






      function getCustPriceByid(empid) {
            services.getCustPriceByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
            //Start
                //var start
       var OrderType = data[0].FID
       // var OrderType = $(this).val(data[0].FID);


      var GrideHide = data[0].FID

                if(GrideHide == "1")
                {
                
                   $("#RecentHideLolo").addClass("d-none");
                   $("#RecentHideWeight").addClass("d-none");

                }else if(GrideHide == "2")
                {
                   $("#RecentHideWeight").addClass("d-none");
                   $("#Recesthide").addClass("d-none");

                }else if(GrideHide == "3")
                {
                   $("#RecentHideLolo").addClass("d-none");
                   $("#Recesthide").addClass("d-none");
                }else{


                }
        if (OrderType == "1") {
            $("#containerhide").removeClass("d-none");
            $("#facList").removeClass("d-none");
            $("#Recesthide").removeClass("d-none");
        }
        else {
         $("#containerhide").addClass("d-none");
            $("#lolohide").addClass("d-none");
            $("#WeightChrgeshide").addClass("d-none");
            $("#facList").addClass("d-none");
            $("#Recesthide").addClass("d-none");
        }
    
        if (OrderType == "2")
        {
            $("#lolohide").removeClass("d-none");
            $("#facList").removeClass("d-none");
         $("#Recesthide").addClass("d-none");
        }
        else {
            $("#lolohide").addClass("d-none");
        }

        if (OrderType == "3")
        {
            $("#WeightChrgeshide").removeClass("d-none");
            $("#facList").removeClass("d-none");
        }
        else {
            $("#WeightChrgeshide").addClass("d-none");
        }
                //var END
                setTimeout(function () {
                  $("#txtCustname").val(data[0].CCustomer);
                  $("#txtfacility").val(OrderType);
                  $("#txtloloLaden").val(data[0].FPrice);
                  $("#txtloloEmpty").val(data[0].FPriceEmpty);
                  $("#txtContainer20laden").val(data[0].FContainerLaden20);
                  $("#txtContainer40laden").val(data[0].FContainerLaden40);
                  $("#txtContainer20Empty").val(data[0].FContainerEmpty20);
                  $("#txtContainer40Empty").val(data[0].FContainerEmpty40);
                  $("#txtweightmentchargesladen").val(data[0].FWeightmentCharges20);
                  $("#txtweightmentchargesempty").val(data[0].FWeightmentCharges40);

                }, 1000)
                 
            //END
        });
        } getCustPriceByid(empid);


        $("#btnBack").click(function () {
            // Remove this line if it worked
            window.location.href = "Index";
        });








    }
    else if (isEdit == 1) {
    $("#lloForm").removeClass("d-none");
    $("#hidemainrecents").removeClass("d-none");
    $("#containerhide").addClass("d-none");
    $("#lolohide").addClass("d-none");
    $("#WeightChrgeshide").addClass("d-none");
    $("#facList").addClass("d-none");
    $("#_reset").addClass("d-none");
    $('#txtfacility').attr("disabled", true);




//check
 function getRecentPrice(empid1,empid2) {
            services.getRecentPrice(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#ResecntGrid').dataTable().fnClearTable();
            $('#ResecntGrid').dataTable().fnDestroy();
            $('#ResecntGrid').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'container1',
                    width: 10
                }, {
                    data: 'container2',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPrice(empid1, empid2);
//check


 function getRecentPricelolo(empid1,empid2) {
            services.getRecentPricelolo(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#LOlOGrideByID').dataTable().fnClearTable();
            $('#LOlOGrideByID').dataTable().fnDestroy();
            $('#LOlOGrideByID').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'FPrice',
                    width: 10
                }, {
                    data: 'FPriceEmpty',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                    visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                    visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPricelolo(empid1, empid2);




 function getRecentPriceWeight(empid1,empid2) {
            services.getRecentPriceWeight(JSON.stringify({
                id: empid1,
                ids2: empid2
            })).then(function (response) {
               // var data = response.result;


            $('#WeightGrideByID').dataTable().fnClearTable();
            $('#WeightGrideByID').dataTable().fnDestroy();
            $('#WeightGrideByID').dataTable({
                dom: 'Bfrtip',
                "lengthChange": true,
                "paging": true,
                'searching': false,
                //order: [[ 3, 'desc' ], [ 0, 'asc' ]],
                 "order": [ 5, 'asc' ],
                 'ordering'    : true,
           

                data: response.result,

                columns: [{
                    data: 'FWeightmentCharges20',
                    width: 10
                }, {
                    data: 'FWeightmentCharges40',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'container3',
                    width: 10,
                    visible: false,
                }, {
                    data: 'container4',
                    width: 10,
                    visible: false,
                }, {
                    data: 'updateby',
                    width: 10,
                  //  visible: false,
                },  {
                  data: 'UpdateDate',
                  type: 'date',
                  render: function (data, type, row) { return data ? moment(data).format('ddd DD/MM/YYYY') : ''; }
                }],
                buttons: []
            });

        });
    }
    getRecentPriceWeight(empid1, empid2);












  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetCustomerNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName+'</option>';
            }
            $("#txtCustname").html(s);
        }
    });



  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetFacilitylist",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].FID + '">' + data[i].FName+'</option>';
            }
            $("#txtfacility").html(s);
        }
    });






      function getCustPriceByid(empid) {
            services.getCustPriceByid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                var OrderType = data[0].FID
                var GrideHide = data[0].FID

                if(GrideHide == "1")
                {
                
                   $("#RecentHideLolo").addClass("d-none");
                   $("#RecentHideWeight").addClass("d-none");

                }else if(GrideHide == "2")
                {
                   $("#RecentHideWeight").addClass("d-none");
                   $("#Recesthide").addClass("d-none");

                }else if(GrideHide == "3")
                {
                   $("#RecentHideLolo").addClass("d-none");
                   $("#Recesthide").addClass("d-none");
                }else{


                }

                if (OrderType == "1") {
                    $("#containerhide").removeClass("d-none");
                    $("#facList").removeClass("d-none");
                }
                else {
                    $("#containerhide").addClass("d-none");
                    $("#lolohide").addClass("d-none");
                    $("#WeightChrgeshide").addClass("d-none");
                    $("#facList").addClass("d-none");
                }
                if (OrderType == "2")
                {
                    $("#lolohide").removeClass("d-none");
                    $("#facList").removeClass("d-none");
                }
                else {
                    $("#lolohide").addClass("d-none");
                }
                if (OrderType == "3")
                {
                   $("#WeightChrgeshide").removeClass("d-none");
                   $("#facList").removeClass("d-none");
                }
                else {
                   $("#WeightChrgeshide").addClass("d-none");
                }
                setTimeout(function () {
                  $("#txtCustname").val(data[0].CCustomer);
                  $("#txtfacility").val(OrderType);
                  $("#txtloloLaden").val(data[0].FPrice);
                  $("#txtloloEmpty").val(data[0].FPriceEmpty);
                  $("#txtContainer20laden").val(data[0].FContainerLaden20);
                  $("#txtContainer40laden").val(data[0].FContainerLaden40);
                  $("#txtContainer20Empty").val(data[0].FContainerEmpty20);
                  $("#txtContainer40Empty").val(data[0].FContainerEmpty40);
                  $("#txtweightmentchargesladen").val(data[0].FWeightmentCharges20);
                  $("#txtweightmentchargesempty").val(data[0].FWeightmentCharges40);

                }, 2000)
        });
        } getCustPriceByid(empid);


        $("#btnBack").click(function () {
            window.location.href = "Index";
        });





   $(document).on('click', '#btnSubmit', function () {
        $("#_Addprice").valid();
    });
    $("#_Addprice").validate({

        rules: {
     
        },
        messages: {

        },
        submitHandler: function (form) {

            var Orderparams = {
                    Customer_Facilityid: empid,
                    FacilityID: $("#txtfacility option:selected").val(),
                    price: $("#txtloloLaden").val(),
                    priceEmpty: $("#txtloloEmpty").val(),
                    ContainerSize20P: $("#txtContainer20laden").val(),
                    ContainerSize40P: $("#txtContainer40laden").val(),
                    ContainerSize20PEmpty: $("#txtContainer20Empty").val(),
                    ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    //ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    WeightmentCharges: $("#txtweightmentchargesladen").val(),
                    WeightmentCharges40: $("#txtweightmentchargesempty").val(),
            }
            services.UpdateCustomerPrice(JSON.stringify(Orderparams)).then(response => {

                    var Facilityparams = {
                    CustomerID: $("#txtCustname").val(),
                    FacilityID: $("#txtfacility option:selected").val(),
                    price: $("#txtloloLaden").val(),
                    priceEmpty: $("#txtloloEmpty").val(),
                    ContainerSize20P: $("#txtContainer20laden").val(),
                    ContainerSize40P: $("#txtContainer40laden").val(),
                    ContainerSize20PEmpty: $("#txtContainer20Empty").val(),
                    ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    //ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    WeightmentCharges: $("#txtweightmentchargesladen").val(),
                    WeightmentCharges40: $("#txtweightmentchargesempty").val(),
                    }
                    services.UpdateCustomerPriceHistory(JSON.stringify(Facilityparams)).then(response => {
                        if (response.success) {                      
//  if (response == "00") {
                            toastr.success("Order has been generated successfully");
                             returncondition = true;
                             window.location.href = "Index";
                        }
                        else {
                            toastr.error("please select required fields");
                            returncondition = false;
                            window.location.href = "Index";
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














//Update add START
/*

   $('#btnSubmit').on('click', function () {
            $.ajax({
                type: "POST", //HTTP POST Method
                url: "/CustomerPrice/UpdateCustomerPriceFacilty", // Controller/View
                dataType: "json",
                data: { //Passing data
                   // logisticsid: empid,
                    Customer_Facilityid: empid,
                    
                    FacilityID: $("#txtfacility option:selected").val(),
                    price: $("#txtloloLaden").val(),
                    priceEmpty: $("#txtloloEmpty").val(),
                    ContainerSize20P: $("#txtContainer20laden").val(),
                    ContainerSize40P: $("#txtContainer40laden").val(),
                    ContainerSize20PEmpty: $("#txtContainer20Empty").val(),
                    ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    //ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    WeightmentCharges: $("#txtweightmentchargesladen").val(),
                    WeightmentCharges40: $("#txtweightmentchargesempty").val(),
                    


                }, success: function (response) {
                    if (response.success) {
                        location.reload();
                        toastr.success("Detail has been Updated successfully");
                       

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

*/





//Update add END


  




}else{





     $("#gridShow").removeClass("d-none");
     $("#containerhide").addClass("d-none");
     $("#lolohide").addClass("d-none");
     $("#WeightChrgeshide").addClass("d-none");
     $("#facList").addClass("d-none");


     function getCustPriceGride() {
        services.getCustPriceGride().then(function (response) {

            $('#MainGrid').dataTable().fnClearTable();
            $('#MainGrid').dataTable().fnDestroy();
            $('#MainGrid').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response.CustPrice,

                columns: [{
                    data: 'CustomerName',
                    width: 10
                }, {
                    data: 'faciltyName',
                    width: 10,
                  //  visible: false,
                }, {
                    data: 'id',
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
    getCustPriceGride();

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
        window.location.href = "/CustomerPrice/Index?id=" + ID + "&view=0";
    });
    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "/CustomerPrice/Index?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._remove", function (e) {
       var ID = parseInt($(this).attr('data-id'));
        deleteItemDetail(ID);
    });
//Delete Function START
function deleteItemDetail(ID) {
            $.confirm({
                title: 'Delete!',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                animation: 'scale',
                type: 'blue',
                buttons: {
                    yes: function () {
                        services.DeleteItemDetail(JSON.stringify({
                            itemId: ID
                        })).then(function (response) {
                            console.log(response);  

                            if (response.statusCode == "00") {
                                toastr.success("Item has been Deleted successfully");
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



 function getContainerWieght() {
        services.getContainerWieght(JSON.stringify({
        })).then(function (response) {

            var s = '<option value="">Please Select ContainerWeight</option>';
            for (var i = 0; i < response.result.length; i++) {

                s += '<option value="' + response.result[i].CID + '">' + response.result[i].CWwight + '</option>';
            }
            if (s != null) {

                   $("#txtContainerWeightCategory").html(s);

             } else {
                        alert("No Service found Against orderid: " + id + "")
              }
          

        });
    }
    getContainerWieght();







  //Back Button
        $("#btnBack").click(function () {
            // Remove this line if it worked
            $("#gridShow").removeClass("d-none");
            $("#lloForm").addClass("d-none");
        });


       //Back Button
        $("#btnADD").click(function () {
            // Remove this line if it worked
            $("#gridShow").addClass("d-none");
            $("#lloForm").removeClass("d-none");
           
        });


//Start


//END






$(document).on('change', '#txtfacility', function () {
        var OrderType = $(this).val();
        if (OrderType == "1") {
            $("#containerhide").removeClass("d-none");
            $("#facList").removeClass("d-none");
            $("#txtloloLaden").val("");
            $("#txtloloEmpty").val("");
            $("#txtweightmentchargesladen").val("");
            $("#txtweightmentchargesempty").val("");
        }
        else {
         $("#containerhide").addClass("d-none");
            $("#lolohide").addClass("d-none");
            $("#WeightChrgeshide").addClass("d-none");
            $("#facList").addClass("d-none");
        }
    
        if (OrderType == "2")
        {
            $("#lolohide").removeClass("d-none");
            $("#facList").removeClass("d-none");
            $("#txtContainer20laden").val("");
            $("#txtContainer40laden").val("");
            $("#txtContainer20Empty").val("");
            $("#txtContainer40Empty").val("");
            $("#txtweightmentchargesladen").val("");
            $("#txtweightmentchargesempty").val("");
        }
        else {
            $("#lolohide").addClass("d-none");
        }

        if (OrderType == "3")
        {
            $("#WeightChrgeshide").removeClass("d-none");
            $("#facList").removeClass("d-none");
                     $("#txtloloLaden").val("");
                     $("#txtloloEmpty").val("");
                     $("#txtContainer20laden").val("");
                     $("#txtContainer40laden").val("");
                     $("#txtContainer20Empty").val("");
                     $("#txtContainer40Empty").val("");
                    // $("#txtweightmentchargesladen").val("");
                    // $("#txtweightmentchargesempty").val("");
        }
        else {
            $("#WeightChrgeshide").addClass("d-none");
        }

    });



  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetCustomerNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName+'</option>';
            }
            $("#txtCustname").html(s);
        }
    });



  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetFacilitylist",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].FID + '">' + data[i].FName+'</option>';
            }
            $("#txtfacility").html(s);
        }
    });

      function getordernumber() {
            services.getlogisticsorders(JSON.stringify({
            })).then(function (data) {
                var s = '<option value="">--Select Order Number--</option>';
                for (var i = 0; i < data.result.length; i++) {
                    s += '<option value="' + data.result[i].Orderid + '">' + data.result[i].OrderNo + '</option>';

                }
                $("#txtOrderNo").html(s);

            });
        } getordernumber();


   //Inserting Data Start
    $(document).on('click', '#btnSubmit', function () {
            $("#_Addprice").valid();
        });



var toastCount = 0;

 $("#_Addprice").validate({
        rules: {
            txtCustname: { min: 1 },
            txtfacility: { min: 1 },
       //     _ExpenseCheckList: "required"
        },
        messages: {
            txtCustname: "*",
            txtfacility: "*",
           // _ExpenseCheckList: "*"

        },
    submitHandler: function (form) {
        var tripparameter = {
            CustomerID: $("#txtCustname option:selected").val(),
            OrderID: $("#txtOrderNo option:selected").val(),
        }

        services.AddFacilityNameCustomer(JSON.stringify(tripparameter)).then(response => {
            if (response != null || response != 0) {
                
                var Facilityparams = {

                    FacilityID: $("#txtfacility option:selected").val(),
                    ContainerWeight: $("#txtContainerWeightCategory option:selected").val(),
                    
                    price: $("#txtloloLaden").val(),
                    priceEmpty: $("#txtloloEmpty").val(),
                    ContainerSize20P: $("#txtContainer20laden").val(),
                    ContainerSize40P: $("#txtContainer40laden").val(),
                    ContainerSize20PEmpty: $("#txtContainer20Empty").val(),
                    ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    //ContainerSize40PEmpty: $("#txtContainer40Empty").val(),
                    WeightmentCharges: $("#txtweightmentchargesladen").val(),
                    WeightmentCharges40: $("#txtweightmentchargesempty").val(),
                    CustomerID: response,

                }
                services.AddCustomerPriceFacilityName(JSON.stringify(Facilityparams)).then(response => {
                    if (response == "00") {
                     $("#txtCustname").val("-1");
                     $("#txtfacility").val("-1");
                     $("#txtloloLaden").val("");
                     $("#txtloloEmpty").val("");
                     $("#txtContainer20laden").val("");
                     $("#txtContainer40laden").val("");
                     $("#txtContainer20Empty").val("");
                     $("#txtContainer40Empty").val("");
                     $("#txtweightmentchargesladen").val("");
                     $("#txtweightmentchargesempty").val("");
                     getCustPriceGride();
                     toastr.success("CustomerPrice has been generated successfuly");
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

   //Inserting Data END
}

 




});