<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeFormationDTO.php';
require '../../DAO/Employee/EmployeeFormationDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

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

/* Se borran todas las imagenes que se tengan que eliminar */
deleteFiles('Formation', '../../', 'System/', 'Resource/Files/Formation/', 1, $employee, false, '.pdf');
/* Se crean las imagenes que se tengan que crear */
$fileFormation = generateFiles('Formation', '../../', 'System/', 'Resource/Files/Formation/', 1, $employee, '.pdf', false);



/* DEFINICION DE OBJETOS */
$obj = new EmployeeFormationDTO($id, $employee, $educationInstitute, $profession, $periodicity, $graduate, $level, $fileFormation );
$dao = new EmployeeFormationDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


