<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EmployeeContractDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EmployeeContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EmployeeContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("savecontract", array((int) $obj->getId(),
            (int) $obj->getEmployee(), (int) $obj->getArea(),
            (string) $obj->getStartDate(),(string) $obj->getEndDate(),
            (int) $obj->getContractType(), (int) $obj->getPosition(),
            (float)$obj->getSalary(), (string) $obj->getUrlContract()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EmployeeContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EmployeeContractDTO $obj) {
        $query = $this->repository->buildQuery("listcontract", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EmployeeContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EmployeeContractDTO $obj) {
        $query = $this->repository->buildQuery("searchcontract", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EmployeeContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EmployeeContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatecontract", array((int) $obj->getId(),
            (int) $obj->getEmployee(), (int) $obj->getArea(),
            (string) $obj->getStartDate(),(string) $obj->getEndDate(),
            (int) $obj->getContractType(), (int) $obj->getPosition(),
            (float)$obj->getSalary(), (string) $obj->getUrlContract()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EmployeeContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EmployeeContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletecontract", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
