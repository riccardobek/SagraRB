<?php
require_once('Server/function.php');

if(isAdmin()) {
    $HTML = file_get_contents("Template/admin.html");
    $MENU = file_get_contents("Template/admin/menu.html");
    $HTML = str_replace('[#content-admin]',$MENU,$HTML);
    $HTML = str_replace('[#table-menu]',tabellaMenu(),$HTML);

    echo $HTML;
}
else{
    //creare pagina d'errore
    echo 'You can not enter in admin page';
}


function tabellaMenu(){
    $risultato = listaMenu();
    $riga="";

    foreach ($risultato as $r){
        $riga .= <<<SCRIVI
<tr id="menu-{$r["id"]}">    
    <td>{$r["nome"]}</td>
    <td>{$r["tipo"]}</td>
    <td>{$r["prezzo"]}</td>
    <td><button data-target="menu-{$r["id"]}">Modifica</button></td>
    <td><button data-target="menu-{$r["id"]}">X</button></td>
 </tr>
SCRIVI;
    }

    return $riga;
}

