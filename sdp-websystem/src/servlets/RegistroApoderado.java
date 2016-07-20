package servlets;

import beans.*;

import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegistroApoderado extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Long codigo = Long.parseLong(req.getParameter("codigo"));
		int dni = Integer.parseInt(req.getParameter("dni"));
		String name = req.getParameter("nombre");
		String lastname = req.getParameter("apellido");
		int numero = Integer.parseInt(req.getParameter("numero"));
		String email = req.getParameter("email");
		
		Date nacimiento = new Date();
		
		String genero = req.getParameter("genero");
		String departamento =req.getParameter("departamento");
		String provincia =req.getParameter("provincia");
		String distrito =req.getParameter("distrito");
		String direccion = req.getParameter("direccion");
		String usuario = generarUsuario(name,lastname);
		String password = ""+dni;
		
		CuentaApoderado cuenta = new CuentaApoderado(usuario,password,true);
		
		Apoderado a = new Apoderado(codigo,dni,name,lastname,
							numero,email,nacimiento,genero,
							departamento,provincia,distrito,direccion,cuenta);
				
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
	
	private String generarUsuario(String nombre, String apellido){
		String term = ".ap@sdp";
		String first;
		if(nombre.indexOf(" ")==-1)
			first = nombre;
		else
			first = nombre.substring(0,nombre.indexOf(" "));
		
		String second;
		if(apellido.indexOf(" ")==-1)
			second = apellido.substring(0,1);
		else
			second = apellido.substring(0,1)+apellido.substring(apellido.indexOf(" ")+1,apellido.indexOf(" ")+2);
			
		return first.toLowerCase()+second.toLowerCase()+term;
	}
	
	}