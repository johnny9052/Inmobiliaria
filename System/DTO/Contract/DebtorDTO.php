<?php

require_once ('../../DTO/BaseDTO.php');

class DebtorDTO extends BaseDTO {

    private $id;
    private $documentNumber;
    private $firstName;
    private $secondName;
    private $firstLastName;
    private $secondLastName;
    private $address;
    private $homePhone;
    private $addressOffice;
    private $officePhone;
    private $mobilePhone;
    private $email;
    private $monthlyIncome;
    private $maritalStatus;
    private $documentType;
    private $cityResidence;
    private $cityExpedition;
    private $expeditionDate;

    function __construct($id, $documentNumber, $firstName, $secondName, $firstLastName, $secondLastName, $address, $homePhone, $addressOffice, $officePhone, $mobilePhone, $email, $monthlyIncome, $maritalStatus, $documentType, $cityResidence, $cityExpedition, $expeditionDate) {
        $this->id = $id;
        $this->documentNumber = $documentNumber;
        $this->firstName = $firstName;
        $this->secondName = $secondName;
        $this->firstLastName = $firstLastName;
        $this->secondLastName = $secondLastName;
        $this->address = $address;
        $this->homePhone = $homePhone;
        $this->addressOffice = $addressOffice;
        $this->officePhone = $officePhone;
        $this->mobilePhone = $mobilePhone;
        $this->email = $email;
        $this->monthlyIncome = $monthlyIncome;
        $this->maritalStatus = $maritalStatus;
        $this->documentType = $documentType;
        $this->cityResidence = $cityResidence;
        $this->cityExpedition = $cityExpedition;
        $this->expeditionDate = $expeditionDate;
    }
    
    function getId() {
        return $this->id;
    }

    function getDocumentNumber() {
        return $this->documentNumber;
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

    function getAddress() {
        return $this->address;
    }

    function getHomePhone() {
        return $this->homePhone;
    }

    function getAddressOffice() {
        return $this->addressOffice;
    }

    function getOfficePhone() {
        return $this->officePhone;
    }

    function getMobilePhone() {
        return $this->mobilePhone;
    }

    function getEmail() {
        return $this->email;
    }

    function getMonthlyIncome() {
        return $this->monthlyIncome;
    }

    function getMaritalStatus() {
        return $this->maritalStatus;
    }

    function getDocumentType() {
        return $this->documentType;
    }

    function getCityResidence() {
        return $this->cityResidence;
    }

    function getCityExpedition() {
        return $this->cityExpedition;
    }

    function getExpeditionDate() {
        return $this->expeditionDate;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
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

    function setAddress($address) {
        $this->address = $address;
    }

    function setHomePhone($homePhone) {
        $this->homePhone = $homePhone;
    }

    function setAddressOffice($addressOffice) {
        $this->addressOffice = $addressOffice;
    }

    function setOfficePhone($officePhone) {
        $this->officePhone = $officePhone;
    }

    function setMobilePhone($mobilePhone) {
        $this->mobilePhone = $mobilePhone;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setMonthlyIncome($monthlyIncome) {
        $this->monthlyIncome = $monthlyIncome;
    }

    function setMaritalStatus($maritalStatus) {
        $this->maritalStatus = $maritalStatus;
    }

    function setDocumentType($documentType) {
        $this->documentType = $documentType;
    }

    function setCityResidence($cityResidence) {
        $this->cityResidence = $cityResidence;
    }

    function setCityExpedition($cityExpedition) {
        $this->cityExpedition = $cityExpedition;
    }

    function setExpeditionDate($expeditionDate) {
        $this->expeditionDate = $expeditionDate;
    }
}
