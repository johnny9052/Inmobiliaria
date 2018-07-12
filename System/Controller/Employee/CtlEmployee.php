<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeDTO.php';
require '../../DAO/Employee/EmployeeDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfoEmployee('action');
$id = getInfoEmployee('id');
$firstName = getInfoEmployee('firstName');
$secondName = getInfoEmployee('secondName');
$firstLastName = getInfoEmployee('firstLastName');
$secondLastName = getInfoEmployee('secondLastName');
$documentNumber = getInfoEmployee('documentNumber');
$birthdate = getInfoEmployee('birthdate');
$address = getInfoEmployee('address');
$homePhone = getInfoEmployee('homePhone');
$mobilePhone = getInfoEmployee('mobilePhone');
$email = getInfoEmployee('email');
$gender = getInfoEmployee('gender');
$typeEmployee = getInfoEmployee('gender');
$cityResidence = getInfoEmployee('cityResidence');
$profession = getInfoEmployee('profession');
$maritalStatus = getInfoEmployee('maritalStatus');


$birthdate = date("Y-m-d", strtotime($birthdate));

/* DEFINICION DE OBJETOS */
$obj = new EmployeeDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus);
$dao = new EmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


