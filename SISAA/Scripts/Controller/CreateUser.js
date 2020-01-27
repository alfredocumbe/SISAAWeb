
function limparCampos() {
    $("#userFullName").val("");
    $("#userEmail").val("");
    $("#userName").val("");
    $("#userPassword").val("");
    $("#userConfirm").val("");
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
        url: GlobalBaseURL + "api/User",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Erro na criacao de  Utilizador!' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                Toast.fire({ type: 'success', title: 'Utilizador criado com Sucesso!' });
                limparCampos();
            } else {
                console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) {
            console.log("Operacacao terminada");
        }
    });
}

$("#form1").submit(function (event) {
    event.preventDefault();
    console.log(GlobalBaseURL);
    var userFullName = $("#userFullName").val();
    var userEmail = $("#userEmail").val();
    var userName = $("#userName").val();
    var userPassword = $("#userPassword").val();

    var body = {
        "Name": userFullName,        
        "UserName": userName,
        "Password": userPassword,
        "AccountID": GlobalHeader.AccountID
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});