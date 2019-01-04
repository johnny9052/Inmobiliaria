/* Funciones jQuery */

$(window).on("load", function (e) {
    loadDepartmentRecord();
    loadCity(-1);
});

function loadDepartmentRecord() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateRecord");', '', '', 'System/');
}


function loadCityRecord(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityRecord");', '', '', 'System/');
}

function sendContact() {
    if (validateForm('FormContainerRecord') === true) {
        Execute(scanInfo('search', true, 'FormContainerRecord'), 'Contact/CtlContactRecord', '', 'showDataSendContact();');
    }
}


function showDataSendContact() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    executeWithTime("cleanForm('FormContainerContact');", 3000);

}
