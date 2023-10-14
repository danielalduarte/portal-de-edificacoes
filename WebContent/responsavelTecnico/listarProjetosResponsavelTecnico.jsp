<%@page import="br.com.DTO.ProjetoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ProjetoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Home Responsável Técnico</title>
	</head>
	<body>
		<div class="indexheader">
			<div class="col-md" align="right">
				<a href="homeResponsavelTecnico.jsp" class="btn btn-primary">Home</a>
				<a href="../projeto/novoProjeto.html" class="btn btn-primary">Novo Projeto</a>
				<a href="consultarProjetosResponsavelTecnico.jsp" class="btn btn-primary">Pesquisar</a>
				<a href="homeResponsavelTecnico.jsp" class="btn btn-primary">Meus Dados</a>
				<a href="../index.html" class="btn btn-primary">Sair</a>
			</div>
		</div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">PROJETOS</h1>
	    </div>
   		<div style="height: 30px"></div>	    
		<div class="container text-center" style="background-color: white">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
						    <th scope="col">Código</th>
						    <th scope="col">Nome</th>
						    <th scope="col">Requerimento</th>
						    <th scope="col">Última atualização</th>
						    <th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
		
			<%
				try{
					ProjetoDAO projetoDAO = new ProjetoDAO();
					ArrayList<ProjetoDTO> lista = projetoDAO.listarProjetos(request.getParameter("nome"), request.getParameter("protocolo"), request.getParameter("processo"), request.getParameter("inscricaoIptu"), request.getParameter("alvara"), request.getParameter("dataInicioObra"), request.getParameter("status"), request.getParameter("requerimento"), request.getParameter("responsavelTecnico"), request.getParameter("requerente"), request.getParameter("cpfCnpjResponsavel"), request.getParameter("cpfCnpjRequerente"));
					
					for(int num = 0; num < lista.size(); num ++){
			%>
					
						<tr>
							<th scope="row"><% out.print(lista.get(num).getCodigo()); %></td>
							<td><% out.print(lista.get(num).getNome()); %></td>
							<td><% out.print(lista.get(num).getRequerimento()); %></td>
							<td><% out.print(lista.get(num).getDataAtualizacao()); %></td>
							<td><% out.print(lista.get(num).getSubtipoStatus()); %></td>
						</tr>
								
			<%
					}
					
				}
				catch (Exception e){
					System.out.println(e.getMessage());
				}
			%>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>