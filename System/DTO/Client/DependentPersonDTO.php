<?php

require_once ('../../DTO/BaseDTO.php');

class DependentPersonDTO extends BaseDTO {

    private $id;
    private $client;
    private $activityEconomic;
    private $company;
    private $position;
    private $address;
    private $salary;
    private $otherIncome;
    private $antiquity;
    private $officePhone;

    function __construct($id, $client, $activityEconomic, $company, $position, $address, $salary, $otherIncome, $antiquity, $officePhone) {
        $this->id = $id;
        $this->client = $client;
        $this->activityEconomic = $activityEconomic;
        $this->company = $company;
        $this->position = $position;
        $this->address = $address;
        $this->salary = $salary;
        $this->otherIncome = $otherIncome;
        $this->antiquity = $antiquity;
        $this->officePhone = $officePhone;
    }
    
    function getId() {
        return $this->id;
    }

    function getClient() {
        return $this->client;
    }

    function getActivityEconomic() {
        return $this->activityEconomic;
    }

    function getCompany() {
        return $this->company;
    }

    function getPosition() {
        return $this->position;
    }

    function getAddress() {
        return $this->address;
    }

    function getSalary() {
        return $this->salary;
    }

    function getOtherIncome() {
        return $this->otherIncome;
    }

    function getAntiquity() {
        return $this->antiquity;
    }

    function getOfficePhone() {
        return $this->officePhone;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setActivityEconomic($activityEconomic) {
        $this->activityEconomic = $activityEconomic;
    }

    function setCompany($company) {
        $this->company = $company;
    }

    function setPosition($position) {
        $this->position = $position;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setSalary($salary) {
        $this->salary = $salary;
    }

    function setOtherIncome($otherIncome) {
        $this->otherIncome = $otherIncome;
    }

    function setAntiquity($antiquity) {
        $this->antiquity = $antiquity;
    }

    function setOfficePhone($officePhone) {
        $this->officePhone = $officePhone;
    }




}
