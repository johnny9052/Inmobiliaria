<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class ClientDAO {

    private $repository;

    function ClientDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param ClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(ClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveclient", array((int) $obj->getId(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (int) $obj->getDocumentType(), (string) $obj->getDocumentNumber(),
            (int) $obj->getCityExpedition(), (string) $obj->getBirthdate(),
            (int) $obj->getClientType(), (string) $obj->getAddress(),
            (string) $obj->getHomePhone(), (string) $obj->getMobilePhone(),
            (string) $obj->getEmail(), (int) $obj->getGender(),
            (int) $obj->getCityResidence(), (int) $obj->getProfession(),
            (int) $obj->getMaritalStatus(), (int) $obj->getPersonType()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param ClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(ClientDTO $obj) {
        $query = $this->repository->buildQuery("listuser", array((int) $obj->getIdClient()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param ClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(ClientDTO $obj) {
        $query = $this->repository->buildQuery("searchuser", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param ClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(ClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateuser", array((int) $obj->getId(),
            (string) $obj->getFirstName(), (string) $obj->getSecondName(),
            (string) $obj->getFirstLastName(), (string) $obj->getSecondLastName(),
            (string) $obj->getClient(), (string) md5($obj->getPassword()),
            (int) $obj->getRol(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param ClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(ClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteuser", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
