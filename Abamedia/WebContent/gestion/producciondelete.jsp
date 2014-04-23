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

// Multiple delete records
String key = "";
String [] arRecKey = request.getParameterValues("key");
String sqlKey = "";
if (arRecKey == null || arRecKey.length == 0 ) {
	response.sendRedirect("produccionlist.jsp");
	response.flushBuffer();
	return;
}
for (int i = 0; i < arRecKey.length; i++){
	String reckey = arRecKey[i].trim();
	reckey = reckey.replaceAll("'",escapeString);

	// Build the SQL
	sqlKey +=  "(";
	sqlKey +=  "`id_pro`=" + "" + reckey + "" + " AND ";
	if (sqlKey.substring(sqlKey.length()-5,sqlKey.length()).equals(" AND " )) { sqlKey = sqlKey.substring(0,sqlKey.length()-5);}
	sqlKey = sqlKey + ") OR ";
}
if (sqlKey.substring(sqlKey.length()-4,sqlKey.length()).equals(" OR ")) { sqlKey = sqlKey.substring(0,sqlKey.length()-4); }

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")){ // Display
		String strsql = "SELECT * FROM `produccion` WHERE " + sqlKey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			response.sendRedirect("produccionlist.jsp");
		}else{
			rs.beforeFirst();
		}
	}else if (a.equals("D")){ // Delete
		String strsql = "DELETE FROM `produccion` WHERE " + sqlKey;
		stmt.executeUpdate(strsql);
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("produccionlist.jsp");
		response.flushBuffer();
		return;
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Delete from TABLE: produccion<br><br><a href="produccionlist.jsp">Back to List</a></span></p>
<form action="producciondelete.jsp" method="post">
<p>
<input type="hidden" name="a" value="D">
<table class="ewTable">
	<tr class="ewTableHeader">
		<td>id pro&nbsp;</td>
		<td>fecha&nbsp;</td>
		<td>id di&nbsp;</td>
		<td>id tipo&nbsp;</td>
		<td>id genero&nbsp;</td>
	</tr>
<%
int recCount = 0;
while (rs.next()){
	recCount ++;
	String rowclass = "ewTableRow"; // Set row color
%>
<%
	if (recCount%2 != 0 ) { // Display alternate color for rows
		rowclass = "ewTableAltRow";
	}
%>
<%
	String x_id_pro = "";
	String x_titulo = "";
	String x_sinopsis = "";
	String x_trailer = "";
	String x_fecha = "";
	String x_id_di = "";
	String x_id_tipo = "";
	String x_id_genero = "";

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
	}
	else{
		x_fecha = "";
	}

	// id_di
	x_id_di = String.valueOf(rs.getLong("id_di"));

	// id_tipo
	x_id_tipo = String.valueOf(rs.getLong("id_tipo"));

	// id_genero
	x_id_genero = String.valueOf(rs.getLong("id_genero"));
%>
	<tr class="<%= rowclass %>">
	<% key =  arRecKey[recCount-1]; %>
	<input type="hidden" name="key" value="<%= HTMLEncode(key) %>">
		<td class="<%= rowclass %>"><% out.print(x_id_pro); %>&nbsp;</td>
		<td class="<%= rowclass %>"><% out.print(x_fecha); %>&nbsp;</td>
		<td class="<%= rowclass %>"><%
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
		<td class="<%= rowclass %>"><%
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
		<td class="<%= rowclass %>"><%
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
<%
}
rs.close();
rs = null;
stmt.close();
stmt = null;
conn.close();
conn = null;
}catch (SQLException ex){
	out.println(ex.toString());
}
%>
</table>
<p>
<input type="submit" name="Action" value="CONFIRM DELETE">
</form>
<%@ include file="footer.jsp" %>
