
function sendrequest() {
    console.log(GlobalUser.header);

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllStudent",
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
            bindTable(xhr.body);
            if(xhr.header.code == "200"){
                //console.log("Operacao executada com sucesso!");
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

function sendRequestEditarEstudante(data) {
    event.preventDefault();
    $.ajax({
        url: GlobalBaseURL + "api/Student/UpdateStudent",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
        },
        error: function (xhr) { 
            Toast.fire({type: 'error', title: 'Erro na Alteracao de dados!'});
        },
        success: function (xhr) {            
            
            if (xhr.header.code == "200") {
                loadData();
                Toast.fire({ type: 'success', title: 'Alteracao feita com Sucesso!' });
                $("#editStudent").modal("hide");
            } else {

            }
            
        },
        complete: function (xhr) { 

         }
    });    
}



function loadData() {
    
    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllStudent",
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
            Toast.fire({ type: 'error', title: '' });
        },
        success: function (xhr) {
            
            if (xhr.header.code == "200") {

                $('#StudentsData').val(JSON.stringify(xhr.body));
                populateDataTable(xhr.body);

            } else {
                //console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) {
            //console.log("Operacacao terminada");
        }
    });
}

// populate the data table with JSON data
function populateDataTable(data) {
   
    var count = 0;  

    // clear the table before populating it with more data
    $("#example1").DataTable().clear();

    $.each(data, function (i, item) {

        count = count + 1;

        var sexo = "";
        var deleted ="N&Atilde;O"

        if (item.gender == "M") {
            sexo = "Masculino"
        } else {
            sexo = "Feminino";
        }

        if (item.isDeleted == false) {

            deleted ="SIM"
        }

        var btnRow = '<div class="btn-group pull-right" role="group" aria-label="Button group with nested dropdown">';

        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="Edit(\'' + item.studentID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-user-edit"></i>Editar</a>';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="JoinStudentParent(\'' + item.studentID + '\');" data-toggle="modal" data-target="#VerEncarregado' + count + '"><i class="fas fa-eye nav-icon"></i>Ver Encarregados</a>'; 
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="deleteStudent(\'' + item.studentID + '\');" data-toggle="modal" data-target="#EditarEstudante' + count + '"><i class="fas fa-trash-alt"></i>Remover</a>';
        btnRow = btnRow + '</div></div></div>';

        $('#example1').dataTable().fnAddData([
            item.name,
            sexo,
            btnRow
        ]);
    });

    loadingStop();
}


function getStudent(studentData, studentID) {

    for (var i = 0; i < studentData.length; i++) {
        var obj = studentData[i];
        if (obj.studentID == studentID) {            
            return obj;
        }

    }
}

function JoinStudentParent(studentID) {
    $(location).attr('href', "/Pages/StudentParent?ID=" + studentID);
}

function deleteStudent(studentID) {
    event.preventDefault();
    $.confirm({
        title: 'Remover estudante!',
        content: 'Certeza que deseja remover este estudante?',
        buttons: {

            confirm: function () {

                var data = {
                    "header": GlobalUser.header,
                    "body": studentID
                };

                $.ajax({
                    url: GlobalBaseURL + "api/Student/DeleteStudent",
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
                            Toast.fire({ type: 'success', title: 'Estudante removido com sucesso!' });

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


function Edit(studentID) {
    var objStudent;
    var studentData = JSON.parse($("#StudentsData").val());

    

    var objStudent = getStudent(studentData, studentID);

    console.log(objStudent);

    console.log(objStudent);

    var sexoM = false;
    var sexoF = false;

    console.log(objStudent.studentID);

    if (objStudent.gender == "M") {
        sexoM = true;
    }

    console.log(objStudent.studentID);

    if (objStudent.gender == "F") {
        sexoF = true;
    }
    $("#gender_1").attr('checked', sexoM);
    $("#gender_2").attr('checked', sexoF);
    $('#studentName').val(objStudent.name);
    $('#studentID').val(objStudent.studentID);

    $("#editStudent").modal() 
}


$("#form1").submit(function (event) {
    event.preventDefault();
    var studentID = $("#studentID").val();
    var studentName = $("#studentName").val();
    var sexo = $("input[name='gender']:checked").val();

    var body = {
        "StudentID": studentID,
        "name": studentName,
        "gender": sexo
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    sendRequestEditarEstudante(data);

});


loadData();



//sendrequest();