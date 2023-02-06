$(document).ready(function () {
    var services = new Services();

    var menuid = $.url().param("id");
    function viewMenuTable() {
        services.GetMenuDetail(JSON.stringify({

        })).then(function (response) {



            $('#_orderTable').dataTable().fnClearTable();
            $('#_orderTable').dataTable().fnDestroy();



            console.log(response.result);
            $('#_orderTable').dataTable({
                dom: 'Bfrtip',
                "lengthChange": false,
                "paging": true,
                'searching': true,

                data: response,

                columns: [{
                    data: 'Menu_ID',
                    width: 10
                }, {
                        data: 'Menu_Caption',
                    width: 10,
                    'render': function (date) {
                        //var data = date ? moment(date).format("DD/MM/YYYY hh:mm A") : "--"
                        var data = date ? moment(date).format("ll") : "--"
                        return data;
                    }
                }, {
                        data: 'Url',
                    width: 10
                }, {
                    data: 'IsActive',
                    width: 10
                }, {
                        data: 'Menu_ID',
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
    viewMenuTable();
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
        window.location.href = "Menu?id=" + ID + "&edit=0";
    });
    $(document).on("click", "._edit", function (e) {
        var ID = $(this).attr('data-id');
        window.location.href = "Menu?id=" + ID + "&edit=1";
    });

    $(document).on("click", "._remove", function (e) {
        var ID = parseInt($(this).attr('data-id'));
        
    });
})