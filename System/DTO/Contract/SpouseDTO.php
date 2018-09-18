<?php

require_once ('../../DTO/BaseDTO.php');

class SpouseDTO extends BaseDTO {

    private $id;
    private $client;
    private $documentNumber;
    private $expeditionDate;
    private $email;
    private $firstName;
    private $firstLastName;
    private $mobilePhone;
    private $company;
    private $address;
    private $officePhone;
    private $salary;
    
    function __construct($id, $client, $documentNumber, $expeditionDate, $email, $firstName, $firstLastName, $mobilePhone, $company, $address, $officePhone, $salary) {
        $this->id = $id;
        $this->client = $client;
        $this->documentNumber = $documentNumber;
        $this->expeditionDate = $expeditionDate;
        $this->email = $email;
        $this->firstName = $firstName;
        $this->firstLastName = $firstLastName;
        $this->mobilePhone = $mobilePhone;
        $this->company = $company;
        $this->address = $address;
        $this->officePhone = $officePhone;
        $this->salary = $salary;
    }
    
    function getId() {
        return $this->id;
    }

    function getClient() {
        return $this->client;
    }

    function getDocumentNumber() {
        return $this->documentNumber;
    }

    function getExpeditionDate() {
        return $this->expeditionDate;
    }

    function getEmail() {
        return $this->email;
    }

    function getFirstName() {
        return $this->firstName;
    }

    function getFirstLastName() {
        return $this->firstLastName;
    }

    function getMobilePhone() {
        return $this->mobilePhone;
    }

    function getCompany() {
        return $this->company;
    }

    function getAddress() {
        return $this->address;
    }

    function getOfficePhone() {
        return $this->officePhone;
    }

    function getSalary() {
        return $this->salary;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
    }

    function setExpeditionDate($expeditionDate) {
        $this->expeditionDate = $expeditionDate;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setFirstName($firstName) {
        $this->firstName = $firstName;
    }

    function setFirstLastName($firstLastName) {
        $this->firstLastName = $firstLastName;
    }

    function setMobilePhone($mobilePhone) {
        $this->mobilePhone = $mobilePhone;
    }

    function setCompany($company) {
        $this->company = $company;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setOfficePhone($officePhone) {
        $this->officePhone = $officePhone;
    }

    function setSalary($salary) {
        $this->salary = $salary;
    }




}
