
var Encarregados = [];

function bindTable(data){
    
    $("#parents tbody tr").remove();
    
    var count = 0;
    var EditarGrupo = '';
    var VerEncarregado = '';
    buscarEncarregado();

    const sleep = (milliseconds) => {
        return new Promise(resolve => setTimeout(resolve, milliseconds))
    };
    sleep(500).then(() => {
        //do stuff
        console.log("Encarregados...");
        console.log(Encarregados);
    $.each(data, function(i, item) {

        count = count + 1;

        var sexoM = "";
        var sexoF = "";

        if(item.gender == "M"){
            sexoM = "checked='true'"
        }else{
            sexoF = "checked='true'";
        }

        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow  = btnRow + '<div class="btn-group" role="group">';
        btnRow  = btnRow + '<button id="btnGroupDrop'+count+'" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Comando </button>';
        btnRow  = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop'+count+'">';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarEstudante'+count+'">Editar Estudante</a>';
        btnRow  = btnRow + '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEncarregado'+count+'">Ver Encarregados</a>';
        btnRow  = btnRow + '</div></div></div>';

        var hiddenStudentID = '<input type="hidden" id="StudentID'+count+'" name="StudentID" value="'+item.studentID+'">';
        
        EditarGrupo = EditarGrupo + hiddenStudentID;

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
        EditarGrupo = EditarGrupo + '<input type="hidden" class="form-control" id="groupID'+count+'">';
        EditarGrupo = EditarGrupo + '<input type="text" value="'+item.name+'" id="Name'+count+'" class="form-control" placeholder="Digita nome">';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<div class="form-group">';
        EditarGrupo = EditarGrupo + '<label for="exampleInputGender">Sexo</label>';
        EditarGrupo = EditarGrupo + '<div class="form-check">';
        EditarGrupo = EditarGrupo + '<input class="form-check-input" type="radio" value="M" name="gender'+count+'" '+sexoM+'>';
        EditarGrupo = EditarGrupo + '<label class="form-check-label">Masculino</label>';
        EditarGrupo = EditarGrupo + '</div>';
        EditarGrupo = EditarGrupo + '<div class="form-check">';
        EditarGrupo = EditarGrupo + '<input class="form-check-input" type="radio" value="F" name="gender'+count+'"  '+sexoF+'>';
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
            $('<td class="d-none">').text(item.studentID),
            $('<td>').text(item.name),
            $('<td>').text(item.gender),
            $('<td>').html(btnRow)
        );

        $("#parents tbody").append($tr);

        var option = "";

        for (i = 0; i < Encarregados.length; i++) {
            option = option + '<option value="'+Encarregados[i].parentID+'">'+Encarregados[i].name+'</option>';
        }

        // $.each(Encarregados, function(i, item) {
        //     option = option + '<option value="'+item.parentID+'">'+item.name+'</option>';
        // });

        VerEncarregado = VerEncarregado + '<div class="modal fade" id="VerEncarregado'+count+'">';
        VerEncarregado = VerEncarregado + '<div class="modal-dialog modal-xl">';
        VerEncarregado = VerEncarregado + '    <div class="modal-content">';
        VerEncarregado = VerEncarregado + '        <div class="modal-header">';
        VerEncarregado = VerEncarregado + '            <h4 class="modal-title">Ver Encarregados ('+item.name+')</h4>';
        VerEncarregado = VerEncarregado + '            <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
        VerEncarregado = VerEncarregado + '                <span aria-hidden="true">&times;</span>';
        VerEncarregado = VerEncarregado + '            </button>';
        VerEncarregado = VerEncarregado + '        </div>';
        VerEncarregado = VerEncarregado + '        <div class="modal-body">';
        VerEncarregado = VerEncarregado + '            <div class="form-group">';
        VerEncarregado = VerEncarregado + '                <select class="duallistbox" multiple="multiple" id="duallistbox'+count+'" >';
        VerEncarregado = VerEncarregado + option;
        VerEncarregado = VerEncarregado + '                </select>';
        VerEncarregado = VerEncarregado + '            </div>';
        VerEncarregado = VerEncarregado + '        </div>';
        VerEncarregado = VerEncarregado + '        <div class="modal-footer justify-content-between">';
        VerEncarregado = VerEncarregado + '            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
        VerEncarregado = VerEncarregado + '            <button type="button" class="btn btn-primary" onclick="AssociarEncarregado('+count+')">Save changes</button>';
        VerEncarregado = VerEncarregado + '        </div>';
        VerEncarregado = VerEncarregado + '    </div>';
        VerEncarregado = VerEncarregado + '    <!-- /.modal-content -->';
        VerEncarregado = VerEncarregado + '</div>';
        VerEncarregado = VerEncarregado + '<!-- /.modal-dialog -->';
        VerEncarregado = VerEncarregado + '</div>';

    }); 

    $("#modelContainer").html(EditarGrupo + VerEncarregado);

    for (i = 0; i < count; i++) {
        $('#duallistbox'+i).bootstrapDualListbox();
    }

  });   
}

