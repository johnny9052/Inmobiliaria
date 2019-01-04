/* Funciones jQuery */

$(window).on("load", function (e) {

});

function sendContact() {
    if (validateForm('FormContainerContact') === true) {
        Execute(scanInfo('search', true, 'FormContainerContact'), 'Contact/CtlContactGeneral', '', 'showDataSendContact();');
    }
}


function showDataSendContact() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    executeWithTime("cleanForm('FormContainerContact');", 3000);

}
