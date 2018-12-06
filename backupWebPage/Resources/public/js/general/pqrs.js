$(window).on("load", function (e) {
    loadPQRSType();
});

function loadPQRSType() {
    Execute(scanInfo('loadPQRSType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPRQSType");', '', '', 'System/');
}

function savePQRS() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'PQRSClient/CtlPQRSClient', '', 'showDataSavePQRS();', '', '', 'System/');
    }
}

function showDataSavePQRS() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    cleanForm('FormContainer');
}
