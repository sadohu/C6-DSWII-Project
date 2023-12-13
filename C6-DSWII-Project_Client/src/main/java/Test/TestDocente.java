package Test;

import java.util.List;

import ClienteDocente.ClassConsumirDocente;
import Modelo.Docente;

public class TestDocente {
	public static void main(String[] args) {
		//Instanciamos la respectiva clase para consumir el listado de docente
				ClassConsumirDocente consumir = new ClassConsumirDocente();
				//PARA LISTAR EN GENERAL  apartir de consumir que tiene el metodo ListadoDocente
				List<Docente> listDocente=consumir.ListadoDocente();
				//Aplicamos un bucle for que recorrera en listDocente y se almacenara en lis
				for(Docente lis:listDocente){
					//Realizamos una impresion por pantalla...
					System.out.println("Código: " +lis.getCodigo()+" Nombre Docente: "+lis.getNombres()+
							" Paterno: "+lis.getPaterno()+" Materno: "+lis.getMaterno()+" Sexo: "+lis.getSexo()+" N° Hijos: "+
							lis.getHijos()+" Sueldo: "+lis.getSueldo());
				}//fin de bucle

	}//fin de main
}
