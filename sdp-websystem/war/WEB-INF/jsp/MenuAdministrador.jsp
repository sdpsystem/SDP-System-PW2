<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>

<%HttpSession misesion = request.getSession();%>

<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Menu Administrador</title>

<script src="/js/jquery-1.12.4.min.js"> 
</script> 
	<script> 
 	$(document).ready(function() { 
	$('#submit').click(function(event) { 
 	var dniVar = $('#dni').val(); 
	var tipoVar = $('#tipo').val(); 
 
 // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get 
 	$.post('busquedaxadministrador', { 
	dni : dniVar, 
	tipo : tipoVar 
 	}, 
 	function(responseText) { 
 	$('#tablabusqueda').html(responseText); 
 	}); 
	}); 
 	}); 
</script>
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
            <li><a href="/menuadministrador"><span></span>MENU</a></li>
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
    	
        <div id="templatemo_content">
        
        	
        
        	<div class="post_box">
            
                <div id="busqueda">
					<div id="formbusqueda">
						<form id="form1"> 
							<h4>Busqueda por Dni</h4>
							<br>
 							<label for="dni">DNI: </label>
							<input type="text" name="dni" id="dni">
							<select name="tipo" id="tipo">
								<option value="profesor">profesor</option>
								<option value="alumno">alumno</option>
								<option value="administrador">administrador</option>
							</select>
							<input type="button" id="submit" value="Buscar" /> 
							
						</form>
					</div>
					<div id="resultadobusqueda">
						<div id="tablabusqueda"></div> 
					</div>
				</div>
            </div>
            
            
        </div>
        
        <div id="templatemo_sidebar">
        	
        	<div class="sidebar_box">
			
   			
			<%if(misesion.getAttribute("email").equals("madara.sdp@gmail.com")){ %>
				<h3><%=misesion.getAttribute("nombre") %></h3>
				<div id="fotodeperfil">
					<img src="/imagenes/homero.jpeg" width="100%" height="100%" alt="Foto de Perfil">
				</div>
				<br>
			<%}else{%>
			<h3><%=misesion.getAttribute("nombre") %></h3>
				<div id="fotodeperfil">
					<% if(misesion.getAttribute("fperfil") != null){ %>
					<img src="/serve?blob-key=<%=(String)misesion.getAttribute("fperfil") %>" width="100%" height="100%" alt="Logotipo">
					<%}else{%>No tienes foto de perfil<%}%>
				</div>
				<br>
				<a href="/adeditinfopersonal" class="button blue">
				<span class="icon-code">edita tu informacion</span></a>
			<%} %>
            
            </div>
        
            
            <div class="cleaner_h20"></div>
            
            <div class="sidebar_box">
            	<!-- administracion -->
			<div id="administracion">
				<div id="tituloadministracion">
					<h3>Configuracion para ...</h3>
				</div>
				<br>
				<br>
				<br>
				<a href="/controladministradores" class="button large">
				<span class="icon-code">Administradores</span></a>
				<br>
				<a href="/controlprofesores" class="button large">
				<span class="icon-code">Profesores</span></a>
				<br>
				<a href="/controlalumnos" class="button large">
				<span class="icon-code">Alumnos</span></a>
				<br>
				<a href="#" class="button large">
				<span class="icon-code">Apoderados</span></a>
				<br>
				<a href="/controladmincomunicados" class="button large">
				<span class="icon-code">Comunicados</span></a>
				<br>
				<a href="/controlhorarios" class="button large">
				<span class="icon-code">Horarios</span></a>
				<br>
				<a href="/controlcursos" class="button large">
				<span class="icon-code">Cursos</span></a>
				
			</div>
			<!-- End of administracion -->
                
                
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