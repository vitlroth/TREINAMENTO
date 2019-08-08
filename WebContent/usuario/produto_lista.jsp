<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.ProdutoBean"%>
<%@page import="java.util.ArrayList"%>
<%@include file="verifica_sessao.jsp"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<%
	String acao = request.getParameter("acao");
	ArrayList<ProdutoBean> listao = null;
	ProdutoBean bean = new ProdutoBean();
	if (acao.equals("listar") && acao != null) {
		listao = bean.lista(request);
	}
	if(acao.equals("paginacao") && acao != null){
	//	listao = bean.listaPaginacao(request);
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Produtos</title>
<jsp:useBean id="produto" class="bean.ProdutoBean"></jsp:useBean>
<jsp:useBean id="dao" class="dao.ProdutoDao"></jsp:useBean>


<link href="../resources/bootstrap/css/dataTables.jqueryui.css"
	rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" />
<link href="https://code.jquery.com/jquery-3.3.1.js" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"
	rel="stylesheet" />



</head>
<script type="text/javascript">
	// items recebe um Array; 
	// pageActual é o numero de paginas que o usuário deseja acessar 
	// limitItems é o numero de items por pagina
	function listaItems(items, pageActual, limitItems) {
		let result = [];

		// Verifica qtas paginas irá ter utilizando a função Math.ceil do JS
		// Declara uma variável usando o “Math.ceil”
		// em que a operação que ela vai retornar é o total de páginas disponível, ou seja, páginas que irão retornar os items.       
		let totalPaginas = Math.ceil(items.length / limitItems);
		// Contador inicial - verifica qual parte da lista ele retorna para o usuário
		let count = (pageActual * limitItems) - limitItems;
		// Limite do laço de repetição - induz o laço de repetição para andar somente os items que irão ser retornados.
		let delimiter = count + limitItems;
		//so realiza o laço de repetiçao se a pagina atual for menor ou igual ao total de paginas permitido
		// na variavel 	"totalPaginas " 
		if (pageActual <= totalPage) {
			// loop        	        	        	        	
			// Laço de repetição
			for (let i = count; i < delimiter; i++) {
				if (items[i] != null) {
					result.push(items[i]);
				}
				count++;
			}
		}
		return result;
	}

	function listar() {
		document.forms[0].acao.value = "listar";
		document.forms[0].action = "produto_lista.jsp";
		document.forms[0].submit();
	}
	function voltar() {
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}
	function limpar() {
		document.forms[0].acao.value = "limpar";
		document.forms[0].action = "produto_lista.jsp";
		document.forms[0].submit();
	}
	
	function paginar(x){

		document.forms[0].acao.value = "paginacao";
		document.forms[0].action = "produto_lista.jsp";
		document.forms[0].submit();
	}
	
	
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
<body>
	<form method="get">
		<div id="example_wrapper" class="table table-striped table-bordered"
			style="width: 100%">
			<div class="row">
				<div class="col-sm-2">				
				<label>Show</label>
				</div>
				<div class="col-sm-3">
					 <select  id="pagination" name="example_length" onChange="paginar(this.value)" aria-controls="example" class="form-control input-sm">
					 <option value="0">seleciona</option>
						<option value="10">10</option>
						<option value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select> 
				</div>
				<div class="col-sm-2">
				<label> entries</label>
				</div>				
				<div class="col-sm-2">
					<label>Search:</label>
				</div>
					<div class="col-sm-2">
					<input type="search"
						class="form-control input-sm" placeholder=""
						aria-controls="example">

				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table id="example"  class="table table-striped table-bordered dataTable"
						style="width: 100%;" role="grid" aria-describedby="example_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 128px;"
									aria-sort="ascending"
									aria-label="Name: activate to sort column descending">ID</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 210px;"
									aria-label="Position: activate to sort column ascending">NOME</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 95px;"
									aria-label="Office: activate to sort column ascending">UNIDADE
									DE MEDIDA</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 40px;"
									aria-label="Age: activate to sort column ascending">VALOR</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 86px;"
									aria-label="Start date: activate to sort column ascending">DATA
									DA COTACAO</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 71px;"
									aria-label="Salary: activate to sort column ascending">NOME
									DO FORNECEDOR</th>
							</tr>
						</thead>
					 <%
				if (listao != null && listao.size() > 0) {
					ProdutoBean Xbean = null;
					for (int i = 0; i < listao.size(); i++) {
						Xbean = listao.get(i); 
						
			%>  
						<!-- UTILIZANDO TAG LIB JSTL CORE -->
						<!--  o método na classe deve ter no nome a Get junto padrão de Beans -->
						<tbody>
<%-- 							<c:forEach var="produtos" items="${dao.listar}">
								<tr>
									<td>${produtos.id}</td>
									<td>${produtos.nome}</td>
									<td>${produtos.unidade}</td>
									<td>${produtos.valor}</td>
									<td>${produtos.datacotacao}</td>
									<td>${produtos.emp.nome}</td>
								</tr>

							</c:forEach> --%>
						
<tr>
<td><%=Xbean.getIdproduto() %></td>
<td><%=Xbean.getNome() %></td>
<td><%=Xbean.getUnidade() %></td>
<td><%=Xbean.getValor() %></td>
<td><%=Xbean.getDatacotacao() %></td>
<td><%=Xbean.getEmp().getNome() %></td>
</tr>

			<%
			
				 }
				} 
			%>  
						</tbody>
						<tfoot>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">NOME</th>
								<th scope="col">UNIDADE DE MEDIDA</th>
								<th scope="col">VALOR</th>
								<th scope="col">DATA DA COTACAO</th>
								<th scope="col">NOME DO FORNECEDOR</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-5">
					<div class="dataTables_info" id="example_info" role="status"
						aria-live="polite">Showing 1 to 10 of 57 entries</div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example_paginate">
						<ul class="pagination">
							<li class="paginate_button previous disabled"
								id="example_previous"><a href="#" aria-controls="example"
								data-dt-idx="0" tabindex="0">Previous</a></li>
							<li class="paginate_button active">
							<a href="../usuario/produto_lista.jsp" aria-controls="example" data-dt-idx="1" tabindex="0">1</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example" data-dt-idx="2" tabindex="0">2</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example" data-dt-idx="3" tabindex="0">3</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example" data-dt-idx="4" tabindex="0">4</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example" data-dt-idx="5" tabindex="0">5</a></li>
							<li class="paginate_button "><a href="#"
								aria-controls="example" data-dt-idx="6" tabindex="0">6</a></li>
							<li class="paginate_button next" id="example_next"><a
								href="#" aria-controls="example" data-dt-idx="7" tabindex="0">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-primary" onclick="listar()">Listar Produtos</button>
		<button class="btn btn-primary" onclick="voltar()">Voltar</button>
		<button class="btn btn-primary" onclick="limpar()">Limpar</button>
		<input type="hidden" name="acao">
	</form>
</body>
</html>