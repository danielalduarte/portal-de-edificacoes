<%@page import="br.com.DAO.HistoricoDAO"%>
<%@page import="br.com.DAO.ProjetoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	</head>	
	<body>
	  <%
		try{
						
			ProjetoDAO projetoDAO = new ProjetoDAO();
			projetoDAO.cadastrarProjeto(request.getParameter("nomeProjeto"), request.getParameter("cpfCnpjResponsavel"), request.getParameter("cpfCnpjRequerente"));
			
			HistoricoDAO historicoDAO = new HistoricoDAO();
			historicoDAO.cadastrarHistorico("Cadastro", request.getParameter("nomeProjeto"));
			
			response.sendRedirect("novoProjeto.html");
			
		} catch (Exception e) {
			
			System.out.println("Ocorreu um erro: " + e.getMessage());
			
		}
	  %>
	</body>
</html>