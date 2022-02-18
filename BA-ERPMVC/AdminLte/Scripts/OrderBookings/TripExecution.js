
function getBookingOrderId() {
    return new URLSearchParams(window.location.search).get("orderBookingId") ?? sessionStorage.getItem("orderBookingId") ?? 0;
}
function refreshOrderId(stepName) {
    if (stepName == 'Dispatched')
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

    if (stepName == 'Dispatched')
        $("ul.steps-wrapper").find("li[data-formstep='1']").addClass("active");
    if (stepName == 'ExecuteTrips')
        $("ul.steps-wrapper").find("li[data-formstep='2']").addClass("active");
    if (stepName == 'OrderDelivery')
        $("ul.steps-wrapper").find("li[data-formstep='3']").addClass("active");
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
    alert(message);
}

function showSuccessMessage(message) {
    hideLoader();
    // Show successMessage banner
    alert(message);
}

