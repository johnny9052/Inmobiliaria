$(window).on("load", function (e) {
    loadPQRSType();
});




function loadPQRSType() {
    Execute(scanInfo('loadPQRSType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");');
}

function sendContact() {
    if (validateForm() === true) {
        Execute(scanInfo('search', true), 'Contact/CtlContact', '', 'showDataSendContact();');
    }
}


function showDataSendContact() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    cleanForm();
}
