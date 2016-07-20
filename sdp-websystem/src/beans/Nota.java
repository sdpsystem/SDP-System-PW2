package beans;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
 
@PersistenceCapable
public class Nota {
	
	@Persistent
	private String curso;
	
	@Persistent
	private int bim1;
	
	@Persistent
	private int bim2;
	
	@Persistent
	private int bim3;
	
	@Persistent
	private int bim4;
	
	@Persistent
	private int promFinal;
	
	public Nota(String curso){
		this.curso = curso;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public int getBim1() {
		return bim1;
	}

	public void setBim1(int bim1) {
		this.bim1 = bim1;
		calcularPromedio();
	}

	public int getBim2() {
		return bim2;
	}

	public void setBim2(int bim2) {
		this.bim2 = bim2;
		calcularPromedio();
	}

	public int getBim3() {
		return bim3;
	}

	public void setBim3(int bim3) {
		this.bim3 = bim3;
		calcularPromedio();
	}

	public int getBim4() {
		return bim4;
	}

	public void setBim4(int bim4) {
		this.bim4 = bim4;
		calcularPromedio();
	}

	public int getPromFinal() {
		return promFinal;
	}

	public void setPromFinal(int promFinal) {
		this.promFinal = promFinal;
	}
	
	private void calcularPromedio(){
		promFinal = (bim1+bim2+bim3+bim4)/4;
	}
	
}
	