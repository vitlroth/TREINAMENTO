<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp" %>
<%@page import="java.util.ArrayList"%><html>
<%
	String acao = request.getParameter("acao");
	String idusuario = request.getParameter("idusuario");
	UsuarioBean usuarioBean = null;
	ArrayList<UsuarioBean> lista = null;
	if (acao != null && acao.equals("listar")) {
		usuarioBean = new UsuarioBean();
		lista = usuarioBean.lista(request);
	}	
	if(acao!=null && acao.equals("excluir")){
		usuarioBean = new UsuarioBean();
		usuarioBean.exclui(request);
		lista = usuarioBean.lista(request);
	}		
%>
<head>
<title>Usuario Lista</title>
</head>
<script type="text/javascript">
function pesquisar(idusuario){
	document.forms[0].idusuario.value = idusuario;
	document.forms[0].acao.value = "pesquisar";
	document.forms[0].action = "usuario_manutencao.jsp";
	document.forms[0].submit();		
}
function excluir(idusuario,nome){
	if (confirm('Confirma a exclusão do usuário '+nome+'?')) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].acao.value = "excluir";
		document.forms[0].action = "usuario_lista.jsp";
		document.forms[0].submit();
	}
}
function retornar(idusuario) {
	document.forms[0].idusuario.value = idusuario;	
	document.forms[0].action = "usuario_pesquisa.jsp";
	document.forms[0].submit();
}
</script>
<body>
<form method="get">
<table border="1">
	<tr>
		<td colspan="4"><font face="verdana">Usuario Lista</font></td>
	</tr>
	<tr>
		<td><font face="verdana">Usuario</font></td>
		<td><font face="verdana">IdUsuario</font></td>
		<td><font face="verdana">Login</font></td>
		<td><font face="verdana">Excluir</font></td>
	</tr>
	<%
		if (lista != null && lista.size() > 0) {
			UsuarioBean bean = null;

			for (int i = 0; i < lista.size(); i++) {
				bean = lista.get(i);
	%>	
		<tr><td><a href="javascript:pesquisar('<%=bean.getIdusuario()%>')"><font face="verdana"><%=bean.getNmusuario()%></font></a></td>
		<td><font face="verdana"><%=bean.getIdusuario()%></font></td>
		<td><font face="verdana"><%=bean.getNmlogin()%></font></td>
		<td><a href="javascript:excluir('<%=bean.getIdusuario() %>','<%=bean.getNmusuario()%>')"><font face="verdana">excluir</font></a></tr>
	<%
		}
		}
	%>
<tr>
		<td><input type="button" value="voltar" onclick="retornar('<%=idusuario%>')"></td>
	</tr>
</table>
<input type="hidden" name="acao" value="<%=acao%>">
<input type="hidden" name="idusuario" value="<%=idusuario%>">
</form>
</body>
</html>