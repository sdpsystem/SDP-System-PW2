package pw2; 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import servlets.PMF;
import beans.Alumno;
import beans.Administrador;
import beans.Profesor;
public class Busqueda extends HttpServlet {
 
	private static final long serialVersionUID = 1L; 

protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException { 
	
    response.setContentType( "text/html" );
    PrintWriter out = response.getWriter(); 
	
	Long dn = Long.parseLong(request.getParameter("dni"));
	String usuario = request.getParameter("tipo");
	
	if(usuario.equals("profesor")){
		
		 final PersistenceManager pm = PMF.get().getPersistenceManager();
		 Query query = pm.newQuery(Profesor.class,"dni==dn");
		 query.declareParameters("int dn");
		 query.setOrdering("key descending");
		 
		 	@SuppressWarnings("unchecked")
	        List<Profesor> prfs = (List<Profesor>)query.execute(dn);
	        
	        if(prfs.size()!=0){
	        out.println("<div class='TitleBusqueda'><p>INFORMACION</p></div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>TIPO DE USUARIO:</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getTipo()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DNI</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getDni()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NOMBRE</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getNombre()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>APELLIDO</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getApellido()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>EMAIL</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getEmail()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NUMERO</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getNumero()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>FECHA DE NACIMIENTO</p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getNacimiento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DEPARTAMENTO </p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getDepartamento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>PROVINCIA </p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getProvincia()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DISTRITO </p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getDistrito()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DIRECCION </p></div>"
	        			+"<div class='Cell'>"+prfs.get(0).getDireccion()+"</p></div>"
	        			+"</div>");
	        }else{
	        out.println("<p>el usuario no existe o no es un profesor</p>");
	        }
	}else if(usuario.equals("alumno")){
		 final PersistenceManager pm = PMF.get().getPersistenceManager();
		 Query query = pm.newQuery(Alumno.class,"dni==dn");
		 query.declareParameters("int dn");
		 query.setOrdering("key descending");
		 	
		 	@SuppressWarnings("unchecked")
	        List<Alumno> alms = (List<Alumno>)query.execute(dn);
	        
	        if(alms.size()!=0){
	        	out.println("<div class='TitleBusqueda'><p>INFORMACION</p></div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>TIPO DE USUARIO:</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getTipo()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DNI</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getDni()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NOMBRE</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getNombre()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>APELLIDO</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getApellido()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>EMAIL</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getEmail()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NUMERO</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getNumero()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>FECHA DE NACIMIENTO</p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getNacimiento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DEPARTAMENTO </p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getDepartamento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>PROVINCIA </p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getProvincia()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DISTRITO </p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getDistrito()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DIRECCION </p></div>"
	        			+"<div class='Cell'>"+alms.get(0).getDireccion()+"</p></div>"
	        			+"</div>");
	        }else{
	        out.println("<p>el usuario no existe o no es un alumno</p>");
	        }
	}else{
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		 Query query = pm.newQuery(Administrador.class,"dni==dn");
		 query.declareParameters("Long dn");
		 query.setOrdering("dni descending");
		 
		 	@SuppressWarnings("unchecked")
	        List<Administrador> admins = (List<Administrador>)query.execute(dn);
	        
	        if(admins.size()!=0){
	        	out.println("<div class='TitleBusqueda'><p>INFORMACION</p></div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>TIPO DE USUARIO:</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getTipo()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DNI</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getDni()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NOMBRE</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getNombre()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>APELLIDO</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getApellido()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>EMAIL</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getEmail()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>NUMERO</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getNumero()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>FECHA DE NACIMIENTO</p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getNacimiento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DEPARTAMENTO </p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getDepartamento()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>PROVINCIA </p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getProvincia()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DISTRITO </p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getDistrito()+"</p></div>"
	        			+"</div>"
	        			+"<div class='Row'>"
	        			+"<div class='Cell'>DIRECCION </p></div>"
	        			+"<div class='Cell'>"+admins.get(0).getDireccion()+"</p></div>"
	        			+"</div>");
	        }else{
	        out.println("<p>el usuario no existe o no es un administrador</p>");
	        }
	}
	
} 

} 