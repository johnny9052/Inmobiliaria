<?php

require_once ('../../DTO/BaseDTO.php');

class IndependentPersonDTO extends BaseDTO {

    private $id;
    private $client;
    private $activityEconomic;
    private $businessDescription;
    private $merchantRecord;
    private $numberEmployees;
    private $income;
    private $expenses;
    

    function __construct($id, $client, $activityEconomic, $businessDescription, $merchantRecord, $numberEmployees, $income, $expenses) {
        $this->id = $id;
        $this->client = $client;
        $this->activityEconomic = $activityEconomic;
        $this->businessDescription = $businessDescription;
        $this->merchantRecord = $merchantRecord;
        $this->numberEmployees = $numberEmployees;
        $this->income = $income;
        $this->expenses = $expenses;
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

    function getBusinessDescription() {
        return $this->businessDescription;
    }

    function getMerchantRecord() {
        return $this->merchantRecord;
    }

    function getNumberEmployees() {
        return $this->numberEmployees;
    }

    function getIncome() {
        return $this->income;
    }

    function getExpenses() {
        return $this->expenses;
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

    function setBusinessDescription($businessDescription) {
        $this->businessDescription = $businessDescription;
    }

    function setMerchantRecord($merchantRecord) {
        $this->merchantRecord = $merchantRecord;
    }

    function setNumberEmployees($numberEmployees) {
        $this->numberEmployees = $numberEmployees;
    }

    function setIncome($income) {
        $this->income = $income;
    }

    function setExpenses($expenses) {
        $this->expenses = $expenses;
    }





}
