<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="clases.*" %>
<%@ page import ="java.util.LinkedList"%>
<table>
<% produccion bp =new produccion();
LinkedList<produccion> lista = consultas.getProducciones();
	for (int i=0;i<lista.size();i++){
		bp=lista.get(i);
%>
								
	<tr>
       <td valign="top"><p ><%=bp.getTitulo() %>
       &nbsp;-&nbsp;<%=bp.getSinopsis() %></p>	
		</tr>
<%}%>
</table>

LinkedList<produccion> listaProduccion=new LinkedList<produccion>();
	try
    {
		Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(
           "jdbc:mysql://localhost:3306/abamedia", "root", "00650065");
       Statement st = conexion.createStatement();
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
			ResultSet res2 =st.executeQuery("select * from fotogramas where id_pro="+beanPro.getIdPro());
			
			       while (res2.next())
			       {
			    	   fotograma beanFot=new fotograma();
			    	   beanFot.setNombreimagen(res2.getString("nombreimagen"));
			    	   beanFot.setPortada(res2.getBoolean("portada"));
			    	   listaF.add(beanFot);
			       }
			      
			 beanPro.setListaFotos(listaF);
			 
			 listaProduccion.add(beanPro);
			 
			// res2.close();	
       }
       
       res.close();
       st.close();
       conexion.close();