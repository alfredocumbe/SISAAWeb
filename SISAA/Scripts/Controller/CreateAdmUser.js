$( document ).ready(function() {
    
    var data = {
        "header": GlobalHeader,
        "body": 0
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAll",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
            console.log(data)
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Erro ao carregar empresas!' });
        },
        success: function (xhr) {
            console.log(xhr);
            var option = "<option value='0'></option>";
            if (xhr.header.code == "200") {               
                
                var $dropdown = $("#Accounts");
                $.each(xhr.body, function(i, item) {
                    option = option + '<option value="'+item.accountId+'">'+item.description+'</option>';
                });

                $("#Accounts ").append(option);

                limparCampos();

            } else {
                console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) {
            console.log("Operacacao terminada");
        }
    });


});

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
    account = $("#Accounts :selected").val();
    var userPassword = $("#userPassword").val();
    var userConfirm = $("#userConfirm").val();

    if (account =="0" ){
        isValid = false;
        Toast.fire({ type: 'error', title: 'O campo Empresa nao pode ser vazio!' });
    }

    if (userConfirm != userPassword){
        isValid = false;
        Toast.fire({ type: 'error', title: 'Password nao combinam' });
    }

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
    var account = $("#Accounts :selected").val();

    console.log(userFullName);

    var body = {
        "name": userFullName,        
        "userName": userName,
        "password": userPassword,
        "AccountID": account
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});

