<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pw2.*"%>
    <%@ page import="beans.*"%>
    <%@ page import="java.util.*"%>
    <%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>


<% List<Curso> cursos = (List<Curso>)Contenido.listCursos();%>
<%HttpSession misesion = request.getSession();%>
<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>

<%List<Curso> misCursos = new ArrayList<Curso>(); %>
<%for (int idx = 0; idx < cursos.size(); idx++) {
	Curso c = (Curso)cursos.get(idx);
		if(c.getProfesor().getDni()== (Integer)misesion.getAttribute("dni")){
				misCursos.add(c);
		}
}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Llenar Notas</title>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
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
				<form action="/registronotas" method="post">
						
			        		<label for="curso">CURSO</label>
			        		<select name="curso">
			        		<option selected>--Selecciona un Curso--</option>
							 	<%for (int idx = 0; idx < misCursos.size(); idx++) {
			       					Curso c = (Curso)misCursos.get(idx);
				   				%>
			        			<%="<option value="+c.getCodigo()+">"+c.getNombre()+"</option>" %>
								<%} %>
			        		</select>
				  			<br>
				  			<label for="alumno">ALUMNOS</label>
				  			<select name="alumno">
				  				<option selected>--Selecciona un Alumno--</option>
							</select>
				  			<br>
				  			<label for="bim1">BIMESTRE1</label>
							<input type="text" name="bim1" value="0"id="bim1">
							<br>
							<label for="bim2">BIMESTRE2</label>
							<input type="text" name="bim2" value="0"id="bim2">
							<br>
							<label for="bim3">BIMESTRE3</label>
							<input type="text" name="bim3" value="0"id="bim3">
							<br>
							<label for="bim4">BIMESTRE4</label>
							<input type="text" name="bim4" value="0"id="bim4">
							<br>
				  			<input type="reset" name="Limpiar">
				  			<input type="submit" value="Registrar">
					</form>
					
			</div>
        
            </div>
            	<!-- delete -->
		
			<div class="post_box">
        <div id="llenarxnotas">
				<%
					 	for (int x = 0; x < misCursos.size(); x++) {
					     Curso c = (Curso)cursos.get(x);%>
				<div class="Table">
						<div class="Title"><p>Notas del curso <%=c.getNombre() %> </p></div>
						<div class="Heading">
							<div class="Cell"><p>Alumno</p></div>
							<div class="Cell"><p>Bimestre 1</p></div>
							<div class="Cell"><p>Bimestre 2</p></div>
							<div class="Cell"><p>Bimestre 3</p></div>
							<div class="Cell"><p>Bimestre 4</p></div>
							<div class="Cell"><p>Promedio</p></div>
						</div>
					    
					     
					     <% for (int y = 0; y < c.getAlumnos().size(); y++){
					     		Alumno a = (Alumno) c.getAlumnos().get(y);
					 		
						%>
						<div class="Row">
							<div class="Cell"><p><%= a.getNombre() %></p></div>
							<%for(int z=0; z<a.getNotas().size();z++){%>
								<%if(a.getNotas().get(z).getCurso().equals(c.getNombre())){ %>
							<div class="Cell"><p><%= a.getNotas().get(z).getBim1() %></p></div>
							<div class="Cell"><p><%= a.getNotas().get(z).getBim2() %></p></div>
							<div class="Cell"><p><%= a.getNotas().get(z).getBim3() %></p></div>
							<div class="Cell"><p><%= a.getNotas().get(z).getBim4() %></p></div>
							<div class="Cell"><p><%= a.getNotas().get(z).getPromFinal() %></p></div>
							<%} 
							}%>
						
						</div>
						<%}%>
					
										    
					   </div>
					   <%}%>			
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