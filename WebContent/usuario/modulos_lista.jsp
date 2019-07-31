<%@include file="verifica_sessao.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="bean.ModuloBean,bean.UsuarioBean,bean.Usuario_ModuloBean"%>
<%@page import="java.util.ArrayList,bean.Usuario_ModuloBean"%>
<html>
<head>
<title>Modulos lista</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<%
	String acao = request.getParameter("acao");
	String msg = null;
	String msgEx = null;
	UsuarioBean user = null;
	if (acao != null && acao.equals("alterar")) {
		user = new UsuarioBean();
		user = user.pesquisar(request);
	}
	Usuario_ModuloBean modulobean = null;
	if (acao != null && acao.equals("inclui")) {
		modulobean = new Usuario_ModuloBean();
		msg = modulobean.incluirmod(request);
		user = new UsuarioBean();
		user = user.pesquisar(request);
	}
%>
<%
	if (acao != null && acao.equals("exclui")) {
		modulobean = new Usuario_ModuloBean();
		msgEx = modulobean.excluirmod(request);
		user = new UsuarioBean();
		user = user.pesquisar(request);

	}
	if (user != null) {
%>
<script type="text/javascript">
	function valida() {
		modulo = new Array;
		contador = 0;
		num1 = document.forms[0].modulo2.length;
		// javascript não considera como um array de dimenssão unitária.	
		if (num1 == undefined && document.forms[0].modulo2.checked == false) {// || document.forms[0].modulo2.checked==false			 
			alert("Nenhum modulo selecionado");
			return false;
		} else if (num1 == undefined
				&& document.forms[0].modulo2.checked == true) {
			return true;
		}

		if (num1 > 0) {
			for (i = 0; i < num1; i++) {
				if (document.forms[0].modulo2[i].checked == true) {
					modulo[contador] = document.forms[0].modulo2[i].value;
					document.forms[0].idmodulos.value = modulo;
					contador++;
				}
			}
			if (modulo == "") {
				alert("Nenhum modulo selecionado");
				return false;
			}
		}
		return true;
	}

	function vincular() {
		//	alert("entrou no vincular");				
		if (valida() == true) {
			document.forms[0].acao.value = "inclui";
			document.forms[0].action = "modulos_lista.jsp";
			document.forms[0].submit();
		} else {
			document.forms[0].action = "modulos_lista.jsp";
		}
	}
	function desvincular() {
		document.forms[0].acao.value = "exclui";
		document.forms[0].action = "modulos_lista.jsp";
		document.forms[0].submit();
	}
	function retornar() {
		document.forms[0].acao.value = "pesquisar";
		document.forms[0].action = "usuario_manutencao.jsp";
		document.forms[0].submit();
	}
</script>
<form method="post">
<table border="1" class="table table-striped">
	<tr>
		<td colspan="2"><font face="verdana">Modulos-Vinculados</font>
	</tr>
	<tr>
		<td><font face="verdana"> <%
 	if (msgEx != null) {
 			out.print(msgEx);
 		}
 %> </font></td>
	</tr>
	<%
		ArrayList<ModuloBean> lista = null;
			ArrayList<Usuario_ModuloBean> listar = null;
			Usuario_ModuloBean modbean = null;
			modbean = new Usuario_ModuloBean();
			ModuloBean bean = null;
			bean = new ModuloBean();
			//listaModulos
			lista = bean.lista(request);

			//listaModulosUsuario
			listar = modbean.listamodulos(request);
			

			if (lista != null && lista.size() > 0) {
				ModuloBean bea = null;
				if (listar != null && listar.size() > 0) {
					Usuario_ModuloBean mod = null;
					for (int i = 0; i < listar.size(); i++) {
						mod = listar.get(i);
						for (int j = 0; j < lista.size(); j++) {
							bea = lista.get(j);
							if (mod.getModuloBean().getIdmodulo() == bea.getIdmodulo()) {
	%>
	<tr>
		<td><input type="checkbox" name="modulo1"  value="<%=mod.getModuloBean().getIdmodulo()%>" checked="checked">
	<font face="verdana"><%=mod.getModuloBean().getNmmodulo()%></font></td>
	</tr>
	<%
		}
						}
					}
				}
			}
	%>

	<tr>
		<td><input type="button" value="Desvincular"  onclick="desvincular()"></td>
	</tr>
</table>
<table border="1" class="table table-striped">
<thead class="thead-dark">
	<tr>
		<td><font face="verdana">Modulos-Não Vinculados</font></td>
	</tr>
</thead>
<tbody>


	<tr>
		<td><font face="verdana"> <%
 	if (msg != null) {
 			out.print(msg);
 		}
 %> </font></td>
	</tr>
	<%
		ArrayList<Usuario_ModuloBean> listando = null;
			Usuario_ModuloBean b = new Usuario_ModuloBean();
			listando = b.listaModulosDesvinculados(request);
			if (listando != null && listando.size() > 0) {
				Usuario_ModuloBean modulo = null;
				for (int i = 0; i < listando.size(); i++) {
					modulo = listando.get(i);
	%>
	<tr>
		<td><input type="checkbox" name="modulo2"
			value="<%=modulo.getModuloBean().getIdmodulo()%>"> <font
			face="verdana"><%=modulo.getModuloBean().getNmmodulo()%></font></td>
	</tr>
	<%
		}
			}		
	%>
	<tr>
		<td><input type="button" value="Vincular" onclick="vincular()"></td>
	</tr>	
	<tr>
		<td><a href="javascript:retornar()"><font face="verdana">usuario</font></a></td>
	</tr>
</tbody>
</table>
<input type="hidden" name="acao"> <input type="hidden" name="idmodulos">
<input type="hidden" name="idusuario" value="<%=user.getIdusuario()%>"> 
<%
		}
	%>
</form>
</body>
</html>