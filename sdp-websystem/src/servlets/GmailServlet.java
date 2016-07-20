package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import beans.*;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class GmailServlet extends HttpServlet {
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws ServletException, IOException {
	 resp.setContentType("text/html");
 
	 PrintWriter out = resp.getWriter();
 
	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
 	
	 if(user == null){
		 resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
	 }else if(user.getEmail().equals("madara.sdp@gmail.com")){
		 HttpSession misesion= req.getSession(true);
			misesion.setAttribute("tipo","administrador");
			misesion.setAttribute("nombre","administrador");
			misesion.setAttribute("apellido","principal");
			misesion.setAttribute("dni","12344321");
			misesion.setAttribute("email","madara.sdp@gmail.com");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/MenuAdministrador.jsp");
			rd.forward(req, resp);
	 }else{
		 
		 String email = (String) user.getEmail();
		 
		 final PersistenceManager pm = PMF.get().getPersistenceManager();
		 final Query q = pm.newQuery(Administrador.class);
				q.setOrdering("dni descending");
				q.setFilter("email == emailParam");
				q.declareParameters("String emailParam");
				
			@SuppressWarnings("unchecked")
			List<Administrador> usr = (List<Administrador>) q.execute(email);
		
			final Query q2 = pm.newQuery(Profesor.class);
			q2.setOrdering("key descending");
			q2.setFilter("email == emailParam");
			q2.declareParameters("String emailParam");
			
			@SuppressWarnings("unchecked")
			List<Profesor> usr2 = (List<Profesor>) q2.execute(email);
			
			final Query q3 = pm.newQuery(Alumno.class);
			q3.setOrdering("key descending");
			q3.setFilter("email == emailParam");
			q3.declareParameters("String emailParam");
			
			@SuppressWarnings("unchecked")
			List<Alumno> usr3 = (List<Alumno>) q3.execute(email);
			
			final Query q4 = pm.newQuery(Apoderado.class);
			q4.setOrdering("codigo descending");
			q4.setFilter("email == emailParam");
			q4.declareParameters("String emailParam");
			
			@SuppressWarnings("unchecked")
			List<Apoderado> usr4 = (List<Apoderado>) q4.execute(email);
	
			if(usr.size()>0){
				HttpSession misesion= req.getSession(true);
				misesion.setAttribute("tipo",usr.get(0).getTipo());
				misesion.setAttribute("dni",usr.get(0).getDni());
				misesion.setAttribute("nombre",usr.get(0).getNombre());
				misesion.setAttribute("apellido",usr.get(0).getApellido());
				misesion.setAttribute("numero",usr.get(0).getNumero());
				misesion.setAttribute("email",usr.get(0).getEmail());
				misesion.setAttribute("fecha",usr.get(0).getNacimiento());
				misesion.setAttribute("departamento",usr.get(0).getDepartamento());
				misesion.setAttribute("provincia",usr.get(0).getProvincia());
				misesion.setAttribute("distrito",usr.get(0).getDistrito());
				misesion.setAttribute("direccion",usr.get(0).getDireccion());
				misesion.setAttribute("fperfil",usr.get(0).getKeyOutsideImage());
				
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/MenuAdministrador.jsp");
				rd.forward(req, resp);
			}else if(usr2.size()>0){
				HttpSession misesion= req.getSession(true);
				misesion.setAttribute("tipo",usr2.get(0).getTipo());
				misesion.setAttribute("key",usr2.get(0).getKey());
				misesion.setAttribute("nombre",usr2.get(0).getNombre());
				misesion.setAttribute("apellido",usr2.get(0).getApellido());
				misesion.setAttribute("dni",usr2.get(0).getDni());
				misesion.setAttribute("email",usr2.get(0).getEmail());
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/MenuProfesor.jsp");
				rd.forward(req, resp);
			}else if(usr3.size()>0){
				HttpSession misesion= req.getSession(true);
				misesion.setAttribute("tipo",usr3.get(0).getTipo());
				misesion.setAttribute("nombre",usr3.get(0).getNombre());
				misesion.setAttribute("apellido",usr3.get(0).getApellido());
				misesion.setAttribute("dni",usr3.get(0).getDni());
				misesion.setAttribute("email",usr3.get(0).getEmail());
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/MenuAlumno.jsp");
				rd.forward(req, resp);
			}else if(usr4.size()>0){
				HttpSession misesion= req.getSession(true);
				misesion.setAttribute("tipo",usr4.get(0).getTipo());
				misesion.setAttribute("nombre",usr4.get(0).getNombre());
				misesion.setAttribute("apellido",usr4.get(0).getApellido());
				misesion.setAttribute("dni",usr4.get(0).getDni());
				misesion.setAttribute("email",usr4.get(0).getEmail());
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/MenuApoderado.jsp");
				rd.forward(req, resp);
			}else{
				out.println("<!DOCTYPE html>"	 
						 + "<html>"
						 + "<head><title>SDP-WebSystem</title>"
						 + "<meta charset=utf-8;></head>"
						 + "<link rel='stylesheet' href='css/estilo.css'>"
						 + "<body>"
						 + "<div id='body'>"
						 + "<a href='"+ us.createLogoutURL("/cerrarsesion")+"' class='button large'><span class='icon-code'>Cerrar sesión</span></a>"
						 + "<h3>No perteneces al sistema</h3>"
						 + "</div>"
						 + "</body></html>");
			}
	 }
 }
}