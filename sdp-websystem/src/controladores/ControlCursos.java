package controladores;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import servlets.PMF;
import beans.Administrador;

@SuppressWarnings("serial")
public class ControlCursos extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		
		HttpSession misesion= req.getSession();
		String email = (String) misesion.getAttribute("email");
		
		if(email.equals("madara.sdp@gmail.com")){
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/AdministrarCursos.jsp");
			rd.forward(req, resp);
		}else{
		Long dni = (Long)misesion.getAttribute("dni");
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Administrador a = pm.getObjectById(Administrador.class,dni);
		if(a.getRecursos().getCursos()==true){
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/AdministrarCursos.jsp");
			rd.forward(req, resp);
		}else{
			resp.setContentType( "text/html" );
			resp.getWriter().println("No tienes acceso");
			resp.getWriter().println("<a href='/menuadministrador'>Regresar</a>");
		}
		}
		
		
	}

}