package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DataConexionDB {
     
    public static Connection GetConnection() throws Exception
    {
       
        Connection conexion=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(
			       "jdbc:mysql://localhost:3306/abamedia", "root", "00650065");
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        return conexion;
        
    }
}