
function limparCampos() {
    $("#companyShortName").val("");
    $("#companyLongName").val("");
    
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
        url: GlobalBaseURL + "api/Account",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Empresa Cadastrada com Sucesso!' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                Toast.fire({ type: 'success', title: 'Empresa Cadastrada com Sucesso!' });
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
    var companyLongName = $("#companyLongName").val();
    var companyShortName = $("#companyShortName").val();
    
    var body = {
        "name": companyShortName,        
        "balance": 0,
        "description": companyLongName
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});