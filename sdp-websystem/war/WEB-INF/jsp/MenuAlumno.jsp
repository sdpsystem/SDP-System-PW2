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
<link href="css/templatemo_style2.css" rel="stylesheet" type="text/css" />
<title>Menu Alumno</title>
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
				
			</div>
        		
        </div>
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_main">
    	
        <div id="templatemo_content">
        
        	
        
        	<div class="post_box">
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
            </div>
            
            <div class="post_box">
        		<div id="readcursos">
				<div class="Table">
						<div class="Title"><p>Tus notas son</p></div>
						<div class="Heading">
							<div class="Cell"><p>Curso</p></div>
							<div class="Cell"><p>Bimestre1</p></div>
							<div class="Cell"><p>Bimestre2</p></div>
							<div class="Cell"><p>Bimestre3</p></div>
							<div class="Cell"><p>Bimestre4</p></div>
							<div class="Cell"><p>PromedioFinal</p></div>
						</div>
					    
					   	<%
					 	for (int idx = 0; idx < miInfo.getNotas().size(); idx++) {
					     Nota mn = (Nota)miInfo.getNotas().get(idx);
						%>
						<div class="Row">
							
							<div class="Cell"><p><%= mn.getCurso() %></p></div>
							<div class="Cell"><p><%= mn.getBim1() %></p></div>
							<div class="Cell"><p><%= mn.getBim2() %></p></div>
							<div class="Cell"><p><%= mn.getBim3() %></p></div>
							<div class="Cell"><p><%= mn.getBim4() %></p></div>
							<div class="Cell"><p><%= mn.getPromFinal() %></p></div>
							
						</div>
					<%}%>    
					   </div>
					   
			</div>
            </div>
            
            <div class="post_box">
        		<div id="readcursos">
				<div class="Table">
						<div class="Title"><p>Comunicados para tus cursos</p></div>
						<div class="Heading">
							<div class="Cell"><p>Curso</p></div>
							<div class="Cell"><p>Autor</p></div>
							<div class="Cell"><p>Asunto</p></div>
							<div class="Cell"><p>Contenido</p></div>
						</div>
					    
					   	<%
					 	for (int idx = 0; idx < misCursos.size(); idx++) {
					     Curso cn = (Curso)misCursos.get(idx);
					     for(int y=0;y<cn.getComunicados().size();y++){
					    	 Comunicado cd = (Comunicado) cn.getComunicados().get(y);
						%>
						<div class="Row">
							
							<div class="Cell"><p><%= cd.getCurso() %></p></div>
							<div class="Cell"><p><%= cd.getAutor() %></p></div>
							<div class="Cell"><p><%= cd.getAsunto() %></p></div>
							<div class="Cell"><p><%= cd.getContenido() %></p></div>
							
						</div>
					<%}}%>    
					   </div>
					   
			</div>
            </div>
            
        </div>
        
        <div id="templatemo_sidebar">
        	
        	<div class="sidebar_box">
			
            
            </div>
            
            <div class="cleaner_h20"></div>
            
            <div class="sidebar_box">
            	
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