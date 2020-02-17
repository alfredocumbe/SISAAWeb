
function bindTable(data){
        
    $("#group").dataTable().fnClearTable();
    
    var count = 0;

   
    $.each(data, function(i, item) {

        count = count + 1;

        console.log(item.name);

        $('#group').dataTable().fnAddData([
            item.name
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
        url: GlobalBaseURL + "api/Account/GetAllGroup",
        dataType: "json", 
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { 
        },
        error: function (xhr) { 
            loadingStop();
        },
        success: function (xhr) { 
            
            if (xhr.header.code == "200") {
                bindTable(xhr.body); 
            }else{
            }
        },
        complete: function (xhr) { 
         }
    });
}



sendrequest();