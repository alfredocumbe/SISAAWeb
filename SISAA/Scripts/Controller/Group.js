
function bindTable(data){
    
    console.log(data);

    $("#group").dataTable().fnClearTable();
    
    var count = 0;

   
    $.each(data, function(i, item) {

        count = count + 1;
        var deleted = "N&Atilde;O"
        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="Edit(\'' + item.groupID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-user-edit"></i>Editar</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="JoinGroupContact(\'' + item.groupID + '\');" data-toggle="modal" data-target="#VerEncarregado' + count + '"><i class="fas fa-eye nav-icon"></i>Ver Contactos</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteGroup(\'' + item.groupID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';
       
        
        if (item.isDeleted == false) {
            deleted = "SIM"
        }

        $('#group').dataTable().fnAddData([
            item.name,
            btnRow
        ]);
              
        
    }); 

     loadingStop();
  }



function sendrequest() {
    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllGroup",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
        },
        error: function (xhr) { 
            loadingStop();
        },
        success: function (xhr) { 
            
            if (xhr.header.code == "200") {
                $('#GroupsData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body); 
            }else{
            }
        },
        complete: function (xhr) { 
         }
    });
}


function sendRequestEditarGroup(data) {
    event.preventDefault();
    $.ajax({
        url: GlobalBaseURL + "api/Group/UpdateGroup",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
        },
        error: function (xhr) {
            Toast.fire({ type: 'error', title: 'Erro na Alteração de dados!' });
        },
        success: function (xhr) {

            
            if (xhr.header.code == "200") {
                sendrequest();
                Toast.fire({ type: 'success', title: 'Alteração feita com sucesso!' });                
                $("#editGroup").modal("hide");
            } else {

            }

        },
        complete: function (xhr) {

        }
    });
}

function JoinGroupContact(groupID) {
    $(location).attr('href', "/Pages/ContactGroup?ID=" + groupID);
}

function deleteGroup(groupID) {

    $.confirm({
        title: 'Remover Turma!',
        content: 'Certeza que deseja remover esta Turma?',
        buttons: {

            confirm: function () {

                var data = {
                    "header": GlobalUser.header,
                    "body": groupID
                };

                $.ajax({
                    url: GlobalBaseURL + "api/Group/DeleteGroup",
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
                            sendrequest();
                            Toast.fire({ type: 'success', title: 'Turma removido com sucesso!' });

                        } else {
                        }
                    },
                    complete: function (xhr) {
                    }
                });


            },
            cancel: function () {

            }
        }
    });
}

function getGroup(groupData, groupID) {

    for (var i = 0; i < groupData.length; i++) {
        var obj = groupData[i];
        if (obj.groupID == groupID) {
            return obj;
        }

    }
}


function Edit(groupID) {
    var groupData = JSON.parse($("#GroupsData").val());

    var objGroup = getGroup(groupData, groupID);

    $("#groupID").val(objGroup.groupID);
    $("#groupName").val(objGroup.name);

    $("#editGroup").modal()
}


$("#form1").submit(function (event) {
    event.preventDefault();
    var groupID = $("#groupID").val();
    var groupName = $("#groupName").val();

    var body = {
        "groupID": groupID,
        "name": groupName,
        "AccountID": GlobalUser.header.AccountID
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    sendRequestEditarGroup(data);

});




sendrequest();