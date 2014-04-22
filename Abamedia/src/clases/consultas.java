package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.sql.Statement;

public class consultas implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static LinkedList<produccion> getProducciones()
	{	
	LinkedList<produccion> listaProduccion=new LinkedList<produccion>();
	try
    {
		Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(
           "jdbc:mysql://localhost:3306/abamedia", "root", "root");
       Statement st = conexion.createStatement();
       Statement st2 = conexion.createStatement();
       ResultSet res = st.executeQuery("select * from produccion as p "
       		+ "inner join tipo as t on p.id_tipo=t.id_tipo "
       		+ "inner join director as d on p.id_di=d.id_di "
       		+ "inner join genero as g on p.id_genero=g.id_genero" );
       while (res.next())
       {
    	    produccion beanPro = new produccion();
			beanPro.setIdPro(res.getInt("id_pro"));
			beanPro.setFecha(res.getString("fecha"));
			beanPro.setSinopsis(res.getString("sinopsis"));
			beanPro.setTitulo(res.getString("titulo"));
			beanPro.setTrailer(res.getString("trailer"));
			beanPro.setTipo(res.getString("nombre"));//tipo
			beanPro.setDirector(res.getString("nombred"));//director
			beanPro.setGenero(res.getString("nombreg"));//genero
			
			LinkedList<fotograma> listaF=new LinkedList<fotograma>();
			ResultSet res2 =st2.executeQuery("select * from fotogramas where id_pro="+beanPro.getIdPro());
			
			       while (res2.next())
			       {
			    	   fotograma beanFot=new fotograma();
			    	   beanFot.setNombreimagen(res2.getString("nombreimagen"));
			    	   beanFot.setPortada(res2.getBoolean("portada"));
			    	   listaF.add(beanFot);
			       }
			      
			 beanPro.setListaFotos(listaF);
			 
			 listaProduccion.add(beanPro);
			 
			 res2.close();	
       }
       
       res.close();
       st.close();
       conexion.close();
    }
    catch (Exception e)
    {
    	System.out.println("No se puede conectar a la base de datos.");
    
       e.printStackTrace();
    }
    return listaProduccion;
    }
	
	public static corporativo getCorporativo()
	{
		corporativo beanCor = new corporativo();
		try
	    {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/abamedia", "root", "root");
			Statement st = conexion.createStatement();
			ResultSet res = st.executeQuery("select * from corporativo" );
			while (res.next())
			{
				beanCor.setP1Tit(res.getString("p1Titulo"));
				beanCor.setP2Tit(res.getString("p2Titulo"));
				beanCor.setP3Tit(res.getString("p3Titulo"));
				beanCor.setP4Tit(res.getString("p4Titulo"));
				beanCor.setP5Tit(res.getString("p5Titulo"));
				beanCor.setP6Tit(res.getString("p6Titulo"));
				beanCor.setP7Tit(res.getString("p7Titulo"));
				beanCor.setP8Tit(res.getString("p8Titulo"));
				beanCor.setP9Tit(res.getString("p9Titulo"));
				
				beanCor.setP1Desc(res.getString("p1Descripcion"));
				beanCor.setP2Desc(res.getString("p2Descripcion"));
				beanCor.setP3Desc(res.getString("p3Descripcion"));
				beanCor.setP4Desc(res.getString("p4Descripcion"));
				beanCor.setP5Desc(res.getString("p5Descripcion"));
				beanCor.setP6Desc(res.getString("p6Descripcion"));
				beanCor.setP7Desc(res.getString("p7Descripcion"));
				beanCor.setP8Desc(res.getString("p8Descripcion"));
				beanCor.setP9Desc(res.getString("p9Descripcion"));
			}
			
			res.close();
			st.close();
			conexion.close();
		}
	    catch (Exception e)
	    {
	    	System.out.println("No se puede conectar a la base de datos.");
	    
	       e.printStackTrace();
	    }
	    return beanCor;
	}
	
	public static LinkedList<tipo> getTipos()
	{		
		LinkedList<tipo> listaTipos = new LinkedList<tipo>();
		try
	    {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/abamedia", "root", "root");
			Statement st = conexion.createStatement();
			ResultSet res = st.executeQuery("select * from tipo" );
			while (res.next())
			{
				tipo beanTipo = new tipo();
				beanTipo.setIdTipo(res.getInt("id_tipo"));//id_tipo
				beanTipo.setNombre(res.getString("nombre"));//tipo
				listaTipos.add(beanTipo);
			}
			
			res.close();
			st.close();
			conexion.close();
		}
	    catch (Exception e)
	    {
	    	System.out.println("No se puede conectar a la base de datos.");
	    
	       e.printStackTrace();
	    }
	    return listaTipos;
	 }
}