<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeExperienceDTO.php';
require '../../DAO/Employee/EmployeeExperienceDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$employee= getInfo('employee');
$companyName = getInfo('companyName');
$admissionDate = getInfo('admissionDate');
$departureDate = getInfo('departureDate');
$urlWorkCertificate = getInfo('urlWorkCertificate');
$position = getInfo('position');


$admissionDate = date("Y-m-d", strtotime($admissionDate));
$departureDate = date("Y-m-d", strtotime($departureDate));



/* DEFINICION DE OBJETOS */
$obj = new EmployeeExperienceDTO($id, $employee, $companyName, $admissionDate, $departureDate, "$urlWorkCertificate", $position);
$dao = new EmployeeExperienceDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


