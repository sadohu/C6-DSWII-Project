package Test;

import java.util.List;

import ClienteDocente.ClassConsumirDocente;
import Modelo.Docente;

public class TestDocente {
	public static void main(String[] args) {
//		listarDocente();
//		registarDocente("nombrePrueba", "apellidoPaternoPrueba", "apellidoMaternoPrueba", "sexoPrueba", 5, 100.00);
//		buscarDocente(53);
//		actualizarDocente(53, "nombreActualizado", "apellidoPaternoActualizado", "apellidoMaternoActualizado", "sexoActualizado", 10, 200.00);
//		eliminarDocente(53);
	}

	private static void listarDocente() {
		// Instanciamos la respectiva clase para consumir el listado de docente
		ClassConsumirDocente consumir = new ClassConsumirDocente();
		// PARA LISTAR EN GENERAL apartir de consumir que tiene el metodo
		// ListadoDocente
		List<Docente> listDocente = consumir.ListadoDocente();
		// Aplicamos un bucle for que recorrera en listDocente y se almacenara
		// en lis
		for (Docente lis : listDocente) {
			// Realizamos una impresion por pantalla...
			System.out.println("Código: " + lis.getCodigo() + " Nombre Docente: " + lis.getNombres() + " Paterno: "
					+ lis.getPaterno() + " Materno: " + lis.getMaterno() + " Sexo: " + lis.getSexo() + " N° Hijos: "
					+ lis.getHijos() + " Sueldo: " + lis.getSueldo());
		} // fin de bucle
	}
	
	private static void buscarDocente(int codigo){
		ClassConsumirDocente service = new ClassConsumirDocente();
		Docente docente = service.BuscarPorCod(codigo);
		System.out.println(docente);
	}

	private static void registarDocente(String nombre, String apellidoPaterno, String apellidoMaterno, String sexo,
			int cantHijos, Double sueldo) {
		Docente docente = new Docente(0, cantHijos, sueldo, nombre, apellidoPaterno, apellidoMaterno, sexo);
		ClassConsumirDocente service = new ClassConsumirDocente();
		service.CrearDocente(docente);

		List<Docente> docentes = service.ListadoDocente();
		int lastIndex = docentes.size() - 1;
		System.out.println(docentes.get(lastIndex));
	}

	private static void actualizarDocente(int codigo, String nombre, String apellidoPaterno, String apellidoMaterno,
			String sexo, int cantHijos, Double sueldo) {
		Docente docente = new Docente(codigo, cantHijos, sueldo, nombre, apellidoPaterno, apellidoMaterno, sexo);
		ClassConsumirDocente service = new ClassConsumirDocente();
		service.ActualizarDocente(docente);

		List<Docente> docentes = service.ListadoDocente();
		System.out.println(docentes.stream().filter(item -> item.getCodigo() == codigo).findFirst().orElse(null));
	}
	
	private static void eliminarDocente(int codigo){
		ClassConsumirDocente service = new ClassConsumirDocente();
		service.EliminarDocente(codigo);

		List<Docente> docentes = service.ListadoDocente();
		for (Docente docente : docentes) {
			System.out.println(docente);
		}
	}
}
