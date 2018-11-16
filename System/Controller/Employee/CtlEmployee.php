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
$pensionFund = getInfo('pensionFund');
$severanceFund = getInfo('severanceFund');
$arl = getInfo('arl');
$eps = getInfo('eps');
$compensationBox = getInfo('compensationBox');
$disability = getInfo('disability');
$contactName = getInfo('contactName');
$contactPhone = getInfo('contactPhone');
$contactEmail = getInfo('contactEmail');


$birthdate = date("Y-m-d", strtotime($birthdate));
$expeditionDate = date("Y-m-d", strtotime($expeditionDate));

/* Se borran todas las imagenes que se tengan que eliminar */
deleteFiles('EmployeeIdentification', '../../', 'System/', 'Resource/Files/Employees/Identification/', 1, $documentNumber, false, '.pdf');
/* Se crean las imagenes que se tengan que crear */
$fileIdentification= generateFiles('EmployeeIdentification', '../../', 'System/', 'Resource/Files/Employees/Identification/', 1, $documentNumber, '.pdf', false);

deleteFiles('EmployeeMilitaryCard', '../../', 'System/', 'Resource/Files/Employees/MilitaryCard/', 1, $documentNumber, false, '.pdf');
/* Se crean las imagenes que se tengan que crear */
$fileMilitaryCard = generateFiles('EmployeeMilitaryCard', '../../', 'System/', 'Resource/Files/Employees/MilitaryCard/', 1, $documentNumber, '.pdf', false);

deleteFiles('EmployeeImage', '../../', 'System/', 'Resource/Files/Employees/Images/', 1, $documentNumber, false, '.jpg');
/* Se crean las imagenes que se tengan que crear */
$imageEmployee = generateFiles('EmployeeImage', '../../', 'System/', 'Resource/Files/Employees/Images/', 1, $documentNumber, '.jpg', false);

/* DEFINICION DE OBJETOS */
$obj = new EmployeeDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $expeditionDate, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus, $cityExpedition, $fileIdentification, $cityBirth, $militaryCard, $bloodType, $fileMilitaryCard, $pensionFund, $severanceFund, $arl, $eps, $compensationBox, $disability, $imageEmployee, $contactName, $contactPhone, $contactEmail);
$dao = new EmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);





