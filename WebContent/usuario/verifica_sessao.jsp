<% 
if(session.getAttribute("UsuarioLogado")== null){		
	response.sendRedirect("/treinamento/index.jsp");		
}
%>

