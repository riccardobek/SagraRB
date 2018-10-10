$('#ins-new').on('click',function(){
    $('#insert-new-background').show();
    bloccaScroll();
});

$('#in-annulla').on('click',function(e){
    e.stopPropagation();
    e.preventDefault();
    $('#insert-new-background').hide('slow',);
    $('#nome').val('');
    $('#prezzo').val('');
    sbloccaScroll();
});

//blocca lo scroll se premo il tasto crea nuova macroattività
function bloccaScroll(){
    $("body").css({"overflow" : "hidden"});
}
//sblocca lo scroll se premo annulla
function sbloccaScroll(){
    $("body").css({"overflow-y":"scroll"});
}

$(function() {
    $(".tab-content").first().show();
    $(".tab-links").first().addClass("active");
    $(".tab-links").on("click", function (e) {
        var tabTarget = $(this).attr("data-target");
        $(".tab-links").removeClass("active");
        $(this).addClass("active");
        $(".tab-content").hide();
        $('#' + tabTarget).show();
    });
});


$('#in-salva').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();

    var nome = $('#nome').val();
    var prezzo = $('#prezzo').val();
    var tipo = $('#tipo').val();

    if(nome == '' || prezzo == ''){
        alert('Inserire tutti i dati.');
    }
    else {
        $.post('Server/insObjMenu.php',$('form').serialize(), function (risposta) {
            if(risposta == '0'){
                alert('Errore di inserimento. Controllare di aver inserito i dati corretti.');
            }
            else{
                var tmp = inserimentoOggettoMenu(nome,tipo,prezzo);
                $('#in-annulla').click();
                $('table.menu-oggetti').append(tmp).show('slow');

            }
        });
    }
});


function inserimentoOggettoMenu(nome,tipo,prezzo) {
    var riga = document.createElement('tr');
    var colonna1 = document.createElement('td');
    colonna1.append(document.createTextNode(nome));
    var colonna2 = document.createElement('td');
    colonna2.append(document.createTextNode(tipo));
    var colonna3 = document.createElement('td');
    colonna3.append(document.createTextNode(prezzo));


    var colonna4 = document.createElement('td');
    var buttonM = document.createElement('button');
    buttonM.append(document.createTextNode('Modifica'));
    colonna4.append(buttonM);

    var colonna5 = document.createElement('td');
    var buttonC = document.createElement('button');
    buttonC.append(document.createTextNode('X'));
    colonna5.append(buttonC);

    riga.append(colonna1);
    riga.append(colonna2);
    riga.append(colonna3);
    riga.append(colonna4);
    riga.append(colonna5);

    return riga;
}
