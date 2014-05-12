<%@ page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch (Exception ex){
	out.println(ex.toString());
}
String xDb_Conn_Str = "jdbc:mysql://127.0.0.1:3306/abamedia";
Connection conn = null;
try{
	conn = DriverManager.getConnection(xDb_Conn_Str,"root","root");
}catch (SQLException ex){
	out.println(ex.toString());
}
%>
