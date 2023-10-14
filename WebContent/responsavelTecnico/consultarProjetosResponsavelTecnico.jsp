<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Consultar Projetos</title>
	</head>
	<body>
		<div class="indexheader">
			<div class="col-md" align="right">
				<a href="homeResponsavelTecnico.jsp" class="btn btn-primary">Home</a>
				<a href="../projeto/novoProjeto.html" class="btn btn-primary">Novo Projeto</a>
				<a href="" class="btn btn-secondary">Pesquisar</a>
				<a href="dadosResponsavelTecnico.jsp" class="btn btn-primary">Meus Dados</a>
				<a href="../index.html" class="btn btn-primary">Sair</a>
			</div>
		</div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">CONSULTAR PROJETOS</h1>
	    </div>
   		<div style="height: 30px"></div>	    
		<div class="container" style="background-color: white">
			<form action="listarProjetosResponsavelTecnico.jsp" method="post">
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Nome</label>
				    <input type="text" class="form-control" name="nome" aria-describedby="nome">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Protocolo</label>
				    <input type="text" class="form-control" name="protocolo" aria-describedby="protocolo">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Processo</label>
				    <input type="text" class="form-control" name="processo" aria-describedby="processo">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Inscrição IPTU</label>
				    <input type="text" class="form-control" name="inscricaoIptu" aria-describedby="inscricaoIptu">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Alvara</label>
				    <input type="text" class="form-control" name="alvara" aria-describedby="alvara">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Data inicio obra</label>
				    <input type="date" class="form-control" name="dataInicioObra" aria-describedby="dtInicioObra">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Status</label>
				    <input type="text" class="form-control" name="status" aria-describedby="status">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Requerimento</label>
				    <input type="text" class="form-control" name="requerimento" aria-describedby="requerimento">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Responsável Técnico</label>
				    <input type="text" class="form-control" name="responsavelTecnico" aria-describedby="responsavelTecnico">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpjResponsavel" aria-describedby="cpfCnpjResp">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Requerente</label>
				    <input type="text" class="form-control" name="requerente" aria-describedby="requerente">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpjRequerente" aria-describedby="cpfCnpjReq">
				  </div>
				</div>
				<br />
				<div>
					<div class="col-md" align="right">
						<button type="submit" class="btn btn-primary">PESQUISAR</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>