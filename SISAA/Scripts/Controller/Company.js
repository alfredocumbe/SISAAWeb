
function bindTable(data){
    
    console.log(data);

    $('#accounts').dataTable().fnClearTable();
    
    var count = 0;
       
   
    $.each(data, function(i, item) {

        count = count + 1;
        var deleted = "N&Atilde;O"
        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="Edit(\'' + item.accountId + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-user-edit"></i>Editar</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="ListStudents(\'' + item.accountId + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Ver Estudantes</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="ListGroups(\'' + item.accountId + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Ver Turmas</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="ListUsers(\'' + item.accountId + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Ver Utilizadores</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteAccount(\'' + item.accountId + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';
       
        if (item.isDeleted == false) {
            deleted = "SIM"
        }


        $('#accounts').dataTable().fnAddData([
            item.accountId,
            item.name,
            item.description,
            item.balance,
            deleted,
            btnRow
        ]);
                
    }); 
    loadingStop();
  }


function sendrequest() {
    var data = {
        "header": GlobalUser.header,
        "body": 0
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAll",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
        },
        error: function (xhr) { 
            loadingStop();
            Toast.fire({type: 'error', title: ''});
        },
        success: function (xhr) { 
            
            if (xhr.header.code == "200") {
                $('#AccountsData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body);  
            }else{
            }
        },
        complete: function (xhr) { 
         }
    });
}

function sendRequestEditarAccount(data) {
    console.log(data);

    event.preventDefault();
    $.ajax({
        url: GlobalBaseURL + "api/Account/UpdateAccount",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
        },
        error: function (xhr) {
            Toast.fire({ type: 'error', title: 'Erro na Alteracao de dados!' });
        },
        success: function (xhr) {

            if (xhr.header.code == "200") {
                Toast.fire({ type: 'success', title: 'Alteracao executada com sucesso!' });
                sendrequest();
                $("#editAccount").modal("hide")
            } else {

            }

        },
        complete: function (xhr) {

        }
    });
}

function ListStudents(AccountID) {
    $(location).attr('href', "/Pages/ListStudents?ID=" + AccountID);
}

function ListGroups(AccountID) {
    $(location).attr('href', "/Pages/ListGroups?ID=" + AccountID);
}

function ListUsers(AccountID) {
    $(location).attr('href', "/Pages/ListUsers?ID=" + AccountID);
}

function deleteAccount(accountID) {
    event.preventDefault();
    $.confirm({
        title: 'Remover Escola!',
        content: 'Certeza que deseja remover esta Escola?',
        buttons: {

            confirm: function () {

                var data = {
                    "header": GlobalUser.header,
                    "body": accountID
                };

                $.ajax({
                    url: GlobalBaseURL + "api/Account/DeleteAccount",
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
                            Toast.fire({ type: 'success', title: 'Escola removida com sucesso!' });
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

function getAccount(accountData, accountID) {

    for (var i = 0; i < accountData.length; i++) {
        var obj = accountData[i];
        if (obj.accountId == accountID) {
            return obj;
        }

    }
}


function Edit(accountID) {
    
    var accontData = JSON.parse($("#AccountsData").val());

    var objUser = getAccount(accontData, accountID);

    $("#accountID").val(objUser.accountId);
    $("#ShortName").val(objUser.name);
    $("#LongName").val(objUser.description);

    $("#editAccount").modal()
}

function ChangePassword(userID) {

    var userData = JSON.parse($("#UsersData").val());

    var objUser = getUser(userData, userID);

    $("#userID").val(objUser.userID);

    $("#changePassword").modal()
}




function validar() {
    var isValid = true;

    // TUDO 
    var userPassword = $("#userPassword").val();
    var userConfirm = $("#userConfirm").val();

    if (account == "0") {
        isValid = false;
        Toast.fire({ type: 'error', title: 'O campo Escola nao pode ser vazio!' });
    }

    if (userConfirm != userPassword) {
        isValid = false;
        Toast.fire({ type: 'error', title: 'Password nao combinam' });
    }

    return isValid;

}

$("#form1").submit(function (event) {
    event.preventDefault();
    var ShortName = $("#ShortName").val();
    var LongName = $("#LongName").val();
    var accountID = $("#accountID").val();
    var body = {
        "name": ShortName,
        "description": LongName,
        "AccountID": accountID
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    sendRequestEditarAccount(data);

});

sendrequest();