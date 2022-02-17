
$(document).ready(function () {
    var services = new Services();


        $("#hiderow3").addClass("d-none");
        $("#hiderow1").addClass("d-none");
        $("#hiderow2").addClass("d-none");






    function getTripDetail() {
            services.TripGridUpcomming().then(function (response) {

                $('#MainGrid').dataTable().fnClearTable();
                $('#MainGrid').dataTable().fnDestroy();
                $('#MainGrid').dataTable({
                    dom: 'Bfrtip',
                    
                    "paging": true,
                    'searching': true,
                    'lengthChange': true,
                     responsive: true,

                    data: response.trip,

                    columns: [{
                        data: 'tripid',
                        width: 10
                    },{
                        data: 'orderno',
                        width: 10
                    },{
                        data: 'contno',
                        width: 10
                    },{
                        data: 'contno2',
                        width: 10 
                    },{
                        data: 'vehicleno',
                        width: 10
                    },{
                        data: 'driver',
                        width: 10
                    },{
                        data: 'fromloc',
                        width: 10
                    },{
                        data: 'toloc',
                        width: 10
                    },//,{
                       // data: 'curentfromloc',
                      //  width: 10
                   // },{
                    //    data: 'currenttoloc',
                    //    width: 10
                   // },
                    {
                        data: 'CContainerStatus',
                        width: 10
                    },{
                        data: 'total',
                        width: 10
                    },{
                        data: 'id',
                        width: 10,
                        "render": function (data) {
                            var html = appendActionMenu(data);
                            return html;
                        }

                    }],
                    buttons: []
                });

            });
        }
        getTripDetail();

        function appendActionMenu(id) {
            var html =
                //'<div class="dropdown">' +
                //    '<a class="dropdown-toggle"  href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >' +
                //        '<span class="vertical-icon"></span>' +
                //        //'<span class="fa fa-ellipsis-v"></span>' +
                //    '</a>' +
                '<div class="row" style="margin-left:4px;">' +

               // '<a data-id="' + id + '" class="p-1 fa fa-eye _view" ></a>' +
               // '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +
              
               // '</div>'+
                '<div class="row" style="margin-left:4px;">'+
                    // '<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
                     '<a data-id="' + id + '" class="p-1 fa fa-truck-loading _Recived" ></a>' +
                    
                '</div>'


            //'</div>'
            return html;
        }
        /*
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
        */
         $(document).on("click", "._Recived", function (e) {
            var ID = $(this).attr('data-id');
             window.location.href = "/sales/TripDetails?id=" + ID + "&deilverd=2";
        });
       















});