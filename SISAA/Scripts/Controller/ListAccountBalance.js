$(document).ready(function () {

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
            var option = "<option value='0'></option>";
            if (xhr.header.code == "200") {

                var $dropdown = $("#Accounts");
                $.each(xhr.body, function (i, item) {
                    option = option + '<option value="' + item.accountId + '">' + item.description + '</option>';
                });

                $("#Accounts ").append(option);

                //Stope Loading
                loadingStop();

            } else {
                console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) {
            console.log("Operacacao terminada");
        }
    });


});

function validar() {
    var isValid = true;

    // TUDO 
    account = $("#Accounts :selected").val();

    if (account == "0") {
        isValid = false;
        Toast.fire({ type: 'error', title: 'O campo Empresa nao pode ser vazio!' });
    }


    return isValid;

}

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

function getCurrentBalance() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/GetAccountBalance",
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
                getUsedBalance();
                
            }
        },
        complete: function (xhr) {
        }
    });

    sendrequest();
}

function sendrequest(data) {

    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/GetAllAccountTransaction",
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
            }
        },
        complete: function (xhr) {
        }
    });
}

$("#form1").submit(function (event) {

    event.preventDefault();
    var account = $("#Accounts :selected").val();
       
    var data = {
        "header": GlobalUser.header,
        "body": account
    };

    if (validar()) {
        sendrequest(data);
    }

});




