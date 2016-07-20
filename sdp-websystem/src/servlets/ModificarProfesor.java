package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Profesor;

@SuppressWarnings("serial")
public class ModificarProfesor extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		String key = req.getParameter("key");
		String name = req.getParameter("nombre");
		String lastname = req.getParameter("apellido");
		int numero = Integer.parseInt(req.getParameter("numero"));
		String email = req.getParameter("email");
		
		String departamento =req.getParameter("departamento");
		String provincia =req.getParameter("provincia");
		String distrito =req.getParameter("distrito");
		String direccion = req.getParameter("direccion");
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        Profesor profesor=pm.getObjectById(Profesor.class,key);
		
        try{
  	        profesor.setNombre(name);
  	        profesor.setApellido(lastname);
  	        profesor.setNumero(numero);
  	        profesor.setEmail(email);
  	        profesor.setDepartamento(departamento);
  	        profesor.setProvincia(provincia);
  	        profesor.setDistrito(distrito);
  	        profesor.setDireccion(direccion);
          	
          	resp.sendRedirect("/controlprofesores");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlprofesores'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }				
	}
	
}
	
	