package beans;

import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.datanucleus.annotations.Unowned;

@PersistenceCapable
public class Curso {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long codigo;
	
	@Persistent
    private String nombre;
	
	@Persistent
	@Unowned
    private Profesor profesor;
	
	@Persistent
	@Unowned
    private List<Alumno> alumnos;
	
	@Persistent
	@Unowned
    private List<Horario> horarios;
	
	@Persistent
	@Unowned
	private List<Comunicado> comunicados;
	
	public Curso(Long codigo,String nombre){
		this.codigo=codigo;
		this.nombre=nombre;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Profesor getProfesor() {
		return profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	public List<Alumno> getAlumnos() {
		return alumnos;
	}

	public void setAlumnos(List<Alumno> alumnos) {
		this.alumnos = alumnos;
	}

	public List<Horario> getHorarios() {
		return horarios;
	}

	public void setHorarios(List<Horario> horarios) {
		this.horarios = horarios;
	}

	public List<Comunicado> getComunicados() {
		return comunicados;
	}

	public void setComunicados(List<Comunicado> comunicados) {
		this.comunicados = comunicados;
	}

		
	
}