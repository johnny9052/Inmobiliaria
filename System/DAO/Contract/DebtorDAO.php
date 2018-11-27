<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class DebtorDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param DebtorDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(DebtorDTO $obj) {
        $query = $this->repository->buildQuerySimply("savedebtor", array((int) $obj->getId(),
            (string) $obj->getDocumentNumber(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (string) $obj->getAddress(),(string) $obj->getHomePhone(),
            (string) $obj->getAddressOffice(), (string) $obj->getOfficePhone(),
            (string) $obj->getMobilePhone(),(string) $obj->getEmail(),
            (float) $obj->getMonthlyIncome(),(int) $obj->getMaritalStatus(),
            (int) $obj->getDocumentType(), (int) $obj->getCityResidence(),
            (int) $obj->getCityExpedition(), (string) $obj->getExpeditionDate()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param DebtorDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(DebtorDTO $obj) {
        $query = $this->repository->buildQuery("listdebtor", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param DebtorDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(DebtorDTO $obj) {
        $query = $this->repository->buildQuery("searchdebtor", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param DebtorDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(DebtorDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatedebtor", array((int) $obj->getId(),
            (string) $obj->getDocumentNumber(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (string) $obj->getAddress(),(string) $obj->getHomePhone(),
            (string) $obj->getAddressOffice(), (string) $obj->getOfficePhone(),
            (string) $obj->getMobilePhone(),(string) $obj->getEmail(),
            (float) $obj->getMonthlyIncome(),(int) $obj->getMaritalStatus(),
            (int) $obj->getDocumentType(), (int) $obj->getCityResidence(),
            (int) $obj->getCityExpedition(), (string) $obj->getExpeditionDate()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param DebtorDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(DebtorDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletedebtor", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
