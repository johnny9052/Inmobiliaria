<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EmployeeDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveemployee", array((int) $obj->getId(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (string) $obj->getDocumentNumber(), (string) $obj->getExpeditionDate(),
            (string) $obj->getBirthdate(),(string) $obj->getAddress(),
            (string) $obj->getHomePhone(), (string) $obj->getMobilePhone(),
            (string) $obj->getEmail(), (int) $obj->getGender(),
            (int) $obj->getTypeEmployee(),(int) $obj->getCityResidence(),
            (int) $obj->getProfession(), (int) $obj->getMaritalStatus(),
            (int) $obj->getCityExpedition(), (string) $obj->getFileIdentification(),
            (int) $obj->getCityBirth(), (string) $obj->getMilitaryCard(),
            (int) $obj->getBloodType(), (string) $obj->getFileMilitaryCard(),
            (int) $obj->getPensionFund(), (int) $obj->getSeveranceFund(),
            (int) $obj->getArl(), (int) $obj->getEps(),
            (int) $obj->getCompensationBox(), (int) $obj->getDisability(),
            (string) $obj->getImageEmployee(), (string) $obj->getContactName(),
            (string) $obj->getContactPhone(), (string) $obj->getContactEmail()  
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EmployeeDTO $obj) {
        $query = $this->repository->buildQuery("listemployee", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EmployeeDTO $obj) {
        $query = $this->repository->buildQuery("searchemployee", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateemployee", array((int) $obj->getId(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (string) $obj->getDocumentNumber(), (string) $obj->getExpeditionDate(),
            (string) $obj->getBirthdate(),(string) $obj->getAddress(),
            (string) $obj->getHomePhone(), (string) $obj->getMobilePhone(),
            (string) $obj->getEmail(), (int) $obj->getGender(),
            (int) $obj->getTypeEmployee(),(int) $obj->getCityResidence(),
            (int) $obj->getProfession(), (int) $obj->getMaritalStatus(),
            (int) $obj->getCityExpedition(), (string) $obj->getFileIdentification(),
            (int) $obj->getCityBirth(), (string) $obj->getMilitaryCard(),
            (int) $obj->getBloodType(), (string) $obj->getFileMilitaryCard(),
            (int) $obj->getPensionFund(), (int) $obj->getSeveranceFund(),
            (int) $obj->getArl(), (int) $obj->getEps(),
            (int) $obj->getCompensationBox(), (int) $obj->getDisability(),
            (string) $obj->getImageEmployee(), (string) $obj->getContactName(),
            (string) $obj->getContactPhone(), (string) $obj->getContactEmail()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteemployee", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
