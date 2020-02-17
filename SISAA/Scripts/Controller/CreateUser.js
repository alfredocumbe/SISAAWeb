
function limparCampos() {
    $("#userFullName").val("");
    $("#userPhone").val("");
    $("#userName").val("");
    $("#userPassword").val("");
    $("#userConfirm").val("");
    $("#form1").trigger("reset"); 
}

function validar() {
    var isValid = true;



    return isValid;
}

function sendrequest(data) {
    console.log(data);
    console.log(JSON.stringify(data));
    $.ajax({
        url: GlobalBaseURL + "api/User/CreateUser",
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
    var userPhone = $("#userPhone").val();
    var userName = $("#userName").val();
    var userPassword = $("#userPassword").val();
    userPhone = userPhone.replace("(", "").replace(")", "").replace("-", "").replace(" ", "");
    var body = {
        "Name": userFullName,        
        "UserName": userName,
        "Password": userPassword,
        "Cellphone": userPhone,
        "AccountID": GlobalUser.header.AccountID
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});