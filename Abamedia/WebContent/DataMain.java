package prueba;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Main {

	public static void main(String[] args)
	{
		ListaClasePrueba lista = new ListaClasePrueba();
		System.out.println(lista.getLista().size());
		try {
		Connection a = (Connection) ConexionDB.GetConnection();
	
		Statement s = (Statement) a.createStatement();
		ResultSet rs = s.executeQuery("select * from ids");
		ClasePrueba aux;
		while (rs.next())
		{
			aux = new ClasePrueba(rs.getInt(1), rs.getString(2));
			lista.getLista().addLast(aux);
		}
		s.executeUpdate("insert into ids values (3,'carlos')");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		System.out.println("Elementos en la lista  "+lista.getLista().size());
		lista.imprimir();	
		
	

	}

}
