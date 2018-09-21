


function saveNewUser() {
    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm('FormContainerNewUser', 'ModalNewUser')) {
            Execute(scanInfo('savePublic', true, 'FormContainerNewUser'), 'Client/CtlClient', '', 'closeWindow("ModalNewUser");', 'ModalIdentifyUser', '', 'System/');
        }
    } else {
        validateForm('FormContainerNewUser', 'ModalNewUser');
        showToast("El password no coincide");
    }
}



/* Identificar a un usuario del sistema */
function LogInPublic() {
    if (validateForm('FormContainerIdentifyUser','ModalIdentifyUser') === true) {
        Execute(scanInfo('logInPublic', true, 'FormContainerIdentifyUser'), 'Security/CtlLogIn', '', 'location.reload();', '', '', 'System/');
    }
}