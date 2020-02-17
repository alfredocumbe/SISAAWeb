
function requestGrupos(){

    var data = {
        "header": GlobalUser.header,
        "body": 0
    }

    $.ajax({
        url: GlobalBaseURL + "api/Group/GetByAccount",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            //console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            console.log(xhr);
        },
        success: function (xhr) {  
            console.log(xhr);
            bindGroup(xhr.body);
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });       
};

$("#compose-textarea").keyup(function () {
    $("#quickCharacters").text($(this).val().length);
    var quantidade = $(this).val().length;
    var total = Math.trunc((quantidade / 160))+1;
    $("#quickNrSMS").text(total);
});

function bindGroup(data){
    console.log(data);   
    var htmlGroup = '';
    var teste = '';

    for (i = 0; i < data.length; i++) {
        htmlGroup = htmlGroup  + '<li>';
        htmlGroup = htmlGroup  + '    <div class="icheck-success d-inline">';
        htmlGroup = htmlGroup + '                                            <input type="checkbox" class="checkBox" onclick="selecionarGrupo(this)" id="checkboxSuccess3'+i+'" name="'+data[i].name+'" value='+data[i].groupID+' >';
        htmlGroup = htmlGroup  + '                                            <label for="checkboxSuccess3'+i+'">';
        htmlGroup = htmlGroup  + '                                                '+data[i].name;
        htmlGroup = htmlGroup  + '                                            </label>';
        htmlGroup = htmlGroup  + '                                        </div>';
        htmlGroup = htmlGroup  + '</li>';
    }

    $("#groups").html(htmlGroup);

    loadingStop(); //Parar O loading

};

function selecionarGrupo(obj){  
    var checks = $(".checkBox");
    var sendto =  '';//$("#sendTo").val(); 
    for (i = 0; i < checks.length; i++) {
        if(checks[i].checked){
            sendto = sendto + checks[i].name + ";";
        }
    }
    $("#sendTo").val(sendto);
}

function limparCampos(){
    var checks = $(".checkBox");
    for (i = 0; i < checks.length; i++) {
        checks[i].checked = false;
    } 
    $("#reset").trigger("click");

    $("#quickCharacters").text(0);
    $("#quickNrSMS").text(1);
    $("#form1").trigger("reset"); 
}

function enviarSMSRequest(data){
    $.ajax({
        url: GlobalBaseURL + "api/SMS",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            loadingStop();
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Ocorreu um erro na operacao'});
        },
        success: function (xhr) { 
            console.log(xhr);
            if(xhr.header.code == "200"){
                loadingStop();
                console.log("SMS Enviada com sucesso!");
                Toast.fire({ type: 'success', title: 'SMS Enviada com sucesso!'});
                limparCampos();
            }else{
                console.log("Ocorreu um erro ao Enviar SMS" + xhr.header.message);
            }
        },
        complete: function (xhr) { 
            console.log("Operacacao terminada");
        }
    });  
}

function enviarSMS(){
    
    loadingStart(); 

    var groups = [];

    var checks = $(".checkBox");

    for (i = 0; i < checks.length; i++) {

        if(checks[i].checked){
            groups.push(checks[i].value);
        }
    };

    var body = $.trim($("#compose-textarea").val());

    var data = {
        "header": GlobalUser.header,
        "body": {
            "body": body,
            "AccountID": GlobalUser.header.AccountID,
            "groups": groups
        }
    };

    console.log(data);

    enviarSMSRequest(data);

}

requestGrupos();
