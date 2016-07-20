package pw2;

import java.io.IOException;
import java.util.List;

import beans.*;
import servlets.PMF;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	@SuppressWarnings("serial")
	public class ListEspecificComunicados extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			HttpSession misesion = req.getSession();
			
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			final Query q = pm.newQuery(Comunicado.class);
			
			String nombre = ""+misesion.getAttribute("nombre");
			
			q.setOrdering("key descending");
			q.setFilter("autor == autorParam");
			q.declareParameters("String autorParam");
			
				try{
					@SuppressWarnings("unchecked")
					List<Comunicado> comunics = (List<Comunicado>) q.execute(nombre);
					req.setAttribute("comunicados", comunics);
					RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Comunicados.jsp");
					rd.forward(req, resp);
				}catch(Exception e){
					System.out.println(e);
				}finally{
					q.closeAll();
					pm.close();
				}
						
		}
	}