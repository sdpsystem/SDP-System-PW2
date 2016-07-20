package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Alumno;

@SuppressWarnings("serial")
public class EliminarAlumno extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
			
		String key = req.getParameter("key");
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        Alumno alumno=pm.getObjectById(Alumno.class,key);
		
        try{
        	pm.deletePersistent(alumno);
	        resp.sendRedirect("/controlalumnos");
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlalumnos'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }				
		
	
	
	}
		
		
	}