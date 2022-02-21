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