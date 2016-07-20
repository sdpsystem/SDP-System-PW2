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
<%List<Horario> horarios = Contenido.listHorarios();%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Horarios</title>
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
        <div id="createhorario">
				<form action="/registrohorario" method="get">
					<fieldset><legend>Crear un horario</legend>
						<div id="formulario">
							<div class="fila">
							<div class="etiqueta"><label for="grado">GRADO</label></div>
							<div class="control"><select name="grado">
								<option value="primero">primero</option>
								<option value="segundo">segundo</option>
								<option value="tercero">tercero</option>
								<option value="cuarto">cuarto</option>
								<option value="quinto">quinto</option>
			        		</select></div>
			        	</div>
			        	<div class="fila">
			        		<div class="etiqueta"><label for="dia">DIA</label></div>
							<div class="control"><select name="dia">
								<option value="lunes">lunes</option>
								<option value="martes">martes</option>
								<option value="miercoles">miercoles</option>
								<option value="jueves">jueves</option>
								<option value="viernes">viernes</option>
			        		</select></div>
			        	</div>
			        	<div class="fila">
			        		<div class="etiqueta"><label for="hora">HORA</label></div>
							<div class="control"><select name="hora">
								<option value="07-09">7:00am-9:00am</option>
								<option value="09-11">9:00am-11:00am</option>
								<option value="11-01">11:00am-1:00pm</option>
								<option value="01-03">1:00pm-3:00pm</option>
			        		</select></div>
			        	</div>
			        	<div class="fila">	
				  			<div id="action"><input type="submit" value="Registrar"></div>
				  		</div>
					</div>
					</fieldset>		
				</form>
						
			</div>
        
            </div>
			<div class="post_box">
        <div id="readhorarios">
				<div class="Table">
						<div class="Title"><p>Mostrando <%= horarios.size() %> horarios</p></div>
						<div class="Heading">
							<div class="Cell"><p>Grado</p></div>
							<div class="Cell"><p>Dia</p></div>
							<div class="Cell"><p>Hora</p></div>
							<div class="Cell"><p>Estado</p></div>
						</div>
					    
					   	<%
					 	for (int idx = 0; idx < horarios.size(); idx++) {
					     Horario h = (Horario)horarios.get(idx);
						%>
						<div class="Row">
							<div class="Cell"><p><%= h.getGrado() %></p></div>
							<div class="Cell"><p><%= h.getDia() %></p></div>
							<div class="Cell"><p><%= h.getInicio() %>-<%= h.getFin() %></p></div>
							<div class="Cell"><p><%= h.getDisponible() %></p></div>
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