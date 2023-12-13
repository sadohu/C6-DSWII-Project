package ClienteDocente;
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

	//Consumimos el metodo listado de docentes
			public List<Docente> ListadoDocente(){
				//Declaramso variables de tipo response
				Response response = null;
				//variable web target 
				WebTarget webtarget ;
				//Invocamos la interfaz para poder consumir
				Client cliente = ClientBuilder.newClient();
				//Creamos lis  de tipo Docente y List
				List<Docente> lis = null;
				//variable responsejson en null
				String responsejson = null;
				//ObjectMapper es una herramienta utilizada en programación para convertir datos entre formatos, 
				//como por ejemplo, de objetos Java a JSON, o viceversa.
				ObjectMapper objmap = new ObjectMapper();
				//Recuperamos nuestra url del servicio
		webtarget = cliente.target("http://localhost:8080/ServicioAPIWebII/Docente/Crud/Listado");
		//invocation le pasamos o decimos que consumira JSON con MediaType.APPLICATION_JSON
			Invocation.Builder invocationBuilder = webtarget.request(MediaType.APPLICATION_JSON);
			//obtenemos en response el JSON
				response = invocationBuilder.get();
				//imprimimos mensaje por pantalla
				//condicionando que si es diferente de 200 osea no esta bien
				if(response.getStatus() != 200){
					//emite mensaje de error..., error y traera el status 
					System.out.println("Fuera de Rango");
				}//fin de if
				//caso contrario si es == 200 osea ok, leemos almacenamos en responsejson la lectura
				responsejson = response.readEntity(String.class);
					try {
						//lis tiene el responsejson de tipo List ClassAutor
						lis =  objmap.readValue(responsejson, new TypeReference<List<Docente>>(){} );
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
				//retornamos el listado
				return lis;	
			}//fin de ListadoDocente
		
		
	
	
}//fin de ClassConsumirDocente
