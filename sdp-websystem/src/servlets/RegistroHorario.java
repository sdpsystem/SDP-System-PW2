package servlets;

import beans.*;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegistroHorario extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String grad = req.getParameter("grado");
		String day = req.getParameter("dia");
		String hora = req.getParameter("hora");
		
		int first = Integer.parseInt(hora.substring(0,2));
		int last = Integer.parseInt(hora.substring(3,5));
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
	
		Horario h= new Horario(grad,day,first,last,true);
			try{
				pm.makePersistent(h);
				resp.sendRedirect("/controlhorarios");
			
			}catch(Exception e){
				System.out.println(e);
				resp.getWriter().println("Ocurrio un error, vuelva a intentarlo" + e);
			}finally{
				pm.close();
			}
		
	}
	
	}