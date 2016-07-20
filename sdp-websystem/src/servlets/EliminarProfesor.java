package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Profesor;

@SuppressWarnings("serial")
public class EliminarProfesor extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
			
		String key = req.getParameter("key");
		

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        Profesor profesor=pm.getObjectById(Profesor.class,key);
		
        try{
	        
        
        	pm.deletePersistent(profesor);
	        resp.sendRedirect("/controlprofesores");
	        
	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlprofesores'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }				
		
	
	
	}
	
	}
	