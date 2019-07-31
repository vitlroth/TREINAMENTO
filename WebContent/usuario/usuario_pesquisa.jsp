<%@ page  trimDirectiveWhitespaces="true" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp" %>
<html>
<head>
<title>Pesquisa de usuários</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />  
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> 
<link href="../resources/bootstrap/css/bootstrap.grid.css" rel="stylesheet" />
</head>
<%
	String idusuario = request.getParameter("idusuario");
	String acao = request.getParameter("acao");
	UsuarioBean usuarioBean = null;

	if (acao != null && acao.equals("relatorio")) {
		usuarioBean = new UsuarioBean();
		usuarioBean.relatorio(request, response);
	}
%>
<script type="text/javascript">
	function valida(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].acao.value = "listar";
		document.forms[0].action = "usuario_lista.jsp";
		document.forms[0].submit();
	}
	function listar() {		
		document.forms[0].acao.value = "listar";
		var op = document.forms[0].opcao.value;
		if (op == 0) {
			alert("O campo tipo deve ser informado");
		}
		var nome = document.forms[0].nome.value;
		var login = document.forms[0].login.value;
		document.forms[0].acao.value = "relatorio";
		document.forms[0].action = "usuario_pesquisa.jsp";
		document.forms[0].submit();

	}
	function retornar(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].acao.value = "modulo";
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}
</script>
<body>
<form method="post">
<div class="container">
<div class="form-row">
<div class="form-group col-md-6" align="center">
<h2 class="display-4">Usuario Pesquisa</h2>
</div>
</div>
<div class="form-row">
<div class="form-group col-md-6">
<label for="nome">Nome:</label>
<input type="text" class="form-control" id="nome"  placeholder="nome" >
</div>
</div>
<div class="form-row">
<div class="form-group col-md-6">
<label for="login">Login:</label>
<input type="text" class="form-control" id="login" placeholder="login">
</div>
</div>
<div class="form-row">
<div class="form-group">
<input type="button" class="btn btn-primary" value="pesquisar" onclick="valida('<%=idusuario %>')">
 
</div>
</div>
<div class="form-row">
<div class="form-group col-md-6">
<label>Tipo:</label>
<select name="opcao">
			<option value="0">selecione</option>
			<option value="1">PDF</option>
			<option value="2">CSV</option>
</select> 
</div>
</div>
<div class="form-row">
<div class="form-group">
<input type="button" class="btn btn-primary" value="listar" onclick="listar()">
<input type="button" class="btn btn-primary" value="voltar" onclick="retornar('<%=idusuario%>')">
</div>
</div>
<input type="hidden" name="idusuario">
<input type="hidden" name="acao">
</div>
</form>
</body>
</html>