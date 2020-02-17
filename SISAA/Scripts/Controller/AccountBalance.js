
function bindTableTransations(data) {

    console.log(data);

    $('#balance').dataTable().fnClearTable();
    var transationType =""
    

    var count = 0;
    
    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            if (item.transationType == "IN") {
                transationType = "CREDITO";
            } else {
                transationType = "DEBITO"
            }

            count = count + 1;
            var dataCriacao = new Date(item.created).format("dd-MM-yyyy HH:mm:ss");           

            $('#balance').dataTable().fnAddData([
                transationType,
                item.transacionAmount,
                item.accountOldBalance,
                item.accountNewBalance,
                dataCriacao
            ]);
        }

    });

    loadingStop();
}


function getUsedBalance() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/GetTotalSent",
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
               
                $("#usedBalance").html(xhr.body);
            }
        },
        complete: function (xhr) {
        }
    });
}


function getCurrentBalance() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/GetAccountBalance",
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

                $("#currentBalance").html(xhr.body);
                getUsedBalance();
                
            }
        },
        complete: function (xhr) {
        }
    });

    sendrequest();
}

function sendrequest() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/AccountBalance/GetAllAccountTransaction",
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
                bindTableTransations(xhr.body);
            }
        },
        complete: function (xhr) {
        }
    });
}

getCurrentBalance();

