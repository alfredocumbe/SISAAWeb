
function loadData() {
    
    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/SMS/GetAllSentSMS",
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

                $('#SentData').val(JSON.stringify(xhr.body));
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

    console.log(data);

    var count = 0;  

    // clear the table before populating it with more data
    $("#sentsms").DataTable().clear();

    $.each(data, function (i, item) {

        count = count + 1;

        var sentDateTime = new Date(item.sentDateTime).format("dd-MM-yyyy HH:mm:ss");    

        var btnRow = '<div class="btn-group" role="group" aria-label="Button group with nested dropdown">';

        btnRow = btnRow + '<div class="btn-group" role="group">';
        btnRow = btnRow + '<button id="btnGroupDrop' + count + '" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    Opera&ccedil;&otilde;es  </button>';
        btnRow = btnRow + '<div class="dropdown-menu" aria-labelledby="btnGroupDrop' + count + '">';
        btnRow = btnRow + '<a class="dropdown-item" href="#" onclick="SmsJoinGroup(\'' + item.smsid + '\',\'' + item.groupID +'\');" data-toggle="modal" data-target="#VerEncarregado' + count + '"><i class="fas fa-eye nav-icon"></i>Ver Detalhes</a>'; 
        btnRow = btnRow + '</div></div></div>';

        $('#sentsms').dataTable().fnAddData([
            item.message,
            sentDateTime,
            item.groupName,
            btnRow
        ]);
    });

    loadingStop();
}

function SmsJoinGroup(smsID, groupID) {
    console.log(groupID);
    $(location).attr('href', "/Pages/ContactGroupReceiveSMS?ID=" + smsID + "&CODE=" + groupID) ;
}


loadData();

