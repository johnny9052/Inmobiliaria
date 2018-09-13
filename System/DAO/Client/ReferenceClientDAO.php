<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class ReferenceClientDAO {

    private $repository;

    function ReferenceClientDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param ReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(ReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("savereference", array((int) $obj->getId(),
            (int) $obj->getClient(), (int) $obj->getTypeReference(),
            (string) $obj->getFirstName(), (string) $obj->getFirstLastName(),
            (string) $obj->getMobilePhone()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param ReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(ReferenceClientDTO $obj) {
        $query = $this->repository->buildQuery("listreference", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param ReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(ReferenceClientDTO $obj) {
        $query = $this->repository->buildQuery("searchreference", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param ReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(ReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatereference", array((int) $obj->getId(),
            (int) $obj->getClient(), (int) $obj->getTypeReference(),
            (string) $obj->getFirstName(), (string) $obj->getFirstLastName(),
            (string) $obj->getMobilePhone()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param ReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(ReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletereference", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
