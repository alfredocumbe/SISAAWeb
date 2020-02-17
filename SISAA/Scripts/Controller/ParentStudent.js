var allStudents =[];
var studentsRelated = [];

function bindTableParentStudents(data) {

    $('#studentsParents').dataTable().fnClearTable();

    var count = 0;
    
    $.each(data, function (i, item) {
        if (typeof item != "undefined") {
            count = count + 1;

            var sexo = "";

            if (item.gender == "M") {
                sexo = "Masculino"
            } else {
                sexo = "Feminino";
            }

            //TESTE
            var btnRow = '<span class="table-remove"><button type="button" onclick="RemoveJoinStudent(\'' + item.studentID + '\',\'' + ID + '\');" class="btn btn-block bg-gradient-danger btn-xs">Remover</button></span>';

            $('#studentsParents').dataTable().fnAddData([
                item.name,
                sexo,
                btnRow
            ]);


        }
    });

    loadingStop();
}

function removeItems() {
    $("#parents tbody tr").remove();
}

function bindTableStudents(data) {

    
    $('#students').dataTable().fnClearTable();
    

    var count = 0;
    
    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            count = count + 1;

            var sexo = "";

            if (item.gender == "M") {
                sexo = "Masculino"
            } else {
                sexo = "Feminino";
            }

            //TESTE
            var btnRow = '<span class="table-remove"><button type="button" onclick="JoinStudent(\'' + item.studentID + '\',\'' + ID + '\');" class="btn btn-block bg-gradient-success btn-xs">Adiconar</button></span>';

            $('#students').dataTable().fnAddData([
                item.name,
                sexo,
                btnRow
            ]);
        }

    });

    loadingStop();
}


function GetParentName() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Parent/GetParent",
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
                console.log(xhr.body.name);
                $(".parentName").html(xhr.body.name);
            }
        },
        complete: function (xhr) {
        }
    });
}


function GetParentStudents() {
    
    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Student/GetStudentsByParentID",
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
                studentsRelated = xhr.body;
                bindTableParentStudents(xhr.body);
                
            }
        },
        complete: function (xhr) {
        }
    });
}

function GetStudents() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };  

    $.ajax({
        url: GlobalBaseURL + "api/Student/GetEligibleStudents",
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
                allStudents = xhr.body;
                bindTableStudents(xhr.body);
                GetParentStudents();

            }
        },
        complete: function (xhr) {
        }
    });
}


function JoinStudent(studentID, parentID) {
    event.preventDefault();
    var body = {
        "studentID": studentID,
        "parentID": parentID
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    $.ajax({
        url: GlobalBaseURL + "api/Student/JoinStudentParent",
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

                var objStudent = getStudent(allStudents, studentID)

                console.log(objStudent);
        
                studentsRelated.push(objStudent);


                var allParentTemp = [];
                for (var i = 0; i < allStudents.length; i++) {
                    var obj = allStudents[i];
                    if (obj.studentID != studentID) {
                        allParentTemp.push(obj);
                    }
                }

                studentsRelated = studentsRelated.filter(function (el) {
                    return el != null;
                });

                allStudents = allStudents.filter(function (el) {
                    return el != null;
                });

                allStudents = allParentTemp;   


                console.log(allStudents);
                console.log(studentsRelated);

                bindTableStudents(allStudents);
                
                bindTableParentStudents(studentsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}

function RemoveJoinStudent(studentID, parentID) {
        
    event.preventDefault();
    var body = {
        "studentID": studentID,
        "parentID": parentID
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    $.ajax({
        url: GlobalBaseURL + "api/Student/RemoveJoinStudentParent",
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

                var objP = getStudent(allStudents, studentID)
             
                allStudents.push(objP);


                var allRelatedParentTemp = [];
                for (var i = 0; i < studentsRelated.length; i++) {
                    var obj = studentsRelated[i];
                    if (obj.studentID != studentID) {
                        allRelatedParentTemp.push(obj);
                    }
                }

                studentsRelated = allRelatedParentTemp;

                studentsRelated = studentsRelated.filter(function (el) {
                    return el != null;
                });

                allStudents = allStudents.filter(function (el) {
                    return el != null;
                });


                console.log(allStudents);
                console.log(studentsRelated);

                bindTableStudents(allStudents);

                bindTableParentStudents(studentsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}


function getStudent(studentData, studentID) {

    for (var i = 0; i < studentData.length; i++) {
        var obj = studentData[i];
        if (typeof obj != "undefined") {
            if (obj.studentID == studentID) {
                return obj;
            }
        }

    }
}


GetParentName();
GetStudents();