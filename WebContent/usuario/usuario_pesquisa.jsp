<%@ page  trimDirectiveWhitespaces="true" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp" %>
<html>
<head>
<title>Pesquisa de usuários</title>
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
<table>
	<tr>
		<td><font face="verdana">Usuario Pesquisa</font></td>
	</tr>
	<tr>
		<td><font face="verdana">Nome:</font><input type="text"
			name="nome"></td>
	</tr>
	<tr>
		<td><font face="verdana">Login:</font><input type="text"
			name="login"></td>
	</tr>
	<tr>
		<td><input type="button" value="pesquisar" onclick="valida('<%=idusuario %>')">
		<font face="verdana">Tipo:</font> <select name="opcao">
			<option value="0">selecione</option>
			<option value="1">PDF</option>
			<option value="2">CSV</option>
		</select> <input type="button" value="listar" onclick="listar()"></td>
	</tr>
	<tr>
		<td><input type="button" value="voltar" onclick="retornar('<%=idusuario%>')"></td>
	</tr>
</table>
<input type="hidden" name="idusuario">
<input type="hidden" name="acao"></form>
</body>
</html>