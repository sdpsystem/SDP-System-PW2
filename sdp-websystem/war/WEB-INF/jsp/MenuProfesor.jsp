<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>

<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>

<%HttpSession misesion = request.getSession();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Menu Profesor</title>
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
            <li><a href="/menuprofesor"><span></span>MENU</a></li>
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
        
            </div>
            
            
        </div>
        
        <div id="templatemo_sidebar">
        	
        	<div class="sidebar_box">
			
            
            </div>
            
            <div class="cleaner_h20"></div>
            
            <div class="sidebar_box">
            	<!-- administracion -->
			<div id="administracion">
				<div id="tituloadministracion">
					<p>Administrar</p>
				</div>
				<a href="/controlcomunicados" class="button large">
				<span class="icon-code">Comunicados</span></a>	
				<a href="#" class="button large">
				<span class="icon-code">Controlar Asistencias</span></a>	
				<a href="/llenarnotas" class="button large">
				<span class="icon-code">Llenar Notas</span></a>		
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