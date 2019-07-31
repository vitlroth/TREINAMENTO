<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.UsuarioBean"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Login de Usuario</title>
<!-- 
 * Bootstrap v4.1.3 (https://getbootstrap.com/)
 * Copyright 2011-2018 The Bootstrap Authors
 * Copyright 2011-2018 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 -->
<!--  <link href="resources/bootstrap/css/bootstrap.css"  rel="stylesheet"  /> -->
 <link href="css/estilo.css" rel="stylesheet" />
<!-- <link href="resources4.3.1/css/bootstrap.css" rel="stylesheet" /> -->
 <link href="resources/bootstrap/css/bootstrap.css"  rel="stylesheet"  />
<!-- <link href="resources/bootstrap/js/bootstrap.bundle.min.js"  rel="stylesheet"  />
<link href="resources/bootstrap/vendor/jquery/jquery.slim.js"  rel="stylesheet"  />   -->
</head>
<%
	String msg01 = request.getParameter("msg01");
	String acao = request.getParameter("acao");
	UsuarioBean usuarioBean = null;
	if (acao != null && acao.equals("acesso")) {
		usuarioBean = new UsuarioBean();
		usuarioBean.acessalogin(request, response);
	}
%>
<script type="text/javascript">
	function valida() {
		if (document.forms[0].login.value == "") {
			alert("Campo Usuario é obrigatório.");
			document.forms[0].login.focus();
			return;
		}
		if (document.forms[0].senha.value == "") {
			alert("Campo Senha é obrigatório.");
			document.forms[0].senha.focus();
			return;
		}
		document.forms[0].acao.value = "acesso";
		document.forms[0].submit();
	}
</script>
<body style="margin-left: 450px; margin-right: 15px; margin-top: 50px;">
	<%
		if (msg01 != null) {
			out.print(msg01);
		}
	%>
	<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Entre com seus dados</h1>
            <div class="account-wall">
                <img class="profile-img" src="fotos/paola.jpg"  alt="Meu perfil">                
                <img class="card-img-top" src="fotos/apple.jpg" alt="Card image cap">   					                             
                <form  method="get" accept-charset="utf-8" class="form-signin">                               
                <input type="text" name="login" class="form-control" placeholder="Email" required autofocus>
                <input type="password" name="senha" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="button"  onclick="valida()"> Sign in</button>
                <input   type="text" name="acao">               
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>                                
                </form>
            </div>
            <a href="#" class="text-center new-account">Create an account </a>
        </div>
    </div>
</div>
</body>
</html>