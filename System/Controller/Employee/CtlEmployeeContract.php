<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeContractDTO.php';
require '../../DAO/Employee/EmployeeContractDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$employee= getInfo('employee');
$area = getInfo('area');
$startDate = getInfo('startDate');
$endDate = getInfo('endDate');
$contractType = getInfo('contractType');
$position = getInfo('position');
$salary = getInfo('salary');
$urlContract = getInfo('urlContract');


$startDate = date("Y-m-d", strtotime($startDate));
$endDate = date("Y-m-d", strtotime($endDate));



/* DEFINICION DE OBJETOS */
$obj = new EmployeeContractDTO($id, $employee, $area, $startDate, $endDate, $contractType, $position, $salary, "$urlContract");
$dao = new EmployeeContractDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


