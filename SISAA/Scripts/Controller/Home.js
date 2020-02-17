

function getUsedBalance() {

    var data = {
        "header": GlobalUser.header,
        "body": GlobalUser.header.AccountID
    };

    $.ajax({
        url: GlobalBaseURL + "api/BaseBalance/GetTotalSent",
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
        url: GlobalBaseURL + "api/BaseBalance/GetBaseBalance",
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
                //getUsedBalance();
                
            }
        },
        complete: function (xhr) {
        }
    });
}




getCurrentBalance();

