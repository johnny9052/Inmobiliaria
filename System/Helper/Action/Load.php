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
        
        case "loadTipoPqrs":
            $dao->LoadSelect($obj, "loadpqrstype");
            break;
        
        case "loadDebtor":
            $dao->LoadSelect($obj, "loaddebtor");
            break;

        case "loadBank":
            $dao->LoadSelect($obj, "loadbank");
            break;

        case "loadTypeReference":
            $dao->LoadSelect($obj, "loadtypereference");
            break;

        case "loadArea":
            $dao->LoadSelect($obj, "loadarea");
            break;

        case "loadContractType":
            $dao->LoadSelect($obj, "loadcontracttype");
            break;

        case "loadBloodType":
            $dao->LoadSelect($obj, "loadbloodtype");
            break;

        case "loadPensionFund":
            $dao->LoadSelect($obj, "loadpensionfund");
            break;

        case "loadSeveranceFund":
            $dao->LoadSelect($obj, "loadseverancefund");
            break;

        case "loadArl":
            $dao->LoadSelect($obj, "loadarl");
            break;

        case "loadEps":
            $dao->LoadSelect($obj, "loadeps");
            break;

        case "loadCompensationBox":
            $dao->LoadSelect($obj, "loadcompensationbox");
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


        case "loadActivityEconomic":
            $dao->LoadSelect($obj, "loadactivityeconomic");
            break;

        case "loadPosition":
            $dao->LoadSelect($obj, "loadposition");
            break;

        case "loadProfessionNivel":
            $dao->LoadSelect($obj, "loadprofessionnivel");
            break;

        case "loadProfession":
            $dao->LoadSelect($obj, "loadprofession");
            break;

        case "loadPropertie":
            $dao->LoadSelect($obj, "loadpropertie");
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

        case "loadTypeEvent":
            $dao->LoadSelect($obj, "loadtypeevent");
            break;

        case "loadClient":
            $dao->LoadSelect($obj, "loadclient");
            break;

        case "loadEmployee":
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
        
        case "loadCheckboxContractType":
            $dao->LoadCheckbox($obj, "loadcontractType");
            break;

        case "loadClientTypeSelected":
            $dao->LoadSelect($obj, "loadclienttypeselected");
            break;

        case "loadEmployeeSelected":
            $dao->LoadSelect($obj, "loademployeeselected");
            break;

        case "loadPeriodicity":
            $dao->LoadSelect($obj, "loadperiodicity");
            break;

        case "loadCheckboxEmployees":
            $dao->LoadCheckbox($obj, "loademployee");
            break;

        /* END Load checkbox */



        /* Load checkbox Selected */




        /* END Load checkbox Selected */
        case "loadCheckboxEmployees":
            $dao->LoadCheckbox($obj, "loademployee");
            break;


        /* LOAD VALUES */


        case "loadPrecioMaximoInmueble":
            $dao->LoadValue($obj, "loadpreciomaximoinmueble");
            break;

        case "loadAreaMaximaInmueble":
            $dao->LoadValue($obj, "loadareamaximainmueble");
            break;

        case "loadTotalInmuebles":
            $dao->LoadValue($obj, "loadtotalinmuebles");
            break;

        case "loadTotalClientes":
            $dao->LoadValue($obj, "loadtotalclientes");
            break;


        case "loadTotalArrendatarios":
            $dao->LoadValue($obj, "loadtotalarrendatarios");
            break;


        /* END LOAD VALUES */



        /* LOAD DATA DASHBOARD */


        case "loadInmueblesTopVisitas":
            $dao->LoadValue($obj, "loadinmueblestopvisitas");
            break;

        case "loadZonasTopVisitas":
            $dao->LoadValue($obj, "loadzonastopvisitas");
            break;

        case "loadTotalInmueblesPorOferta":
            $dao->LoadValue($obj, "loadtotalinmueblesporoferta");
            break;

        case "loadTotalInmueblesPorOfertaContrato":
            $dao->LoadValue($obj, "loadtotalinmueblesporofertacontrato");
            break;


        /* END LOAD DATA DASHBOARD */

        default :
            echo 'No action found';
            break;
    }
}
