<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeDTO.php';
require '../../DAO/Employee/EmployeeDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';


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
$cityExpedition = getInfo('cityExpedition');
$expeditionDate = getInfo('expeditionDate');
$cityBirth = getInfo('cityBirth');
$militaryCard = getInfo('militaryCard');
$bloodType = getInfo('bloodType');
$fileMilitaryCard = getInfo('urlFileMilitaryCard');
$pensionFund = getInfo('pensionFund');
$severanceFund = getInfo('severanceFund');
$arl = getInfo('arl');
$eps = getInfo('eps');
$compensationBox = getInfo('compensationBox');
$disability = getInfo('disability');
$imageEmployee = getInfo('urlImage');
$contactName = getInfo('contactName');
$contactPhone = getInfo('contactPhone');
$contactEmail = getInfo('contactEmail');


$birthdate = date("Y-m-d", strtotime($birthdate));


/* Se borran todas las imagenes que se tengan que eliminar */
//deleteFiles('nameFileDelete', '../../', 'System/', 'Resource/Images/Properties/', 100, $matriculaInmobiliaria, false, '.jpg');


/* Se crean las imagenes que se tengan que crear */
$fileIdentification = generateFiles('../../', 'System/', 'Resource/Files/Employees/', 1, 'nameFileDelete', 'nameFile', 'base64File', $documentNumber, '.pdf', false);



/* DEFINICION DE OBJETOS */
$obj = new EmployeeDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $expeditionDate, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus, $cityExpedition, $fileIdentification, $cityBirth, $militaryCard, $bloodType, $fileMilitaryCard, $pensionFund, $severanceFund, $arl, $eps, $compensationBox, $disability, $imageEmployee, $contactName, $contactPhone, $contactEmail);
$dao = new EmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);





