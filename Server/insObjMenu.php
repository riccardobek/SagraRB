<?php
require_once "config.php";
require_once "function.php";

$db->beginTransaction();

if(isAdmin()) {
    $nome = $_POST["nome"];
    $prezzo = $_POST["prezzo"];
    $tipo = $_POST["tipo"];

    $queryInserimento = $db->prepare("INSERT INTO menu VALUES (NULL,?,?,?)");

    if ($queryInserimento->execute(array($nome, $prezzo, $tipo))) {
        $db->commit();
        print('1');
    } else {
        $db->rollBack();
        print('0');
    }
}
else{
    echo "You can not do any action.";
}