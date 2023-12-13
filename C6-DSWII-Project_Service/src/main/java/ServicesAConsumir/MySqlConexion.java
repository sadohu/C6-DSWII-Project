package ServicesAConsumir;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class MySqlConexion {
	//Declaramos variables globales
		private static String url="jdbc:mysql://localhost:3306/instituto_2021_t4dn";
		private static String usuario="root";
		private static String password="mysql";
		private static Connection cn;
		//Creamos un metodo de conexión
		public static Connection conexion(){
			try {
				//Class.forName("com.mysql.jdbc.Driver");
				Class.forName("com.mysql.cj.jdbc.Driver");
				//Nos conectamos con la BD a partir de las variables de arriba
				cn=DriverManager.getConnection(url, usuario, password);;
				//aplicamos una condición
				if(cn != null){
					//primero null, segundo es el texto del mensaje, tercero es lo que sera de titulo y  de icono information message
					// JOptionPane.showMessageDialog(null, "Conexion con base de datos Exitosa !!!","MENSAJE",JOptionPane.INFORMATION_MESSAGE);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			//retornamos el valor
			return cn;
		}// FIN DEL METODO CONNECTION
}//FIN DE LA CLASE MySqlConexion
