package pw2;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import servlets.PMF;
import beans.*;

public class Contenido {
	
	@SuppressWarnings("unchecked")
	public static List<Alumno> listaAlumnos(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Alumno.class);
		return (List<Alumno>) query.execute();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Administrador> listaAdministradores(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Administrador.class);
		return (List<Administrador>) query.execute();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Profesor> listaProfesores(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Profesor.class);
		return (List<Profesor>) query.execute();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Comunicado> listaComunicados(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Comunicado.class);
		return (List<Comunicado>) query.execute();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Curso> listCursos(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Curso.class);
		return (List<Curso>) query.execute();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Horario> listHorarios(){
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		final Query query = pm.newQuery(Horario.class);
		return (List<Horario>) query.execute();
	}
	
	}
	