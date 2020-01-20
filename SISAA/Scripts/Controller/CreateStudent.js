
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
        "cellphone": row[2],
    };
}

function formatTable(tableData) {
    var data = [];
    for (let i = 1; i < tableData.length; i++) {
        data.push(formatRow(tableData[i]));
    }
    return data;
}

function sendrequest(data) {
    console.log(data);
    console.log(JSON.stringify(data));
    $.ajax({
        url: "https://localhost:44338/api/Student",
        dataType: "json",
        contentType: "application/json",
        method: "POST",
        data: JSON.stringify(data),
        beforeSend: function (xhr) { console.log("beforeSend"); },
        error: function (xhr) { console.log("error"); },
        success: function (xhr) { console.log("success"); },
        complete: function (xhr) { console.log("complete"); }
    });
}

$("#form1").submit(function (event) {
    event.preventDefault();
    var studentName = $("#studentName").val();
    var sexo = $("input[name='gender']:checked").val();
    var table = $("#parents")
    var tableData = getTableData(table);
    var parents = formatTable(tableData);

    var header = {
        "UserID": "49ea4e24-ad7f-4573-9bf3-d4c13ecfca3c",
        "system": "WEB",
        "token": "tokemteste123"
    };

    var body = {
        "name": studentName,
        "gender": sexo,
        "parents": parents
    }

    var data = {
        "header": header,
        "body": body
    };

    sendrequest(data)

    alert("Handler for .submit() called.");
});