<?php

/**
 * Contiene el control de las acciones de la carga de los selects del sistema
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function ExecuteActionLoad($action, $obj, $dao) {

    switch ($action) {

        /* Load selects */

        case "loadRol":
            $dao->LoadSelect($obj, "loadrol");
            break;


        case "loadTipoIdentificacion":
            $dao->LoadSelect($obj, "loadtipoidentificacion");
            break;

        case "loadDepartment":
            $dao->LoadSelect($obj, "loaddepartment");
            break;

        case "loadCity":
            $dao->LoadSelect($obj, "loadcity");
            break;


        case "loadGender":
            $dao->LoadSelect($obj, "loadgender");
            break;


        case "loadClientType":
            $dao->LoadSelect($obj, "loadclientType");
            break;

        case "loadProfessionNivel":
            $dao->LoadSelect($obj, "loadprofessionnivel");
            break;

        case "loadProfession":
            $dao->LoadSelect($obj, "loadprofession");
            break;

        case "loadMaritalStatus":
            $dao->LoadSelect($obj, "loadmaritalstatus");
            break;

        case "loadPersonType":
            $dao->LoadSelect($obj, "loadpersontype");
            break;

        case "loadProfessionNivel":
            $dao->LoadSelect($obj, "loadprofessionnivel");
            break;
        
        case "loadtypeevent":
            $dao->LoadSelect($obj, "loadtypeevent");
            break;
        
        case "loadclient":
            $dao->LoadSelect($obj, "loadclient");
            break;
        
        case "loademployee":
            $dao->LoadSelect($obj, "loademployee");
            break;

        case "loadTypeEmployee":
            $dao->LoadSelect($obj, "loadtypeemployee");
            break;



        /* End load selects */


        /* Load checkbox */

        case "loadCheckboxClientType":
            $dao->LoadCheckbox($obj, "loadclientType");
            break;
        /* END Load checkbox */


        default :
            echo 'No action found';
            break;
    }
}
