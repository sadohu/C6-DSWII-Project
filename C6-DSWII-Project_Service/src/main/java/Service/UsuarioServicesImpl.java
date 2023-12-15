package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidad.Usuario;
import Interface.UsuarioService;
import ServicesAConsumir.MySqlConexion;

public class UsuarioServicesImpl implements UsuarioService {

	@Override
	public List<Usuario> listar() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Usuario> usuarios = new ArrayList<Usuario>();
		String sql = "SELECT * FROM tb_usuario";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Usuario usuario = new Usuario(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
				usuarios.add(usuario);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (resultSet != null)
					resultSet.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return usuarios;
	}

	@Override
	public Usuario buscar(int codigo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Usuario usuario = null;
		String sql = "SELECT * FROM tb_usuario WHERE cod_usu = ?";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, codigo);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				usuario = new Usuario(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (resultSet != null)
					resultSet.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return usuario;
	}

	@Override
	public void registrar(Usuario usuario) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO tb_usuario (log_usu, pas_usu) values (?, ?)";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, usuario.getUsername());
			preparedStatement.setString(2, usuario.getPassword());
			int resultSet = preparedStatement.executeUpdate();
			if (resultSet > 0) {
				System.out.println("Usuario regitrado");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}

	@Override
	public void actualizar(Usuario usuario) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE tb_usuario set log_usu = ?, pas_usu = ? WHERE cod_usu = ?";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, usuario.getUsername());
			preparedStatement.setString(2, usuario.getPassword());
			preparedStatement.setInt(3, usuario.getCodigo());
			int resultSet = preparedStatement.executeUpdate();
			if (resultSet > 0) {
				System.out.println("Usuario actualizado");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}

	@Override
	public void eliminar(int codigo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "DELETE FROM tb_usuario WHERE cod_usu = ?";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, codigo);
			int resultSet = preparedStatement.executeUpdate();
			if (resultSet > 0) {
				System.out.println("Usuario eliminado");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}

	@Override
	public Usuario login(Usuario usuario) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Usuario usuarioEnBD = null;
		String sql = "SELECT * FROM tb_usuario WHERE log_usu = ? and pas_usu = ?";

		try {
			connection = MySqlConexion.conexion();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, usuario.getUsername());
			preparedStatement.setString(2, usuario.getPassword());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				usuarioEnBD = new Usuario(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (resultSet != null)
					resultSet.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return usuarioEnBD;
	}

}
