<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class SpouseDAO {

    private $repository;

    function SpouseDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param SpouseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(SpouseDTO $obj) {
        $query = $this->repository->buildQuerySimply("savespouse", array((int) $obj->getId(),
            (int) $obj->getClient(), (int) $obj->getDocumentNumber(),
            (string) $obj->getExpeditiondate(), (string) $obj->getEmail(), 
            (string) $obj->getFirstName(), (string) $obj->getFirstLastName(),
            (string) $obj->getMobilePhone(), (string) $obj->getCompany(),
            (string) $obj->getAddress(), (string) $obj->getOfficePhone(),
            (float) $obj->getSalary()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param SpouseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(SpouseDTO $obj) {
        $query = $this->repository->buildQuery("listspouse", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param SpouseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(SpouseDTO $obj) {
        $query = $this->repository->buildQuery("searchspouse", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param SpouseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(SpouseDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatespouse", array((int) $obj->getId(),
            (int) $obj->getClient(), (int) $obj->getDocumentNumber(),
            (string) $obj->getExpeditiondate(), (string) $obj->getEmail(), 
            (string) $obj->getFirstName(), (string) $obj->getFirstLastName(),
            (string) $obj->getMobilePhone(), (string) $obj->getCompany(),
            (string) $obj->getAddress(), (string) $obj->getOfficePhone(),
            (float) $obj->getSalary()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param SpouseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(SpouseDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletespouse", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
