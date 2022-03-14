$(function () {
    //Initialize Select2 Elements
/*    $('.select2').select2()*/

    //Initialize Select2 Elements
    $('.select2bs4').select2({
        theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    //Date range picker

    //Date range picker with time picker

    //Date range as a button


    //Timepicker
    $('#timepicker').datetimepicker({
        format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker


    $('.my-colorpicker2').on('colorpickerChange', function (event) {
        $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function () {
        $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

})

/*

 $(document).on('keyup', 'input', function (e) {
        if (e.target.id == 'pass1' || e.target.id == 'pass2') {

        }
        else {
            makeUpperCase(e);
        }
    });
    //$(document).on('keyup', 'textarea', function (e) {
    //    if (e.target.id == 'pass1' || e.target.id == 'pass2') {

    //    }
    //    else {
    //        makeUpperCase(e);
    //    }
    //});
    function makeUpperCase(e) {
        const cursorStart = e.target.selectionStart;
        const cursorEnd = e.target.selectionEnd;
        e.target.value = e.target.value.toUpperCase();
        e.target.setSelectionRange(cursorStart, cursorEnd);
    }

*/






