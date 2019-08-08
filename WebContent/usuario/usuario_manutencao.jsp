 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="bean.UsuarioBean,bean.SetorBean"%>
<%@page import="java.util.ArrayList"%><html>
<%@include file="verifica_sessao.jsp" %>
<head>
<title>Usuario Manutenção</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />     

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
<script type="text/javascript"  title="Bom dia" >
	function incluimod(){	
		document.forms[0].acao.value = "alterar";		
		document.forms[0].action = "modulos_lista.jsp";
		document.forms[0].submit();
	}
	function retornaprincipal(){
		document.forms[0].action = "principal.jsp";
		document.forms[0].submit();
	}
	
	function retornapesquisar(){
		document.forms[0].action = "usuario_pesquisa.jsp";
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
<div class="container">
<div align="center">
<h1><font face="verdana" size="3">Manutenção de Usuarios</font></h1>
<font face="verdana" size="3"><%if(msg!=null){out.println(msg);}%></font>
</div>
<div class="form-row">
<div class="form-group col-md-8">
<label for="nome" class="col-sm-2 col-form-label">Nome</label>
<input type="text" name="nome" class="form-control" value="<%=usuarioBean.getNmusuario()%>">
</div>
</div>

<div class="form-row">
<div class="form-group col-md-4">
<label for="login" class="col-sm-2 col-form-label">Login</label>
<input type="text" name="login"  class="form-control"  value="<%=usuarioBean.getNmlogin() %>">	
</div>
<div class="form-group col-md-4">
<label for="senha" class="col-sm-2 col-form-label">Senha</label>
<input type="password" class="form-control"	name="senha" value="<%=usuarioBean.getNmsenha()%>">
</div>
</div>
<fieldset class="form-group">
<div class="row">
<H3  align="left"    class="col-sm-2 col-form-label">Sexo</H3>>
<div class="col-sm-10">
<div class="form-check">
<input type="radio" class="form-check-input" name="sexo"  <%=usuarioBean.getNmsexo().equals("M") ? "checked=\"checked\"" : ""%>   value="M">Masculino
</div>
<div class="form-check">
<input type="radio" class="form-check-input" name="sexo"   <%=usuarioBean.getNmsexo().equals("F") ? "checked=\"checked\"" : "" %> value="F">Feminino
</div>
</div>
</div>
</fieldset>

<div class="form-row">
<div class="form-group  col-md-2">
<label  class="form-check-label">Setor</label>	
<select name="setor" class="custom-select custom-select-sm">
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
		</select>						
	</div>								
</div>
<div class="form-row">
<div class="form-group col-md-2">
	<label class="form-check-label">Data de Nascimento </label>
	<input type="text"  class="form-control"  
	name="data" value="<%=usuarioBean.getFormataData(usuarioBean.getDataNascimento().getTime())%>">
	<label >
	(dd/mm/aaaa)
	</label>
	</div>	
</div>
						
	<div>
		<input type="button"  class="btn btn-primary"   value="alterar" onclick="valida()">
	</div>	
			<div>
			<input type="hidden" name="acao">
			</div>
			<div>
			<input type="hidden" name="idusuario" value="<%=usuarioBean.getIdusuario()%>">
			</div>
		<div>
		<a href="javascript:retornaprincipal()">Principal</a>
		<br>
		<a href="javascript:incluimod()">Módulos</a>
		<br>
		<a href="javascript:retornapesquisar()"  class="btn btn-default btn-lg">
		<span class="glyphicon glyphicon-search"></span> Pesquisar novamente
		</a>				
<% } %>
</div>


</div>
</form>
</body>
</html>