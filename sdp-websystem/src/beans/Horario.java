package beans;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
 
@PersistenceCapable
public class Horario {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private String dia;
	
	@Persistent
	private String grado;
	
	@Persistent
	private int inicio;
	
	@Persistent
	private int fin;
	
	@Persistent
	private boolean disponible;

	
	public Horario(String grado,String dia, int inicio,int fin,boolean disponible){
		super();
		this.grado=grado;
		this.dia = dia;
		this.inicio= inicio;
		this.fin = fin;
		this.disponible = disponible;
	}
	
	public String getKey() {
		return KeyFactory.keyToString(key);
	}
	
	public String getGrado(){
		return grado;
	}
	
	public String getDia(){
		return dia;
	}
	
	public void setDia(String dia){
		this.dia=dia;
	}
	
	public int getInicio(){
		return inicio;
	}
	
	public void setInicio(int inicio){
		this.inicio=inicio;
	}
	
	public int getFin(){
		return fin;
	}
	
	public void setFin(int fin){
		this.fin=fin;
	}
	
	public String getDisponible(){
		if(disponible==true)
			return "disponible";
		else
		return "no disponible";
	}
	
	public void setDisponible(boolean disponible){
		this.disponible=disponible;
	}
	
	@Override
	public String toString() {
		String resp = dia + "";  
		return resp;
	}
}