<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>

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
<title>Modificar Datos</title>
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
            <li><a href="/controlprofesores"><span></span>REGRESAR</a></li>
        </ul>    	
        
        <div id="register_box">
        		
        		
        </div>
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_main">
    	
        <div id="templatemo_contentall">
        
			<div class="post_box">
<div id="create">
				<form action="/modificarprofesor" method="post">
				<fieldset><legend>Modificar Datos</legend>
				<div id="formulario">
				<div class="fila">
				<input type="hidden" name="key" value="<%=request.getParameter("ukey")%>">
				</div>
				<div class="fila">
				<div class="etiqueta">Dni:</div>
				<div class="control"><input type="text" name="dni" value="<%=request.getParameter("udni")%>" readonly="readonly"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Nombre:</div>
				<div class="control"><input type="text" name="nombre" value="<%=request.getParameter("unombre")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Apellido:</div>
				<div class="control"><input type="text" name="apellido" value="<%=request.getParameter("uapellido")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Email:</div>
				<div class="control"><input type="text" name="email" value="<%=request.getParameter("uemail")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Numero:</div>
				<div class="control"><input type="text" name="numero" value="<%=request.getParameter("unumero")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Departamento:</div>
				<div class="control"><input type="text" name="departamento" value="<%=request.getParameter("udepartamento")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Provincia:</div>
				<div class="control"><input type="text" name="provincia" value="<%=request.getParameter("uprovincia")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Distrito:</div>
				<div class="control"><input type="text" name="distrito" value="<%=request.getParameter("udistrito")%>"></div>
				</div>
				<div class="fila">
				<div class="etiqueta">Direccion:</div>
				<div class="control"><input type="text" name="direccion" value="<%=request.getParameter("udireccion")%>"></div>
				</div>
				<div class="fila">
				<input type="submit" value="Guardar Cambios">
				</div>
				</div>
				</fieldset>
				</form>
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