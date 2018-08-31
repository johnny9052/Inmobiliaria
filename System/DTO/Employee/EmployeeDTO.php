<?php

require_once ('../../DTO/BaseDTO.php');

class EmployeeDTO extends BaseDTO {

    private $id;
    private $firstName;
    private $secondName;
    private $firstLastName;
    private $secondLastName;
    private $documentNumber;
    private $expeditionDate;
    private $birthdate;
    private $address;
    private $homePhone;
    private $mobilePhone;
    private $email;
    private $gender;
    private $typeEmployee;
    private $cityResidence;
    private $profession;
    private $maritalStatus;
    private $cityExpedition;
    private $fileIdentification;
    private $cityBirth;
    private $militaryCard;
    private $bloodType;
    private $fileMilitaryCard;
    private $pensionFund;
    private $severanceFund;
    private $arl;
    private $eps;
    private $compensationBox;
    private $disability;
    private $imageEmployee;
    private $contactName;
    private $contactPhone;
    private $contactEmail;
    
    
    function __construct($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $expeditionDate, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus, $cityExpedition, $fileIdentification, $cityBirth, $militaryCard, $bloodType, $fileMilitaryCard, $pensionFund, $severanceFund, $arl, $eps, $compensationBox, $disability, $imageEmployee, $contacName, $contactPhone, $contactEmail) {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->secondName = $secondName;
        $this->firstLastName = $firstLastName;
        $this->secondLastName = $secondLastName;
        $this->documentNumber = $documentNumber;
        $this->expeditionDate = $expeditionDate;
        $this->birthdate = $birthdate;
        $this->address = $address;
        $this->homePhone = $homePhone;
        $this->mobilePhone = $mobilePhone;
        $this->email = $email;
        $this->gender = $gender;
        $this->typeEmployee = $typeEmployee;
        $this->cityResidence = $cityResidence;
        $this->profession = $profession;
        $this->maritalStatus = $maritalStatus;
        $this->cityExpedition = $cityExpedition;
        $this->fileIdentification = $fileIdentification;
        $this->cityBirth = $cityBirth;
        $this->militaryCard = $militaryCard;
        $this->bloodType = $bloodType;
        $this->fileMilitaryCard = $fileMilitaryCard;
        $this->pensionFund = $pensionFund;
        $this->severanceFund = $severanceFund;
        $this->arl = $arl;
        $this->eps = $eps;
        $this->compensationBox = $compensationBox;
        $this->disability = $disability;
        $this->imageEmployee = $imageEmployee;
        $this->contactName = $contacName;
        $this->contactPhone = $contactPhone;
        $this->contactEmail = $contactEmail;
        
    }
    
    function getId() {
        return $this->id;
    }

    function getFirstName() {
        return $this->firstName;
    }

    function getSecondName() {
        return $this->secondName;
    }

    function getFirstLastName() {
        return $this->firstLastName;
    }

    function getSecondLastName() {
        return $this->secondLastName;
    }

    function getDocumentNumber() {
        return $this->documentNumber;
    }

    function getExpeditionDate() {
        return $this->expeditionDate;
    }

    function getBirthdate() {
        return $this->birthdate;
    }

    function getAddress() {
        return $this->address;
    }

    function getHomePhone() {
        return $this->homePhone;
    }

    function getMobilePhone() {
        return $this->mobilePhone;
    }

    function getEmail() {
        return $this->email;
    }

    function getGender() {
        return $this->gender;
    }

    function getTypeEmployee() {
        return $this->typeEmployee;
    }

    function getCityResidence() {
        return $this->cityResidence;
    }

    function getProfession() {
        return $this->profession;
    }

    function getMaritalStatus() {
        return $this->maritalStatus;
    }

    function getCityExpedition() {
        return $this->cityExpedition;
    }

    function getFileIdentification() {
        return $this->fileIdentification;
    }

    function getCityBirth() {
        return $this->cityBirth;
    }

    function getMilitaryCard() {
        return $this->militaryCard;
    }

    function getBloodType() {
        return $this->bloodType;
    }

    function getFileMilitaryCard() {
        return $this->fileMilitaryCard;
    }

    function getPensionFund() {
        return $this->pensionFund;
    }

    function getSeveranceFund() {
        return $this->severanceFund;
    }

    function getArl() {
        return $this->arl;
    }

    function getEps() {
        return $this->eps;
    }

    function getCompensationBox() {
        return $this->compensationBox;
    }

    function getDisability() {
        return $this->disability;
    }

    function getImageEmployee() {
        return $this->imageEmployee;
    }

    function getContactName() {
        return $this->contactName;
    }

    function getContactPhone() {
        return $this->contactPhone;
    }

    function getContactEmail() {
        return $this->contactEmail;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setFirstName($firstName) {
        $this->firstName = $firstName;
    }

    function setSecondName($secondName) {
        $this->secondName = $secondName;
    }

    function setFirstLastName($firstLastName) {
        $this->firstLastName = $firstLastName;
    }

    function setSecondLastName($secondLastName) {
        $this->secondLastName = $secondLastName;
    }

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
    }

    function setExpeditionDate($expeditionDate) {
        $this->expeditionDate = $expeditionDate;
    }

    function setBirthdate($birthdate) {
        $this->birthdate = $birthdate;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setHomePhone($homePhone) {
        $this->homePhone = $homePhone;
    }

    function setMobilePhone($mobilePhone) {
        $this->mobilePhone = $mobilePhone;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setGender($gender) {
        $this->gender = $gender;
    }

    function setTypeEmployee($typeEmployee) {
        $this->typeEmployee = $typeEmployee;
    }

    function setCityResidence($cityResidence) {
        $this->cityResidence = $cityResidence;
    }

    function setProfession($profession) {
        $this->profession = $profession;
    }

    function setMaritalStatus($maritalStatus) {
        $this->maritalStatus = $maritalStatus;
    }

    function setCityExpedition($cityExpedition) {
        $this->cityExpedition = $cityExpedition;
    }

    function setFileIdentification($fileIdentification) {
        $this->fileIdentification = $fileIdentification;
    }

    function setCityBirth($cityBirth) {
        $this->cityBirth = $cityBirth;
    }

    function setMilitaryCard($militaryCard) {
        $this->militaryCard = $militaryCard;
    }

    function setBloodType($bloodType) {
        $this->bloodType = $bloodType;
    }

    function setFileMilitaryCard($fileMilitaryCard) {
        $this->fileMilitaryCard = $fileMilitaryCard;
    }

    function setPensionFund($pensionFund) {
        $this->pensionFund = $pensionFund;
    }

    function setSeveranceFund($severanceFund) {
        $this->severanceFund = $severanceFund;
    }

    function setArl($arl) {
        $this->arl = $arl;
    }

    function setEps($eps) {
        $this->eps = $eps;
    }

    function setCompensationBox($compensationBox) {
        $this->compensationBox = $compensationBox;
    }

    function setDisability($disability) {
        $this->disability = $disability;
    }

    function setImageEmployee($imageEmployee) {
        $this->imageEmployee = $imageEmployee;
    }

    function setContactName($contacName) {
        $this->contactName = $contacName;
    }

    function setContactPhone($contactPhone) {
        $this->contactPhone = $contactPhone;
    }

    function setContactEmail($contactEmail) {
        $this->contactEmail = $contactEmail;
    }





}
