package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

@SuppressWarnings("serial")
public class OtorgarPermisos extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String[] admins = req.getParameterValues("administrador");
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        
        try{
        	
        if(admins!=null){
        	for(int i=0;i<admins.length;i++){
        		String[] recursos = req.getParameterValues(admins[i]);
        			Administrador ad = pm.getObjectById(Administrador.class,Long.parseLong(admins[i]));
        			if(recursos!=null && recursos.length>0){
        			ad.resetRecursos();
        			for(int j=0;j<recursos.length;j++){
        				if(recursos[j].equals("administradores")){
        					ad.getRecursos().setAdministradores(true);
        				}else if(recursos[j].equals("profesores")){
    						ad.getRecursos().setProfesores(true);
    					}else if(recursos[j].equals("alumnos")){
    						ad.getRecursos().setAlumnos(true);
    					}else if(recursos[j].equals("horarios")){
    						ad.getRecursos().setHorarios(true);
    					}else if(recursos[j].equals("cursos")){
    						ad.getRecursos().setCursos(true);
    					}
        			}
        			}else{
        				ad.resetRecursos();
        			}
        			
        	}
        }
           resp.sendRedirect("/controladministradores");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }
	}
	
}