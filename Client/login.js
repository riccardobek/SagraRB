$('form').on('submit', function(e){
    e.preventDefault();
    e.stopPropagation();

    var username = $('#username').val();
    var password = $('#password').val();

    if(username == '' || password =='') {
        alert('Si prega di controllare i dati inseriti.');
    }
    else {
        $.post("Server/login.php",$('form').serialize(),function(risposta){
            if(risposta=='1'){
                setTimeout(function() {
                    location.href = 'admin.php';
                },1500);
            }
            else if(risposta=='2'){
                setTimeout(function() {
                    location.href = 'user.php';
                },1500);
            }
            else{
                alert('Errore i dati inseriti non sono corretti.');
                console.log(risposta);
            }
        });
    }
});
