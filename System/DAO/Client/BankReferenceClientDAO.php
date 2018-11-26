<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class BankReferenceClientDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param BankReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(BankReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("savereferencebank", array((int) $obj->getId(),
            (int) $obj->getClient(), (string) $obj->getNumberAccount(),
            (int) $obj->getBank(), (string) $obj->getBranchOffice()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param BankReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(BankReferenceClientDTO $obj) {
        $query = $this->repository->buildQuery("listreferencebank", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param BankReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(BankReferenceClientDTO $obj) {
        $query = $this->repository->buildQuery("searchreferencebank", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param BankReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(BankReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatereferencebank", array((int) $obj->getId(),
            (int) $obj->getClient(), (string) $obj->getNumberAccount(),
            (int) $obj->getBank(), (string) $obj->getBranchOffice()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param BankReferenceClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(BankReferenceClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletereferencebank", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
