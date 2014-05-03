<html>
<head>
	<title></title>
<link href="project1.css" rel="stylesheet" type="text/css" />
<meta name="generator" content="JSPMaker v1.0.0.0" />
</head>
<body>
<div align="right">
<%if(session.getAttribute("name")!=null){%>
<div align="center"><h1>WEB DE GESTIÓN DE ABAMEDIA</h1></div>
<div align="right">
<p>Bienvenido , <%=session.getAttribute("name")%> || <a href="logout.jsp">Logout</a>
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
			<tr><td><span class="jspmaker"><a href="actorlist.jsp?cmd=resetall">actor</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="corporativolist.jsp?cmd=resetall">corporativo</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="directorlist.jsp?cmd=resetall">director</a></span></td></tr>

			<tr><td><span class="jspmaker"><a href="generolist.jsp?cmd=resetall">genero</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="produccionlist.jsp?cmd=resetall">produccion</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="repartolist.jsp?cmd=resetall">reparto</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="tipolist.jsp?cmd=resetall">tipo</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="contactolist.jsp?cmd=resetall">contacto</a></span></td></tr>
			<tr><td><span class="jspmaker"><a href="usuarioslist.jsp?cmd=resetall">usuarios</a></span></td></tr>
		</table>
	</td>
	<!-- right column -->
	<td width="80%" valign="top">
	
	
