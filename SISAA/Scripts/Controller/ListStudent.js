
function loadData() {
    
    var data = {
        "header": GlobalUser.header,
        "body":ID
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
    $("#example1").DataTable().clear();

    $.each(data, function (i, item) {

        var sexo = "";
        count = count + 1;    
        if (item.gender == "M") {
            sexo = "Masculino"
        } else {
            sexo = "Feminino";
        }

        $('#example1').dataTable().fnAddData([
            item.name,
            sexo
        ]);
    });

    loadingStop();
}


loadData();



