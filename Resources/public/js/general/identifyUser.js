


function saveNewUser() {

    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm('FormContainerNewUser', 'ModalNewUser')) {
            Execute(scanInfo('savePublic', true), 'Client/CtlClient', '', 'closeWindow("ModalNewUser");reloadPage();', '', '', 'System/');
        }
    } else {
        validateForm('FormContainerNewUser', 'ModalNewUser');
        showToast("El password no coincide");
    }
}