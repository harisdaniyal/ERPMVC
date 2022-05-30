
function getBookingOrderId() {
    return new URLSearchParams(window.location.search).get("orderBookingId") ?? sessionStorage.getItem("orderBookingId") ?? 0;
}
function refreshOrderId(stepName) {
    if (stepName == 'ExportBooking')
        sessionStorage.setItem("orderBookingId", 0);
}
function loadPartial(stepName) {
    if (stepName) {

        refreshOrderId(stepName);
        var orderBookingId = getBookingOrderId();

        var url = "/OrderBooking/" + stepName + "?orderBookingId=" + orderBookingId;

        showLoader();

        fetch(url, {
            method: 'GET'
        }).then(res => res.text()).then(function (response) {
            highlightCurrentTab(stepName);
            $("#stepDiv").html(response);
            $("#sp_OrderNo").html($("#hf_OrderNo").val());
            hideLoader();
        });
    }
}
function highlightCurrentTab(stepName) {
    $("ul.steps-wrapper").find("li[data-formstep='1']").removeClass("active");
    $("ul.steps-wrapper").find("li[data-formstep='2']").removeClass("active");
    $("ul.steps-wrapper").find("li[data-formstep='3']").removeClass("active");
    $("ul.steps-wrapper").find("li[data-formstep='4']").removeClass("active");
    $("ul.steps-wrapper").find("li[data-formstep='5']").removeClass("active");

    if (stepName == 'ExportBooking')
        $("ul.steps-wrapper").find("li[data-formstep='1']").addClass("active");
    if (stepName == 'ExportLogistic')
        $("ul.steps-wrapper").find("li[data-formstep='2']").addClass("active");
    if (stepName == 'Trips')
        $("ul.steps-wrapper").find("li[data-formstep='3']").addClass("active");
    if (stepName == 'Invoice')
        $("ul.steps-wrapper").find("li[data-formstep='4']").addClass("active");
    if (stepName == 'Summary')
        $("ul.steps-wrapper").find("li[data-formstep='5']").addClass("active");
}
function showLoader() {
    $("div.loading-dimmer").addClass('active');
}

function hideLoader() {
    $("div.loading-dimmer").removeClass('active');
}

function showErrorMessage(message) {
    hideLoader();
    // Show errorMessage banner
    
    toastr.error(message);
}

function showSuccessMessage(message) {
    hideLoader();
    // Show successMessage banner
    toastr.success(message);
}

