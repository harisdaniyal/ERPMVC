
    $(document).ready(function () {
        var services = new Services();
        var itemId = $.url().param('id');
        var isEdit = $.url().param('edit');
        if (isEdit == 1) {
            services.getCategoryById(JSON.stringify({
                CatId: itemId
            })).then(function (response) {
                $("#CatId").val(response.CatId);
                $("#_catName").val(response.CategoryName);
            })
        }


        $(document).on("click", "#_AddItem", function (e) {
            if ($("#_txtunitName").val() != "" ) {
                var Orderparams = {
                    ID: $('#UnitId').val(),
                    UnitName: $('#_txtunitName').val(),
                }
                services.addUnitItems(JSON.stringify(Orderparams)).then(function (response) {
                    console.log(response);
                    if (response.statusCode == "00") {
                        toastr.success(response.message);
                        setTimeout(function () {
                            window.location = 'ItemUnit';
                        }, 2000)
                    }
                    else {
                        toastr.error("Server error,Please check your internet connection");
                    }
                })

            }
            else {
                toastr.warning("Please Fill Required Fields");
            }
        });
        $(document).on("click", "#_resetItem", function (e) {
            $("#_itemName").val("");

        });
        function itemQty() {
            services.getCategoryList().then(function (response) {

                console.log(response);
                $("#_tblTicketList").dataTable().fnClearTable();
                $("#_tblTicketList").dataTable().fnDestroy();

                $('#_tblTicketList').DataTable({
                    data: response,
                    columns: [
                        {
                            'data': 'CatId',

                        },
                        {
                            'data': 'CategoryName',

                        },                      
                        {
                            'data': 'isActive',
                        },
                        {
                            data: 'CatId',
                            width: 10,
                            "render": function (data) {
                                var html = appendActionMenu(data);
                                return html;
                            }

                        }
                        ],




                });
            })
        }
        itemQty();

        function appendActionMenu(id) {
            var html =

                '<div class="row" style="margin-left:4px;">' +


                '<a data-id="' + id + '" class="p-1 fa fa-edit _edit" ></a>' +
                '<a data-id="' + id + '" class="p-1 fa fa-trash _remove" ></a>' +
                '</div>'
            //'</div>'
            return html;
        }

        $(document).on("click", "._edit", function (e) {
            var ID = $(this).attr('data-id');
            window.location.href = "Category?id=" + ID + "&edit=1";
        });

        $(document).on("click", "._remove", function (e) {
            var ID = parseInt($(this).attr('data-id'));
            deleteItemDetail(ID);
        });

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
                        services.DeleteCategoryDetail(JSON.stringify({
                            CatId: ID
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
    })
