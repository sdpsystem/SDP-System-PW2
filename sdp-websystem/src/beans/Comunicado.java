package beans;

import java.util.*;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class Comunicado{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private String autor;
	
	@Persistent
	private Date fecha;
	
	@Persistent
	private String email;
	
	@Persistent
	private String curso;
	
	@Persistent
	private String asunto;
	
	@Persistent
	private String contenido;
	
	public Comunicado(String autor,String curso, Date fecha, String email, String asunto, String contenido){
		this.autor=autor;
		this.curso=curso;
		this.fecha=fecha;
		this.email=email;
		this.asunto=asunto;
		this.contenido=contenido;
	}
	
	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public String getCurso(){
		return curso;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	
	
}