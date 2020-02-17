
function bindTable(data){
    
    console.log(data);

    $('#users').dataTable().fnClearTable();
    var count = 0;

    $.each(data, function(i, item) {

        count = count + 1;

        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="Edit(\'' + item.userID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-user-edit"></i>Editar</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="ChangePassword(\'' + item.userID + '\');" data-toggle="modal" data-target="#VerEncarregado' + count + '"><i class="fas fa-eye nav-icon"></i>Reset Password</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteUser(\'' + item.userID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';

        var bloqueado;
        if(item.isBloqued==true){
            bloqueado = "SIM"
        }else{
            bloqueado = "NAO"
        }
       

        $('#users').dataTable().fnAddData([
            item.name,
            item.userName,
            item.cellphone,
            bloqueado,
            btnRow
        ]);        
        
    }); 

  }

function sendrequest() {
    var data = {
        "header": GlobalUser.header,
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
                $('#UsersData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body);        
            }else{
                //console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) { 
            //console.log("Operacacao terminada");
         }
    });
}


function sendRequestEditarUser(data) {
    event.preventDefault();
    $.ajax({
        url: GlobalBaseURL + "api/User/ChangeUserBasicData",
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

            Toast.fire({ type: 'success', title: 'Alteração executada com sucesso!' });

            if (xhr.header.code == "200") {
                Toast.fire({ type: 'success', title: 'Alteração executada com sucesso!' });
                sendrequest();
                $("#editUser").modal("hide");
            } else {

            }

        },
        complete: function (xhr) {

        }
    });
}



function deleteUser(userID) {
    event.preventDefault();
    $.confirm({
        title: 'Remover encarregado!',
        content: 'Certeza que deseja remover este utilizador?',
        buttons: {

            confirm: function () {

                var data = {
                    "header": GlobalUser.header,
                    "body": userID
                };

                $.ajax({
                    url: GlobalBaseURL + "api/User/DeleteUser",
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
                            Toast.fire({ type: 'success', title: 'Utilizador removido com sucesso!' });
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

function getUser(userData, userID) {

    for (var i = 0; i < userData.length; i++) {
        var obj = userData[i];
        if (obj.userID == userID) {
            return obj;
        }

    }
}


function Edit(userID) {
    var userData = JSON.parse($("#UsersData").val());

    var objUser = getUser(userData, userID);
    console.log(userID);
    $("#userID").val(objUser.userID);
    $("#userFullName").val(objUser.name);
    $("#userName").val(objUser.userName);

    $("#editUser").modal()
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
        Toast.fire({ type: 'error', title: 'O campo Empresa nao pode ser vazio!' });
    }

    if (userConfirm != userPassword) {
        isValid = false;
        Toast.fire({ type: 'error', title: 'Password nao combinam' });
    }

    return isValid;

}


$("#form1").submit(function (event) {
    event.preventDefault();
    var userFullName = $("#userFullName").val();
    var userName = $("#userName").val();
    var userID = $("#userID").val();

    console.log(userID);

    var body = {
        "UserID": userID,
        "Name": userFullName,
        "UserName": userName,
        "AccountID": GlobalUser.header.AccountID
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    sendRequestEditarUser(data);

});

sendrequest();