package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import beans.Administrador;

@SuppressWarnings("serial")
public class GuardarCambiosAd extends HttpServlet{
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession misesion= req.getSession();
		
		Long dni = (Long)misesion.getAttribute("dni");
		
		String name = req.getParameter("nombre");
		String lastname = req.getParameter("apellido");
		int numero = Integer.parseInt(req.getParameter("numero"));
		String email = req.getParameter("email");
		String departamento =req.getParameter("departamento");
		String provincia =req.getParameter("provincia");
		String distrito =req.getParameter("distrito");
		String direccion = req.getParameter("direccion");
		String fperfil;

		
		 Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
	     List<BlobKey> blobKeys = blobs.get("outsideImage");

	     if (blobKeys == null || blobKeys.isEmpty()) {
	         fperfil = null;
	     } else {
	    	 fperfil = blobKeys.get(0).getKeyString();
	    	 misesion.setAttribute("fperfil", fperfil);
	    	 
	     }

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
        	admin.setKeyOutsideImage(fperfil);
        	
        	resp.sendRedirect("/controladministradores");
	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, vuelva a intentarlo" + e);
         }finally{
	        pm.close();
         }				
		
	}	
	}
