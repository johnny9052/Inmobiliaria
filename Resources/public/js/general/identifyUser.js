


function saveNewUser() {
    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm('FormContainerNewUser', 'ModalNewUser')) {
            Execute(scanInfo('savePublic', true, 'FormContainerNewUser'), 'Client/CtlClient', '', 'closeWindow("ModalNewUser");', 'ModalIdentifyUser', '', 'System/');
        }
    } else {
        validateForm('FormContainerNewUser', 'ModalNewUser');
        showToast("El password no coincide", "error", "ModalNewUser");
    }
}



/* Identificar a un usuario del sistema */
function LogInPublic() {
    if (validateForm('FormContainerIdentifyUser', 'ModalIdentifyUser') === true) {
        Execute(scanInfo('logInPublic', true, 'FormContainerIdentifyUser'), 'Security/CtlLogIn', '', 'location.reload();', 'ModalIdentifyUser', '', 'System/');
    }
}


/* Desconectarce del sistema */
function LogOut() {
    Execute("", 'Security/CtlLogOut', '', 'location.reload();', '', '', 'System/');
}



