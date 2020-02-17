
function bindTable(data){
    
    console.log(data);

    $("#users").dataTable().fnClearTable();
    
    var count = 0;

   
   
    $.each(data, function(i, item) {

        count = count + 1;

       
       
        $('#users').dataTable().fnAddData([
            item.name,
            item.userName,
            item.cellphone
        ]);

    }); 

    loadingStop();

  }


function sendrequest() {
    var data = {
        "header": GlobalUser.header,
        "body": ID
    };

    $.ajax({
        url: GlobalBaseURL + "api/Account/GetAllUsers",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {  
        },
        error: function (xhr) { 
            loadingStop();
            Toast.fire({type: 'error', title: ''});
        },
        success: function (xhr) { 
            
            if (xhr.header.code == "200") {
                $('#UsersData').val(JSON.stringify(xhr.body));
                bindTable(xhr.body);
            }else{
            }
        },
        complete: function (xhr) { 
         }
    });
}

sendrequest();