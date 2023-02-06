function next() {
    loadPartial('Invoice');
}

function back() {
    loadPartial('Logistics');
}

function onClick_BtnBack() {
    back();
}

function onClick_BtnProceed() {
    next();
}
