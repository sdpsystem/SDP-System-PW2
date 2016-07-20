package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Administrador;

@SuppressWarnings("serial")
public class ModificarAdministrador extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
			
		Long dni = Long.parseLong(req.getParameter("dni"));
		String name = req.getParameter("nombre");
		String lastname = req.getParameter("apellido");
		int numero = Integer.parseInt(req.getParameter("numero"));
		String email = req.getParameter("email");
		String departamento =req.getParameter("departamento");
		String provincia =req.getParameter("provincia");
		String distrito =req.getParameter("distrito");
		String direccion = req.getParameter("direccion");

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        Administrador admin=pm.getObjectById(Administrador.class,dni);
        
        try{
        	admin.setNombre(name);
        	admin.setApellido(lastname);
        	admin.setNumero(numero);
        	admin.setEmail(email);
        	admin.setDepartamento(departamento);
        	admin.setProvincia(provincia);
        	admin.setDistrito(distrito);
        	admin.setDireccion(direccion);
        	
        	resp.sendRedirect("/controladministradores");
	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, vuelva a intentarlo" + e);
         }finally{
	        pm.close();
         }				
		
	}	
	}
	