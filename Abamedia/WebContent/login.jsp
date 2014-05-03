<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="clases.*" %>

<%
String  nombre= request.getParameter("name");
String contra = request.getParameter("password");	
usuario user = consultas.comprobarUsuarioCon(nombre,contra);

if(user == null)
{
	session.setAttribute("logeado","no"); 
	response.sendRedirect("gestion.jsp"); 
	
	}else{
		session.setAttribute("logeado","si"); 
		session.setAttribute("name",nombre);
		response.sendRedirect("gestion/index.jsp");
	}
%>

