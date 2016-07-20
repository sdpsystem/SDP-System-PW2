package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Curso;

@SuppressWarnings("serial")
public class RegistroCurso extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		Long codigo = Long.parseLong(req.getParameter("codigo"));
		String nombre = req.getParameter("nombre");
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		
        try{
			Curso c = new Curso(codigo,nombre);
				pm.makePersistent(c);
	        	
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrodata");
				rd.forward(req, resp);
				
	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlcursos'>vuelva a intentarlo</a> " + e);
         }finally{
        	 pm.close();
         }		
        
        
		}
		
	
	}