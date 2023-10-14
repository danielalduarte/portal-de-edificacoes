<%@page import="br.com.DAO.RequerenteDAO"%>
<%@page import="br.com.DTO.RequerenteDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		try{
			
			RequerenteDTO requerenteDTO = new RequerenteDTO();
			
			requerenteDTO.setNome(request.getParameter("nome"));
			requerenteDTO.setCpfCnpj(request.getParameter("cpfCnpj"));
			requerenteDTO.setEmail(request.getParameter("email"));
			requerenteDTO.setSenha(request.getParameter("senha"));
			requerenteDTO.setTelefone(request.getParameter("telefone"));
			
			RequerenteDAO requerenteDAO = new RequerenteDAO();
			requerenteDAO.cadastrarRequerente(requerenteDTO);
			
		} catch (Exception e) {
			
			System.out.println("Ocorreu um erro: " + e.getMessage());
			
		}
%>
</body>
</html>