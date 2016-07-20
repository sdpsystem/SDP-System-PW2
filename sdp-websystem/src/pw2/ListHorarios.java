package pw2;

import java.io.IOException;

import beans.*;
import servlets.PMF;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	@SuppressWarnings("serial")
	public class ListHorarios extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			PersistenceManager pm = PMF.get().getPersistenceManager();
			resp.setContentType("text/html");
			
			Query q = pm.newQuery(Horario.class);
			
			try{
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/AdministrarHorarios.jsp");
				rd.forward(req, resp);
				
			}finally{
				q.closeAll();
			}
						
		}
	}