package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Administrador;

@SuppressWarnings("serial")
public class EliminarAdministrador extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
			
		Long dni = Long.parseLong(req.getParameter("dni"));
		

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        Administrador admin=pm.getObjectById(Administrador.class,dni);
		
        try{
        	pm.deletePersistent(admin);
        	resp.sendRedirect("/controladministradores");
	        
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controladministradores'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }				
		
	
	
	}
	}
	
