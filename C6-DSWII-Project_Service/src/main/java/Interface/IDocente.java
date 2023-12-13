package Interface;
import java.util.List;

import Entidad.Docente;
public interface IDocente {
	//Declaramos los metodos...
		public void RegistrarDocente(Docente docente);
		
		public void ActualizarDocente(Docente docente);
		
		public void EliminarDocente(Docente docente);
		
		public Docente BuscarDocente(Docente docente);
		
		public List<Docente> listado();
	
	
}//fin de IDocente
