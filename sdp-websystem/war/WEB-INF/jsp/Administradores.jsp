<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%@page import="pw2.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%HttpSession misesion = request.getSession();%>

<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>
<%List<Administrador> admins = Contenido.listaAdministradores();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Administradores</title>
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
			  
				<form action="/registroadministrador" method="post">
				
				<fieldset><legend>Registrar un Administrador</legend>
				<div id="formulario">
						<div class="fila">
							<div class="etiqueta"><label for="dni">DNI</label></div>
							<div class="control"><input type="text" name="dni" id="dni"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="nombre">NOMBRES</label></div>
							<div class="control"><input type="text" name="nombre" id="nombre"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="apellido">APELLIDOS</label></div>
							<div class="control"><input type="text" name="apellido" id="apellido"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="numero">NUMERO</label></div>
							<div class="control"><input type="text" name="numero" id="numero"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="email">EMAIL</label></div>
							<div class="control"><input type="text" name="email" id="email"></div>
						</div>
						<div class="fila">
				  			<div class="etiqueta"><label for="fecha">FECHA DE NACIMIENTO</label></div>
							<div class="control"><input type="text" name="fecha" id="datepicker" readonly="readonly"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="departamento">DEPARTAMENTO</label></div>
							<div class="control"><input type="text" name="departamento" id="departamento"></div>		  		
				  		</div>
				  		<div class="fila">
				  			<div class="etiqueta"><label for="provincia">PROVINCIA</label></div>
							<div class="control"><input type="text" name="provincia" id="provincia"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="distrito">DISTRITO</label></div>
							<div class="control"><input type="text" name="distrito" id="distrito"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="direccion">DIRECCION</label></div>
							<div class="control"><input type="text" name="direccion" id="direccion"></div>
						</div>
						<div class="fila"><div id="action">
				  			<input type="reset" name="Limpiar"/>
				  			<input type="submit" value="Registrar"/>
						</div></div>
					</div>
					</fieldset>
				</form>
						
			</div>
        
            </div>
            	<!-- delete -->
			<div id="delete">
			
				<form action="/eliminaradministrador" method="post">
					<fieldset><legend>Eliminar un Administrador</legend>
						<div id="formulario">
							<div class="fila">
				       			<div class="etiqueta"><select name="dni">
				  				<%
				 	   			for (int idx = 0; idx < admins.size(); idx++) {
				       			Administrador a = (Administrador)admins.get(idx);
					   			%>
				        		<%="<option value='"+a.getDni()+"'>"+a.getDni()+"</option>" %>
				        		<%} %>
				        		</select>
				        		</div>
				        		<div class="control">
				  				<input type="submit" value="Eliminar">
				  				</div>
				  			</div>
						</div>
					</fieldset>	
				</form>
			</div><div id="acl">
			<form action="/permisos" method="get">
			<div class="Table">
				<div class="Title"><p>Lista de Control de Acceso</p></div>
				<div class="Heading">
				<div class="Cell"><p>Usuario</p></div>
				<div class="Cell"><p>admins</p></div>
				<div class="Cell"><p>profesores</p></div>
				<div class="Cell"><p>alumnos</p></div>
				<div class="Cell"><p>horarios</p></div>
				<div class="Cell"><p>cursos</p></div>
			</div>
				    
		<%
		for (int idx = 0; idx < admins.size(); idx++) {
			Administrador t = (Administrador)admins.get(idx);
		%>
		<div class="Row">
			<div class="Cell"><%=t.getNombre()+"<input type=\"hidden\" name=\"administrador\" value=\""+t.getDni()+"\">" %></div>
			<%if(t.getRecursos().getAdministradores()==true){ %>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"administradores\" checked>"%></div>
			<%}else{%>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"administradores\">"%></div>
			<%}%>
			<%if(t.getRecursos().getProfesores()==true){ %>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"profesores\" checked>"%></div>
			<%}else{%>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"profesores\">"%></div>
			<%}%>
			<%if(t.getRecursos().getAlumnos()==true){ %>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"alumnos\" checked>"%></div>
			<%}else{%>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"alumnos\">"%></div>
			<%}%>
			<%if(t.getRecursos().getHorarios()==true){ %>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"horarios\" checked>"%></div>
			<%}else{%>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"horarios\">"%></div>
			<%}%>
			<%if(t.getRecursos().getCursos()==true){ %>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"cursos\" checked>"%></div>
			<%}else{%>
			<div class="Cell"><%="<input type=\"checkbox\" name=\""+t.getDni()+"\" value=\"cursos\">"%></div>
			<%}%>
			</div>
			
		<%}%>
			
		    
	</div>
	<div class="fila"><input type="submit" value="Guardar Cambios"/></div>
	</form>
			
			</div>
			<div class="post_box">
            <div id="read">
					<div class="Table">
					<div class="Title"><p>Mostrando <%= admins.size() %> administradores</p></div>
					<div class="Heading">
						<div class="Cell"><p>Dni</p></div>
						<div class="Cell"><p>Email</p></div>
						<div class="Cell"><p>Nombre</p></div>
						<div class="Cell"><p>Apellido</p></div>
						<div class="Cell"><p>...</p></div>
						</div>
				    
				   	<%
				 	for (int idx = 0; idx < admins.size(); idx++) {
				     Administrador a = (Administrador)admins.get(idx);
					%>
					<form id="edit" action="/modificardatosad" method="get">
						<div class="Cell"><%= a.getDni() %><input type="hidden" name="udni" value="<%= a.getDni() %>"></div>
						<div class="Cell"><%= a.getEmail() %><input type="hidden" name="uemail" value="<%= a.getEmail() %>"></div>
						<div class="Cell"><%= a.getNombre() %><input type="hidden" name="unombre" value="<%= a.getNombre() %>"></div>
						<div class="Cell"><%= a.getApellido() %><input type="hidden" name="uapellido" value="<%= a.getApellido() %>"></div>
						<input type="hidden" name="unumero" value="<%= a.getNumero() %>">
						<input type="hidden" name="udepartamento" value="<%= a.getDepartamento() %>">
						<input type="hidden" name="uprovincia" value="<%= a.getProvincia() %>">
						<input type="hidden" name="udistrito" value="<%= a.getDistrito() %>">
						<input type="hidden" name="udireccion" value="<%= a.getDireccion() %>">
						<div class="Cell"><input type="submit" value="Editar"></div>
					</form>
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