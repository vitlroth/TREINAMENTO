<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="bean.UsuarioBean,bean.SetorBean"%>
<%@page import="java.util.ArrayList"%><html>
<%@include file="verifica_sessao.jsp" %>
<head>
<title>Usuario Inclusao</title>
</head>
<%
	String acao = request.getParameter("acao");
    String idusuario =  request.getParameter("idusuario");
	String msg = null;
	UsuarioBean usuarioBean = null;
	if (acao != null && acao.equals("incluir")) {
		usuarioBean = new UsuarioBean();
		msg = usuarioBean.inclui(request);
		usuarioBean.setIdusuario(usuarioBean.recuperaId());
%>
	<script type="text/javascript">
	alert("Incluido com sucesso!!");		
	document.location.href = 'usuario_manutencao.jsp?acao=pesquisar&idusuario=<%=usuarioBean.getIdusuario()%>';
	</script>
<%
	}
%>
	<script type="text/javascript" src="../js/valida_data.js"></script>
	<script type="text/javascript">
	function retornar(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}
	function validar() {

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

		if (document.forms[0].sexo[0].checked == false
				&& document.forms[0].sexo[1].checked == false) {
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
		} else {
			var data = document.forms[0].data.value;			
			if(valida_data(data)== true){
				document.forms[0].acao.value = "incluir";
				document.forms[0].action = "usuario_inclusao.jsp";
				document.forms[0].submit();
			}
			
		}

	}
	</script>
<body>
<form method="post">
<table border="1">
	<tr>
		<td><font face="verdana" size="3">Inclusão de Usuários</font></td>
	</tr>
	<tr>
		<td><font face="verdana">Nome:</font><input type="text"
			name="nome"></td>
	</tr>
	<tr>
		<td><font face="verdana">Login:</font><input type="text"
			name="login"></td>
	</tr>
	<tr>
		<td><font face="verdana">Senha:</font><input type="password"
			name="senha"></td>
	</tr>
	<tr>
		<td><font face="verdana">Sexo:</font><input type="radio"
			name="sexo" value="M"><font face="verdana">Masculino</font> <input
			type="radio" name="sexo" value="F"><font face="verdana">Feminino</font></td>
	</tr>
	<tr>
		<td><font face="verdana">Setor :</font> <select name="setor">
			<option value="0">selecione</option>
			<%
				SetorBean setor = new SetorBean();
				ArrayList<SetorBean> lista = setor.setaSetor(request);
				if (lista != null && lista.size() > 0) {
					for (int i = 0; i < lista.size(); i++) {
						setor = lista.get(i);
			%>
			<option value="<%=setor.getIdSetor()%>"><%=setor.getNmSetor()%></option>
			<%
				}
				}
			%>
		</select></td>
	</tr>
	<tr>
		<td><font face="verdana">Data de Nascimento:</font>
        <input type="text" name="data"> <font face="verdana">(dd/mm/aaaa)</font></td>
	</tr>
	<tr>
		<td><input type="button" value="incluir" onclick="validar()"></td>
	</tr>
	<tr>
		<td><input type="button" value="voltar" onclick="retornar('<%=idusuario %>')"></td>
	</tr>
</table>
<input type="hidden" name="acao"> 
<input type="hidden" name="idusuario">
</form>
</body>
</html>