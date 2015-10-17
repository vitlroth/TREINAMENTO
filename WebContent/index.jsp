<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<html>
<head>
<title>Login de Usuario</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<% 
String msg01 = request.getParameter("msg01");
String acao = request.getParameter("acao");
UsuarioBean usuarioBean = null;
if(acao!=null && acao.equals("acesso")){
	usuarioBean = new UsuarioBean();	
    usuarioBean.acessalogin(request,response);	
}
%>
<script type="text/javascript">
function valida(){	
	
	if(document.forms[0].login.value == ""){
		 alert("Campo Usuario é obrigatório.");
		 document.forms[0].login.focus();
		 return;
	}
	if(document.forms[0].senha.value == ""){
		 alert("Campo Senha é obrigatório.");
		 document.forms[0].senha.focus();
		 return;
	}
	document.forms[0].acao.value = "acesso";		
	document.forms[0].submit();
}
</script>
<body>
<form   method="get">
<table border="1">
<tr>
<td><font size="3" face="verdana">Login de Usuario</font></td>
</tr>
<tr>
<td><font face="verdana"><%if(msg01!=null){out.print(msg01);}%></font></td>
</tr>
<tr>
<td><font face="verdana">Usuario :</font><input type="text" name="login"></td>
</tr>
<tr>
<td><font face="verdana">Senha :</font><input type="password" name="senha"></td>
</tr>
<tr>
<td><input type="button" value="acessar" onclick="valida()"></td>
</tr>
</table>
<input type="text"  name="acao">
</form>
</body>
</html>