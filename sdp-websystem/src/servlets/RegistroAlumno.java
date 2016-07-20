package servlets;

import beans.*;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegistroAlumno extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		
		int dni = Integer.parseInt(req.getParameter("dni"));
		String name = req.getParameter("nombre");
		String lastname = req.getParameter("apellido");
		int numero = Integer.parseInt(req.getParameter("numero"));
		String email = req.getParameter("email");
		
		String fecha = req.getParameter("fecha");
		String departamento =req.getParameter("departamento");
		String provincia =req.getParameter("provincia");
		String distrito =req.getParameter("distrito");
		String direccion = req.getParameter("direccion");
		
		Alumno a = new Alumno(dni,name,lastname,
							numero,email,fecha,
							departamento,provincia,distrito,direccion);
				
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			pm.makePersistent(a);
			resp.sendRedirect("/controlalumnos");
		}catch(Exception e){
			System.out.println(e);
			resp.getWriter().println("Ocurrio un error, <a href='/controlalumnos'>vuelva a intentarlo</a> " + e);
		}finally{
			pm.close();
		}
		
		}
	}