function limparCampos() {
    $("#quantity").val("");
    $("#transationType").val('0');
}

function validar() {
    var isValid = true;

    // TUDO 
    account = $("#transationType :selected").val();
    var compare = account.localeCompare("0");

    if (compare < 0) {
        isValid = false;
        Toast.fire({ type: 'error', title: 'O campo Tipo Operacao nao pode ser vazio!' });
    }

    return isValid;
}

function sendrequest(data) {

    $.ajax({
        url: GlobalBaseURL + "api/BaseBalance/TransactionIN",
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
                Toast.fire({ type: 'success', title: 'Conta recarregada com sucesso!' });
                limparCampos();
                loadTransations();
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
        url: GlobalBaseURL + "api/BaseBalance/" + url,
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
                Toast.fire({ type: 'success', title: 'Operacao executada com sucesso!' });
                limparCampos();
                loadTransations();
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

    
    if (transationType == "IN") {

        var body = {
            "userID": GlobalUser.header.userID,
            "transactionAmount": quantity
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
            "userID": GlobalUser.header.userID,
            "transactionAmount": quantity
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

function bindTableTransations(data) {

    console.log(data);

    $('#balance').dataTable().fnClearTable();
    var transationType =""
    

    var count = 0;
    
    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            if (item.transationType == "IN") {
                transationType = "CREDITO";
            } else {
                transationType = "DEBITO"
            }

            count = count + 1;
            var dataCriacao = new Date(item.created).format("dd-MM-yyyy HH:mm:ss");

            $('#balance').dataTable().fnAddData([
                transationType,
                item.transacionAmount,
                item.accountOldBalance,
                item.accountNewBalance,
                dataCriacao
            ]);
        }

    });

    loadingStop();
}

function loadTransations() {

    var data = {
        "header": GlobalUser.header,
        "body": 0
    };

    $.ajax({
        url: GlobalBaseURL + "api/BaseBalance/GetAllAccountTransaction",
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
                console.log(xhr.body);
                bindTableTransations(xhr.body);
                getCurrentBalance();
            }
        },
        complete: function (xhr) {
        }
    });
}

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

loadTransations();



