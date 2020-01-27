
function limparCampos() {
    $("#parentName").val("");   
    $("#parentProfissao").val("");  
    $("#parentAddress").val("");  
    $("#parentPhone").val("");   
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
        url: GlobalBaseURL + "api/Parent",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Erro na criacao do Encarregado!' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                Toast.fire({ type: 'success', title: 'Encarregado Criado com Sucesso!' });
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
    var parentName = $("#parentName").val();
    var parentProfissao = $("#parentProfissao").val();
    var parentAddress = $("#parentAddress").val();
    var parentPhone = $("#parentPhone").val();

    var students = new Array ({
                    "name": "Edio Junior",
                    "gender": "M"
            })

  
    var body = {
        "name": parentName,  
        "profession": parentProfissao,
        "address": parentAddress,
        "cellphone": parentPhone, 
        "AccountID": GlobalHeader.AccountID,
        "students": students
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});