package ClienteDocente;

import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import Modelo.Docente;
import java.io.IOException;
import java.util.List;

public class ClassConsumirDocente {

	// Consumimos el metodo listado de docentes
	public List<Docente> ListadoDocente() {
		// Declaramso variables de tipo response
		Response response = null;
		// variable web target
		WebTarget webtarget;
		// Invocamos la interfaz para poder consumir
		Client cliente = ClientBuilder.newClient();
		// Creamos lis de tipo Docente y List
		List<Docente> lis = null;
		// variable responsejson en null
		String responsejson = null;
		// ObjectMapper es una herramienta utilizada en programación para
		// convertir datos entre formatos,
		// como por ejemplo, de objetos Java a JSON, o viceversa.
		ObjectMapper objmap = new ObjectMapper();
		// Recuperamos nuestra url del servicio
		webtarget = cliente.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/Listado");
		// invocation le pasamos o decimos que consumira JSON con
		// MediaType.APPLICATION_JSON
		Invocation.Builder invocationBuilder = webtarget.request(MediaType.APPLICATION_JSON);
		// obtenemos en response el JSON
		response = invocationBuilder.get();
		// imprimimos mensaje por pantalla
		// condicionando que si es diferente de 200 osea no esta bien
		if (response.getStatus() != 200) {
			// emite mensaje de error..., error y traera el status
			System.out.println("Fuera de Rango"); // En consola aparece cuando
													// no esta activado el
													// servicio
		} // fin de if
			// caso contrario si es == 200 osea ok, leemos almacenamos en
			// responsejson la lectura
		responsejson = response.readEntity(String.class);
		try {
			// lis tiene el responsejson de tipo List ClassAutor
			lis = objmap.readValue(responsejson, new TypeReference<List<Docente>>() {
			});
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// retornamos el listado
		return lis;
	}// fin de ListadoDocente

	// Para agregar
	public void CrearDocente(Docente doc) {
		// Creamos el objeto cliente...
		// Invocamos la interfaz para poder consumir
		Client cliente = ClientBuilder.newClient();
		// Recuperamos nuestra url del servicio para crear
		WebTarget webtarget = cliente.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/CrearDocente");
		// crear un objeto invocation builder para la solicitud
		// invocation le pasamos o decimos que consumira JSON con
		// MediaType.APPLICATION_JSON
		Invocation.Builder invocationBuilder = webtarget.request(MediaType.APPLICATION_JSON);
		// realizamos la solicitud POST con el objeto doc
		// obtenemos en response el JSON
		Response response = invocationBuilder.post(Entity.entity(doc, MediaType.APPLICATION_JSON));
		// condicionando que si es diferente de 200 osea esta bien
		if (response.getStatus() != 200) {
			// emite mensaje de error..., error y traera el status
			System.out.println("Docente creado exitosamente en BD");
		} // fin de if
		else {
			System.out.println("Error al crear al Docente " + response.getStatus());
		} // fin de else

	}// fin de CrearDocente

	// Creamos el metodo listar por ID
	// Consumimos el metodo que devuelve un Docente
	public Docente BuscarPorCod(int cod) {
		// declaramos objetos ...
		Response response = null;
		WebTarget webtarget = null;
		Client cliente = ClientBuilder.newClient();
		Docente doce = null;
		String responsejson = null;
		ObjectMapper objmap = new ObjectMapper();

		webtarget = cliente.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/BuscarDocente/" + cod);

		Invocation.Builder invocationbuilder = webtarget.request(MediaType.APPLICATION_JSON);
		response = invocationbuilder.get();
		// aplicamos una condicion...

		if (response.getStatus() == 200) {
			responsejson = response.readEntity(String.class);
			try {
				doce = objmap.readValue(responsejson, Docente.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (response.getStatus() == 404) {
			System.out.println("Docente no encontrado");
		} else {
			System.out.println("Fuera de rango " + response.getStatus());
		} // fin del else...

		// retornamos el valor

		return doce;
	} // fin del metodo BuscarPorCod

	// Creamos el metodo de actualizar docente
	public void ActualizarDocente(Docente de) {
		// Creamos el objeto cliente...
		// Invocamos la interfaz para poder consumir
		Client cliente = ClientBuilder.newClient();
		// Recuperamos nuestra url del servicio para crear
		WebTarget webtarget = cliente.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/ActualizarDocente");
		// crear un objeto invocation builder para la solicitud
		// invocation le pasamos o decimos que consumira JSON con
		// MediaType.APPLICATION_JSON
		Invocation.Builder invocationBuilder = webtarget.request(MediaType.APPLICATION_JSON);
		// realizamos la solicitud PUT con el objeto de
		// obtenemos en response el JSON
		Response response = invocationBuilder.put(Entity.entity(de, MediaType.APPLICATION_JSON));
		// condicionando que si es diferente de 200 osea esta bien
		if (response.getStatus() == 201) {
			// emite mensaje de error..., error y traera el status
			System.out.println("Docente actualizado exitosamente en BD");
		} // fin de if
		else {
			System.out.println("Error al actualizar al Docente " + response.getStatus());
		} // fin de else
	}// fin de ActualizarDocente

	// Creamos el metodo eliminar docente
	public void EliminarDocente(int cod) {
		// Creamos el objeto cliente...
		// Invocamos la interfaz para poder consumir
		Client cliente = ClientBuilder.newClient();
		// Recuperamos nuestra url del servicio para crear
		WebTarget webtarget = cliente
				.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/EliminarDocente/" + cod);
		// crear un objeto invocation builder para la solicitud
		// invocation le pasamos o decimos que consumira JSON con
		// MediaType.APPLICATION_JSON
		Invocation.Builder invocationBuilder = webtarget.request(MediaType.APPLICATION_JSON);
		// realizamos la solicitud DELETE

		Response response = invocationBuilder.delete();
		// condicionando que si es diferente de 200 osea esta bien
		if (response.getStatus() == 200) {
			// emite mensaje de error..., error y traera el status
			System.out.println("Docente eliminado exitosamente en BD");
		} // fin de if
		else if (response.getStatus() == 400) {
			System.out.println("Error :  Docente no encontrado");
		} else {
			System.out.println("Error al eliminar el Docente " + response.getStatus());
		} // fin de else
	}// fin de EliminarDocente

}// fin de ClassConsumirDocente
