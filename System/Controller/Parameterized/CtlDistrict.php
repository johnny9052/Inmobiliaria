<?php

/* IMPORTS */
require '../../DTO/Parameterized/DistrictDTO.php';
require '../../DAO/Parameterized/DistrictDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$name = getInfo('nameDistrict');
$city = getInfo('city');

/* DEFINICION DE OBJETOS */
$obj = new DistrictDTO($id, $name, $city);
$dao = new DistrictDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


