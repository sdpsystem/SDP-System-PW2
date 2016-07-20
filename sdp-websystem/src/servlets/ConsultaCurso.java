package servlets;
import java.io.IOException; 
import java.io.PrintWriter; 
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import beans.Curso;
import beans.Alumno;

@SuppressWarnings("serial")
public class ConsultaCurso extends HttpServlet {
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Long codigo = Long.parseLong(request.getParameter("codigocurso"));
		

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        
        
        Curso c = pm.getObjectById(Curso.class,codigo);
        
        StringBuilder sb = new StringBuilder("");
        List<Alumno> als = (List<Alumno>)c.getAlumnos();
        for(int i=0;i<als.size();i++){
        	sb.append(als.get(i).getKey()+"-"+als.get(i).getNombre()+":");
        	out.write(sb.toString());
        }
		
        
		
		
		
	}

}
	
    
		 
