<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>

<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>
<%HttpSession misesion = request.getSession();%>
<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/stepform.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Modificar Datos</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/js/multi_step_form.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script>
$(function () {
$.datepicker.setDefaults($.datepicker.regional["es"]);
$("#datepicker").datepicker({
changeMonth: true,
changeYear: true,
yearRange: "1900:2013"
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
            <li><a href="/menuadministrador"><span></span>REGRESAR</a></li>
        </ul>    	
        
        <div id="register_box">
     	
        		
        </div>
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_main">
    	
        <div id="templatemo_contentall">
        		<!-- Multistep Form -->
	<form action="<%= blobstoreService.createUploadUrl("/guardarcambiosad") %>" class="regform" method="post" enctype="multipart/form-data">

		<!-- Fieldsets -->
		<fieldset id="first">
			<h2 class="title">Informacion Personal</h2>
			<div class="etiqueta"><label for="name">Nombre:</label></div>
			<div class="control"><input type="text" name="nombre" id="name" value="<%=misesion.getAttribute("nombre")%>" /></div>
			<div class="etiqueta"><label for="apellido">Apellido:</label></div>
			<div class="control"><input type="text" name="apellido" id="apellido" value="<%=misesion.getAttribute("apellido")%>" /></div>
			<input class="next_btn" name="next" type="button" value="Next">
		</fieldset>
		<fieldset>
			<h2 class="title">Informacion de Contacto</h2>
			<div class="etiqueta"><label for="numero">Numero:</label></div>
			<div class="control"><input type="text" name="numero" id="numero" value="<%=misesion.getAttribute("numero")%>" /></div>
			<div class="etiqueta"><label for="email">Email:</label></div>
			<div class="control"><input type="text" name="email" id="email" value="<%=misesion.getAttribute("email")%>" /></div>
			<div class="etiqueta"><label for="fecha">Fecha de Nacimiento:</label></div>
			<input type="text" name="fecha" id="datepicker" value="<%=misesion.getAttribute("fecha")%>" readonly="readonly" size="12" />
			<input class="pre_btn" name="previous" type="button" value="Previous">
			<input class="next_btn" name="next" type="button" value="Next">
		</fieldset>
		<fieldset>
			<h2 class="title">Localidad</h2>
			<div class="etiqueta"><label for="departamento">Departamento:</label></div>
			<div class="control"><input type="text" name="departamento" id="departamento" value="<%=misesion.getAttribute("departamento")%>" /></div>
			<div class="etiqueta"><label for="provincia">Provincia:</label></div>
			<div class="control"><input type="text" name="provincia" id="provincia" value="<%=misesion.getAttribute("provincia")%>" /></div>
			<div class="etiqueta"><label for="distrito">Distrito:</label></div>
			<div class="control"><input type="text" name="distrito" id="distrito" value="<%=misesion.getAttribute("distrito")%>" /></div>
			<div class="etiqueta"><label for="direccion">Direccion:</label></div>
			<div class="control"><input type="text" name="direccion" id="direccion" value="<%=misesion.getAttribute("direccion")%>" /></div>
			<input class="pre_btn" type="button" value="Previous">
			<input class="next_btn" name="next" type="button" value="Next">
		</fieldset>
		<fieldset>
			<h2 class="title">Perfil</h2>
			<div class="etiqueta"><label for="outsideImage">Sube una foto de perfil:</label></div>
			<div class="control"><input type="file" name="outsideImage" id="outsideImage"></div>
			<input class="pre_btn" type="button" value="Previous">
			<input class="next_btn" name="next" type="button" value="Next">
		</fieldset>
		<fieldset>
			<h2 class="title">Deseas guardar los Cambios</h2>
			
			<input class="pre_btn" type="button" value="Previous">
			<input class="submit_btn" type="submit" value="Guardar">
		</fieldset>
</form>
            
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