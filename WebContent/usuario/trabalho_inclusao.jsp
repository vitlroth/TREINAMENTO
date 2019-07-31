<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Perfumaria do Cadastro</title>



  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">




<!-- 
 * Bootstrap v3.3.0
 * OBS: Nessa pagina a versão se encontra diferente da versão que está no projeto
 -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script  src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>  -->
<!-- <link href="../css/formulario.css"  rel="stylesheet">
<link href="../css/formulario.js"  rel="stylesheet"> -->
<!-- <link href=../resources/bootstrap/css/bootstrap.css rel="stylesheet"  /> -->


<link hre="css/formulario.css"         rel="stylesheet"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<script type="text/javascript">
	function voltar() {
		
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}
</script>
<body>
	<form class="form-horizontal" method="get">
		<fieldset>
			<div class="panel panel-primary">
				<div class="panel-heading">Cadastro de Candidaturas à Vagas de Emprego</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-4 control-label">
							<img id="logo" src="../imagens/cadastro.jpg"
								class="rounded-circle" alt="Deus é fiel!" />
						</div>
						<div class="col-md-4 control-label">
							<h2>Preencha os campos abaixo</h2>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-11 control-label">
							<p class="help-block">
								<h11>*</h11>
								Campo Obrigatório
							</p>
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Nome">Nome da Empresa<h11>*</h11>
						</label>
						<div class="col-md-8">
							<input id="Nome" name="Nome" placeholder="Nome da Empresa"
								class="form-control input-md" required="required" type="text">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Data">Data de Cadastro<h11>*</h11></label>
						<div class="col-md-4">
							<input id="dtnasc" name="dtnasc" placeholder="DD/MM/AAAA"
								class="form-control input-md" required="" type="text"
								maxlength="10" OnKeyPress="formatar('##/##/####', this)"
								onBlur="showhide()">
						</div>	
							
						<label class="col-md-2 control-label" for="DataCal">Data de Nascimento :</label>		
			   <div class='col-md-4'>                                    
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>            
        </div>															
					</div>
					<!-- Prepended text-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Telefone
							da Empresa<h11>*</h11>
						</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-earphone"></i></span> <input
									id="prependedtext" name="prependedtext" class="form-control"
									placeholder="XX XXXXX-XXXX" required="" type="text"
									maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
									OnKeyPress="formatar('## #####-####', this)">
							</div>
						</div>
					</div>

					<!-- Prepended text-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Email
							da Empresa<h11>*</h11>
						</label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input
									id="prependedtext" name="prependedtext" class="form-control"
									placeholder="email@email.com" required="" type="text"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
							</div>
						</div>
						
						<label class="col-md-2 control-label" >Site da Empresa</label>
						<div class="col-md-4">
						<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-envelop"></i></span>
						<input id="prependedtext" name="prependedtext" class="form-control" placeholder="wwww.unisinos.edu.br" required="" type="text"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
						</div>												
						</div>						
												
					</div>

					<!-- Search input-->
					<!-- Prepended text-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Endereço da Empresa</label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">Rua</span> <input id="rua"
									name="rua" class="form-control" placeholder="Endereco"
									required="" readonly="readonly" type="text">
							</div>
						</div>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Nº <h11>*</h11></span> <input
									id="numero" name="numero" class="form-control" placeholder=""
									required="" type="text">
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">Bairro</span> <input id="bairro"
									name="bairro" class="form-control" placeholder="" required=""
									readonly="readonly" type="text">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext"></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">Cidade</span> <input id="cidade"
									name="cidade" class="form-control" placeholder="" required=""
									readonly="readonly" type="text">
							</div>
						</div>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Estado</span> <input id="estado"
									name="estado" class="form-control" placeholder="" required=""
									readonly="readonly" type="text">
							</div>
						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Estado Civil">Tipo
							de Cadastro <h11>*</h11>
						</label>
						<div class="col-md-2">
							<select required id="Estado Civil" name="Estado Civil"
								class="form-control">
								<option value=""></option>
								<option value="Solteiro(a)">Agencia</option>
								<option value="Casado(a)">Site da Empresa</option>
								<option value="Divorciado(a)">Site</option>
								<option value="Viuvo(a)">E-mail</option>
							</select>
						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="cargoPretendido">Cargo
							Pretendido <h11>*</h11>
						</label>
						<div class="col-md-4">
							<input id="profissao" name="profissao" type="text"
								placeholder="Cargo pretendido" class="form-control input-md"
								required="">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="encaminhamento">Encaminhamento
							<h11>*</h11>
						</label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <label
									class="radio-inline" for="radios-0"> <input
										type="radio" name="enc" id="enc" value="Nao"
										onclick="desabilita('enc_instituicao')" required> Não
								</label> <label class="radio-inline" for="radios-1"> <input
										type="radio" name="enc" id="enc" value="sim"
										onclick="habilita('enc_instituicao')"> Sim
								</label>
								</span> <input id="enc_instituicao" name="enc" class="form-control"
									type="text" placeholder="Agencia">

							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="textinput">Como
							ficou sabendo da Vaga?</label>
						<div class="col-md-4">
							<input id="textinput" name="textinput" placeholder=""
								class="form-control input-md" type="text">
						</div>
					</div>
					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Cadastrar"></label>
						<div class="col-md-8">
							<button id="Cadastrar" name="Cadastrar" class="btn btn-success"
								type="Submit">Cadastrar</button>
							<button id="Cancelar" name="Cancelar" class="btn btn-danger"
								type="Reset" onclick="voltar()">Cancelar</button>
							<button id="Voltar" name="Voltar" class="btn btn-info" type="Reset"
								onclick="voltar()">Voltar</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Fim da Div => panel panel-primary -->
			<!-- ************************************************************************************************************ 
			*****************************************************************************************************************
			************Abaixo alguns itens e melhorias para serem acrescentadas na tela de cadastro de usuários**************
		*****************************************************************************************************************	
			<div class="panel panel-primary">
			<div class="panel-heading">
				Cadastro de Usuários
		     </div>
			<div class="panel-body">																
			<div id="newpost">
				<div class="form-group">
					<div class="col-md-2 control-label">
						<h3>Responsável</h3>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="Nome">Nome <h11>*</h11></label>
					<div class="col-md-8">
						<input id="Nome" name="Nome" placeholder=""
							class="form-control input-md" required="" type="text">
					</div>
					<label class="col-md-2 control-label" for="Nome">CPF <h11>*</h11></label>
					<div class="col-md-2">
						<input id="cpf" name="cpf" placeholder="Apenas números"
							class="form-control input-md" required="" type="text"
							maxlength="11" pattern="[0-9]+$">
					</div>
				</div>
				<!-- Text input-->
			<div class="form-group">
				<label class="col-md-1 control-label" for="Nome">Nascimento<h11>*</h11></label>
				<div class="col-md-2">
					<input id="dtnasc" name="dtnasc" placeholder="DD/MM/AAAA"
						class="form-control input-md" required="" type="text"
						maxlength="10" OnKeyPress="formatar('##/##/####', this)">
				</div>
				<!-- Multiple Radios (inline) -->
				<label class="col-md-1 control-label" for="radios">Sexo <h11>*</h11></label>
				<div class="col-md-4">
					<label required="" class="radio-inline" for="radios-0"> <input
						name="sexo" id="sexo" value="feminino" type="radio" required>
						Feminino
					</label> <label class="radio-inline" for="radios-1"> <input
						name="sexo" id="sexo" value="masculino" type="radio">
						Masculino
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="Estado Civil">Estado
					Civil <h11>*</h11>
				</label>
				<div class="col-md-2">
					<select required id="Estado Civil" name="Estado Civil"
						class="form-control">
						<option value=""></option>
						<option value="Solteiro(a)">Solteiro(a)</option>
						<option value="Casado(a)">Casado(a)</option>
						<option value="Divorciado(a)">Divorciado(a)</option>
						<option value="Viuvo(a)">Viuvo(a)</option>
					</select>
				</div>
				<label class="col-md-1 control-label" for="Filhos">Filhos<h11>*</h11></label>
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon"> <label
							class="radio-inline" for="radios-0"> <input type="radio"
								name="ofilhos" id="ofilhos" value="nao"
								onclick="desabilita('ofilhos_qtd')" required> Não
						</label> <label class="radio-inline" for="radios-1"> <input
								type="radio" name="ofilhos" id="ofilhos" value="sim"
								onclick="habilita('ofilhos_qtd')"> Sim
						</label>
						</span> <input id="ofilhos_qtd" name="ofilhos_qtd" class="form-control"
							type="text" placeholder="Quantos?" pattern="[0-9]+$">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="selectbasic">Escolaridade
					<h11>*</h11>
				</label>
				<div class="col-md-3">
					<select required id="escolaridade" name="escolaridade"
						class="form-control">
						<option value=""></option>
						<option value="Analfabeto">Analfabeto</option>
						<option value="Fundamental Incompleto">Fundamental
							Incompleto</option>
						<option value="Fundamental Completo">Fundamental Completo</option>
						<option value="Médio Incompleto">Médio Incompleto</option>
						<option value="Médio Completo">Médio Completo</option>
						<option value="Superior Incompleto">Superior Incompleto</option>
						<option value="Superior Completo">Superior Completo</option>
					</select>
				</div>
				<!-- Text input-->
				<label class="col-md-1 control-label" for="profissao">Profissão<h11>*</h11></label>
				<div class="col-md-4">
					<input id="profissao" name="profissao" type="text" placeholder=""
						class="form-control input-md" required="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="prependedtext">Telefone
					<h11>*</h11>
				</label>
				<div class="col-md-2">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-earphone"></i></span> <input
							id="prependedtext" name="prependedtext" class="form-control"
							placeholder="XX XXXXX-XXXX" required="" type="text"
							maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
							OnKeyPress="formatar('## #####-####', this)">
					</div>
				</div>
				<label class="col-md-1 control-label" for="prependedtext">Telefone</label>
				<div class="col-md-2">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-earphone"></i></span> <input
							id="prependedtext" name="prependedtext" class="form-control"
							placeholder="XX XXXXX-XXXX" type="text" maxlength="13"
							pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
							OnKeyPress="formatar('## #####-####', this)">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="prependedtext">Email
					<h11>*</h11>
				</label>
				<div class="col-md-5">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope"></i></span> <input
							id="prependedtext" name="prependedtext" class="form-control"
							placeholder="email@email.com" required="" type="text"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
					</div>
				</div>
			</div>
			<!-- Search input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="CEP">CEP <h11>*</h11></label>
				<div class="col-md-2">
					<input id="cep" name="cep" placeholder="Apenas números"
						class="form-control input-md" required="" value="" type="search"
						maxlength="8" pattern="[0-9]+$">
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary"
						onclick="pesquisacep(cep.value)">Pesquisar</button>
				</div>
			</div>

			<!-- Prepended text-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="prependedtext">Endereço</label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon">Rua</span> <input id="rua"
							name="rua" class="form-control" placeholder="" required=""
							readonly="readonly" type="text">
					</div>
				</div>
				<div class="col-md-2">
					<div class="input-group">
						<span class="input-group-addon">Nº <h11>*</h11></span> <input
							id="numero" name="numero" class="form-control" placeholder=""
							required="" type="text">
					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">Bairro</span> <input id="bairro"
							name="bairro" class="form-control" placeholder="" required=""
							readonly="readonly" type="text">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="prependedtext"></label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon">Cidade</span> <input id="cidade"
							name="cidade" class="form-control" placeholder="" required=""
							readonly="readonly" type="text">
					</div>
				</div>
				<div class="col-md-2">
					<div class="input-group">
						<span class="input-group-addon">Estado</span> <input id="estado"
							name="estado" class="form-control" placeholder="" required=""
							readonly="readonly" type="text">
					</div>
				</div>
			</div>

		</fieldset>
	</form>
</body>
</html>