package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

@SuppressWarnings("serial")
public class ModificarAlumno extends HttpServlet{
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
        Alumno alumno=pm.getObjectById(Alumno.class,key);
		
        try{
	        alumno.setNombre(name);
	        alumno.setApellido(lastname);
	        alumno.setNumero(numero);
	        alumno.setEmail(email);
	        alumno.setDepartamento(departamento);
	        alumno.setProvincia(provincia);
	        alumno.setDistrito(distrito);
	        alumno.setDireccion(direccion);
        	
        	resp.sendRedirect("/controlalumnos");
	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlalumnos'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }		
        
		}
		
	}