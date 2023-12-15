package Test;

import java.util.List;

import Entidad.Usuario;
import Interface.UsuarioService;
import Service.UsuarioServicesImpl;

public class TestUsuarioService {
	private static UsuarioService service = new UsuarioServicesImpl();

	public static void main(String[] args) {
//		listar();
//		buscar(5);
//		registrar("usuario123", "123");
//		actualizar(5, "prueba123", "789");
//		eliminar(6);
		login("prueba123", "789");
	}
	
	public static void listar(){
		List<Usuario> usuarios = service.listar();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario);
		}
	}
	
	public static void buscar(int codigo){
		Usuario usuario = service.buscar(codigo);
		System.out.println(usuario);
	}
	
	public static void registrar(String username, String password){
		Usuario usuario = new Usuario(0, username, password);
		service.registrar(usuario);
		
		List<Usuario> usuarios = service.listar();
		int lastIndex = usuarios.size() - 1;
		System.out.println(usuarios.get(lastIndex));
		
	}
	
	public static void actualizar(int codigo, String username, String password){
		Usuario usuario = new Usuario(codigo, username, password);
		service.actualizar(usuario);
		
		List<Usuario> usuarios = service.listar();
		System.out.println(usuarios.stream().filter(item -> item.getCodigo() == codigo).findFirst().orElse(null));
	}
	
	public static void eliminar(int codigo){
		service.eliminar(codigo);
		
		List<Usuario> usuarios = service.listar();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario);
		}
	}
	
	public static void login(String username, String password){
		Usuario usuarioForm = new Usuario(0, username, password);
		Usuario usuario = service.login(usuarioForm);
		System.out.println(usuario);
	}

}
