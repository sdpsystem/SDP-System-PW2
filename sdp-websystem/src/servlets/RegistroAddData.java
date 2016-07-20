package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

@SuppressWarnings("serial")
public class RegistroAddData extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		Long codigo = Long.parseLong(req.getParameter("codigo"));
		String codigoprof = req.getParameter("keyprof");
		String[] horarios = req.getParameterValues("horarios");
		String[] alumnos = req.getParameterValues("alumnos");
		
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        
        Curso curso = pm.getObjectById(Curso.class,codigo);
        Profesor profesor=pm.getObjectById(Profesor.class,codigoprof);
		
        try{
	        curso.setProfesor(profesor);
	        
	        Alumno found;
	        if( req.getParameterValues("alumnos")!=null )
				for(int i=0;i<alumnos.length;i++){
					found = pm.getObjectById(Alumno.class,alumnos[i]);
					Nota n = new Nota(curso.getNombre());
					found.getNotas().add(n);
					curso.getAlumnos().add(found);
				}
	        Horario hfound;
	        if( req.getParameterValues("horarios")!=null )
				for(int j=0;j<horarios.length;j++){
					hfound = pm.getObjectById(Horario.class,horarios[j]);
					hfound.setDisponible(false);
					curso.getHorarios().add(hfound);
				}
	        
          	resp.sendRedirect("/controlcursos");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/controlcursos'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }
	}
	
}
	