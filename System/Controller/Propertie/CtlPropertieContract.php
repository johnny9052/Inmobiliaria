<?php

/* IMPORTS */
require '../../DTO/Employee/PropertieContractDTO.php';
require '../../DAO/Employee/PropertieContractDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$propertie = getInfo('propertie');
$firmDate = getInfo('firmDate');
$startDate = getInfo('startDate');
$endDate = getInfo('endDate');
$contractValue = getInfo('contractValue ');
$termContract = getInfo('termContract');
$wayPay = getInfo('wayPay');
$urlContract = getInfo('urlContract');

$firmDate = date("Y-m-d", strtotime($firmDate));
$startDate = date("Y-m-d", strtotime($startDate));
$endDate = date("Y-m-d", strtotime($endDate));


/* Se borran todos los archivos que se tengan que eliminar */
deleteFiles('Propertie', '../../', 'System/', 'Resource/Files/Properties/Contracts/', 1, $employee, false, '.pdf');
/* Se crean los archivos que se tengan que crear */
$fileContract = generateFiles('Propertie', '../../', 'System/', 'Resource/Files/Properties/Contracts/', 1, $propertie, '.pdf', false);


/* DEFINICION DE OBJETOS */
$obj = new PropertieContractDTO($id, $propertie, $firmDate, $startDate, $endDate, $contractValue, $termContract, $wayPay, $urlContract);
$dao = new PropertieContractDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


