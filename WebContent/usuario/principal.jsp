<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.Usuario_ModuloBean,util.Data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.UsuarioBean"%><html>
<%@include file="verifica_sessao.jsp" %>
<head>
<%
	String msg = request.getParameter("msg");
	String idusuario = request.getParameter("idusuario");
	ArrayList<Usuario_ModuloBean> lista = null;
	Usuario_ModuloBean modulo = new Usuario_ModuloBean();
	lista = modulo.listamodulos(request);
	if (session.getAttribute("UsuarioLogado") != null) {
%>
<title>Módulos</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function valida(idmodulo, destmodulo) {
		alert(destmodulo);
		document.forms[0].action = destmodulo;
		document.forms[0].submit();
	}

	function validando(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}
</script>
<body>
	<form method="get">

		<%
			UsuarioBean usuarioLogado = (UsuarioBean) session
						.getAttribute("UsuarioLogado");
		%>

		<h3>
			Bem vindo
			<%
			out.print(usuarioLogado.getNmusuario() + " - "
						+ usuarioLogado.getNmlogin());
		%>!
		</h3>
		<h4><%=Data.dataAtual()%></h4>

		<table border="1">
			<tr>
				<td><font face="verdana">
						<%
							if (msg != null) {
									out.println(msg);
								}
						%>
				</font></td>
			</tr>
			<tr>
				<td><font face="verdana" size="3">Módulos</font></td>
			</tr>
			<tr>
				<td><a href="javascript:validando('<%=idusuario%>')"><font
						face="verdana">Usuarios</font></a></td>
			</tr>
			<%
				if (lista != null && lista.size() > 0) {
						Usuario_ModuloBean moduloBean = null;
						for (int i = 0; i < lista.size(); i++) {
							moduloBean = lista.get(i);
			%>
			<tr>
				<td><a
					href="javascript:valida('<%=moduloBean.getModuloBean().getIdmodulo()%>','<%=moduloBean.getModuloBean().getDestmodulo()%>')"><font
						face="verdana"><%=moduloBean.getModuloBean().getNmmodulo()%></font></a></td>
			</tr>
			<%
				}
					}
				}
			%>

		</table>
		<input type="hidden" name="acao" value="modulo"> <input
			type="hidden" name="idusuario" value="<%=idusuario%>">
	</form>
</body>
</html>