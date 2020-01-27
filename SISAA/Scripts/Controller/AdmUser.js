
function bindTable(data){
    
    console.log(data);

    $("#users tbody tr").remove();
    
    var count = 0;
    var EditarGrupo = '';
    var VerEncarregado = '';
    //buscarEstudante();

    const sleep = (milliseconds) => {
        return new Promise(resolve => setTimeout(resolve, milliseconds))
    };
    sleep(500).then(() => {
        //do stuff
   
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

        var bloqueado;
        if(item.isBloqued==true){
            bloqueado = "SIM"
        }else{
            bloqueado = "NAO"
        }
       

        var $tr = $('<tr>').append(
            $('<td class="d-none">').text(item.accountID),
            $('<td>').text(item.name),
            $('<td>').text(item.userName),
            $('<td>').text(""),
            $('<td>').text(bloqueado),
            $('<td>').html(btnRow)
        );

        $("#users tbody").append($tr);

        
        
    }); 

  });   
}



function sendrequest() {
    var data = {
        "header": GlobalHeader,
        "body": 0
    };

    $.ajax({
        url: GlobalBaseURL + "api/User/GetAll",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            //console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            //console.log("Ocorreu um erro na operacao");
            Toast.fire({type: 'error', title: ''});
        },
        success: function (xhr) { 
            
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