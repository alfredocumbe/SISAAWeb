
function requestGrupos(){

    var data = {
        "header": GlobalHeader,
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
            bindGroup(xhr.body);
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });       
};

function bindGroup(data){
    console.log(data);   
    var htmlGroup = '';
    var teste = '';

    for (i = 0; i < data.length; i++) {
        htmlGroup = htmlGroup  + '<li>';
        htmlGroup = htmlGroup  + '    <div class="icheck-success d-inline">';
        htmlGroup = htmlGroup + '                                            <input type="checkbox" class="checkGroup" id="checkboxSuccess3'+i+'" name="checkGroup" value='+data[i].groupID+' >';
        htmlGroup = htmlGroup  + '                                            <label for="checkboxSuccess3'+i+'">';
        htmlGroup = htmlGroup  + '                                                '+data[i].name;
        htmlGroup = htmlGroup  + '                                            </label>';
        htmlGroup = htmlGroup  + '                                        </div>';
        htmlGroup = htmlGroup  + '</li>';
    }

    $("#groups").html(htmlGroup);

};

function selecionarGrupo(obj){
    console.log(obj);
}

requestGrupos();
