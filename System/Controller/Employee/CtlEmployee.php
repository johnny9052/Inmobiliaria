<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeDTO.php';
require '../../DAO/Employee/EmployeeDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$firstName = getInfo('firstName');
$secondName = getInfo('secondName');
$firstLastName = getInfo('firstLastName');
$secondLastName = getInfo('secondLastName');
$documentNumber = getInfo('documentNumber');
$birthdate = getInfo('birthdate');
$address = getInfo('address');
$homePhone = getInfo('homePhone');
$mobilePhone = getInfo('mobilePhone');
$email = getInfo('email');
$gender = getInfo('gender');
$typeEmployee = getInfo('typeEmployee');
$cityResidence = getInfo('cityResidence');
$profession = getInfo('profession');
$maritalStatus = getInfo('maritalStatus');


$birthdate = date("Y-m-d", strtotime($birthdate));

/* DEFINICION DE OBJETOS */
$obj = new EmployeeDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus);
$dao = new EmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


