<%@ page session="true" buffer="16kb" import="java.sql.*,java.util.*,java.text.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
response.setDateHeader("Expires", 0); // date in the past
response.addHeader("Cache-Control", "no-store, no-cache, must-revalidate"); // HTTP/1.1 
response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
response.addHeader("Pragma", "no-cache"); // HTTP/1.0 
%>
<% Locale locale = Locale.getDefault();
response.setLocale(locale);%>
<% session.setMaxInactiveInterval(30*60); %>
<%@ include file="db.jsp" %>
<%@ include file="jspmkrfn.jsp" %>
<%
String tmpfld = null;
String escapeString = "\\\\'";
String key = request.getParameter("key");
if (key == null || key.length() == 0) { response.sendRedirect("produccionlist.jsp");}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}
String x_id_pro = "";
String x_titulo = "";
String x_sinopsis = "";
String x_trailer = "";
String x_fecha = "";
String x_id_di = "";
String x_id_tipo = "";
String x_id_genero = "";

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")) {// Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `produccion` WHERE `id_pro`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			out.clear();
			response.sendRedirect("produccionlist.jsp");
		}else{
			rs.first();
		}

		// Get field values
		// id_pro

		x_id_pro = String.valueOf(rs.getLong("id_pro"));

		// titulo
		if (rs.getClob("titulo") != null) {
			long length = rs.getClob("titulo").length();
			x_titulo = rs.getClob("titulo").getSubString((long) 1, (int) length);
		}else{
			x_titulo = "";
		}

		// sinopsis
		if (rs.getClob("sinopsis") != null) {
			long length = rs.getClob("sinopsis").length();
			x_sinopsis = rs.getClob("sinopsis").getSubString((long) 1, (int) length);
		}else{
			x_sinopsis = "";
		}

		// trailer
		if (rs.getClob("trailer") != null) {
			long length = rs.getClob("trailer").length();
			x_trailer = rs.getClob("trailer").getSubString((long) 1, (int) length);
		}else{
			x_trailer = "";
		}

		// fecha
		if (rs.getString("fecha") != null){
			x_fecha = rs.getString("fecha");
		}else{
			x_fecha = "";
		}

		// id_di
		x_id_di = String.valueOf(rs.getLong("id_di"));

		// id_tipo
		x_id_tipo = String.valueOf(rs.getLong("id_tipo"));

		// id_genero
		x_id_genero = String.valueOf(rs.getLong("id_genero"));
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">View TABLE: produccion<br><br><a href="produccionlist.jsp">Back to List</a></span></p>
<p>
<form>
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">id pro&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_id_pro); %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_titulo != null) { out.print(((String)x_titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">sinopsis&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_sinopsis != null) { out.print(((String)x_sinopsis).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">trailer&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_trailer != null) { out.print(((String)x_trailer).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">fecha&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_fecha); %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id di&nbsp;</td>
		<td class="ewTableAltRow"><%
if (x_id_di!=null && ((String)x_id_di).length() > 0) {
	String sqlwrk_where = "";
	sqlwrk_where = "`id_di` = " + x_id_di;
	String sqlwrk = "SELECT DISTINCT `id_di`, `nombred` FROM `director`";
	if (sqlwrk_where.length() > 0) {
	sqlwrk += " WHERE " + sqlwrk_where;
	}
	Statement stmtwrk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rswrk = stmtwrk.executeQuery(sqlwrk);
	if (rswrk.next()) {
		out.print(rswrk.getString("nombred"));
	}
	rswrk.close();
	rswrk = null;
	stmtwrk.close();
	stmtwrk = null;
}
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id tipo&nbsp;</td>
		<td class="ewTableAltRow"><%
if (x_id_tipo!=null && ((String)x_id_tipo).length() > 0) {
	String sqlwrk_where = "";
	sqlwrk_where = "`id_tipo` = " + x_id_tipo;
	String sqlwrk = "SELECT DISTINCT `id_tipo`, `nombre` FROM `tipo`";
	if (sqlwrk_where.length() > 0) {
	sqlwrk += " WHERE " + sqlwrk_where;
	}
	Statement stmtwrk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rswrk = stmtwrk.executeQuery(sqlwrk);
	if (rswrk.next()) {
		out.print(rswrk.getString("nombre"));
	}
	rswrk.close();
	rswrk = null;
	stmtwrk.close();
	stmtwrk = null;
}
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id genero&nbsp;</td>
		<td class="ewTableAltRow"><%
if (x_id_genero!=null && ((String)x_id_genero).length() > 0) {
	String sqlwrk_where = "";
	sqlwrk_where = "`id_genero` = " + x_id_genero;
	String sqlwrk = "SELECT DISTINCT `id_genero`, `nombreg` FROM `genero`";
	if (sqlwrk_where.length() > 0) {
	sqlwrk += " WHERE " + sqlwrk_where;
	}
	Statement stmtwrk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rswrk = stmtwrk.executeQuery(sqlwrk);
	if (rswrk.next()) {
		out.print(rswrk.getString("nombreg"));
	}
	rswrk.close();
	rswrk = null;
	stmtwrk.close();
	stmtwrk = null;
}
%>
&nbsp;</td>
	</tr>
</table>
</form>
<p>
<%
	rs.close();
	rs = null;
	stmt.close();
	stmt = null;
	conn.close();
	conn = null;
}catch(SQLException ex){
	out.println(ex.toString());
}
%>
<%@ include file="footer.jsp" %>
