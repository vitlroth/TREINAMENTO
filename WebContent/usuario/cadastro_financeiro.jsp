<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp" %>
<html>
<head>
<title>Cadastro Financeiro</title>
</head>
<%

 	String acao = request.getParameter("acao");
	UsuarioBean bean = null;
if(acao!=null && acao.equals("modulo")){
	bean = new UsuarioBean();
	bean = bean.pesquisar(request);	
}
if(bean!=null){

%>
<script type="text/javascript">
	function retornaprincipal(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "principal.jsp";
		document.forms[0].submit();

	}
</script>
<body>
<form>		
			<font size="4">Cadastro Financeiro</font>	

			<table border="1">

			<tr>					
					<td><a href="#">Inclusão</a></td>					
			</tr>
			<tr>					
					<td><a href="#">Pesquisa</a></td>					
			</tr>
			<tr>
			<td><a href="javascript:retornaprincipal('<%=bean.getIdusuario()%>')">Principal</a></td>
			</tr>
			</table>
	
<input type="hidden" name="idusuario">
<%} %>
</form>
</body>
</html>