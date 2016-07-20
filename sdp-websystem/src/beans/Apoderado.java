package beans;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
 
@PersistenceCapable
public class Apoderado {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long codigo;
	
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
	private Date nacimiento;
	
	@Persistent
	private String genero;
	
	@Persistent
	private String departamento;
	
	@Persistent 
	private String provincia;
	
	@Persistent
	private String distrito;
	
	@Persistent
	private String direccion;
	
	@Persistent
	private String tipo = "apoderado";
	
	@Persistent(defaultFetchGroup = "true")
    private CuentaApoderado cuenta = null;
	
	@Persistent
    private List<Alumno> alumnos;
	
	
	public Apoderado(Long codigo, int dni, String nombre, 
			String apellido, int numero, 
			String email, Date nacimiento, 
			String genero, String departamento, 
			String provincia, String distrito,
			String direccion, CuentaApoderado cuenta){
		this.codigo=codigo;
		this.dni=dni;
		this.nacimiento=nacimiento;
		this.nombre=nombre;
		this.apellido=apellido;
		this.numero=numero;
		this.email=email;
		this.genero=genero;
		this.departamento=departamento;
		this.provincia=provincia;
		this.distrito =distrito;
		this.direccion=direccion;
		this.cuenta=cuenta;
}


	public Long getCodigo() {
		return codigo;
	}


	public void setCodigo(Long codigo) {
		this.codigo = codigo;
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


	public int getNumero() {
		return numero;
	}


	public void setNumero(int numero) {
		this.numero = numero;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNacimiento() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		return format.format(nacimiento);
	}


	public void setNacimiento(Date nacimiento) {
		this.nacimiento = nacimiento;
	}


	public String getGenero() {
		return genero;
	}


	public void setGenero(String genero) {
		this.genero = genero;
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


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public CuentaApoderado getCuenta() {
		return cuenta;
	}


	public void setCuenta(CuentaApoderado cuenta) {
		this.cuenta = cuenta;
	}


	public List<Alumno> getAlumnos() {
		return alumnos;
	}


	public void setAlumnos(List<Alumno> alumnos) {
		this.alumnos = alumnos;
	}
	
	
}