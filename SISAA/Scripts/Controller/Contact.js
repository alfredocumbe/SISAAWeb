var Estudantes = [];

function bindTable(data){
    

    $("#contactos").dataTable().fnClearTable();
    var count = 0;    

    $.each(data, function (i, item) {

        var deleted = "N&Atilde;O"
        count = count + 1;

        //TESTE
        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';
        
        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteContact(\'' + item.contactID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';

        if (item.isDeleted == false) {
            deleted = "SIM"
        }

        $('#contactos').dataTable().fnAddData([
            item.name,
            item.email,
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
        url: GlobalBaseURL + "api/Account/GetAllContacts",
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
                console.log(xhr.body);
                $('#ContactsData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body);
                
            }
        },
        complete: function (xhr) {
        }
    });
}


function sendRequestEditarContacto(data) {
    $.ajax({
        url: GlobalBaseURL + "api/Contact/UpdateContact",
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
            bindTable(xhr.body);
            if (xhr.header.code == "200") {

                limparCampos();
            } else {

            }

        },
        complete: function (xhr) {

        }
    });
}



function deleteContact(contactID) {
    
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
                    url: GlobalBaseURL + "api/Contact/DeleteContact",
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
                            loadData();                            
                            $.alert('Encarregado removido com sucesso!');

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

function getContact (contactData, contactID) {

    for (var i = 0; i < contactData.length; i++) {
        var obj = contactData[i];
        if (obj.contactID == contactID) {
            return obj;
        }

    }
}


function Edit(contactID) {
    var contactData = JSON.parse($("#ContactsData").val());

    var objContact = getContact(contactData, contactID);

    $("#parentID").val(objContact.parentID);
    $("#parentName").val(objContact.name);
    $("#parentProfissao").val(objContact.profession);
    $("#parentAddress").val(objContact.address);
    $("#parentPhone").val(objContact.cellphone);   

    $("#editContact").modal()
}


$("#form1").submit(function (event) {
    event.preventDefault();
    var parentID = $("#parentID").val();
    var parentName = $("#parentName").val();
    var parentProfissao = $("#parentProfissao").val();
    var parentAddress = $("#parentAddress").val();
    var parentPhone = $("#parentPhone").val();

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

    sendRequestEditarContacto(data);

});



loadData();