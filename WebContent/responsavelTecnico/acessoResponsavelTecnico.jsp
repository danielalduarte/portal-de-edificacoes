<%@page import="br.com.DAO.ResponsavelTecnicoDAO"%>
<%@page import="br.com.DTO.ResponsavelTecnicoDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<title>Portal de Edificações :: Acesso de Responsável Técnico</title>
	</head>	
	<body>
	    <div class="indexheader"></div>
	    <div class="container" style="background-color: white">
	    	<h1 align="center">ACESSO DE RESPONSÁVEL TÉCNICO</h1>
	    </div>
   		<div style="height: 30px"></div>	    
		<div class="container" style="background-color: white">
		<%
			String cpfCnpj = request.getParameter("cpfCnpj");
			String senha = request.getParameter("senha");
		
			try{
				
				if(cpfCnpj.isEmpty() || senha.isEmpty() || cpfCnpj == null || senha == null) {
					%><div class="alert alert-primary" role="alert">Informe usuário e senha!</div><%
				} else {
				
					ResponsavelTecnicoDAO responsavelTecnicoDAO = new ResponsavelTecnicoDAO();
					
					ResponsavelTecnicoDTO responsavelTecnicoDTO = responsavelTecnicoDAO.loginResponsavelTecnico(request.getParameter("cpfCnpj"), request.getParameter("senha"));
					
					
					if(responsavelTecnicoDTO.getNome() != null){
						
						HttpSession httpSession = request.getSession();
						httpSession.setAttribute("codigoResponsavel", responsavelTecnicoDTO.getCodigo());
						httpSession.setAttribute("nomeResponsavel", responsavelTecnicoDTO.getNome());
						httpSession.setAttribute("cpfResponsavel", responsavelTecnicoDTO.getCpfCnpj());
						
						out.println("Seja bem vindo(a), " + responsavelTecnicoDTO.getNome() + "!");
						response.sendRedirect("homeResponsavelTecnico.jsp");
						
					
					} else {
						%><div class="alert alert-danger" role="alert">Usuário ou senha inválidos!</div><%				
					}
				}
				
			} catch (Exception e) {
				%><div class="alert alert-primary" role="alert">Usuário ou senha inválidos!</div><%
			}	
		%>
			<form action="acessoResponsavelTecnico.jsp" method="post">
				<div class="row g-2">
				  <div class="col-md">
				    <label for="floatingSelectGrid">CPF/CNPJ</label>
				    <input type="text" class="form-control" name="cpfCnpj" value="">
				  </div>
				  <div class="col-md">
				    <label for="floatingSelectGrid">Senha</label>
				    <input type="password" class="form-control" name="senha" value="">
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
					<a href="cadastroResponsavelTecnico.jsp" class="btn btn-secondary">CADASTRE-SE</a>
				</div>
			</div>
		</div>
	</body>
</html>