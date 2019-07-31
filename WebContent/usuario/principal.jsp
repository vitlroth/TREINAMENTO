<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="bean.Usuario_ModuloBean,util.Data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.UsuarioBean"%>
<%@include file="verifica_sessao.jsp"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Módulos</title>
<!-- <link href="css/estilo.css" rel="stylesheet" type="text/css" />   -->
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- Templates criado by startbootstrap -->
<!-- Bootstrap core CSS -->
<link href="../resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="../resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../resources/bootstrap/css/grayscale.min.css" rel="stylesheet">
</head>
<%
	String msg = request.getParameter("msg");
	String idusuario = request.getParameter("idusuario");
	ArrayList<Usuario_ModuloBean> lista = null;
	Usuario_ModuloBean modulo = new Usuario_ModuloBean();
	lista = modulo.listamodulos(request);
	if (session.getAttribute("UsuarioLogado") != null) {
%>
<script type="text/javascript">
	function valida(idmodulo, destmodulo) {
		alert(destmodulo);
		document.forms[0].action = destmodulo;
		document.forms[0].submit();
	}

	function validando(idusuario) {
		document.forms[0].idusuario.value = idusuario;
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}

	function retorno() {
		window.location.replace("http://localhost:8080/treinamento/index.jsp");
	}

	
	
	function ret(id){
		document.forms[0].action = "cadastro_usuario.jsp";		
		document.forms[0].submit();
	}
	
	
</script>
<body>
<form method="get">
	<input type="text" name="acao" value="modulo"> 
	<input type="text" name="idusuario" value="<%=idusuario%>">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">																
			NETUNO
			</a>							
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"	aria-label="Toggle navigation">  Menu <i class="fas fa-bars"></i>
			</button> 
			<div class="collapse navbar-collapse" id="navbarResponsive"> 
			<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">SOBRE</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#projects">FRONT-END</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#signup">BACK-END</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#signup">BANCO DE DADOS</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#signup">GOVERNANÇA</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#signup">OUTROS</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:ret('<%=idusuario%>')">CADASTRO</a></li>
			</ul>
			</div>
		</div>
	</nav>
	<!-- Header -->
	<header class="masthead">
		<div class="container d-flex h-100 align-items-center">
			<div class="mx-auto text-center">
				<h1 class="mx-auto my-0 text-uppercase"> God doesn't make wars</h1>
				<h2 class="text-white-50 mx-auto mt-2 mb-5">Um sistema desenvolvido por 
				<%
				UsuarioBean usuarioL = (UsuarioBean) session.getAttribute("UsuarioLogado");
			%>
				<%
				out.print(usuarioL.getNmusuario() + " ");
			%>
				<%
				if (msg != null) {
						out.println(msg);
					}
			%>
				</h2>
				<a href="javascript:retorno()" class="btn btn-primary js-scroll-trigger">Voltar para pagina de login</a>
			</div>
		</div>
	</header>										
<div class="row text-center">

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <h2 class="my-5 h2">Senior Software Engineer</h2>

          <img class="rounded-circle" alt="100x100" src="../fotos/luis.jpg" data-holder-rendered="true">

        </div>
       
        
            <!--Grid column-->
        <div class="col-md-6 mb-4">

          <h2 class="my-5 h2">Graphic Designer Marketing
</h2>

          <img class="rounded-circle z-depth-2" alt="100x100" src="../fotos/paola.jpg" data-holder-rendered="true">

        </div>
        <!--Grid column-->
        
      </div>

	<!-- About Section -->
	<section id="about" class="about-section text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-white mb-4">Built with Bootstrap 4</h2>
					<p class="text-white-50">
						Grayscale is a free Bootstrap theme created by Start Bootstrap. It
						can be yours right now, simply download the template on <a
							href="http://startbootstrap.com/template-overviews/grayscale/">the
							preview page</a>. The theme is open source, and you can use it for
						any purpose, personal or commercial.
					</p>
				</div>
			</div>
			<img src="../resources/bootstrap/img/ipad.png" class="img-fluid"
				alt="">
		</div>
	</section>

	<!-- Projects Section -->
	<section id="projects" class="projects-section bg-light">
		<div class="container">
			<!-- Featured Project Row -->
			<div class="row align-items-center no-gutters mb-4 mb-lg-5">
				<div class="col-xl-8 col-lg-7">
					<img class="img-fluid mb-3 mb-lg-0"
						src="../resources/bootstrap/img/bg-masthead.jpg" alt="">
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="featured-text text-center text-lg-left">
						<h4>Shoreline</h4>
						<p class="text-black-50 mb-0">Grayscale is open source and MIT
							licensed. This means you can use it for any project - even
							commercial projects! Download it, customize it, and publish your
							website!</p>
					</div>
				</div>
			</div>
			<!-- Project One Row -->
			<div class="row justify-content-center no-gutters mb-5 mb-lg-0">
				<div class="col-lg-6">
					<img class="img-fluid"
						src="../resources/bootstrap/img/demo-image-01.jpg" alt="">
				</div>
				<div class="col-lg-6">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-left">
								<h4 class="text-white">Misty</h4>
								<p class="mb-0 text-white-50">An example of where you can
									put an image of a project, or anything else, along with a
									description.</p>
								<hr class="d-none d-lg-block mb-0 ml-0">
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Project Two Row -->
			<div class="row justify-content-center no-gutters">
				<div class="col-lg-6">
					<img class="img-fluid"
						src="../resources/bootstrap/img/demo-image-02.jpg" alt="">
				</div>
				<div class="col-lg-6 order-lg-first">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-right">
								<h4 class="text-white">Montanhas</h4>
								<p class="mb-0 text-white-50">Another example of a project
									with its respective description. These sections work well
									responsively as well, try this theme on a small screen!</p>
								<hr class="d-none d-lg-block mb-0 mr-0">
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- Signup Section -->
	<section id="signup" class="signup-section">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-lg-8 mx-auto text-center">

					<i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
					<h2 class="text-white mb-5">Subscribe to receive updates!</h2>

					<form class="form-inline d-flex">
						<input type="email"
							class="form-control flex-fill mr-0 mr-sm-2 mb-3 mb-sm-0"
							id="inputEmail" placeholder="Enter email address...">
						<button type="submit" class="btn btn-primary mx-auto">Subscribe</button>
					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section -->
	<section class="contact-section bg-black">
		<div class="container">

			<div class="row">

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Endereço</h4>
							<hr class="my-4">
							<div class="small text-black-50">1012 Bento Alves,
								São Leopoldo RS</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4">
							<div class="small text-black-50">
								<a href="#">vitlroth@gmail.com</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Fone</h4>
							<hr class="my-4">
							<div class="small text-black-50">(051) 92994625</div>
						</div>
					</div>
				</div>
			</div>
			<!--  Acesso as redes sociais -->
			<div class="social d-flex justify-content-center">
				<a href="#" class="mx-2"> <i class="fab fa-twitter"></i>
				</a> <a href="#" class="mx-2"> <i class="fab fa-facebook-f"></i>
				</a> <a href="#" class="mx-2"> <i class="fab fa-github"></i>
				</a>
			</div>

		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-black small text-center text-white-50">
		<div class="container">Copyright &copy; Your Website 2019</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/grayscale.min.js"></script>



	<!-- Aqui começa o projeto anterior -->
	
	<!--  vamos capinar isso aqui -->
	
	<div class="container-fluid">
		
			<%
				UsuarioBean usuarioLogado = (UsuarioBean) session.getAttribute("UsuarioLogado");
			%>

			<h3>
				Bem vindo
				<%
				out.print(usuarioLogado.getNmusuario() + " - " + usuarioLogado.getNmlogin());
			%>! -
				<%
				if (msg != null) {
						out.println(msg);
					}
			%>
			</h3>
			<h4><%=Data.dataAtual()%></h4>
			<div class="list-group ">
				<button type=button class="list-group-item list-group-item">
					Módulos</button>
				<a href="javascript:validando('<%=idusuario%>')"
					class="list-group-item list-group-item active"> Cadastrar  Usuarios</a>
				<%
					if (lista != null && lista.size() > 0) {
							Usuario_ModuloBean moduloBean = null;
							for (int i = 0; i < lista.size(); i++) {
								moduloBean = lista.get(i);
				%>
				<a
					href="javascript:valida('<%=moduloBean.getModuloBean().getIdmodulo()%>','<%=moduloBean.getModuloBean().getDestmodulo()%>')"
					class="list-group-item list-group-item"> <%=moduloBean.getModuloBean().getNmmodulo()%>
				</a>

				<%
					}
						}
					}
				%>
			</div>
			<input type="text" name="acao" value="modulo"> <input
				type="text" name="idusuario" value="<%=idusuario%>"> <input
				type="button" value="Ir para Página de Login" onclick="retorno()">
		
	</div>
	</form>
</body>
</html>