<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeFormationDTO.php';
require '../../DAO/Employee/EmployeeFormationDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$employee= getInfo('employee');
$educationInstitute = getInfo('educationInstitute');
$professionNivel = getInfo('professionNivel');
$profession = getInfo('profession');
$periodicity = getInfo('periodicity');
$graduate = getInfo('graduate');
$level = getInfo('level');


/* Se crean las imagenes que se tengan que crear */
//$fileCertificate= generateFiles('../../', 'System/', 'Resource/Files/EmployeesExperience/', 1, 'nameFileDelete', 'nameFile', 'base64File', $employee, '.pdf', false);

/* DEFINICION DE OBJETOS */
$obj = new EmployeeFormationDTO($id, $employee, $educationInstitute, $profession, $periodicity, $graduate, $level, "urlarchivo");
$dao = new EmployeeFormationDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


