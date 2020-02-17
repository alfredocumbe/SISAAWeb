
function limparCampos() {
    $("#parentName").val("");   
    $("#parentProfissao").val("");  
    $("#parentAddress").val("");  
    $("#parentPhone").val(""); 
    $("#form1").trigger("reset"); 
}

function validar() {
    var isValid = true;

    // TUDO

    return isValid;
}

function sendrequest(data) {

    $.ajax({
        url: GlobalBaseURL + "api/Parent/CreateParent",
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
    parentPhone = parentPhone.replace("(", "").replace(")", "").replace("-", "").replace(" ","");
 
    var students = new Array ({
                    "name": "Edio Junior",
                    "gender": "M"
            })

  
    var body = {
        "name": parentName,  
        "profession": parentProfissao,
        "address": parentAddress,
        "cellphone": parentPhone,
        "AccountID": GlobalUser.header.AccountID,
        "students": students
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});