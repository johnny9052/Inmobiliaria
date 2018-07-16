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


        case "loadNeighborhood":
            $dao->LoadSelect($obj, "loadneighborhood");
            break;


        case "loadStratum":
            $dao->LoadSelect($obj, "loadstratum");
            break;

        case "loadPropertieType":
            $dao->LoadSelect($obj, "loadpropertietype");
            break;


        case "loadOfferType":
            $dao->LoadSelect($obj, "loadoffertype");
            break;


        case "loadCurtainType":
            $dao->LoadSelect($obj, "loadcurtaintype");
            break;

        case "loadVigilanceType":
            $dao->LoadSelect($obj, "loadvigilancetype");
            break;


        case "loadZone":
            $dao->LoadSelect($obj, "loadzone");
            break;


        case "loadViewType":
            $dao->LoadSelect($obj, "loadviewtype");
            break;

        case "loadStatus":
            $dao->LoadSelect($obj, "loadstatus");
            break;


        case "loadKitchenType":
            $dao->LoadSelect($obj, "loadkitchentype");
            break;


        case "loadKitchenStructure":
            $dao->LoadSelect($obj, "loadkitchenstructure");
            break;


        case "loadFloorType":
            $dao->LoadSelect($obj, "loadfloortype");
            break;


        case "loadOutstandingType":
            $dao->LoadSelect($obj, "loadoutstandingtype");
            break;


        /* End load selects */


        /* Load checkbox */

        case "loadCheckboxClientType":
            $dao->LoadCheckbox($obj, "loadclientType");
            break;

        case "loadClientTypeSelected":
            $dao->LoadSelect($obj, "loadclienttypeselected");
            break;
        
         case "loadCheckboxEmployees":
            $dao->LoadCheckbox($obj, "loademployee");
            break;

        /* END Load checkbox */
        
        
        
        /*Load checkbox Selected*/
        
        
        
        
        /*END Load checkbox Selected*/


        default :
            echo 'No action found';
            break;
    }
}
