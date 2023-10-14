<%@page import="br.com.DTO.RequerenteDTO"%>
<%@page import="br.com.DAO.RequerenteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Acesso de Requerente</title>
	</head>
	<body>
	    <div class="indexheader"></div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">ACESSO DE REQUERENTE</h1>
	    </div>
   		<div style="height: 30px"></div>
		<div class="container" style="background-color: white">
		<%
			try{
				
				if(request.getParameter("cpfCnpjReq").isEmpty() || request.getParameter("senhaReq").isEmpty() || request.getParameter("cpfCnpjReq") == null || request.getParameter("senhaReq") == null) {
		%>
					<div class="alert alert-primary" role="alert">Informe usuário e senha!</div>
		<%
				} else {
					
					RequerenteDAO requerenteDAO = new RequerenteDAO();
					
					RequerenteDTO requerenteDTO = requerenteDAO.loginRequerente(request.getParameter("cpfCnpjReq"), request.getParameter("senhaReq"));
					
					if(!requerenteDTO.getNome().isEmpty()){
						
						HttpSession httpSession = request.getSession();
						httpSession.setAttribute("codigoRequerente", requerenteDTO.getCodigo());
						httpSession.setAttribute("nomeRequerente", requerenteDTO.getNome());
						httpSession.setAttribute("cpfRequerente", requerenteDTO.getCpfCnpj());
						
						out.println("Seja bem vindo(a), " + requerenteDTO.getNome() + "!");
						response.sendRedirect("homeRequerente.jsp");
						
					} else {
		%>
						<div class="alert alert-danger" role="alert">Usuário ou senha inválidos!</div>			
		<%				
					}
				}
				
			} catch (Exception e) {
				
		%>
				<div class="alert alert-danger" role="alert">Usuário ou senha inválidos!</div>			
		<%	
			}	
		%>
			<form action="acessoRequerente.jsp" method="post">
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpjReq" value="">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Senha</label>
				    <input type="password" class="form-control" name="senhaReq" value="">
				  </div>
				</div>
				<br />
				<div>
					<div class="col-md" align="center">
						<button type="submit" class="btn btn-primary">ENTRAR</button>
					</div>
				</div>
			</form>
			<div>
				<div class="col-md" align="center">
					ou
				</div>
				<div class="col-md" align="center">
					<a href="cadastroRequerente.jsp" class="btn btn-secondary">CADASTRE-SE</a>
				</div>
			</div>
		</div>
	</body>
</html>