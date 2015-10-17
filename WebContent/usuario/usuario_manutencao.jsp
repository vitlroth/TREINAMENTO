 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="bean.UsuarioBean,bean.SetorBean"%>
<%@page import="java.util.ArrayList"%><html>
<%@include file="verifica_sessao.jsp" %>
<head>
<title>Usuario Manutenção</title>
</head>
<%
	String acao = request.getParameter("acao");
	String msg = null;
	UsuarioBean usuarioBean = null;
	
	if (acao != null && acao.equals("pesquisar")) {		
		usuarioBean = new UsuarioBean();		
		usuarioBean = usuarioBean.pesquisar(request);
	}
%>
<%
	if(acao!=null && acao.equals("alterar")){		
		usuarioBean = new UsuarioBean();	
		msg = usuarioBean.altera(request);
		usuarioBean = usuarioBean.pesquisar(request);
	}

	if(usuarioBean!=null){

%>
<script type="text/javascript" src="../js/valida_data.js"></script>
<script type="text/javascript">
	function incluimod(){	
		document.forms[0].acao.value = "alterar";		
		document.forms[0].action = "modulos_lista.jsp";
		document.forms[0].submit();
	}
	function retornaprincipal(){
		document.forms[0].action = "principal.jsp";
		document.forms[0].submit();
	}
	function valida() {	
		
		if (document.forms[0].nome.value == "") {
			alert("Campo Nome é obrigatório.");
			document.forms[0].nome.focus();
			return;
		}

		if (document.forms[0].login.value == "") {
			alert("Campo Login é obrigatório.");
			document.forms[0].login.focus();
			return;
		}

		if (document.forms[0].senha.value == "") {
			alert("Campo Senha é obrigatório.");
			document.forms[0].senha.focus();
			return;
		}

		if (document.forms[0].sexo[0].checked == false  && document.forms[0].sexo[1].checked == false) {
			alert("O campo Sexo é obrigatório");
			return;
		}

		if (document.forms[0].setor.value == "0") {
			alert("O campo setor deve ser informado");
			return;
		}
	
		if (document.forms[0].data.value == "") {
			alert("O campo data deve ser preenchido");
			return;
		}	else{
			var data = document.forms[0].data.value;			
			if(valida_data(data)== true){
				document.forms[0].acao.value = "alterar";
				document.forms[0].action = "usuario_manutencao.jsp";
				document.forms[0].submit();
			}						      	      
		}		
		}	
</script>
<body>
<form method="post">
<table border="1">
	<tr>
		<td><font face="verdana" size="3">Manutenção de Usuarios</font></td>
	</tr>
	<tr>
		<td><font face="verdana" size="3"><%if(msg!=null){out.println(msg);}%></font></td>
	</tr>
	<tr>
		<td><font face="verdana">Nome:</font><input type="text" name="nome" value="<%=usuarioBean.getNmusuario()%>"></td>
	</tr>
	<tr>
		<td><font face="verdana">Login:</font><input type="text" name="login" value="<%=usuarioBean.getNmlogin() %>"></td>
	</tr>
	<tr>
		<td><font face="verdana">Senha:</font><input type="password"
			name="senha" value="<%=usuarioBean.getNmsenha()%>"></td>
	</tr>
	<tr>
	<td><font face="verdana">Sexo:</font>
		<input type="radio" name="sexo"  <%=usuarioBean.getNmsexo().equals("M") ? "checked=\"checked\"" : ""%>   value="M"><font face="verdana">Masculino</font> 
		<input type="radio" name="sexo"   <%=usuarioBean.getNmsexo().equals("F") ? "checked=\"checked\"" : "" %> value="F"><font face="verdana">Feminino</font>
	</td>
	</tr>
	<tr>
		<td><font face="verdana">Setor :</font> <select name="setor">
			<option value="0">selecione</option>
			<%
			SetorBean setor = new SetorBean();
			ArrayList<SetorBean> lista = setor.setaSetor(request);
			if(lista!=null && lista.size()>0){
			SetorBean bean = null;
			for(int i=0;i<lista.size();i++){				
				bean = lista.get(i);
				if(usuarioBean.getSetor().getIdSetor()== bean.getIdSetor()){
		%>
			<option value="<%=bean.getIdSetor()%>" selected="selected"><%=bean.getNmSetor() %></option>
			<%		
				}else{%><option value="<%=bean.getIdSetor() %>"><%=bean.getNmSetor() %></option>
			<%
			}
			}																	
			}						
			%>
		</select></td>
	</tr>
	<tr>
		<td><font face="verdana">Data de Nascimento:</font> <input type="text" name="data" value="<%= usuarioBean.getData()%>"><font face="verdana">(dd/mm/aaaa)</font></td>
	</tr>
	<tr>
		<td><input type="button" value="alterar" onclick="valida()"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="acao"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="idusuario" value="<%=usuarioBean.getIdusuario()%>"></td>
	</tr>
	<tr>
		<td><a href="javascript:retornaprincipal()"><font face="verdana">Principal</font></a>
	</tr>
	<tr>
		<td><a href="javascript:incluimod()"><font face="verdana">Módulos</font></a>
	</tr>
</table>
<% } %>
</form>
</body>
</html>