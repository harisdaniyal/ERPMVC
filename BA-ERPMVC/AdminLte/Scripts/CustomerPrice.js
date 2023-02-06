




//$(document).on('change', '#dvCheckBoxListControl', function (Expenseid) {
  //      var a =  Expenseid;
    //    var OrderType = $(this).val(a);
      //  var status = $this.val().$(a);
      //  if (OrderType == "2") {
        //    $("#loloid").removeClass("d-none");
        //    $("#Container20id").addClass("d-none");
        
        //}
       // else {
       // $("#loloid").addClass("d-none");
       // }


    //});




 // $(document).ready(function(Expenseid) {
   //     $(Expenseid).change(function() {
     //       if ($(Expenseid).val() == 2) {
       //         $("#loloid").show()
         //   } else {
           //     $("#loloid").hide()
          //  }

       // })
   // }); 



$(function() {
    var 
    jqDdl = $('#dvCheckBoxListControl'),
    onChange = function(event) {
        if ($(this).val() === "1") {
            $('#loloid').show();
            $('#loloemptyid').show();
            $('#loloid').focus().select();
            $('#loloemptyid').focus().select();
        } else {
            $('#loloid').hide();
            $('#loloemptyid').hide();
            $('#WeightmentCharges20id').hide();
            $('#WeightmentCharges40id').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});






//function showtextbox(Expenseid) {
  //         if ($(Expenseid).val() == 1) {
      //  $("#loloid").removeClass("d-none");
    //          $("#loloid").show()
      //      } else {
        //       $("#loloid").hide()
         //   }


//}

/*
  $(document).ready(function showtextbox(Expenseid) {
        $(Expenseid).change(function() {
            if ($(Expenseid).val().prop == 2) {
                $("#Container20id").show()
            } else {
                if($(Expenseid).val().prop == 1)
                {
                 $("#Container20id").hide()
                }else{
                 $("#Container20id").hide()

                }
                 if($(Expenseid).val().prop == 2)
                {
                 $("#Container20id").hide()
                }else{
                 $("#Container20id").hide()

                }
            
            }
        })
    }); 

*/


/*
$(function () {
        $("#dvCheckBoxListControl").click(function () {
            if ($(this).is(":checked")) {
                $("#Container20id").show();
                $("#loloid").hide();
            } else {
                $("#Container20id").hide();
                $("#loloid").show();
            }
        });
    });
*/
/*

$("#dvCheckBoxListControl :checkbox").click(function() 
	{
       	$("#loloid").hide();
       	$("#dvCheckBoxListControl").each(function() 
       	{
           $("." + $(this).val()).fadeIn();
		});
       
        if($('#dvCheckBoxListControl').filter(':checked').length < 1) 
        {
        	$("#loloid").fadeIn();
        	
        }
        
    });



*/


function showtextbox(Expenseid) {
    var a = "#txt" + Expenseid;
    var b = "#txt2" + Expenseid;
    var c = "#txt3" + Expenseid;
    var d = "#txt4" + Expenseid;
    var E = "#txt5" + Expenseid;
    var F = "#txt6" + Expenseid;
    var X = "#txt7" + Expenseid;
    var Y = "#txt8" + Expenseid;
  //  var z =  Expenseid;
    var status = $(a);
    var status = $(b);
    var status = $(c);
    var status = $(d);
    var status = $(E);
    var status = $(F);
    var status = $(X);
    var status = $(Y);
  //  var status = $(z);
    if ($(a).prop("disabled") &  $(b).prop("disabled") & $(c).prop("disabled") &  $(d).prop("disabled") & $(E).prop("disabled") & $(F).prop("disabled") & $(X).prop("disabled") & $(Y).prop("disabled")) {
        ($(a).prop("disabled",false) & $(b).prop("disabled", false) & $(c).prop("disabled", false) & $(d).prop("disabled", false) & $(E).prop("disabled", false) & $(F).prop("disabled", false) & $(X).prop("disabled", false) & $(Y).prop("disabled", false));
    } else {
        ($(a).prop("disabled", true) & $(b).prop("disabled", true) & $(c).prop("disabled", true) & $(d).prop("disabled", true) & $(E).prop("disabled", true) & $(F).prop("disabled", true) & $(X).prop("disabled", true) & $(Y).prop("disabled", true));
    }



 // $(document).ready(function (Expenseid) {
     //   $(Expenseid).change(function showtextbox() {
       //     if ($(z).val() == 2) {
       //        // $("#loloid").removeClass("d-none");
           //     $("#Container20id").removeClass("d-none");
         //   } else {
             //  $("#Container20id").addClass("d-none");
            //}

     //   })
   // }); 


   


}

/*
$(function() {
   // var 
   // jqDdl = $('#txtcontsize'),
    var jqDdl = "#txt2" + Expenseid;
    //jqDdl = $('#txt2'),
    onChange = function(event) {
        if ($(this).val() === '1') {
            $('#dv').show();
            $('#dv').focus().select();
        } else {
            $('#dv').hide();
        }
    };
    onChange.apply(jqDdl.get(0)); // To show/hide the Other textbox initially
    jqDdl.change(onChange);
});
*/







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


function editClick(a)
{
    var referenceNum = a;
    window.location.href = "Customer?id=" + referenceNum + "&edit=1";
}



$(document).ready(function(){
var services = new Services(); 







    var empid = $.url().param("id");
    var isEdit = $.url().param("edit");



if( isEdit == 1 ){
  $("#lloForm").show();

        function getCPricebyid(empid) {
            services.getCPricebyid(JSON.stringify({
                id: empid
            })).then(function (response) {
                var data = response.result;
                $("#txtCustomerNo").val(data[0].CID).change();
            //    $("#dvCheckBoxListControl").val(data[0].FID).change();
                //$("input[name='_ExpenseCheckList']:checked").each(function () {
                  //  var id = $(this).val();
                   // var link = "#txt" + id;
                    //var price = $(link).val();
                   // listcheck.push($(this).val());
                   // listprice.push(price);
                //});
             
            });
        } getCPricebyid(empid);




} else {
$("#gridShow").removeClass("d-none");

function getCustomerPriceGride() {
        services.CustomerPriceGride().then(function (response) {

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
                    data: 'total',
                    width: 10,
                    visible: false,
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
    getCustomerPriceGride();

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
        window.location.href = "/Account/Register?id=" + ID + "&edit=0";
    });
    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "/CustomerPrice/Customer?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._remove", function (e) {
        var ID = $(this).attr('data-id');
        deleteUserDetail(ID);
    });


// list by id 

 $(document).on('change', '#txtCustomerNo', function () {
            var custId = $(this).val();
            if (custId != "") {
                services.getExpenseListById(JSON.stringify({
                    CustId: custId
                })).then(function (response) {
                    $('input:checkbox').removeAttr('checked')

                    if (response.length > 0) {
                        for (var i = 0; i < response.length; i++) {
                            var val = response[i].faciltyid;
                           // var val1 = response[i].facilityPrice;
                          //  var a = "#txt" + Expenseid;
                            $('#expense_' + val).prop("checked", true);
                           // $('#txt' + val).prop("disabled", false);
                             var Y = "#txt" + response[i].facilityPrice;
                             var status = $(Y);

                             if ($(Y).prop("disabled")) {
                                 ($(Y).prop("disabled",true));
                             } else {
                                 ($(Y).prop("disabled", false));
                             }


                        }
                    }
                    else {
                        $('input:checkbox').removeAttr('checked')
                    }
                   
                })
            }
            else {
                $('input:checkbox').removeAttr('checked')

            }


        });



//


   


    $(document).on('click', '#btnSubmit', function () {
            $("#_Addprice").valid();
        });



var toastCount = 0;

 $("#_Addprice").validate({
        rules: {
            txtCustomerNo: { min: 1 },
            _ExpenseCheckList: "required"
        },
        messages: {
            txtCustomerNo: "*",
            _ExpenseCheckList: "*"

        },
    submitHandler: function (form) {
        var tripparameter = {
            CustomerID: $("#txtCustomerNo option:selected").val(),
        }

        services.AddFacilityCustomer(JSON.stringify(tripparameter)).then(response => {
            var listcheck = [];
            var listprice = [];
            var listpriceEmpty = [];
            var listContainerSize20P = [];
            var listContainerSize40P = [];
            var listContainerSize20PEmpty = [];
            var listContainerSize40PEmpty = [];
            var listWeightmentCharges = [];
            var listWeightmentCharges40 = [];
            if (response != null || response != 0) {
                $("input[name='_ExpenseCheckList']:checked").each(function () {
                    var id = $(this).val();
                    var link = "#txt" + id;
                    var link2 = "#txt2" + id;
                    var link3 = "#txt3" + id;
                    var link4 = "#txt4" + id;
                    var link5 = "#txt5" + id;
                    var link6 = "#txt6" + id;
                    var link7 = "#txt7" + id;
                    var link8 = "#txt8" + id;
                    var price = $(link).val();
                    var ContainerSize20P = $(link2).val();
                    var ContainerSize40P = $(link3).val();
                    var WeightmentCharges = $(link4).val();
                    var WeightmentCharges40 = $(link5).val();
                    var priceEmpty = $(link6).val();
                    var ContainerSize20PEmpty = $(link7).val();
                    var ContainerSize40PEmpty = $(link8).val();
                    listcheck.push($(this).val());
                    listprice.push(price);
                    listContainerSize20P.push(ContainerSize20P);
                    listContainerSize40P.push(ContainerSize40P);
                    listWeightmentCharges.push(WeightmentCharges);
                    listWeightmentCharges40.push(WeightmentCharges40);
                    listpriceEmpty.push(priceEmpty);
                    listContainerSize20PEmpty.push(ContainerSize20PEmpty);
                    listContainerSize40PEmpty.push(ContainerSize40PEmpty);
                });
                
                var Facilityparams = {

                    FacilityID: listcheck,
                    Price: listprice,
                    priceEmpty: listpriceEmpty,
                    ContainerSize20P: listContainerSize20P,
                    ContainerSize40P: listContainerSize40P,
                    ContainerSize20PEmpty: listContainerSize20PEmpty,
                    ContainerSize40PEmpty: listContainerSize40PEmpty,
                    WeightmentCharges: listWeightmentCharges,
                    WeightmentCharges40: listWeightmentCharges40,
                    CustomerID: response,

                }
                services.AddCustomerPriceFacility(JSON.stringify(Facilityparams)).then(response => {
                    if (response == "00") {
                        $("#txtCustomerNo").val("-1").change();
                        $("input[name='_ExpenseCheckList']:checked").each(function () {
                            var id = $(this).val();
                            var link = "#txt" + id;
                            var link2 = "#txt2" + id;
                            var link3 = "#txt3" + id;
                            var link4 = "#txt4" + id;
                            var link5 = "#txt5" + id;
                            var link6 = "#txt6" + id;
                            var link7 = "#txt7" + id;
                            var link8 = "#txt8" + id;
                            $(link).val("").change();
                            $(link2).val("").change();
                            $(link3).val("").change();
                            $(link4).val("").change();
                            $(link5).val("").change();
                            $(link6).val("").change();
                            $(link7).val("").change();
                            $(link8).val("").change();
                            $(this).removeAttr('checked');
                            showtextbox(id); 
                        });
                        getCustomerPriceGride();
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















  $.ajax({
        type: "GET",
        url: "/CustomerPrice/GetCustomerNo",
        data: "{}",
        success: function (data) {
            var s = '<option value="-1" >Please Select a Customer Name</option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].CID + '">' + data[i].CName+'</option>';
            }
            $("#txtCustomerNo").html(s);
        }
    });






    function getFacilitiesList() {
        var html = "";
        var orderList = $("#dvCheckBoxListControl");
        services.getFacilitiesList(JSON.stringify({
        })).then(function (response) {
        
        $(response.result).each(function () {
          //  html += '<li class="list-group-item"><div class="col-md-4"> <div class="form-check"><input class="form-check-input" type="checkbox" name="FacilityCheckList" value="' + this.facilityID + '" id="' + this.facilityID + '"><label class="form-check-label" for="">' + this.FacilityName + '</label></div></div></li>';
         // html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" placeholder="LOLO" onchange="showtextbox(' + this.facilityID + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.facilityID + '" id="' + this.facilityID + '"><label class="form-check-label" for="">' + this.FacilityName + '</label></div></div><div class="col-md-2"><p>LOLO</p><div class="form-group"><input type="text" id="txt' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>    <div class="col-md-2"><p>Container20</p><div class="form-group"><input type="text" id="txt2' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>  <div class="col-md-2"><p>Container40</p><div class="form-group"><input type="text" id="txt3' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>     </div></li>';
          html += '<li class="list-group-item"><div class="row"><div class="col-md-2"><div class="form-group"><input class="form-check-input" placeholder="LOLO" onchange="showtextbox(' + this.facilityID + ')" type="checkbox" name="_ExpenseCheckList" value="' + this.facilityID + '" id="expense_' + this.facilityID + '" class="expense_' + this.facilityID + '"><label class="form-check-label" for="">' + this.FacilityName + '</label></div></div><div class="col-md-2" id="loloid"><p>LOLO/LADEN</p><div class="form-group"><input type="text" id="txt' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>    <div class="col-md-2" id="loloemptyid"><p>LOLO/EMPTY</p><div class="form-group"><input type="text" id="txt6' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>          <div class="col-md-2" id="Container20id"><p>Container20</p><div class="form-group"><input type="text" id="txt2' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>  <div class="col-md-2" id="ContainersNo40id"><p>Container40</p><div class="form-group" ><input type="text" id="txt3' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>          <div class="col-md-2" id="ContainersNo20Emptyid"><p>Container20Empty</p><div class="form-group" ><input type="text" id="txt7' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>             <div class="col-md-2" id="ContainersNo40Emptyid"><p>Container40Empty</p><div class="form-group" ><input type="text" id="txt8' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>          <div class="col-md-2" id="WeightmentCharges20id"><p>WeightmentCharges20</p><div class="form-group" ><input type="text" id="txt4' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>       <div class="col-md-2" id="WeightmentCharges40id"><p>WeightmentCharges40D</p><div class="form-group" ><input type="text" id="txt5' + this.facilityID + '" value="" class="form-control" disabled="disabled"></div></div>       </div></li>';
        });

        orderList.append(html);
        });
    }  getFacilitiesList();







}







});



