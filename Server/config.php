<?php

ini_set("opcache.enabled","0");

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'sagra');

try {
    $db = new PDO('mysql:host='.DB_SERVER.';dbname='.DB_DATABASE.';charset=utf8mb4', DB_USERNAME);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch (PDOException $e) {
    print "ERRORE DI CONNESSIONE AL DATABASE:" . $e->getMessage() . "<br/>";
    die();
}

