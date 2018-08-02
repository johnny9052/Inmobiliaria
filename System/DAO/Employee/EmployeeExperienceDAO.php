<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EmployeeExperienceDAO {

    private $repository;

    function EmployeeExperienceDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EmployeeExperienceDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EmployeeExperienceDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveexperience", array((int) $obj->getId(),
            (int) $obj->getEmployee(), (string) $obj->getCompanyName(),
            (string) $obj->getAdmissionDate(),(string) $obj->getDepartureDate(),
            (string) $obj->getUrlWorkCertificate(), (int) $obj->getPosition()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EmployeeExperienceDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EmployeeExperienceDTO $obj) {
        $query = $this->repository->buildQuery("listexperience", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EmployeeExperienceDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EmployeeExperienceDTO $obj) {
        $query = $this->repository->buildQuery("searchexperience", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EmployeeExperienceDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EmployeeExperienceDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateexperience", array((int) $obj->getId(),
            (int) $obj->getEmployee(), (string) $obj->getCompanyName(),
            (string) $obj->getAdmissionDate(),(string) $obj->getDepartureDate(),
            (string) $obj->getUrlWorkCertificate(), (int) $obj->getPosition()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EmployeeExperienceDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EmployeeExperienceDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteexperience", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
