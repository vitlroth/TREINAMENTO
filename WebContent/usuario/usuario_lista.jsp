<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
	String acao = request.getParameter("acao");
	String idusuario = request.getParameter("idusuario");
	UsuarioBean usuarioBean = null;
	ArrayList<UsuarioBean> lista = null;
	if (acao != null && acao.equals("listar")) {
		usuarioBean = new UsuarioBean();
		lista = usuarioBean.lista(request);
	}
	if (acao != null && acao.equals("excluir")) {
		usuarioBean = new UsuarioBean();
		usuarioBean.exclui(request);
		lista = usuarioBean.lista(request);
	}
%>
<head>
<title>Usuario Lista</title>
<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<script type="text/javascript">
	function pesquisar(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].acao.value = "pesquisar";
		document.forms[0].action = "usuario_manutencao.jsp";
		document.forms[0].submit();
	}
	function excluir(idusuario, nome) {
		if (confirm('Confirma a exclusão do usuário ' + nome + '?')) {
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
	<jsp:useBean id="usuario" class="bean.UsuarioBean" />
	<form method="get">
		<h1 align="center">
			<font face="verdana">Lista de Usu&aacute;rios</font>
		</h1>
		<table class="table table-striped" border="1">
			<thead>
				<tr>
					<th scope="col"><font face="verdana">Usuario</font></th>
					<th scope="col"><font face="verdana">IdUsuario</font></th>
					<th scope="col"><font face="verdana">Data de Nascimento</font>
					<th scope="col"><font face="verdana">Login</font></th>
					<th scope="col"><font face="verdana">Excluir</font></th>
				</tr>
			</thead>
			<%
				UsuarioBean data = new UsuarioBean();
				if (lista != null && lista.size() > 0) {
					UsuarioBean bean = null;

					for (int i = 0; i < lista.size(); i++) {
						bean = lista.get(i);
			%>
			<tbody>
				<tr>
					<td><a href="javascript:pesquisar('<%=bean.getIdusuario()%>')"><font
							face="verdana"><%=bean.getNmusuario()%></font></a></td>
					<td><font face="verdana"><%=bean.getIdusuario()%></font></td>
					<td><font face="verdana"><%=bean.getFormataData(bean.getDataNascimento().getTime())%></font></td>
					<td><font face="verdana"><%=bean.getNmlogin()%></font></td>
					<td><a
						href="javascript:excluir('<%=bean.getIdusuario()%>','<%=bean.getNmusuario()%>')"><font face="verdana">excluir</font></a>
				</tr>
			</tbody>
			<%
				}
				}
			%>
		</table>
		<div align="left">
			<input type="button" class="btn btn-primary" value="voltar" onclick="retornar('<%=idusuario%>')">
		</div>
		<input type="hidden" name="acao" value="<%=acao%>"> <input type="hidden" name="idusuario" value="<%=idusuario%>">
	</form>
</body>
</html>