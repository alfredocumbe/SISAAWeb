
function bindTable(data){
    
    console.log(data);

    $("#group tbody tr").remove();
    
    var count = 0;
    var EditarGrupo = '';
    var VerEncarregado = '';
    //buscarEstudante();

    const sleep = (milliseconds) => {
        return new Promise(resolve => setTimeout(resolve, milliseconds))
    };
    sleep(500).then(() => {
        //do stuff
        console.log("Estudantes...");
   
    $.each(data, function(i, item) {

        count = count + 1;

        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow  = btnRow + '<div class="btn-group" role="group">';
        btnRow  = btnRow + '<button id="btnGroupDrop'+count+'" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Comando </button>';
        btnRow  = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop'+count+'">';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarEncarregado'+count+'">Editar Turma</a>';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEncarregado'+count+'">Ver Contactos</a>';
        btnRow  = btnRow + '</div></div></div>';
       

        var $tr = $('<tr>').append(
            $('<td class="d-none">').text(item.groupID),
            $('<td>').text(item.name),
            $('<td>').html(btnRow)
        );
        console.log($tr);

        $("#group tbody").append($tr);

        
        
    }); 

  });   
}



function sendrequest() {
    var data = {
        "header": GlobalHeader,
        "body": GlobalHeader.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllGroup",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            //console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            loadingStop();
            //console.log("Ocorreu um erro na operacao");
            Toast.fire({type: 'error', title: ''});
        },
        success: function (xhr) { 
            loadingStop();
            if(xhr.header.code == "200"){
                // console.log(xhr.body);
                bindTable(xhr.body);        
                //console.log("Operacao executada com sucesso!");
                limparCampos();
                // $('.duallistbox').bootstrapDualListbox();
            }else{
                //console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });
}



function limparCampos(){
    
}

sendrequest();