package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Entidad.Docente;
import Interface.IDocente;
import ServicesAConsumir.MySqlConexion;

public class DocenteServiceImpl  implements IDocente {
	
	
	public void RegistrarDocente(Docente docente) {
		//Declaramos salida en -1 es decir no se agrego nada , y eso retorna por q el metodo si es int , debe devolver un int
		//si el valor es diferente a -1 o 0 , un 1 entonces registro es exitoso
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.conexion();
			String sql="insert into tb_docente values(null,?,?,?,?,?,?,1)";
			pstm=cn.prepareStatement(sql);
			//Obtenemos los parametros, 1 es parametro osea nom_doc y asi sucesivamente ponemos los numeros segun los ?
			pstm.setString(1, docente.getNombres());
			pstm.setString(2, docente.getPaterno());
			pstm.setString(3, docente.getMaterno());
			pstm.setString(4, docente.getSexo());
			pstm.setInt(5, docente.getHijos());
			pstm.setDouble(6, docente.getSueldo());
			//ejecucion de la instruccion-> y si todo esta OK se convierte a 1 , es decir OK la agregacion
			salida=pstm.executeUpdate();
			//aplicamos una condicion
			if(salida>0){
				//imprimimos mensaje por pantalla...
				System.out.println("Dato registrado en la BD");
			}//fin de condicion
			
		} catch (SQLException e) {
			System.out.println("Error en la instrucción SQL-Registrar de Docentes" + e.getMessage());
		}
		finally {
			try {
				//Quiere decir que se estableció conexion si son diferentes de null y cerramos la conexion con close()
				if(pstm != null) pstm.close();
				if(cn != null) cn.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar la BD" +e2.getMessage());
			}
		}
		
		
	} //fin de RegistrarDocente

	public void ActualizarDocente(Docente docente) {
		//Declaramos salida en -1 es decir no se agrego nada , y eso retorna por q el metodo si es int , debe devolver un int
				//si el valor es diferente a -1 o 0 , un 1 entonces registro es exitoso
				int salida=-1;
				Connection cn=null;
				PreparedStatement pstm=null;
				try {
					cn=MySqlConexion.conexion();
					String sql="update tb_docente set nom_doc=?,pat_doc=?,mat_doc=?,sex_doc=?,num_hijo_doc=?,sue_doc=? where cod_doc=?";
					pstm=cn.prepareStatement(sql);
					//Obtenemos los parametros, 1 es parametro osea nom_doc y asi sucesivamente ponemos los numeros segun los ?
					pstm.setString(1, docente.getNombres());
					pstm.setString(2, docente.getPaterno());
					pstm.setString(3, docente.getMaterno());
					pstm.setString(4, docente.getSexo());
					pstm.setInt(5, docente.getHijos());
					pstm.setDouble(6, docente.getSueldo());
					//Agregamos el parametro de eliminar por codigo
					pstm.setInt(7, docente.getCodigo());
					//ejecucion de la instruccion-> y si todo esta OK se convierte a 1 , es decir OK la agregacion
					salida=pstm.executeUpdate();
					//aplicamos una condicion
					if(salida>0){
						//imprimimos mensaje por pantalla...
						System.out.println("Dato actualizado en la BD");
					}//fin de condicion
				} catch (SQLException e) {
					System.out.println("Error en la instrucción SQL-Actualizar Docentes" + e.getMessage());
				}
				finally {
					try {
						//Quiere decir que se estableció conexion si son diferentes de null y cerramos la conexion con close()
						if(pstm != null) pstm.close();
						if(cn != null) cn.close();
					} catch (SQLException e2) {
						System.out.println("Error al cerrar la BD" +e2.getMessage());
					}
				}
				
	}//fin de ActualizarDocente

	public void EliminarDocente(Docente docente) {
		//Declaramos salida en -1 es decir no se agrego nada , y eso retorna por q el metodo si es int , debe devolver un int
		//si el valor es diferente a -1 o 0 , un 1 entonces registro es exitoso
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.conexion();
			String sql="delete from tb_docente where cod_doc=?";
			pstm=cn.prepareStatement(sql);
			//Obtenemos los parametros, 1 es parametro osea cod_doc 
			pstm.setInt(1, docente.getCodigo());
			//ejecucion de la instruccion-> y si todo esta OK se convierte a 1 , es decir OK la eliminacion
			salida=pstm.executeUpdate();
			if(salida>0){
				//imprimimos mensaje por pantalla...
				System.out.println("Dato eliminado de la Base de Datos");
			}//fin de condicion
			
		} catch (SQLException e) {
			System.out.println("Error en la instrucción SQL-Eliminar Docentes" + e.getMessage());
		}
		finally {
			try {
				//Quiere decir que se estableció conexion si son diferentes de null y cerramos la conexion con close()
				if(pstm != null) pstm.close();
				if(cn != null) cn.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar la BD" +e2.getMessage());
			}
		}
	
		
	} //fin de EliminarDocente

	public Docente BuscarDocente(Docente docente) {
		//declarar y crear
	
		//Declarar objeto de la clase Docente
		Docente bean=null;
		//Connection,PreparedStatement y ResultSet de java.sql importamos
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1 La conexion
		   cn=MySqlConexion.conexion();
		   //2 La instruccion SQL
		   String sql="SELECT * FROM tb_docente where cod_doc=?";
		   //3 asignar la instruccion con la conexion
		   pstm=cn.prepareStatement(sql);
		   //4 PARAMETROS NO HAY O NO EXISTE
		 //Obtenemos los parametros, 1 es parametro osea cod_doc 
			pstm.setInt(1, docente.getCodigo());
		   //5 EJECUTAR-> rs almacena los 40 docentes y lo imprime while
		   rs=pstm.executeQuery();
		   //6 un bucle while
		   while(rs.next()){
			   //7 crear objeto bean
			   bean=new Docente();
			   //8 Setear los atributos del objeto bean con los valores de la fila actual
			   bean.setCodigo(rs.getInt(1));
			   bean.setNombres(rs.getString(2));
			   bean.setPaterno(rs.getString(3));
			   bean.setMaterno(rs.getString(4));
			   bean.setSexo(rs.getString(5));
			   bean.setHijos(rs.getInt(6));
			   bean.setSueldo(rs.getDouble(7));
			 
		   }
		} catch (SQLException e) {
			System.out.println("Error en la instrucción SQL-Lista de Docentes" + e.getMessage());
		}
		//Bloque finlly que siempre se ejecutará
		finally {
			try {
				//Aca cerramos conexion
				//objeto rs de tipo ResultSet cuando vamos a consultar
				if(rs != null) rs.close();
				if(pstm != null) pstm.close();
				if(cn != null) cn.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar la BD" +e2.getMessage());
			}
		}
		return bean;
		
	}//fin de BuscarDocente

	public List<Docente> listado() {
		//declarar y crear
		//Donde list es la colección y ArrayList es la implementación
		List<Docente> lista=new ArrayList<Docente>();
		//Declarar objeto de la clase Docente
		Docente bean=null;
		//Connection,PreparedStatement y ResultSet de java.sql importamos
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1 La conexion
		   cn=MySqlConexion.conexion();
		   //2 La instruccion SQL
		   String sql="SELECT * FROM tb_docente";
		   //3 asignar la instruccion con la conexion
		   pstm=cn.prepareStatement(sql);
		   //4 PARAMETROS NO HAY O NO EXISTE
		   
		   //5 EJECUTAR-> rs almacena los 40 docentes y lo imprime while
		   rs=pstm.executeQuery();
		   //6 un bucle while
		   while(rs.next()){
			   //7 crear objeto bean
			   bean=new Docente();
			   //8 Setear los atributos del objeto bean con los valores de la fila actual
			   bean.setCodigo(rs.getInt(1));
			   bean.setNombres(rs.getString(2));
			   bean.setPaterno(rs.getString(3));
			   bean.setMaterno(rs.getString(4));
			   bean.setSexo(rs.getString(5));
			   bean.setHijos(rs.getInt(6));
			   bean.setSueldo(rs.getDouble(7));
			   //9 .-adicionar objeto "bean" al arreglo "lista"
			   lista.add(bean);
		   }
		} catch (SQLException e) {
			System.out.println("Error en la instrucción SQL-Lista de Docentes" + e.getMessage());
		}
		//Bloque finlly que siempre se ejecutará
		finally {
			try {
				//Aca cerramos conexion
				//objeto rs de tipo ResultSet cuando vamos a consultar
				if(rs != null) rs.close();
				if(pstm != null) pstm.close();
				if(cn != null) cn.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar la BD" +e2.getMessage());
			}
		}
		return lista;
	} //fin de listado

}
