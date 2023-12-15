package Test;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import ClienteDocente.UsuarioService;
import Modelo.Usuario;

public class TestUsuarioService {
	private static UsuarioService service = new UsuarioService();
	

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
//		listar();
//		registar("aluze", "123");
//		buscar(8);
//		actualizar(8, "aluzeluperdi", "123456");
		login("aluzeluperdi", "123456");
//		eliminar(8);
	}

	private static void listar() throws JsonParseException, JsonMappingException, IOException {
		List<Usuario> usuarios = service.listar();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario);
		}
	}

	private static void buscar(int codigo) throws JsonParseException, JsonMappingException, IOException {
		Usuario usuario = service.buscar(codigo);
		System.out.println(usuario);
	}

	private static void registar(String username, String password) throws JsonParseException, JsonMappingException, IOException {
		Usuario usuario = new Usuario(0, username, password);
		service.registrar(usuario);

		List<Usuario> usuarios = service.listar();
		int lastIndex = usuarios.size() - 1;
		System.out.println(usuarios.get(lastIndex));
	}

	private static void actualizar(int codigo, String username, String password) throws JsonParseException, JsonMappingException, IOException {
		Usuario usuario = new Usuario(codigo, username, password);
		service.actualizar(usuario);

		List<Usuario> usuarios = service.listar();
		System.out.println(usuarios.stream().filter(item -> item.getCodigo() == codigo).findFirst().orElse(null));
	}

	private static void eliminar(int codigo) throws JsonParseException, JsonMappingException, IOException {
		service.eliminar(codigo);

		List<Usuario> usuarios = service.listar();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario);
		}
	}
	
	private static void login(String username, String password) throws JsonParseException, JsonMappingException, IOException{
		Usuario usuario = new Usuario(0, username, password);
		Usuario usurioExists = service.login(usuario);
		if(usurioExists == null){
			System.out.println("Error en las credenciales");
			return;
		}
		
		System.out.println("Login correcto, bienvenido");
	}
}
