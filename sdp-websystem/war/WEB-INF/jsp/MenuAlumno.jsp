<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%@page import="pw2.*"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>

<%UserService us = UserServiceFactory.getUserService();%>
<%User user = us.getCurrentUser(); %>
    
<%HttpSession misesion = request.getSession();%>
<%List<Curso> cursos = Contenido.listCursos();%>
<%List<Alumno> alumnos = Contenido.listaAlumnos();%>

<%List<Curso> misCursos = new ArrayList<Curso>();%>

<%for (int idx = 0; idx < cursos.size(); idx++) {
	Curso c = (Curso)cursos.get(idx);
		for(int i=0; i<c.getAlumnos().size();i++){
			if(c.getAlumnos().get(i).getDni()== (Integer)misesion.getAttribute("dni")){
				misCursos.add(c);
			}
		}
}%>
<%Alumno miInfo = null;%>
<%for (int z=0;z<alumnos.size();z++) {
	Alumno a = (Alumno)alumnos.get(z);
	if(a.getDni()==(Integer)misesion.getAttribute("dni")){
		miInfo=a;
		break;
	}		
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilo.css">
<title>Menu Alumno</title>
</head>
<body>

<!-- body -->	
	<div id="body">
		<!-- top -->
		<div id="top">
			<div id="logo">
				<img src="/imagenes/sdplogo.png" width="700" height="80" alt="Logotipo">
			</div>
			<div id="conexion">
				<div id="tiempo">
					tiempo
				</div>
				<div id="cerrar">
					<a href="<%= us.createLogoutURL("/cerrarsesion")%>"><button>DESCONECTAR</button></a>
				</div>
				<div id="usuario">
					Sesion iniciada con: <%=misesion.getAttribute("usuario") %>
				</div>
				<div id="icono">
					<img src="/imagenes/perfil.svg" alt="icono">
				</div>
				
			</div>
		</div>
		<!-- End of top -->
		<!-- Informacion -->
		<div id="informacion">
			<div id="fecha">
				fecha
			</div>
			<div id="hora">
				hora
			</div>
			<div id="nombre">
				<%=misesion.getAttribute("nombre")+" "+misesion.getAttribute("apellido") %>
			</div>
			<div id="ultimaconexion">
				ultima conexion
			</div>
		</div>
		<!-- End of informacion -->
		<div id="left">
			<div id="reclamos">
				mi bandeja
			</div>
			<div id="publicaciones">
				mis asistencias
			</div>
		</div>
		<!-- End of left -->
		<!-- right -->
		<div id="right">
			<div id="readcursos">
				<div class="Table">
						<div class="Title"><p>Tienes <%= misCursos.size() %> cursos</p></div>
						<div class="Heading">
							<div class="Cell"><p>Nombre</p></div>
							<div class="Cell"><p>Profesor</p></div>
						</div>
					    
					   	<%
					 	for (int idx = 0; idx < misCursos.size(); idx++) {
					     Curso mc = (Curso)misCursos.get(idx);
						%>
						<div class="Row">
							
							<div class="Cell"><p><%= mc.getNombre() %></p></div>
							<div class="Cell"><p><%= mc.getProfesor().getNombre() %></p></div>
							
						</div>
					<%}%>    
					   </div>
					   
			</div>
			<div id="readprofesores">
				mis profes
			</div>
			<div id="readnotas">
				
			</div>
		</div>
		<!-- End of right -->
	</div>
	<!-- End of body -->		
</body>
</html>