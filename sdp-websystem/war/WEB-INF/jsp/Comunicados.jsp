<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="pw2.*"%>
    <%@ page import="beans.*"%>
    <%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>

<% List<Curso> ecursos = (List<Curso>)request.getAttribute("ecursos");%>
<% List<Comunicado> miscomunicados = new ArrayList<Comunicado>();%>
<% for(int i=0;i<ecursos.size();i++) {
		for(int j=0;j<ecursos.get(i).getComunicados().size();j++){
			miscomunicados.add(ecursos.get(i).getComunicados().get(j));
		}
}%>
<%HttpSession misesion = request.getSession();%>
<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Comunicados</title>
</head>
<body>
<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">
    
    <div id="templatemo_header">
            
        <div id="site_title">
           <img src="/imagenes/sdplogo.png" width="600" height="95" alt="Logotipo">
        </div> <!-- end of site_title -->
        
        <div id="search_box">
           <div id="cerrar">
					<a href="<%= us.createLogoutURL("/cerrarsesion")%>"><button>DESCONECTAR</button></a>
			</div>
        </div>
    
   
        <div class="cleaner"></div>
        
    </div> <!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="/menuprofesor"><span></span>REGRESAR</a></li>
        </ul>    	
        
        <div id="register_box">
        		<div id="fecha">
				<% Date fecha = new Date(); %>
				<% SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd"); %>
				<%= format.format(fecha) %>
			</div>
        		
        </div>
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_main">
    	
        <div id="templatemo_contentall">
        
        	
        
        <div class="post_box">
        <div id="create">
				<form action="/registrocomunicado" method="post">
					<fieldset><legend>Escribe un comunicado</legend>
						<div id="formulario">
							<div class="fila">
								<div class="etiqueta"><label for="curso">Elige un curso:</label></div>
								<div class="control"><select name="curso">
				  				<%
				 	   			for (int idx = 0; idx < ecursos.size(); idx++) {
				       			Curso c = (Curso)ecursos.get(idx);
					   			%>
				        		<%="<option value='"+c.getCodigo()+"'>"+c.getNombre()+"</option>" %>
				        		<%} %>
				        		</select>
				        		</div>
							</div>
							<div class="fila">
								<div class="etiqueta"><label for="autor">Autor:</label></div>
								<div class="control"><input type="text" name="autor" value="<%= misesion.getAttribute("nombre") %>" readonly="readonly"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"><label for="email">Email:</label></div>
								<div class="control"><input type="text" name="email" value="<%= misesion.getAttribute("email") %>" readonly="readonly"></div>
							</div>
							<div class="fila">
							<div class="etiqueta">Asunto:</div>
							<div class="control"><p>escriba su asunto</p></div>
							</div>
							<div class="fila">
							<div class="etiqueta"><textarea name="asunto" rows="1" cols="41"></textarea></div>
							</div>
							<div class="fila">
							<div class="etiqueta">Contenido:</div>
							<div class="control"><p>escriba el contenido</p></div>
							</div>
							<div class="fila">
							<div class="etiqueta"><textarea name="contenido" rows="5" cols="41"></textarea></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"></div>
							</div>
							<div class="fila">
								<div class="etiqueta"><input type="submit" value="Publicar"></div>
							</div>
				</div>
				</fieldset>
				</form>
			</div>
        
            </div>
            	<!-- delete -->
		
			<div class="post_box">
        	<div id="read">
					<div class="Table">
					<div class="Title"><p>Tienes <%= miscomunicados.size() %> comunicados</p></div>
					<div class="Heading">
						<div class="Cell"><p>Curso</p></div>
						<div class="Cell"><p>Asunto</p></div>
						<div class="Cell"><p>Contenido</p></div>
					</div>
					
					<%for( Comunicado cm : miscomunicados ) {%>
					<div class="Row">
						<div class="Cell"><p><%= cm.getCurso() %></p></div>
						<div class="Cell"><p><%= cm.getAsunto() %></p></div>
						<div class="Cell"><p><%= cm.getContenido() %></p></div>
					</div>
					<%}%>
					</div>
			</div>
        
            </div>
            
        </div>
        
    
    	<div class="cleaner"></div>
    </div>
    
</div>
<div class="cleaner"></div>
</div>


<div id="templatemo_footer_wrapper">
	<div id="templatemo_footer">
    
    	<div class="footer_box col_w300">
        	<h4>Posts Relacionados</h4>
            <ul class="footer_menu">
            	<li><a href="#">Google AppEngine</a></li>
                <li><a href="#">HTML</a></li>
                <li><a href="#">CSS</a></li>
                <li><a href="#">JAVA SCRIPT</a></li>
            </ul>     
        </div>
        
        <div class="footer_box col_w160">
        	<h4>Autores</h4>
            <ul class="footer_menu">
            	<li><a href="#">Alejandro Flores</a></li>
                <li><a href="#">Sonny Pimentel</a></li>
                <li><a href="#">William Orihuela</a></li>
                <li><a href="#">Marco Mendoza</a></li>
            </ul>     
        </div>
        
           
    	<div class="cleaner"></div>
    </div>
</div>

<div id="templatemo_copyright">
    Copyright © 2016 <a href="#">Todos los derechos Reservados</a> 
</div>

</body>
</html>