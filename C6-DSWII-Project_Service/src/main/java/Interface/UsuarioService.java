package Interface;

import java.util.List;

import Entidad.Usuario;

public interface UsuarioService {
	public abstract List<Usuario> listar();
	public abstract Usuario buscar(int codigo);
	public abstract void registrar(Usuario usuario);
	public abstract void actualizar(Usuario usuario);
	public abstract void eliminar(int codigo);
	public abstract Usuario login(Usuario usuario);
}
