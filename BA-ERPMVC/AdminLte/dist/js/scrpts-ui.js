$(document).ready(function () {
    $('.cardV2 .form-control').on('blur', function () {
        if ($(this).val()) {
            $(this).parent('.input-group').addClass('active');
            /*$(this).parent('.input-group').removeClass('invalid');*/
        } else {
            $(this).parent('.input-group').removeClass('active');
            /*$(this).parent('.input-group').addClass('invalid');*/
        }
    });

    //$('.multiStepForm .btn-next').on('click', function () {
    //    var currentStep = $(this).parents('fieldset').data('fieldset');
    //    var nextStep = currentStep + 1;
    //    $(this).parents('fieldset').removeClass('active');
    //    $(this).parents('.multiStepForm').find('fieldset[data-fieldset=' + nextStep + ']').addClass('active');

    //    $(this).parents('.multiStepForm').find('.steps-wrapper li[data-formstep=' + currentStep + ']').attr('class', 'stepCount complete');
    //    $(this).parents('.multiStepForm').find('.steps-wrapper li[data-formstep=' + nextStep + ']').addClass('active');

    //});
    //$('.multiStepForm .btn-back').on('click', function () {
    //    var currentStep = $(this).parents('fieldset').data('fieldset');
    //    var prevStep = currentStep - 1;
    //    $(this).parents('fieldset').removeClass('active');
    //    $(this).parents('.multiStepForm').find('fieldset[data-fieldset=' + prevStep + ']').addClass('active');

    //    $(this).parents('.multiStepForm').find('.steps-wrapper li[data-formstep=' + currentStep + ']').attr('class', 'stepCount');
    //    $(this).parents('.multiStepForm').find('.steps-wrapper li[data-formstep=' + prevStep + ']').attr('class', 'stepCount active');
    //});


    // Multi Step ORDER STEP 2
    if ($('#orderCreating.card').length) {

        $('#addLogisticTable').DataTable({
            "paging": false,
            "ordering": false,
            "info": false
        });

    }

    $('#addLogisticBtn').on('click', function () {
        var t = $('#addLogisticTable').DataTable();

        t.row.add([
            $('#containerNumberLogistic').val(),
            $('#containerWeightLogistic').val(),
            $('#containerSizeLogistic').val(),
            $('#containerTypeLogistic').val(),
            $('#containerJobTypeLogistic').val()
        ]).draw(false);
        $('#addLogisticTable .form-control:not(select)').val('');
        $('#containerJobTypeLogistic').prop('selectedIndex', 0);
    });

    $('.input-lableSwitch').attr('readonly', 'true');
    $('.edit-tripCard').on('click', function () {
        var currentTripCard = $(this).parents('.tripBox');
        currentTripCard.toggleClass('editMod');

        $(".tripBox").not(currentTripCard).removeClass('editMod');
        $(".tripBox").not(currentTripCard).find('.input-lableSwitch').attr('readonly', 'true');

        if (currentTripCard.hasClass('editMod')) {
            currentTripCard.find('.input-lableSwitch').removeAttr('readonly');
            //currentTripCard.find('tripHeaderFields').addClass()
            //currentTripCard.find('.input-lableSwitch').addClass('d-none');
        } else {
            currentTripCard.find('.input-lableSwitch').attr('readonly', 'true');
        }
        currentTripCard.find('.btn-delete, .edit-tripCard').toggleClass('d-inline-block d-none');
    })

});

