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

import com.google.appengine.api.datastore.Key;

	@SuppressWarnings("serial")
	public class ListCursosEspecificos extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			HttpSession misesion = req.getSession();
			
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			final Query q = pm.newQuery(Curso.class);
			
			q.setFilter("profesor == profesorParam");
			q.declareParameters(Key.class.getName() + " profesorParam");
			
			String key = ""+misesion.getAttribute("key");
			Profesor profesor=pm.getObjectById(Profesor.class,key);
			
				try{
					@SuppressWarnings("unchecked")
					List<Curso> cursos = (List<Curso>) q.execute(profesor.getKey());
					req.setAttribute("ecursos", cursos);
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