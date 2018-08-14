<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EmployeeFormationDAO {

    private $repository;

    function EmployeeFormationDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EmployeeFormationDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EmployeeFormationDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveformation", array((int) $obj->getId(),
            (string) $obj->getEducationInstitute(), (int) $obj->getLevel(),
            (string) $obj->getFileCertificate(),(int) $obj->getEmployee(),
            (int) $obj->getProfession(), (int) $obj->getPeriodicity(),
            (int) $obj->getGraduate()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EmployeeFormationDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EmployeeFormationDTO $obj) {
        $query = $this->repository->buildQuery("listformation", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EmployeeFormationDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EmployeeFormationDTO $obj) {
        $query = $this->repository->buildQuery("searchformation", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EmployeeFormationDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EmployeeFormationDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateformation", array((int) $obj->getId(),
            (string) $obj->getEducationInstitute(), (int) $obj->getLevel(),
            (string) $obj->getFileCertificate(),(int) $obj->getEmployee(),
            (int) $obj->getProfession(), (int) $obj->getPeriodicity(),
            (int) $obj->getGraduate()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EmployeeFormationDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EmployeeFormationDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteformation", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
