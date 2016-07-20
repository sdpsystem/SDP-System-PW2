package beans;

import beans.Apoderado;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class CuentaApoderado {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
		
	@Persistent
	private String user;
		
	@Persistent
	private String pass;
	
	@Persistent
	private boolean estado;
	
	@Persistent
	private String question;
	
	@Persistent
	private String answer;
	
	@Persistent(mappedBy = "cuenta")
    private Apoderado usuario;
	
	public CuentaApoderado(String user, String pass,boolean estado){
		this.user=user;
		this.pass=pass;
		this.estado=estado;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	

}