var Estudantes = [];

function bindTable(data){


    console.log(data);

    $("#parentes").dataTable().fnClearTable();
    
    var count = 0;
    

    $.each(data, function (i, item) {

        var deleted = "N&Atilde;O"
        count = count + 1;

        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="Edit(\'' + item.parentID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-user-edit"></i>Editar</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="JoinStudentParent(\'' + item.parentID + '\');" data-toggle="modal" data-target="#VerEncarregado' + count + '"><i class="fas fa-eye nav-icon"></i>Ver Estudantes</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteParent(\'' + item.parentID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';

        if (item.isDeleted == false) {
            deleted = "SIM"
        }

        $('#parentes').dataTable().fnAddData([
            item.name,
            item.profession,
            item.address,
            item.cellphone,
            btnRow
        ]);
        
    }); 

    loadingStop();
}

function loadData() {
    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllParent",
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

                $('#ParentsData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body);
                
            }
        },
        complete: function (xhr) {
        }
    });
}


function sendRequestEditarParente(data) {
    event.preventDefault();
    console.log("Update parent")
    $.ajax({
        url: GlobalBaseURL + "api/Parent/UpdateParent",
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
                loadData();
                Toast.fire({ type: 'success', title: 'Alteracao feita com Sucesso!' });
                $("#editParent").modal("hide");
            } else {

            }

        },
        complete: function (xhr) {

        }
    });
}

function JoinStudentParent(studentID) {
    $(location).attr('href', "/Pages/ParentStudent?ID=" + studentID);
}


function deleteParent(parentID) {
    event.preventDefault();

    $.confirm({
        title: 'Remover encarregado!',
        content: 'Certeza que deseja remover este encarregado?',
        buttons: {

            confirm: function () {

                var data = {
                    "header": GlobalUser.header,
                    "body": parentID
                };


                $.ajax({
                    url: GlobalBaseURL + "api/Parent/DeleteParent",
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
                        loadData();
                        Toast.fire({ type: 'success', title: 'Encarregado removido com sucesso!' });
                        if (xhr.header.code == "200") {
                           

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

function getParent(parentData, parentID) {

    for (var i = 0; i < parentData.length; i++) {
        var obj = parentData[i];
        if (obj.parentID == parentID) {
            return obj;
        }

    }
}


function Edit(parentID) {
    var parentData = JSON.parse($("#ParentsData").val());

    var objParent = getParent(parentData, parentID);

    $("#parentID").val(objParent.parentID);
    $("#parentName").val(objParent.name);
    $("#parentProfissao").val(objParent.profession);
    $("#parentAddress").val(objParent.address);
    $("#parentPhone").val(objParent.cellphone);   

    $("#editParent").modal()
}


$("#form1").submit(function (event) {
    event.preventDefault();
    var parentID = $("#parentID").val();
    var parentName = $("#parentName").val();
    var parentProfissao = $("#parentProfissao").val();
    var parentAddress = $("#parentAddress").val();
    var parentPhone = $("#parentPhone").val();
    parentPhone = parentPhone.replace("(", "").replace(")", "").replace("-", "").replace(" ", "");
    var body = {
        "parentID": parentID,
        "name": parentName,
        "profession": parentProfissao,
        "address": parentAddress,
        "cellphone": parentPhone,
        "AccountID": GlobalUser.header.AccountID
    }

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    sendRequestEditarParente(data);

});



loadData();