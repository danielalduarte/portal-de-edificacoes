<%@page import="br.com.DTO.ProjetoDTO"%>
<%@page import="br.com.DAO.ProjetoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Dados do Projeto</title>
	</head>	
	<body>
		<%	
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			
			ProjetoDAO projetoDAO = new ProjetoDAO();
			
			ProjetoDTO projetoDTO = projetoDAO.buscaProjetoPorCodigo(codigo);
		%>
	    <div class="indexheader">
	    	<div class="col-md" align="right">
				<a href="../responsavelTecnico/homeResponsavelTecnico.jsp" class="btn btn-primary">Home</a>
				<a href="novoProjeto.html" class="btn btn-primary">Novo Projeto</a>
				<a href="../responsavelTecnico/consultarProjetosResponsavelTecnico.jsp" class="btn btn-primary">Pesquisar</a>
				<a href="../responsavelTecnico/dadosResponsavelTecnico.jsp" class="btn btn-primary">Meus Dados</a>
				<a href="../index.html" class="btn btn-primary">Sair</a>
			</div>
	    </div>
	    <div class="container" style="background-color: white">
	    	<div class="row g-1">
	    		<h1><% out.print(projetoDTO.getNome() + " - " + projetoDTO.getSubtipoStatus()); %></h1>
	    	</div>	
	    </div>
   		<div style="height: 30px"></div>	    
		<div class="container" style="background-color: white">
			<div class="col-md" align="right">
				<% out.print("Última alteração: " + projetoDTO.getDataAtualizacao()); %>
			</div>
			<br>
			<div class="row g-3">
			  <div class="col-md">
			    <label for="floatingSelectGrid">Requerimento</label>
			    <input type="text" class="form-control" name="requerimento" value="<% out.print(projetoDTO.getRequerimento()); %>" disabled>
			  </div>
			  <div class="col-md">
			    <label for="floatingSelectGrid">Processo</label>
			    <input type="text" class="form-control" name="processo" value="<% out.print(projetoDTO.getProcesso()); %>" disabled>
			  </div>
			  <div class="col-md">
			    <label for="floatingSelectGrid">Alvara</label>
			    <input type="text" class="form-control" name="alvara" value="<% out.print(projetoDTO.getAlvara()); %>" disabled>
			  </div>
			</div>
			<br><br>
			<div class="row g-4">
			  <div class="col-md" align="center">
				<a href="" class="btn btn-secondary">HISTORICO</a>
			  </div>
			  <div class="col-md" align="center">
				<a href="" class="btn btn-primary">ANEXAR DOCUMENTOS</a>
			  </div>
			  <div class="col-md" align="center">
				<a href="" class="btn btn-primary">EMITIR ALVARA</a>
			  </div>
			  <div class="col-md" align="center">
				<a href="" class="btn btn-primary">EMITIR GUIAS</a>
			  </div>
			</div>
			<br><br>
			<div class="row g-1">
			<p>Requer alvará consolidado com as informações complementares.</p>
			<p>A aprovação do projeto seguirá o fluxo convencional.</p>
			</div>
		</div>
	</body>
</html>