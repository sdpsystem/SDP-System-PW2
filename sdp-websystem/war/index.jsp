<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if((String)session.getAttribute("usuario")!=null && session.getAttribute("tipo").equals("administrador")){
	response.sendRedirect("menuadministrador");
}%>
<% if((String)session.getAttribute("usuario")!=null && session.getAttribute("tipo").equals("profesor")){
	response.sendRedirect("menuprofesor");
}%>
<% if((String)session.getAttribute("usuario")!=null && session.getAttribute("tipo").equals("alumno")){
	response.sendRedirect("menualumno");
}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SDP-WebSystem</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">
    
    <div id="templatemo_header">
            
        <div id="site_title">
           <img src="/imagenes/sdplogo.png" width="600" height="95" alt="Logotipo">
        </div> <!-- end of site_title -->
        
        <div id="search_box">
            <form action="#" method="get">
                <input type="text" value="Enter keyword here..." name="q" size="10" id="searchfield" title="searchfield" onfocus="clearText(this)" onblur="clearText(this)" />
              <input type="submit" name="Search" value="Search" id="searchbutton" title="Search" />
            </form>
        </div>
    
   
        <div class="cleaner"></div>
        
    </div> <!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="/index.jsp" class="current"><span></span>Home</a></li>
            <li><a href="#"><span></span>Informacion</a></li>
            <li><a href="#"><span></span>Quienes Somos</a></li>
            <li><a href="#"><span></span>Noticias</a></li>
            <li><a href="#"><span></span>Contactanos</a></li>
        </ul>    	
        
        <div id="register_box">
        	<a href="#" class="signup">Registrate</a> | <a href="#" class="new_reg">Aqui</a>
        </div>
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_main">
    	
        <div id="templatemo_content">
        
        	<div class="post_box">
            
                <h2><a href="#">Colegio Señor de las Piedades</a></h2>		
                <div class="news_meta">Posted on <a href="#"></a> 15 de julio del 2016 | Tags: <a href="#"></a>, <a href="#"></a> <a href="#"></a> <a href="#"></a></div>
                <div class="image_wrapper"><a href="#"><img src="images/colegio.JPG" width="604" height="200" alt="image 1" /></a></div>
              <p align="justify">Somos una institución dedicada a la formación y enseñanza escolar a nivel primaria y secundaria como actividad principal.</p>
              <div class="cleaner"></div>
            </div>
            
            <div class="post_box">
            
                <h2><a href="#">Ubicacion</a></h2>		
                <div class="news_meta">Posted on <a href="#"></a>, 15 de julio del 2016 | Tags: <a href="#"></a> <a href="#"></a> <a href="#"></a></div>
                <div class="image_wrapper"><a href="#"><img src="images/mapa.png" width="604" height="300" alt="image 2" /></a></div>
              <p align="justify">Nos ubicamos en el kilometro 10,5 de la carretera a Yura en la interseccion con la autopista de Arequipa-La Joya, al frente del Cementerio de Ciudad MUnicipal</p>
        <div class="cleaner"></div>
            </div>
            
           
        
        </div>
        
        <div id="templatemo_sidebar">
        	
        	<div class="sidebar_box">
      
            	<a href="/gmail"><img src="images/inicio.png" width="260" height="60" alt="inicio de sesion"/></a>
                
            </div>
        
        	<div id="aboutus">
            	<h3>Acerca del diseño de la pagina web</h3>
                <div class="image_fl"><img src="images/templatemo_about.jpg" alt="about this blog" /></div>
                <p>Este sitio web fue diseñado por estudiantes de la Escuela Profesional de INgeneria de Sistemas de la UNSA, cualquier informacion enviar un correo a "alexx.rodrigo.20@gmail"</p>
          </div>
            
            <div class="cleaner_h20"></div>
            
            <div class="sidebar_box">
            	<h3>Archivos</h3>
                <ul class="sm_two_col">
                    <li><a href="#">&raquo; Febre 2016</a></li>
                    <li><a href="#">&raquo; Abril 2016</a></li>
                    <li><a href="#">&raquo; Mayo 2016</a></li>
                    <li><a href="#">&raquo; Junio 2016</a></li>
                    <li><a href="#">&raquo; Julio 2016</a></li>
                </ul>
                
                <div class="cleaner"></div>
            </div>
  
            
          	<div class="sidebar_box">
            
            	<h3>Buscanos en...</h3>
                
                <form method="get" action="#">
                  	<input type="text" id="user" name="user" class="newsletter_email" value=""  onfocus="clearText(this)" onblur="clearText(this)" />
                    <input style="font-weight: bold;" type="submit" name="submit" id="submit" value="Subscribete" />
                </form>
                
            	<div class="cleaner_h20"></div>
              <a href="#" class="icon_link"><img src="images/facebook.png"  width="60" height="60" alt="rss" /></a><a href="#" class="icon_link"><img src="images/twitter.png" width="63" height="63"alt="twitter" /></a>
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