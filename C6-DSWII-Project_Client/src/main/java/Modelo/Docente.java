package Modelo;

public class Docente {
	// Creamos variables como la tabla de bd
	private int codigo, hijos;
	private double sueldo;
	private String nombres, paterno, materno, sexo;

	// Constructor con parametros
	public Docente(int codigo, int hijos, double sueldo, String nombres, String paterno, String materno, String sexo) {
		this.codigo = codigo;
		this.hijos = hijos;
		this.sueldo = sueldo;
		this.nombres = nombres;
		this.paterno = paterno;
		this.materno = materno;
		this.sexo = sexo;
	}

	// Constructor por defecto
	public Docente() {

	}

	// GET AND SET
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getHijos() {
		return hijos;
	}

	public void setHijos(int hijos) {
		this.hijos = hijos;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getPaterno() {
		return paterno;
	}

	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}

	public String getMaterno() {
		return materno;
	}

	public void setMaterno(String materno) {
		this.materno = materno;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	@Override
	public String toString() {
		return "Docente [codigo=" + codigo + ", hijos=" + hijos + ", sueldo=" + sueldo + ", nombres=" + nombres
				+ ", paterno=" + paterno + ", materno=" + materno + ", sexo=" + sexo + "]";
	}
}
