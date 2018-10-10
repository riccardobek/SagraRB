<?php
require_once('config.php');
require_once ('function.php');

$username = filter_var($_POST["username"],FILTER_SANITIZE_STRING);
$password = $_POST["password"];

$query= $db->prepare("SELECT * FROM Utenti WHERE Username = ? AND Password = ?");
$query->execute(array($username,criptaPassword($password)));

$utente = $query->fetch();

if(!$utente) {
    print('0');
    return;
}

$_SESSION['Utente']= array();
$_SESSION['Utente'] = $utente;

if($utente['tipo']=='admin') {
    print('1');
    return;
}
print('2');