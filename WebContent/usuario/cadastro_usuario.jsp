<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Cadastro de Usuários</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">  -->
</head>
<%
	String idusuario = request.getParameter("idusuario");
	String acao = request.getParameter("acao");
%>
<script type="text/javascript">

function ir(){
	document.forms[0].action = "loginNovo.jsp";
	document.forms[0].submit(); 		
}

	function retornar(idusuario) {
		document.forms[0].acao.value = "modulo";
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "principal.jsp";
		document.forms[0].submit();
	}
	function envia(idusuario) {
		document.forms[0].acao.value = "pesquisa";
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "usuario_pesquisa.jsp";
		document.forms[0].submit();
	}
	function enviaId(idusuario) {
		document.forms[0].acao.value = "inclusao";
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "usuario_inclusao.jsp";
		document.forms[0].submit();

	}
	
	
	function enviaIdEmp(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "empresa_inclusao.jsp";
		document.forms[0].submit();
	}
	
	
	function manutencaoProd(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "produto_lista.jsp";
		document.forms[0].submit();
	}
				
	function manutencaoProdAux(idusuario){
		document.forms[0].acao.value = "listar";	
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "produtoListaAuxiliar.jsp";
		document.forms[0].submit();
	}
	
	
	function cadastroEmpr(idusuario){
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "trabalho_inclusao.jsp";
		document.forms[0].submit();		
	}					
</script>
<body>
	<form method="get">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">				
				<h1 class="display-4">Cadastro de Usuários</h1>
				<p class="lead">Bem vindo!</p>
			</div>
			<!-- fim .container dentro do jumbotron -->
		</div>
		<!-- fim .jumbotron -->
		<div class="container">
			<div class="card mb3" style="width: 18rem;">
				<div class="card-header">Seu cadastro</div>
				<img class="card-img-top" src="../imagens/java.gif"
					alt="Card image cap">
				<div class="card-body">
					<dl compact="compact">
						<dt>
							<a href="javascript:enviaId('<%=idusuario%>')" >Inclusão de Usuarios</a>
						</dt>
						<dt>
							<a href="javascript:envia('<%=idusuario%>')" >Pesquisa de Usuarios </a>
						</dt>
						<dt>
						<a href="javascript:enviaIdEmp('<%=idusuario%>')">Listar Empresas</a>						
						</dt>
						<dt>						
						<a href="javascript:manutencaoProd('<%=idusuario%>')">Listar Produtos</a>
						</dt>
						<dt>
						<a href="javascript:manutencaoProdAux('<%=idusuario%>')">Listar Produtos Auxiliares</a>
						</dt>
						<dt>
						<a   href="javascript:cadastroEmpr('<%=idusuario%>')">Cadastrar Empregos</a>						
						</dt>						
						<dt>
						<br>
							<input type="button" class="btn btn-primary" value="voltar"
								onclick="retornar('<%=idusuario%>')">								
								<button id="Voltar" name="Voltar" class="btn btn-info" onclick="ir()">Novo layout login</button>
						</dt>
					</dl>
				</div>
			</div>		
		</div>
		<input type="hidden" name="idusuario"> 
		<input type="hidden" name="acao">
	</form>	
</body>
</html>