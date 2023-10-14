<%@page import="br.com.DTO.HistoricoDTO"%>
<%@page import="br.com.DAO.HistoricoDAO"%>
<%@page import="br.com.DTO.ProjetoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ProjetoDAO"%>
<%@page import="br.com.DAO.RequerenteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Home Requerente</title>
	</head>
	<body>
		<div class="indexheader">
			<div class="col-md" align="right">
				<a href="" class="btn btn-secondary">Home</a>
				<a href="" class="btn btn-primary">Novo Projeto</a>
				<a href="" class="btn btn-primary">Pesquisar</a>
				<a href="" class="btn btn-primary">Meus Dados</a>
				<a href="../index.html" class="btn btn-primary">Sair</a>
			</div>
		</div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">MEUS PROJETOS - ÚLTIMAS ATUALIZAÇÕES</h1>
	    </div>
   		<div style="height: 30px"></div>
   		<div class="container" style="background-color: white">
   			<div class="row g-2">
   			<div class="col-md">
   			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
						    <th scope="col">Nome</th>
						    <th scope="col">Requerimento</th>
						    <th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
		
			<%
				try{
					HttpSession sessao = request.getSession();
					
					String cpf = sessao.getAttribute("cpfRequerente").toString().trim();
					
					ProjetoDAO projetoDAO = new ProjetoDAO();
					
					ArrayList<ProjetoDTO> lista = projetoDAO.listaProjetosPorCpfCnpj(cpf);
					
					for(int num = 0; num < lista.size(); num ++){
			%>
					
						<tr>
							<td scope="row"><% out.print(lista.get(num).getNome()); %></td>
							<td><% out.print(lista.get(num).getRequerimento()); %></td>
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

			<div class="col-md">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
						    <th scope="col">Últimas atualizações</th>
						</tr>
					</thead>
					<tbody>
		
			<%
				try{
					HttpSession sessao = request.getSession();
					
					String cpf = sessao.getAttribute("cpfRequerente").toString().trim();
					
					HistoricoDAO historicoDAO = new HistoricoDAO();
					
					ArrayList<HistoricoDTO> lista = historicoDAO.listaHistoricoPorCpfCnpj(cpf);
					
					for(int num = 0; num < lista.size(); num ++){
			%>
					
						<tr>
							<td scope="row"><%
							out.print(lista.get(num).getDescricao());
							out.print(" do projeto " + lista.get(num).getSubtipoProjetoNome());
							out.print(" " + lista.get(num).getDataCriacao()); %></td>
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
			</div>
		</div>
	</body>
</html>