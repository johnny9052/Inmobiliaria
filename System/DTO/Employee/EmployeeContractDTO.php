<?php

require_once ('../../DTO/BaseDTO.php');

class EmployeeContractDTO extends BaseDTO {

    private $id;
    private $employee;
    private $area;
    private $startDate;
    private $endDate;
    private $contractType;
    private $position;
    private $salary;
    private $urlContract;
    
    function __construct($id, $employee, $area, $startDate, $endDate, $contractType, $position, $salary, $urlContract) {
        $this->id = $id;
        $this->employee = $employee;
        $this->area = $area;
        $this->startDate = $startDate;
        $this->endDate = $endDate;
        $this->contractType = $contractType;
        $this->position = $position;
        $this->salary = $salary;
        $this->urlContract = $urlContract;
    }
    
    function getId() {
        return $this->id;
    }

    function getEmployee() {
        return $this->employee;
    }

    function getArea() {
        return $this->area;
    }

    function getStartDate() {
        return $this->startDate;
    }

    function getEndDate() {
        return $this->endDate;
    }

    function getContractType() {
        return $this->contractType;
    }

    function getPosition() {
        return $this->position;
    }

    function getSalary() {
        return $this->salary;
    }

    function getUrlContract() {
        return $this->urlContract;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setEmployee($employee) {
        $this->employee = $employee;
    }

    function setArea($area) {
        $this->area = $area;
    }

    function setStartDate($startDate) {
        $this->startDate = $startDate;
    }

    function setEndDate($endDate) {
        $this->endDate = $endDate;
    }

    function setContractType($contractType) {
        $this->contractType = $contractType;
    }

    function setPosition($position) {
        $this->position = $position;
    }

    function setSalary($salary) {
        $this->salary = $salary;
    }

    function setUrlContract($urlContract) {
        $this->urlContract = $urlContract;
    }
}
