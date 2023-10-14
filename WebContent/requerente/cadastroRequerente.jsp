<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Cadastro Requerente</title>
	</head>	
	<body>
	    <div class="indexheader"></div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">CADASTRO DE REQUERENTE</h1>
	    </div>
   		<div style="height: 30px"></div>	    
		<div class="container" style="background-color: white">
			<form action="dadosRequerente.jsp" method="post">
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Nome</label>
				    <input type="text" class="form-control" name="nome" aria-describedby="nome">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpj" aria-describedby="cpfCnpj">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Senha</label>
				    <input type="password" class="form-control" name="senha" aria-describedby="senha">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">E-mail</label>
				    <input type="text" class="form-control" name="email" aria-describedby="email">
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Telefone</label>
				    <input type="text" class="form-control" name="telefone" aria-describedby="telefone">
				  </div>
				</div>
				<br />
				<div>
					<div class="col-md">
						<a href="acessoRequerente.jsp" class="btn btn-secondary">CANCELAR</a>
						<button type="submit" class="btn btn-primary">CADASTRAR</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>