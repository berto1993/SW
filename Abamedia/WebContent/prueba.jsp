<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%
try {
String Host = "jdbc:mysql://localhost:3306/abamedia";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(Host, "root","00650065");
statement = connection.createStatement();
String Data = "select * from produccion";
rs = statement.executeQuery(Data);
%>

<TABLE border="1">
<tr  width="10" bgcolor="#9979">
<td>titulo</td>
<td>sinopsis</td>
</tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("titulo")%></TD>
<TD><%=rs.getString("sinopsis")%></TD>

</TR>
<%   }    %>
</table>
<%
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
out.println("Can’t connect to database.");
}
%>
<h1>Hello World!</h1></body>
</html>