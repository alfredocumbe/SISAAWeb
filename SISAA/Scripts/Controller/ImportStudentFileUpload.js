(function () {

	var app = angular.module('myApp', []);
	app.controller('MyController', ['$scope', myController]);

	function myController($scope) {
		$scope.uploadeExcel = function () {
			var myFile = document.getElementById('file');
			var input = myFile;
			var reader = new FileReader();
			reader.onload = function () {
				var fileData = reader.result;
				var workbook = XLSX.read(fileData, { type: 'binary' });
				workbook.SheetNames.forEach(function (sheetName) {
					var rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
					excelJsonObj = rowObject;
				});

				for (var i = 0; i < excelJsonObj.length; i++) {
					var data = excelJsonObj[i];
					var item = "<tr>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.NomeEstudante + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.SexoEstudante + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.NomeEncarregado1 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.ProfissaoEncarregado1 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.EnderecoEncarregado1 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.celularEncarregado1 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.NomeEncarregado2 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.ProfissaoEncarregado2 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.EnderecoEncarregado2 + "</td>";
					item = item + "<td class='pt-2-half' contenteditable='true'>" + data.celularEncarregado2 + "</td>";
					item = item + "<td><span class='table-remove'><button type='button' class='btn btn-danger btn-rounded btn-sm my-0 waves-effect waves-light'>Remover</button></span></td>";
					item = item + "</tr>"; 
					$("#batchStudent tbody:last-child").append(item);
				}
			};
			reader.readAsBinaryString(input.files[0]);
		};
	}
})();

function getTableData1(table) {
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
		"student": {
			"name": row[0],
			"gender": row[1]
		},
		"parents": [
			{
				"name": row[2],
				"profession": row[3],
				"address": row[4],
				"cellphone": row[5]
			},
		    {
				"name": row[6],
				"profession": row[7],
				"address": row[8],
				"cellphone": row[9]
			}
		]
	};
};

function formatTable1(tableData) {
	var data = [];
	for (let i = 1; i < tableData.length; i++) {
		data.push(formatRow(tableData[i]));
	}
	return data;
};

function createBatchStudent() {
	event.preventDefault();
	var table = $("#batchStudent")
	var tableData = getTableData1(table);
	var students = formatTable1(tableData);
	var data = {
		"header": GlobalUser.header,
		"body": students
	};
	sendRequest(data);
};

function limparCampos() {
	$("#batchStudent tbody tr").remove();
	$("#file").val('');
	$("#form1").trigger("reset"); 
};

function sendRequest(data) {
	$.ajax({
		url: GlobalBaseURL + "api/Student/CreateStudentOnBacth",
		dataType: "json",
		contentType: "application/json",
		method: "POST",
		data: JSON.stringify(data),
		beforeSend: function (xhr) {
			console.log("Enviado os dados para o servidoor");
		},
		error: function (xhr) {
			console.log("Ocorreu um erro na operacao");
			Toast.fire({ type: 'error', title: 'Erro no cadastro!' });
		},
		success: function (xhr) {
			console.log(xhr);
			if (xhr.header.code == "200") {
				console.log("Operacao executada com sucesso!");
				Toast.fire({ type: 'success', title: 'Estudantes Cadastrados com Sucesso!' });
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

function downLoadTemplate() {
	event.preventDefault();  //stop the browser from following
	console.log("dowload");
	window.location.href = '/Content/ImportStude_Template.xlsx';
}