package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ModificarDatosAd extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/ModificarAdministrador.jsp");
		rd.forward(req, resp);
		
		
	}

}