
function valida_data(data) {

	var data_tamanho = data.length;
	if (data_tamanho != 10) {	
		alert("Formato de data inválido");
		return false;
	}
	if (data.charAt(2) != "/" || data.charAt(5) != "/") {
		alert("Voce deve utilizar uma / para separar os caracteres");
		return false;
	}
	var dia = data.substr(0, 2)
	var ano = data.substr(6)
	var mes = data.substr(3, 2)
	var data_hoje = new Date();
	var ano_atual = data_hoje.getFullYear();
	// var ano_atual = data_hoje.getYear();

	if (isNaN(dia)) { // funcão isNaN verifica se o valor não é nulo
		alert("Por favor, use apenas números para preencher o campo ");
		return false;
	}

	if (dia > 31 || dia <= 0) {
		alert("Dia inválido");
		return false;
	}
	if (isNaN(mes)) { // funcão isNaN verifica se o valor não é nulo
		alert("Por favor, use apenas números para preencher o campo ");
		return false;
	}
	if (mes > 12 || mes <= 0) {
		alert("Mês inválido");
		return false;
	}
	if (isNaN(ano)) {// funcão isNaN verifica se o valor não é nulo
		alert("Por favor, use apenas números para preencher o campo ");
		return false;
	}
	if (ano > ano_atual || ano < 1700) {
		alert("ano inválido");
		return false;
	}

	return true;
}
