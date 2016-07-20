package beans;

import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
 
@PersistenceCapable
public class Alumno {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private int dni;
	
	@Persistent
	private String nombre;
	
	@Persistent
	private String apellido;
	
	@Persistent
	private int numero;
	
	@Persistent
	private String email;
	
	@Persistent
	private String nacimiento;
	
	@Persistent
	private String departamento;
	
	@Persistent 
	private String provincia;
	
	@Persistent
	private String distrito;
	
	@Persistent
	private String direccion;
	
	@Persistent
	private String tipo = "alumno";
	
	@Persistent
	private List<Nota> notas;
	
	public Alumno(int dni, String nombre, 
			String apellido, int numero,
			String email, String nacimiento, 
			String departamento, 
			String provincia, String distrito,
			String direccion){
		this.dni=dni;
		this.nombre=nombre;
		this.apellido=apellido;
		this.numero=numero;
		this.email=email;
		this.nacimiento=nacimiento;
		this.departamento=departamento;
		this.provincia=provincia;
		this.distrito =distrito;
		this.direccion=direccion;
}
	
	public String getKey() {
		return KeyFactory.keyToString(key);
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(String nacimiento) {
		this.nacimiento = nacimiento;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<Nota> getNotas() {
		return notas;
	}

	public void setNotas(List<Nota> notas) {
		this.notas = notas;
	}
	
	
	
}