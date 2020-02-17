

function bindTableSMSDetails(data) {


    $('#smsDetails').dataTable().fnClearTable();

    

    var count = 0;
    

    $.each(data, function (i, item) {

        if (typeof item != "undefined") {

            count = count + 1;
            var sentDateTime = new Date(item.sentDateTime).format("dd-MM-yyyy HH:MM");             

            $('#smsDetails').dataTable().fnAddData([
                item.message,
                sentDateTime,
                item.groupName,
                item.name,
                item.cellphone
            ]);
        }

    });

    loadingStop();
}


function GetSMSDetails() {
    var body ={
        "smsid": ID,
        "groupID": CODE
    };

    var data = {
        "header": GlobalUser.header,
        "body": body
    };

    console.log(data);

    $.ajax({
        url: GlobalBaseURL + "api/SMS/GetAllContactGroupReceiveSMS",
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

                bindTableSMSDetails(xhr.body);
            }
        },
        complete: function (xhr) {
        }
    });
}



GetSMSDetails();