function EditarEstudante(count){

    var newName = $("#Name"+count).val();
    var gender = $("input[name='gender"+count+"']:checked").val();
    var StudentID = $("#StudentID"+count).val();

    var body = {
        "StudentID": StudentID,
        "name": newName,
        "gender": gender
    };

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    sendRequestEditarEstudante(data);

}

function sendrequest() {
    var data = {
        "header": GlobalHeader,
        "body": GlobalHeader.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account",
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
            bindTable(xhr.body);
            if(xhr.header.code == "200"){
                //console.log("Operacao executada com sucesso!");
                Toast.fire({type: 'success', title: ''});
                limparCampos();
                $('.duallistbox').bootstrapDualListbox();
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

function sendRequestEditarEstudante(data){
    $.ajax({
        url: GlobalBaseURL + "api/Student/UpdateStudent",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            //console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            //console.log(xhr);
            //console.log("Ocorreu um erro na operacao");
            Toast.fire({type: 'error', title: 'Estudante Cadastrado com Sucesso!'});
        },
        success: function (xhr) { 
            console.log(xhr);
            bindTable(xhr.body);
            if(xhr.header.code == "200"){
                //console.log("Operacao executada com sucesso!");
                Toast.fire({type: 'success', title: 'Estudante Cadastrado com Sucesso!'});
                limparCampos();
            }else{
                //console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });    
}

// const getUser = function (){
//     var Encarregados = [];
//     var data = {
//         "header": GlobalHeader,
//         "body": 0
//     };

//     $.ajax({
//         url: GlobalBaseURL + "api/Parent/GetALL",
//         dataType: "json",
//         contentType: "application/json",
//         method: "POST",
//         data: JSON.stringify(data),
//         beforeSend: function (xhr) { 
//             //console.log("Enviado os dados para o servidoor"); 
//         },
//         error: function (xhr) { 
//             //console.log(xhr);
//             //console.log("Ocorreu um erro na operacao");
//         },
//         success: function (xhr) { 
//             Encarregados = xhr.body
//             console.log("success");
//         },
//         complete: function (xhr) { 
//             //console.log("Operacacao terminada");
//          }
//     });  
//     return Encarregados;
// };

function buscarEncarregado(){
    
    var data = {
        "header": GlobalHeader,
        "body": 0
    };

    $.ajax({
        url: GlobalBaseURL + "api/Parent/GetALL",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
            //console.log("Enviado os dados para o servidoor"); 
        },
        error: function (xhr) { 
            //console.log(xhr);
            //console.log("Ocorreu um erro na operacao");
        },
        success: function (xhr) { 
            Encarregados = xhr.body
            console.log("success");
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });  
}

function AssociarEncarregado(count){
    console.log(count);
    console.log($("#duallistbox"+count));

    var selectedParents = [];
    $.each($("#duallistbox"+count), function(){            
        selectedParents.push($(this).val());
    });

    var data = {
        "header": GlobalHeader,
        "body": selectedParents[0]
    };

    //var selectedParent = $("#duallistbox"+count).children("option:selected").val();
    console.log(selectedParents[0]);
}

sendrequest();

