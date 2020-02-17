$( document ).ready(function() {
    
    var data = {
        "header": GlobalUser.header,
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
    $("#Accounts").val('0');
    $("#quantity").val("");
    $("#transationType").val('0');
    $("#form1").trigger("reset"); 
}

function validar() {
    var isValid = true;

    // TUDO 
    account = $("#Accounts :selected").val();

    if (account =="0" ){
        isValid = false;
        Toast.fire({ type: 'error', title: 'O campo Empresa nao pode ser vazio!' });
    }


    return isValid;
    
}


function sendrequest(data) {
    
    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/TransactionIN",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Erro ao recarregar a conta' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                getCurrentBalance();
                Toast.fire({ type: 'success', title: 'Conta recarregada com sucesso!' });
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


function sendrequest(data, url) {
    
    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/" + url,
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Erro ao recarregar a conta' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                getCurrentBalance();
                Toast.fire({ type: 'success', title: 'Operacao executada com sucesso!' });
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
    var quantity = parseInt($("#quantity").val());
    var transationType = $("#transationType :selected").val();
    var account = $("#Accounts :selected").val();

    

    if (transationType == "IN") {

        var body = {
            "accountBalanceID": 0,
            "transactionAmount": quantity,
            "accountID": account
        }

        var data = {
            "header": GlobalUser.header,
            "body": body
        };

        if (validar()) {
            sendrequest(data, "TransactionIN");
        }

    } else if ((transationType == "OUT")) {

        var body = {
            "accountBalanceID": 0,
            "transactionAmount": quantity,
            "providerTransationID": "",
            "transationType": 1,
            "transationTypeOut": 1,           
            "accountID": account
        }

        var data = {
            "header": GlobalUser.header,
            "body": body
        };

        if (validar()) {
            sendrequest(data, "TransactionOUT");
        }

    }

});

function getCurrentBalance() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/BaseBalance/GetBaseBalance",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
        },
        error: function (xhr) {
            loadingStop();
            Toast.fire({ type: 'error', title: '' });
        },
        success: function (xhr) {

            if (xhr.header.code == "200") {

                $("#currentBalance").html(xhr.body);
                //getUsedBalance();

            }
        },
        complete: function (xhr) {
        }
    });

}

getCurrentBalance();

