<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class DependentPersonDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param DependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(DependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("savedependent", array((int) $obj->getId(),
            (int) $obj->getClient(), (int) $obj->getActivityEconomic(),
            (string) $obj->getCompany(), (int) $obj->getPosition(),
            (string) $obj->getAddress(), (float) $obj->getSalary(),
            (float) $obj->getOtherIncome(), (int) $obj->getClientType(),
            (int) $obj->getAntiquity(), (string) $obj->getOfficePhone()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param DependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(DependentPersonDTO $obj) {
        $query = $this->repository->buildQuery("listdependent", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param DependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(DependentPersonDTO $obj) {
        $query = $this->repository->buildQuery("searchdependent", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param DependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(DependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveupdatedependent", array((int) $obj->getId(),
            (int) $obj->getActivityEconomic(),
            (string) $obj->getCompany(), (int) $obj->getPosition(),
            (string) $obj->getAddress(), (float) $obj->getSalary(),
            (float) $obj->getOtherIncome(), (int) $obj->getAntiquity(), 
            (string) $obj->getOfficePhone()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param DependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(DependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletedependent", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
