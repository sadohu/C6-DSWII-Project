package Test;
import java.util.List;

import Entidad.Docente;
import Service.DocenteServiceImpl;

public class TestClassDocente {

	public static void main(String[] args) {
		//Instanciamos las respectivas clases
				//PARA REGISTRAR
				Docente doc = new Docente();
				DocenteServiceImpl imp = new DocenteServiceImpl();
				//Asignamos los nuevos valores...
				doc.setNombres("Hayley");
				doc.setPaterno("Williams");
				doc.setMaterno("Paramore");
				doc.setSexo("Femenino");
				doc.setHijos(1);
				doc.setSueldo(11399.22);
			
				//invocamos al metoo registrar
				imp.RegistrarDocente(doc);
				
				//PARA ACTUALIZAR
				/*doc.setNombres("Peter");
				doc.setPaterno("Mc Flight");
				doc.setMaterno("Alister");
				doc.setSexo("Masculino");
				doc.setHijos(2);
				doc.setSueldo(399.22);
				
				//actualizaremos al de id 5
				doc.setCodigo(46);
				//invocamos al metodo actualizar
				imp.ActualizarDocente(doc);
				*/
				
				//PARA ELIMINAR
				//Asignamos al idAutor el id a eliminar
				//doc.setCodigo(47);
				//llamamos al metodo
				//imp.EliminarDocente(doc);
				
				//PARA Buscar por codigo
				/*doc.setCodigo(1);
				Docente buscardocente = imp.BuscarDocente(doc);
						//imprimimos por pantalla
				System.out.println("Código: " +buscardocente.getCodigo()+" Nombre Docente: "+buscardocente.getNombres()+
						" Paterno: "+buscardocente.getPaterno()+" Materno: "+buscardocente.getMaterno()+" Sexo: "+buscardocente.getSexo()+" N° Hijos: "+
						buscardocente.getHijos()+" Sueldo: "+buscardocente.getSueldo());*/
				
				//PARA LISTAR EN GENERAL
				/*List<Docente> listado=imp.listado();
				//Aplicamos un bucle for que recorrera en listado y se almacenara en list
						for(Docente list:listado){
							//Realizamos una impresion por pantalla...
				System.out.println("Código: " +list.getCodigo()+" Nombre Docente: "+list.getNombres()+
			" Paterno: "+list.getPaterno()+" Materno: "+list.getMaterno()+" Sexo: "+list.getSexo()+" N° Hijos: "+
						list.getHijos()+" Sueldo: "+list.getSueldo());
						}//fin de bucle
*/
	}//fin de main

}//fin de TestClass
