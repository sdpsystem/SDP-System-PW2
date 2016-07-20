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
<%List<Profesor> profesores = Contenido.listaProfesores();%>
<%List<Alumno> alumnos = Contenido.listaAlumnos();%>
<%List<Curso> cursos = Contenido.listCursos();%>
<%List<Horario> horarios = Contenido.listHorarios();%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Cursos</title>
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
        <div id="createcurso">      
				<form action="/registrocurso" method="post">
					<fieldset><legend>Registrar un Curso</legend>
						<div id="formulario">
						<div class="fila">
							<div class="etiqueta"><label for="codigo">CODIGO</label></div>
							<div class="control"><input type="text" name="codigo" id="codigo"></div>
						</div>
						<div class="fila">
							<div class="etiqueta"><label for="nombre">NOMBRE</label></div>
							<div class="control"><input type="text" name="nombre" id="nombre"></div>
			        	</div>
			        <%if(profesores.size()>0 && horarios.size()>0 && alumnos.size()>0){%>
			        	<div class="fila">
			        		<div class="etiqueta"><label for="keyprof">PROFESOR</label></div>
			        		<div class="control"><select name="keyprof">
							 	<%for (int idx = 0; idx < profesores.size(); idx++) {
			       					Profesor p = (Profesor)profesores.get(idx);
				   				%>
			        			<%="<option value='"+p.getKey()+"'>"+p.getNombre()+"</option>" %>
								<%} %>
			        		</select></div>
				  		</div>
				  		<div class="fila">
				  			<div class="etiqueta"><label for="horarios">HORARIOS</label></div>
				  				<div class="control"><%for (int idx = 0; idx < horarios.size(); idx++) {
			       					Horario h = (Horario)horarios.get(idx);
			       					if(h.getDisponible().equals("disponible")){
				   				%>
							<%="<input type=\"checkbox\" name=\"horarios\" value=\""+h.getKey()+"\">"+h.getDia()+"-"+h.getGrado()+"-"+h.getInicio()+"-"+h.getFin()+"<br />"%>
							<%}}%>
							</div>
				  		</div>
				  		<div class="fila">
				  			<div class="etiqueta"><label for="alumnos">ALUMNOS</label></div>
				  				<div class="control"><%for (int idx = 0; idx < alumnos.size(); idx++) {
			       					Alumno a = (Alumno)alumnos.get(idx);
				   				%>
							<%="<input type=\"checkbox\" name=\"alumnos\" value=\""+a.getKey()+"\">"+a.getNombre()+"<br />"%>
							<%}%>
				  		</div>
				  		</div>
				  		<div class="fila"><div id="action">
				  			<input type="reset" name="Limpiar">
				  			<input type="submit" value="Registrar">
				  		</div></div>
				  		<%}else{ %>
				  		<p>Aun no se puede registrar un curso</p>
				  		<p>Deben habe profesores, alumnos y horarios disponibles</p>
				  		<%}%>
					</div>
					</fieldset>  	
				</form>
						
			</div>
        
            </div>
			<div class="post_box">
        <div id="read">
				<div class="Table">
						<div class="Title"><p>Mostrando <%= cursos.size() %> cursos</p></div>
						<div class="Heading">
							<div class="Cell"><p>Codigo</p></div>
							<div class="Cell"><p>Nombre</p></div>
							<div class="Cell"><p>Profesor</p></div>
							<div class="Cell"><p>Alumnos</p></div>
						</div>
					    
					   	<%
					 	for (int idx = 0; idx < cursos.size(); idx++) {
					     Curso c = (Curso)cursos.get(idx);
						%>
						<div class="Row">
							<div class="Cell"><p><%= c.getCodigo() %></p></div>
							<div class="Cell"><p><%= c.getNombre() %></p></div>
							<div class="Cell"><p><%= c.getProfesor().getNombre() %></p></div>
							<%if(c.getAlumnos().size()>0){ %>
							<div class="Cell"><p><%= c.getAlumnos().get(0).getNombre() %></p></div>
							<%}else{ %>
							<div class="Cell"><p>El curso no tiene alumnos</p></div>
							<%}%>
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