<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"   import="bean.EmpresaBean"%>
<!DOCTYPE html>
<html>
<%
	String ac = request.getParameter("acao");
	ArrayList<EmpresaBean> listao = null;
	EmpresaBean emp = new EmpresaBean();
	if (ac.equals("lista") && ac != null) {
		listao = emp.listar(request);
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inclusão de Empresas</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<script type="text/javascript">
	function listar() {
		document.forms[0].acao.value = "lista";
		document.forms[0].action = "empresa_inclusao.jsp";
		document.foms[0].submit();
	}
	
	function limpar(){
		document.forms[0].acao.value = "limpar";
		document.forms[0].action = "empresa_inclusao.jsp";
		document.foms[0].submit();
	}
	
	function voltar(){
		document.forms[0].acao.value = "voltar";
		document.forms[0].action = "cadastro_usuario.jsp"
		document.forms[0].submit();
	}
</script>
<body>
	<form method="get">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">NOME</th>
					<th scope="col">EMAIL</th>
				</tr>
			</thead>
			<%
				if (listao != null && listao.size() > 0) {
					EmpresaBean bean = null;
					for (int i = 0; i < listao.size(); i++) {
						bean = listao.get(i);					
			%>
			<tbody>
				<tr>
					<td><%=bean.getId()%></td>
					<td><%=bean.getNome()%></td>
					<td><%=bean.getEmail()%></td>
				</tr>
			</tbody>
			<%
					}
				}			
			%>								
		</table>
		<button class="btn btn-primary" value="LISTAR" onclick="listar()">Ver Empresas</button>
		<button class="btn btn-primary" value="Limpar" onclick="limpar()"> Limpar</button>
		<button class="btn btn-primary" value="Voltar" onclick="voltar()">Voltar</button>
		<input type="hidden" name="acao" value="<%=ac%>">
	</form>
</body>
</html>