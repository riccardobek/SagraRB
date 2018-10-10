<?php
require_once "function.php";

setcookie(session_name(), '', 100);
session_unset();
session_destroy();
$_SESSION = array();

//Reindirizzo l'utente alla home del sito
header("Location: ../index.php");
