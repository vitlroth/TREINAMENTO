<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp" %>
<html>
<head>
<title>Cadastro de Usuários</title>	
</head>
<%
String idusuario = request.getParameter("idusuario");
String acao = request.getParameter("acao");
%>
<script type="text/javascript">	
	function retornar(idusuario) {	
	document.forms[0].acao.value = "modulo";
	document.forms[0].idusuario.value = idusuario;
	document.forms[0].action = "principal.jsp";
	document.forms[0].submit();
	}
	function envia(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "usuario_pesquisa.jsp";
		document.forms[0].submit();
	}
	function  enviaId(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "usuario_inclusao.jsp";
		document.forms[0].submit();

		}
	
</script>
<body>
<form method="post">
<table border="1">
<tr>
<td><font face="verdana">Cadastro de usuarios</font></td>
</tr>
<tr>
<td><a href="javascript:enviaId('<%=idusuario %>')"><font face="verdana">Inclusão de usuarios</font></a>
</tr>
<tr>
<td><a href="javascript:envia('<%=idusuario%>')"><font face="verdana">Pesquisa de usuarios</font></a>
</tr>
<tr>
	<td><input type="button" value="voltar" onclick="retornar('<%=idusuario%>')"></td>
</tr>
<tr>
	<td><input type="hidden" name="idusuario"></td>
</tr>
<tr>
	<td><input type="hidden" name="acao"></td>
</tr>
</table>
</form>
</body>
</html>