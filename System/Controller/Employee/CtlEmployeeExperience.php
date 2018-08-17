<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeExperienceDTO.php';
require '../../DAO/Employee/EmployeeExperienceDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$employee = getInfo('employee');
$companyName = getInfo('companyName');
$admissionDate = getInfo('admissionDate');
$departureDate = getInfo('departureDate');
$urlWorkCertificate = getInfo('urlWorkCertificate');
$position = getInfo('position');


$admissionDate = date("Y-m-d", strtotime($admissionDate));
$departureDate = date("Y-m-d", strtotime($departureDate));

/* Se borran todas las imagenes que se tengan que eliminar */
deleteFiles('Experience', '../../', 'System/', 'Resource/Files/Experience/', 1, $employee, false, '.pdf');
/* Se crean las imagenes que se tengan que crear */
$fileWorkCertificate = generateFiles('Experience', '../../', 'System/', 'Resource/Files/Experience/', 1, $employee, '.pdf', false);



/* DEFINICION DE OBJETOS */
$obj = new EmployeeExperienceDTO($id, $employee, $companyName, $admissionDate, $departureDate, $fileWorkCertificate, $position);
$dao = new EmployeeExperienceDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


