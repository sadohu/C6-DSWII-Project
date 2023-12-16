package Test;
import java.util.List;

import Entidad.Docente;
import Service.DocenteServiceImpl;

public class TestClassDocente {
	
	private static DocenteServiceImpl service = new DocenteServiceImpl();

	public static void main(String[] args) {
		listar();
//		registrar("Hayley", "Williams", "Paramore", "Femenino", 1, 11399.22);
//		buscar(7);
//		actualizar(7, "Peter", "Mc Flight", "Alister", "Masculino", 2, 399.22);
//		eliminar(7);
	}//fin de main
	
	public static void listar() {
		// PARA LISTAR EN GENERAL
		List<Docente> docentes = service.listado();
		for (Docente docente : docentes) {
			System.out.println(docente);
		}
	}
	
	private static void registrar(String nombre, String paterno, String materno, String sexo, int hijos, double sueldo){
		//PARA REGISTRAR
		Docente doc = new Docente();
		//Asignamos los nuevos valores...
		doc.setNombres(nombre);
		doc.setPaterno(paterno);
		doc.setMaterno(materno);
		doc.setSexo(sexo);
		doc.setHijos(hijos);
		doc.setSueldo(sueldo);
	
		//invocamos al metoo registrar
		service.RegistrarDocente(doc);
		
		List<Docente> docentes = service.listado();
		int lastIndex = docentes.size() - 1;
		System.out.println(docentes.get(lastIndex));
	}
	
	private static void actualizar(int codigo, String nombre, String paterno, String materno, String sexo, int hijos, double sueldo){
		Docente doc = new Docente();
		//PARA ACTUALIZAR
		doc.setCodigo(codigo);
		doc.setNombres(nombre);
		doc.setPaterno(paterno);
		doc.setMaterno(materno);
		doc.setSexo(sexo);
		doc.setHijos(hijos);
		doc.setSueldo(sueldo);
		
		//invocamos al metodo actualizar
		service.ActualizarDocente(doc);
		
		Docente docente = service.BuscarDocente(doc);
		System.out.println(docente);
	}
	
	private static void eliminar(int codigo){
		//PARA ELIMINAR
		//Asignamos al idAutor el id a eliminar
		Docente doc = new Docente();
		doc.setCodigo(codigo);
		//llamamos al metodo
		service.EliminarDocente(doc);
	}
	
	private static void buscar(int codigo){
		//PARA Buscar por codigo
		Docente doc = new Docente();
		doc.setCodigo(codigo);
		Docente buscardocente = service.BuscarDocente(doc);
		System.out.println(buscardocente);
	}

}//fin de TestClass
