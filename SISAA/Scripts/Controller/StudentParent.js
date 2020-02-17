var allParents =[];
var parentsRelated = [];

function bindTableStudentParents(data) {


    $('#studentsParents').dataTable().fnClearTable();

    var count = 0;
    
    $.each(data, function (i, item) {

        count = count + 1;

        //TESTE
        var btnRow = '<span class="table-remove"><button type="button" onclick="RemoveJoinParent(\'' + ID + '\',\'' + item.parentID +'\');" class="btn btn-block bg-gradient-danger btn-xs">Remover</button></span>';

        $('#studentsParents').dataTable().fnAddData([
            item.name,
            item.profession,
            item.address,
            item.cellphone,
            btnRow
        ]);
        

    });

    loadingStop();
}

function removeItems() {
    $("#parents tbody tr").remove();
}

function bindTableParents(data) {

    

    //$("#parents tbody tr").remove();

    $('#parents').dataTable().fnClearTable();
    //$('#parents').dataTable().fnDraw();
    //$('#parents').dataTable().fnDestroy();

    

    var count = 0;
    
    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            count = count + 1;

            //TESTE
            var btnRow = '<span class="table-remove"><button type="button" onclick="JoinParent(\'' + ID + '\',\'' + item.parentID + '\');" class="btn btn-block bg-gradient-success btn-xs">Adiconar</button></span>';

            $('#parents').dataTable().fnAddData([
                item.name,
                item.profession,
                item.address,
                item.cellphone,
                btnRow
            ]);
        }

    });

    loadingStop();
}


function GetStudentParents() {
    
    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Parent/GetParentsByStudentID",
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
                parentsRelated = xhr.body;
                bindTableStudentParents(xhr.body);
                
            }
        },
        complete: function (xhr) {
        }
    });
}

function GetParents() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Parent/GetEligibleParants",
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
                allParents = xhr.body;
                bindTableParents(xhr.body);
                GetStudentParents();
            }
        },
        complete: function (xhr) {
        }
    });
}

function GetStudentName() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Student/GetStudent",
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
                $(".studentName").html(xhr.body.name);
            }
        },
        complete: function (xhr) {
        }
    });
}


function JoinParent(studentID, parentID) {
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

                var objParent = getParent(allParents, parentID)
        
                parentsRelated.push(objParent);


                var allParentTemp = [];
                for (var i = 0; i < allParents.length; i++) {
                    var obj = allParents[i];
                    if (obj.parentID != parentID) {
                        allParentTemp.push(obj);
                    }
                }

                parentsRelated = parentsRelated.filter(function (el) {
                    return el != null;
                });

                allParents = allParents.filter(function (el) {
                    return el != null;
                });

                allParents = allParentTemp;       


                bindTableParents(allParents);
                
                bindTableStudentParents(parentsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}

function RemoveJoinParent(studentID, parentID) {
        
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
                
                var objP = getParent(allParents, parentID)
             
                allParents.push(objP);


                var allRelatedParentTemp = [];
                for (var i = 0; i < parentsRelated.length; i++) {
                    var obj = parentsRelated[i];
                    if (obj.parentID != parentID) {
                        allRelatedParentTemp.push(obj);
                    }
                }

                parentsRelated = allRelatedParentTemp;

                parentsRelated = parentsRelated.filter(function (el) {
                    return el != null;
                });

                allParents = allParents.filter(function (el) {
                    return el != null;
                });


                console.log(allParents);
                console.log(parentsRelated);

                bindTableParents(allParents);

                bindTableStudentParents(parentsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}


function getParent(parentData, parentID) {

    for (var i = 0; i < parentData.length; i++) {
        var obj = parentData[i];
        if (typeof obj != "undefined") {
            if (obj.parentID == parentID) {
                return obj;
            }
        }

    }
}

GetStudentName();
GetParents();