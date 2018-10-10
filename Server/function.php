<?php
require_once "config.php";

session_start();

function criptaPassword($password) {
    return hash('sha512',$password);
}

function isAdmin() {
    return isset($_SESSION['Utente']['tipo']) && $_SESSION['Utente']['tipo'] == 'admin';
}

function listaMenu(){
    global $db;
    $query= $db->prepare("SELECT * FROM menu ORDER BY tipo ASC,nome ASC");
    $query->execute();
    $r = $query->fetchAll();
    return $r;
}

function listaUtenti(){
    global $db;
    $query= $db->prepare("SELECT * FROM Utenti");
    $query->execute();
    $r = $query->fetchAll();
    return $r;
}
