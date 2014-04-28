
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="clases.*" %>

<%
		String  nombre= (String)request.getParameter("name");
		String email = (String)request.getParameter("email");	
		String coment = (String)request.getParameter("coments");

		try {
			consultas.insertarContacto(nombre, email, "sdfa", coment);
            response.sendRedirect("index.jsp");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
%>