<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean,bean.SetorBean"%>
<%@page import="java.util.ArrayList"%>
<%@include file="verifica_sessao.jsp"%>
<!DOCTYPE html>
<html lang="pt-br">
<%@include file="verifica_sessao.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Usuario Inclusao</title>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.grid.css"
	rel="stylesheet" />
</head>
<%
	String acao = request.getParameter("acao");
	String idusuario = request.getParameter("idusuario");
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

		if (document.forms[0].nome.value == "") {
			alert("Campo Nome é obrigatório.");
			document.forms[0].nome.focus();
			return;
		}

		if (document.forms[0].sexo[0].checked == false
				&& document.forms[0].sexo[1].checked == false) {
			alert("O campo Sexo é obrigatório");
			return;
		}

		if (document.forms[0].data.value == "") {
			alert("O campo data deve ser preenchido");
			return;
		} else {
			var data = document.forms[0].data.value;
			if (valida_data(data) == true) {
				document.forms[0].acao.value = "incluir";
				document.forms[0].action = "usuario_inclusao.jsp";
				document.forms[0].submit();
			}

		}

		if (document.forms[0].setor.value == "0") {
			alert("O campo setor deve ser informado");
			return;
		}

	}
</script>
<body>
	<form method="get">
		<input type="text" class="form-control" id="chuva" placeholder="Login">
		<div class="container">
			<div class="form-row">
				<div class="col">
					<div class="card border-warning mb-3" style="width: 18rem;">
						<div class="card-header bg-warning mb-3">
							<img src="../imagens/cadastro.jpg" class="card-img-top" alt="...">
							<!--<h5 class="card-title text-white bg-dark mb-3">Cadastrar Usuário</h5>  -->
						</div>
						<div class="card-body">
							<h5 class="card-title">Escolha uma foto</h5>
							<p class="card-text">Máximo 150px</p>

							<!-- Upload de foto do usuário -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input"
										id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
									<label class="custom-file-label" for="inputGroupFile01">Choose
										file</label>
								</div>
							</div>
						</div>
					</div>
					<!-- Primeira coluna -->
				</div>
				<div class="col">
					<h3>Inclusão de Usuários</h3>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="login">Login :</label> <input type="text"
								class="form-control" id="login" name="login" placeholder="Login">
						</div>
						<div class="form-group col-md-6">
							<label for="senha">Password :</label> <input type="password"
								class="form-control" id="senha" name="senha"
								placeholder="Password">
						</div>
						<div class="form-group col-md-12">
							<label for="name">Nome :</label> <input type="text"
								class="form-control" name="nome" id="nome" placeholder="Nome">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check form-check-inline">
							<label class="form-check-label" id="sexo" for="inlineRadio1">Sexo
								: &nbsp;</label> <input class="form-check-input" type="radio"
								name="sexo" id="inlineRadio1" value="M"> <label
								class="form-check-label" id="M" for="inlineRadio1">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="sexo"
								id="sexo" name="sexo" value="F"> <label
								class="form-check-label" id="F" for="inlineRadio2">Feminino</label>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="data">Data de Nascimento:</label> <input type="text"
								name="data" class="form-control" id="data">
						</div>
						<div class="form-group col-md-4">
							<label for="setor">Setor</label> <select name="setor" id="setor"
								class="form-control">
								<option value="0" selected>Choose...</option>
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
							</select>
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-primary" value="incluir"
							onclick="validar()">Incluir</button>
						<button type="button" class="btn btn-primary" value="voltar"
							onclick="retornar('<%=idusuario%>')">Voltar</button>
					</div>
				</div>
			</div>
			<!-- Fim da form-row -->
			<input type="text" name="acao"> 
			<input type="hidden" name="idusuario">
		</div>
	</form>
</body>
</html>