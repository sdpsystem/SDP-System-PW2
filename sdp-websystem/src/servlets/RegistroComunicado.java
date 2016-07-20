package servlets;

import beans.*;

import java.io.IOException;
import java.util.*;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegistroComunicado extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Long codigo = Long.parseLong(req.getParameter("curso"));
		
		String autor = req.getParameter("autor");
		String email = req.getParameter("email");
		String asunto = req.getParameter("asunto");
		String contenido = req.getParameter("contenido");
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
        Curso curso = pm.getObjectById(Curso.class,codigo);
        
        String cname = curso.getNombre();
        Date fecha = new Date();
        
        try{
        	Comunicado c = new Comunicado(autor,cname,fecha,email,asunto,contenido);
        	pm.makePersistent(c);
        	curso.getComunicados().add(c);
          	resp.sendRedirect("/controlcomunicados");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, vuelva a intentarlo" + e);
         }finally{
	        pm.close();
         }				

		
		
	}
	}
	