
function limparCampos() {
    $("#Username").val("");
    $("#Password").val("");
}

function validar() {
    var isValid = true;

    // TUDO 
    
    return isValid;
    
}

function sendrequest(data) {
    console.log(data);
    console.log(JSON.stringify(data));
    $.ajax({
        url: "/SISAA/Pages/Register",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
            console.log(xhr);
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                window.location.replace("/SISAA/Pages/Default");
                limparCampos();                
            } else {
                console.log("Utilizador ou Password incorrectos" + xhr.header.message);
                Toast.fire({ type: 'success', title: 'Utilizador ou Password incorrectos!' });
            }
        },
        complete: function (xhr) {
            console.log("Operacacao terminada");
        }
    });
}

$("#form1").submit(function (event) {
    event.preventDefault();
    var Username = $("#Username").val();
    var Password = $("#Password").val();


    var body = {
        "username": Username,        
        "password": Password      
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});

