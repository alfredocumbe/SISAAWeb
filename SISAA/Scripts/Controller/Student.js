
function bindTable(data){
    console.log("teste");
    $("#parents tbody tr").remove();
    console.log("teste2");
    
    var count = 0;
    var EditarGrupo = '';
    $.each(data, function(i, item) {
        console.log(item);
        count = count + 1;
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        btnRow  = btnRow + '<div class="btn-group" role="group">';
        btnRow  = btnRow + '<button id="btnGroupDrop'+count+'" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Comando </button>';
        btnRow  = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop'+count+'">';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarEstudante'+count+'">Editar Estudante</a>';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEstudante">Ver Encarregados</a>';
        btnRow  = btnRow + '</div></div></div>';
        
        EditarGrupo = EditarGrupo + '<div class="modal fade" id="EditarEstudante'+count+'">';
        EditarGrupo = EditarGrupo + '<div class="modal-dialog modal-lg">';
        EditarGrupo = EditarGrupo + '<div class="modal-content">';
        EditarGrupo = EditarGrupo + '<div class="modal-header">';
        EditarGrupo = EditarGrupo + '<h4 class="modal-title">Alterar Dados do Estudante('+item.name+')</h4>';
        EditarGrupo = EditarGrupo + '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
        EditarGrupo = EditarGrupo + '<span aria-hidden="true">&times;</span></button></div>';
        EditarGrupo = EditarGrupo + '<div class="modal-body">';
        EditarGrupo = EditarGrupo + '<!-- form start -->';
        EditarGrupo = EditarGrupo + '<div class="card-body">';
        EditarGrupo = EditarGrupo + '<div class="form-group">';
        EditarGrupo = EditarGrupo + '<label for="groupName">Nome</label>';
        EditarGrupo = EditarGrupo + '<input type="hidden" class="form-control" id="groupID">';
        EditarGrupo = EditarGrupo + '<input type="text" id="Name'+count+'" class="form-control" id="Name" placeholder="Digita nome">';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<div class="form-group">';
        EditarGrupo = EditarGrupo + '<label for="exampleInputGender">Sexo</label>';
        EditarGrupo = EditarGrupo + '<div class="form-check">';
        EditarGrupo = EditarGrupo + '<input class="form-check-input" type="radio" value="M" name="gender'+count+'" checked="true">';
        EditarGrupo = EditarGrupo + '<label class="form-check-label">Masculino</label>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<div class="form-check">';
        EditarGrupo = EditarGrupo + '<input class="form-check-input" type="radio" value="F" name="gender'+count+'">';
        EditarGrupo = EditarGrupo + '<label class="form-check-label">Femenino</label>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<!-- /.card-body -->';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<div class="modal-footer justify-content-between">';
        EditarGrupo = EditarGrupo + '<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>';
        EditarGrupo = EditarGrupo + '<button type="button" class="btn btn-primary" onclick=(EditarEstudante('+count+'))>Gravar</button>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<!-- /.modal-content -->';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<!-- /.modal-dialog -->';
        EditarGrupo = EditarGrupo + '</div>';        

        var $tr = $('<tr>').append(
            $('<td>').text(item.studentID),
            $('<td>').text(item.gender),
            $('<td>').text(item.name),
            $('<td>').html(btnRow)
        );

        console.log($tr);

        $("#parents tbody").append($tr);

    }); 
    
    $("#modelContainer").html(EditarGrupo);

}

var exemplo = [
    {"studentID": "1", "gender":"M", "name":"Alfredo"},
    {"studentID": "2", "gender":"F", "name":"Neide"}
];

// bindTable(exemplo);

function EditarEstudante(EstudanteID){
    console.log(EstudanteID);
    var newName = $("#Name"+EstudanteID).val();
    var gender = $("input[name='gender"+EstudanteID+"']:checked").val();
    console.log(newName);
    console.log(gender);
}

var data = {
    "header": GlobalHeader,
    "body": GlobalHeader.AccountID
};

sendrequest(data);

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
            console.log(xhr);
            console.log("Ocorreu um erro na operacao");
            Toast.fire({type: 'error', title: 'Estudante Cadastrado com Sucesso!'});
        },
        success: function (xhr) { 
            console.log(xhr);
            if(xhr.header.code == "200"){
                console.log("Operacao executada com sucesso!");
                Toast.fire({type: 'success', title: 'Estudante Cadastrado com Sucesso!'});
                limparCampos();
            }else{
                console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) { 
            console.log("Operacacao terminada");
         }
    });
}

