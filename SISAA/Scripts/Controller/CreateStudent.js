function getTableData(table) {
    var data = [];
    table.find('tr').each(function (rowIndex, r) {
        var cols = [];
        $(this).find('th,td').each(function (colIndex, c) {
            cols.push(c.textContent);
        });
        data.push(cols);
    });
    return data;
};

function formatRow(row) {
    return {
        "name": row[0],
        "profession": row[1],
        "address": row[2],
        "cellphone": row[3],
    };
}

function formatTable(tableData) {
    var data = [];
    for (let i = 1; i < tableData.length; i++) {
        data.push(formatRow(tableData[i]));
    }
    return data;
}

function limparCampos() {
    $("#parents tbody tr").remove();
    $("#studentName").val("");
}

function validar() {
    var isValid = true;

    // TUDO

    return isValid;
}

function sendrequest(data) {
    console.log(data);
    console.log(JSON.stringify(data));
    $.ajax({
        url: GlobalBaseURL + "api/Student",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            console.log("Enviado os dados para o servidoor");
        },
        error: function (xhr) {
            console.log("Ocorreu um erro na operacao");
            Toast.fire({ type: 'error', title: 'Estudante Cadastrado com Sucesso!' });
        },
        success: function (xhr) {
            console.log(xhr);
            if (xhr.header.code == "200") {
                console.log("Operacao executada com sucesso!");
                Toast.fire({ type: 'success', title: 'Estudante Cadastrado com Sucesso!' });
                limparCampos();
            } else {
                console.log("Ocorreu um erro na operacao" + xhr.header.message);
            }
        },
        complete: function (xhr) {
            console.log("Operacacao terminada");
        }
    });
}

$("#form1").submit(function (event) {
    event.preventDefault();
    console.log(GlobalBaseURL);
    var studentName = $("#studentName").val();
    var sexo = $("input[name='gender']:checked").val();
    var table = $("#parents")
    var tableData = getTableData(table);
    var parents = formatTable(tableData);

    var body = {
        "name": studentName,
        "gender": sexo,
        "AccountID": GlobalHeader.AccountID,
        "parents": parents
    }

    var data = {
        "header": GlobalHeader,
        "body": body
    };

    if (validar()) {
        sendrequest(data);
    }

});