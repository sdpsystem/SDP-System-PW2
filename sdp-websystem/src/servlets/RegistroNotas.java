package servlets;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

@SuppressWarnings("serial")
public class RegistroNotas extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		String cod = req.getParameter("alumno");
		Long codcurso = Long.parseLong(req.getParameter("curso"));
		int bim1 = Integer.parseInt(req.getParameter("bim1"));
		int bim2 = Integer.parseInt(req.getParameter("bim2"));
		int bim3 = Integer.parseInt(req.getParameter("bim3"));
		int bim4 = Integer.parseInt(req.getParameter("bim4"));
		
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        
        
		
        try{
        	Alumno alumno = pm.getObjectById(Alumno.class,cod);
        	Curso cs = pm.getObjectById(Curso.class,codcurso);
        	String cname = (String) cs.getNombre();
        	for(int i=0;i<alumno.getNotas().size();i++){
        		if(alumno.getNotas().get(i).getCurso().equals(cname)){
        			alumno.getNotas().get(i).setBim1(bim1);
        			alumno.getNotas().get(i).setBim2(bim2);
        			alumno.getNotas().get(i).setBim3(bim3);
        			alumno.getNotas().get(i).setBim4(bim4);
        		}
        	}
	        
	        
          	resp.sendRedirect("/llenarnotas");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/llenarnotas'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }
	}
	
}
	