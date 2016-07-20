<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pw2.*"%>
    <%@ page import="beans.*"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<% List<Curso> cursos = (List<Curso>)Contenido.listCursos();%>
<%HttpSession misesion = request.getSession();%>

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
<title>Llenar Notas</title>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
</head>
<body>
<!-- Menu Horizontal -->
	<div id="menuhorizontal">
		<ul id="menu">
 			<li><a href="/menuprofesor">REGRESAR</a></li>
		</ul>
	</div>
	<!-- End of Menu Horizontal -->
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
					<a href="/cerrarsesion"><button>DESCONECTAR</button></a>
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
		<!-- left -->
		<div id="leftcrud">
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
							<input type="text" name="bim1" id="bim1">
							<br>
							<label for="bim2">BIMESTRE2</label>
							<input type="text" name="bim2" id="bim2">
							<br>
							<label for="bim3">BIMESTRE3</label>
							<input type="text" name="bim3" id="bim3">
							<br>
							<label for="bim4">BIMESTRE4</label>
							<input type="text" name="bim4" id="bim4">
							<br>
				  			<input type="reset" name="Limpiar">
				  			<input type="submit" value="Registrar">
					</form>
					
			</div>
			<div id="delete">
				eliminar
			</div>
		</div>
		<!-- End of left -->
		<!-- right -->
		<div id="rightcrud">
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
		<!-- End of right -->
		
	</div>
	<!-- End of body -->
	
</body>
</html>