<?php

class Connection {

    private $userbd;
    private $passworddb;
    private $database;
    private $port;
    private $host;
    private $connect;


    public function connect() {
        $this->userbd = "hexagono_admin";
        $this->passworddb = "d4v1d3s3lm3j0r19";
        $this->database = "hexagono_inmobiliaria";
        $this->host = "localhost";

        try {
            /*Ultima linea de UTF8 es para evitar problemas con las acentuaciones y las Ñ*/
            $this->connect = new PDO("mysql:host=$this->host;dbname=$this->database", $this->userbd, $this->passworddb, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            // set the PDO error mode to exception
            $this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //echo "Connected successfully";
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function getConnect() {
        return $this->connect;
    }

}
