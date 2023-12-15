package ClienteDocente;

import java.io.IOException;
import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Modelo.Usuario;

public class UsuarioService {
	
	public List<Usuario> listar() throws JsonParseException, JsonMappingException, IOException{
		Response response = null;
		WebTarget webTarget;
		Client client = ClientBuilder.newClient();
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<Usuario> usuarios = null;
		String responseJson = null;
		
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/ListadoUsuarios");
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.get();
		
		if(response.getStatus() != 200)
			System.out.println("Out of Range");
		
		responseJson = response.readEntity(String.class);
		usuarios = objectMapper.readValue(responseJson, new TypeReference<List<Usuario>>() {});
		return usuarios;
	}
	
	public Usuario buscar(int codigo) throws JsonParseException, JsonMappingException, IOException{
		Response response = null;
		WebTarget webTarget;
		Client client = ClientBuilder.newClient();
		ObjectMapper objectMapper = new ObjectMapper();
		
		Usuario usuario = null;
		String responseJson = null;
		
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/BuscarPorId/" + codigo);
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.get();
		
		if(response.getStatus() != 200 && response.getStatus() != 404)
			System.out.println("Out of Range");
		
		if(response.getStatus() == 404)
			System.out.println("Usuario no encontrado");
		
		responseJson = response.readEntity(String.class);
		usuario = objectMapper.readValue(responseJson, Usuario.class);
		
		return usuario;
	}
	
	public void registrar(Usuario usuario){
		// Set interaces
		Client client = ClientBuilder.newClient();
		WebTarget webTarget;
		Response response = null;
		
		// Implementation
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/CrearUsuario");
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.post(Entity.entity(usuario, MediaType.APPLICATION_JSON));
		
		// Validation: Ok Status
		if(response.getStatus() != 201)
			System.out.println("Error al crear el usuario: " + response.getStatus());
			
		System.out.println("Usuario creado exitosamente.");
	}
	
	public void actualizar(Usuario usuario){
		// Set interaces
		Client client = ClientBuilder.newClient();
		WebTarget webTarget;
		Response response = null;
		
		// Implementation
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/ActualizarUsuario");
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.put(Entity.entity(usuario, MediaType.APPLICATION_JSON));
		
		// Validation: Ok Status
		if(response.getStatus() != 201)
			System.out.println("Error al actualizar el usuario: " + response.getStatus());
			
		System.out.println("Usuario actualizado exitosamente.");
	}
	
	public void eliminar(int codigo) throws JsonParseException, JsonMappingException, IOException{
		// Set Interfaces
		Response response = null;
		WebTarget webTarget;
		Client client = ClientBuilder.newClient();
		
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/EliminarUsuario/" + codigo);
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.delete();
		
		// Validation: Ok Status
		if(response.getStatus() != 201 && response.getStatus() != 400)
			System.out.println("Out of Range");
		
		if(response.getStatus() == 400)
			System.out.println("Usuario no encontrado");
		
		System.out.println("Usuario eliminado exitosamente.");
	}
	
	public Usuario login(Usuario usuario) throws JsonParseException, JsonMappingException, IOException{
		Response response = null;
		WebTarget webTarget;
		Client client = ClientBuilder.newClient();
		ObjectMapper objectMapper = new ObjectMapper();
		
		Usuario usuarioExists = null;
		String responseJson = null;
		
		webTarget = client.target("http://localhost:8080/ServicioAPIWebII/Docente/Usuario/LoginUsuario");
		Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON);
		response = invocationBuilder.post(Entity.entity(usuario, MediaType.APPLICATION_JSON));
		
		if(response.getStatus() != 200){
			System.out.println("Credenciales incorrectas: " + response.getStatus());
		}else{
			responseJson = response.readEntity(String.class);
			usuarioExists = objectMapper.readValue(responseJson, Usuario.class);
		}
		return usuarioExists;
	}
	
	
	
}
