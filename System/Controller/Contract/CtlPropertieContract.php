<?php

/* IMPORTS */
require '../../DTO/Contract/PropertieContractDTO.php';
require '../../DAO/Contract/PropertieContractDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$propertie = getInfo('propertie');
$firmDate = getInfo('firmDate');
$startDate = getInfo('startDate');
$endDate = getInfo('endDate');
$contractValue = getInfo('contractValue');
$termContract = getInfo('termContract');
$wayPay = getInfo('wayPay');
$typesContractSelecteds = getInfo('typesContractSelecteds');


$firmDate = date("Y-m-d", strtotime($firmDate));
$startDate = date("Y-m-d", strtotime($startDate));
$endDate = date("Y-m-d", strtotime($endDate));


/* Se borran todos los archivos que se tengan que eliminar */
deleteFiles('Contract', '../../', 'System/', 'Resource/Files/Properties/Contracts/', 1, $propertie, false, '.pdf');
/* Se crean los archivos que se tengan que crear */
$fileContract = generateFiles('Contract', '../../', 'System/', 'Resource/Files/Properties/Contracts/', 1, $propertie, '.pdf', false);


/* DEFINICION DE OBJETOS */
$obj = new PropertieContractDTO($id, $client, $propertie, $firmDate, $startDate, $endDate, $contractValue, $termContract, $wayPay, $fileContract, $typesContractSelecteds);
$dao = new PropertieContractDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


