package beans;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class Recursos {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private boolean administradores;
	
	@Persistent
	private boolean profesores;
	
	@Persistent
	private boolean alumnos;
	
	@Persistent
	private boolean horarios;
	
	@Persistent
	private boolean cursos;
	
	public Recursos(){
		
	}
	public Recursos(boolean administradores,boolean profesores,boolean alumnos,
					boolean horarios,boolean cursos){
		this.administradores=administradores;
		this.profesores=profesores;
		this.alumnos=alumnos;
		this.horarios=horarios;
		this.cursos=cursos;
	}
	public boolean getAdministradores() {
		return administradores;
	}
	public void setAdministradores(boolean administradores) {
		this.administradores = administradores;
	}
	public boolean getProfesores() {
		return profesores;
	}
	public void setProfesores(boolean profesores) {
		this.profesores = profesores;
	}
	public boolean getAlumnos() {
		return alumnos;
	}
	public void setAlumnos(boolean alumnos) {
		this.alumnos = alumnos;
	}
	public boolean getHorarios() {
		return horarios;
	}
	public void setHorarios(boolean horarios) {
		this.horarios = horarios;
	}
	public boolean getCursos() {
		return cursos;
	}
	public void setCursos(boolean cursos) {
		this.cursos = cursos;
	}

}