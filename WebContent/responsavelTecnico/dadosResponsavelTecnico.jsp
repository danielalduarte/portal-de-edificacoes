<%@page import="br.com.DAO.ResponsavelTecnicoDAO"%>
<%@page import="br.com.DTO.ResponsavelTecnicoDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Meus Dados</title>
	</head>
<body>
	<%
		try{
			
			HttpSession sessao = request.getSession();
			
			String cpfCnpj = sessao.getAttribute("cpfResponsavel").toString().trim();
			
			ResponsavelTecnicoDAO responsavelTecnicoDAO = new ResponsavelTecnicoDAO();			
			
			ResponsavelTecnicoDTO responsavelTecnicoDTO = responsavelTecnicoDAO.buscaResponsavelTecnicoPorCpfCnpf(cpfCnpj);

	%>
		<div class="indexheader">
			<div class="col-md" align="right">
				<a href="homeResponsavelTecnico.jsp" class="btn btn-primary">Home</a>
				<a href="../projeto/novoProjeto.html" class="btn btn-primary">Novo Projeto</a>
				<a href="consultarProjetosResponsavelTecnico.jsp" class="btn btn-primary">Pesquisar</a>
				<a href="" class="btn btn-secondary">Meus Dados</a>
				<a href="../index.html" class="btn btn-primary">Sair</a>
			</div>
		</div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">MEUS DADOS</h1>
	    </div>
   		<div style="height: 30px"></div>
   		<div class="container" style="background-color: white">
   			<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Nome</label>
				    <input type="text" class="form-control" name="nome" value="<% out.print(responsavelTecnicoDTO.getNome()); %>" disabled>
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpj" value="<% out.print(responsavelTecnicoDTO.getCpfCnpj()); %>" disabled>
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">E-mail</label>
				    <input type="text" class="form-control" name="email" value="<% out.print(responsavelTecnicoDTO.getEmail()); %>" disabled>
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Telefone</label>
				    <input type="text" class="form-control" name="telefone" value="<% out.print(responsavelTecnicoDTO.getTelefone()); %>" disabled>
				  </div>
				</div>
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">Profissão</label>
				    <input type="text" class="form-control" name="profissao" value="<% out.print(responsavelTecnicoDTO.getSubtipoProfissao()); %>" disabled>
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">CREA</label>
				    <input type="text" class="form-control" name="crea" value="<% out.print(responsavelTecnicoDTO.getCrea()); %>" disabled>
				  </div>
				</div>
				<br />
	</div>
	<%
		} catch (Exception e) {
			
			System.out.println("Ocorreu um erro: " + e.getMessage());
			
		}
	%>
</body>
</html>