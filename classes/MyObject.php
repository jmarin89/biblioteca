<?php

class MyObject
{

    protected $dbh;

    public function __construct(){

        try {
            $this->dbh = new PDO("mysql:host=" . DB_HOST . "; dbname=" . DB_NAME, DB_USER, DB_PASS, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        } catch (PDOException $e) {
            $this->dbh = NULL;
        }

    }

}