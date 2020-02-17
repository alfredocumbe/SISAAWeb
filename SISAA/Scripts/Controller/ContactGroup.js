var allContacts = [];
var contactsRelated = [];

function bindTableGrouContact(data) {

    $('#groupContacts').dataTable().fnClearTable();

    var count = 0;

    $.each(data, function (i, item) {
        if (typeof item != "undefined") {
            count = count + 1;

            //TESTE
            var btnRow = '<span class="table-remove"><button type="button" onclick="RemoveJoinContact(\'' + ID + '\',\'' + item.contactID + '\');" class="btn btn-block bg-gradient-danger btn-xs">Remover</button></span>';

            $('#groupContacts').dataTable().fnAddData([
                item.name,
                item.cellphone,
                item.email,
                btnRow
            ]);
        }
    });

    loadingStop();
}



function bindTableContacts(data) {



    //$("#parents tbody tr").remove();

    $('#contacts').dataTable().fnClearTable();
    //$('#parents').dataTable().fnDraw();
    //$('#parents').dataTable().fnDestroy();



    var count = 0;

    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            count = count + 1;

            //TESTE
            var btnRow = '<span class="table-remove"><button type="button" onclick="JoinContact(\'' + ID + '\',\'' + item.contactID + '\');" class="btn btn-block bg-gradient-success btn-xs">Adiconar</button></span>';

            $('#contacts').dataTable().fnAddData([
                item.name,
                item.cellphone,
                item.email,
                btnRow
            ]);
        }

    });

    loadingStop();
}


function GetGroupName() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Group/GetGroup",
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
                $(".groupName").html(xhr.body.name);
            }
        },
        complete: function (xhr) {
        }
    });

    console.log("Buscar Nome Grupo");
}

function GetGroupContacts() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Group/GetAllContact",
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
                contactsRelated = xhr.body;
                bindTableGrouContact(xhr.body);

            }
        },
        complete: function (xhr) {
        }
    });

    console.log("Buscar Contactos Grupo");
}

function GetContacts() {

    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Contact/GetEligibleContacts",
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
                allContacts = xhr.body;
                bindTableContacts(xhr.body);
                GetGroupContacts();
            }
        },
        complete: function (xhr) {
        }
    });

    console.log("Buscar Contactos");

}


function JoinContact(groupID, contactID) {

    event.preventDefault();
    var body = {
        "groupID": groupID,
        "contactID": contactID
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    $.ajax({
        url: GlobalBaseURL + "api/Contact/JoinContactGroup",
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

                var objContact = getContact(allContacts, contactID);

                contactsRelated.push(objContact);


                var allContactTemp = [];
                for (var i = 0; i < allContacts.length; i++) {
                    var obj = allContacts[i];
                    if (obj.contactID != contactID) {
                        allContactTemp.push(obj);
                    }
                }

                contactsRelated = contactsRelated.filter(function (el) {
                    return el != null;
                });

                allContacts = allContacts.filter(function (el) {
                    return el != null;
                });


                allContacts = allContactTemp;


                bindTableContacts(allContacts);

                bindTableGrouContact(contactsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}

function RemoveJoinContact(groupID, contactID) {

    event.preventDefault();
    var body = {
        "groupID": groupID,
        "contactID": contactID
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    $.ajax({
        url: GlobalBaseURL + "api/Contact/RemoveJoinContactGroup",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log(xhr);
        },
        error: function (xhr) {
            console.log(xhr);
            loadingStop();
            Toast.fire({ type: 'error', title: '' });
        },
        success: function (xhr) {

            if (xhr.header.code == "200") {

                var objContact = getContact(contactsRelated, contactID);

                //console.log(objContact);

                allContacts.push(objContact);


                var allRelatedContactTemp = [];
                for (var i = 0; i < contactsRelated.length; i++) {
                    var obj = contactsRelated[i];
                    if (obj.contactID != contactID) {
                        allRelatedContactTemp.push(obj);
                    }
                }

                contactsRelated = allRelatedContactTemp;

                contactsRelated = contactsRelated.filter(function (el) {
                    return el != null;
                });

                allContacts = allContacts.filter(function (el) {
                    return el != null;
                });


                //console.log(allContacts);
                //console.log(contactsRelated);

                bindTableContacts(allContacts);

                bindTableGrouContact(contactsRelated);

            }
        },
        complete: function (xhr) {
        }
    });

}


function getContact(contactData, contactID) {

    for (var i = 0; i < contactData.length; i++) {
        var obj = contactData[i];
        if (typeof obj != "undefined") {
            if (obj.contactID == contactID) {
                return obj;
            }
        }

    }
}


GetGroupName();
GetContacts();