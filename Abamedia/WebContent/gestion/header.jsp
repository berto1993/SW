<html>
<head>
	<title>Gestión de Abamedia</title>
<link href="project1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
<%if(session.getAttribute("name")!=null){%>
<div align="center"><h1>GESTIÓN DE ABAMEDIA</h1></div>
<div align="right">
<h2>Bienvenido <%=session.getAttribute("name")%> || <a class="logout" href="logout.jsp">Logout</a></h2>
<%}else{
	response.sendRedirect("../gestion.jsp");
}%>
</div>
<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="10">
	<tr class="columleft" align="center">
		<td colspan="2"><span class="jspmaker"><b></b></span></td>
	</tr>
<tr class="columleft">
	<!-- left column -->
	<td class="menu" width="20%" height="100%" valign="top">
		<table  width="100%" border="0" cellspacing="0" cellpadding="2">
			<tr><td><span class="jspmaker"><b></b></span></td></tr>
			
			<tr><td><span class="jspmaker"><a href="corporativolist.jsp?cmd=resetall">Corporativo</a></span></td></tr>
			
			<tr><td><span class="jspmaker"><a href="produccionlist.jsp?cmd=resetall">Producción</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="actorlist.jsp?cmd=resetall">Actor</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="repartolist.jsp?cmd=resetall">Reparto</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="tipolist.jsp?cmd=resetall">Tipo</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="directorlist.jsp?cmd=resetall">Director</a></span></td></tr>

			<tr><td><span class="jspmaker"><a href="generolist.jsp?cmd=resetall">Género</a></span></td></tr>
			
			<tr><td><span class="jspmaker"><a href="contactolist.jsp?cmd=resetall">Contacto</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="usuarioslist.jsp?cmd=resetall">Usuarios</a></span></td></tr>
		</table>
	</td>
	<!-- right column -->
	<td width="80%" valign="top">
	
	
