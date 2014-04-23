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
	response.sendRedirect("corporativolist.jsp");
	response.flushBuffer();
	return;
}
for (int i = 0; i < arRecKey.length; i++){
	String reckey = arRecKey[i].trim();
	reckey = reckey.replaceAll("'",escapeString);

	// Build the SQL
	sqlKey +=  "(";
	sqlKey +=  "`idcorporativo`=" + "" + reckey + "" + " AND ";
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
		String strsql = "SELECT * FROM `corporativo` WHERE " + sqlKey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			response.sendRedirect("corporativolist.jsp");
		}else{
			rs.beforeFirst();
		}
	}else if (a.equals("D")){ // Delete
		String strsql = "DELETE FROM `corporativo` WHERE " + sqlKey;
		stmt.executeUpdate(strsql);
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("corporativolist.jsp");
		response.flushBuffer();
		return;
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Delete from TABLE: corporativo<br><br><a href="corporativolist.jsp">Back to List</a></span></p>
<form action="corporativodelete.jsp" method="post">
<p>
<input type="hidden" name="a" value="D">
<table class="ewTable">
	<tr class="ewTableHeader">
		<td>idcorporativo&nbsp;</td>
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
	String x_idcorporativo = "";
	String x_p1Titulo = "";
	String x_p1Descripcion = "";
	String x_p2Titulo = "";
	String x_p2Descripcion = "";
	String x_p3Titulo = "";
	String x_p3Descripcion = "";
	String x_p4Titulo = "";
	String x_p4Descripcion = "";
	String x_p5Titulo = "";
	String x_p5Descripcion = "";
	String x_p6Titulo = "";
	String x_p6Descripcion = "";
	String x_p7Titulo = "";
	String x_p7Descripcion = "";
	String x_p8Titulo = "";
	String x_p8Descripcion = "";
	String x_p9Titulo = "";
	String x_p9Descripcion = "";

	// idcorporativo
	x_idcorporativo = String.valueOf(rs.getLong("idcorporativo"));

	// p1Titulo
	if (rs.getClob("p1Titulo") != null) {
		long length = rs.getClob("p1Titulo").length();
		x_p1Titulo = rs.getClob("p1Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p1Titulo = "";
	}

	// p1Descripcion
	if (rs.getClob("p1Descripcion") != null) {
		long length = rs.getClob("p1Descripcion").length();
		x_p1Descripcion = rs.getClob("p1Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p1Descripcion = "";
	}

	// p2Titulo
	if (rs.getClob("p2Titulo") != null) {
		long length = rs.getClob("p2Titulo").length();
		x_p2Titulo = rs.getClob("p2Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p2Titulo = "";
	}

	// p2Descripcion
	if (rs.getClob("p2Descripcion") != null) {
		long length = rs.getClob("p2Descripcion").length();
		x_p2Descripcion = rs.getClob("p2Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p2Descripcion = "";
	}

	// p3Titulo
	if (rs.getClob("p3Titulo") != null) {
		long length = rs.getClob("p3Titulo").length();
		x_p3Titulo = rs.getClob("p3Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p3Titulo = "";
	}

	// p3Descripcion
	if (rs.getClob("p3Descripcion") != null) {
		long length = rs.getClob("p3Descripcion").length();
		x_p3Descripcion = rs.getClob("p3Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p3Descripcion = "";
	}

	// p4Titulo
	if (rs.getClob("p4Titulo") != null) {
		long length = rs.getClob("p4Titulo").length();
		x_p4Titulo = rs.getClob("p4Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p4Titulo = "";
	}

	// p4Descripcion
	if (rs.getClob("p4Descripcion") != null) {
		long length = rs.getClob("p4Descripcion").length();
		x_p4Descripcion = rs.getClob("p4Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p4Descripcion = "";
	}

	// p5Titulo
	if (rs.getClob("p5Titulo") != null) {
		long length = rs.getClob("p5Titulo").length();
		x_p5Titulo = rs.getClob("p5Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p5Titulo = "";
	}

	// p5Descripcion
	if (rs.getClob("p5Descripcion") != null) {
		long length = rs.getClob("p5Descripcion").length();
		x_p5Descripcion = rs.getClob("p5Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p5Descripcion = "";
	}

	// p6Titulo
	if (rs.getClob("p6Titulo") != null) {
		long length = rs.getClob("p6Titulo").length();
		x_p6Titulo = rs.getClob("p6Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p6Titulo = "";
	}

	// p6Descripcion
	if (rs.getClob("p6Descripcion") != null) {
		long length = rs.getClob("p6Descripcion").length();
		x_p6Descripcion = rs.getClob("p6Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p6Descripcion = "";
	}

	// p7Titulo
	if (rs.getClob("p7Titulo") != null) {
		long length = rs.getClob("p7Titulo").length();
		x_p7Titulo = rs.getClob("p7Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p7Titulo = "";
	}

	// p7Descripcion
	if (rs.getClob("p7Descripcion") != null) {
		long length = rs.getClob("p7Descripcion").length();
		x_p7Descripcion = rs.getClob("p7Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p7Descripcion = "";
	}

	// p8Titulo
	if (rs.getClob("p8Titulo") != null) {
		long length = rs.getClob("p8Titulo").length();
		x_p8Titulo = rs.getClob("p8Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p8Titulo = "";
	}

	// p8Descripcion
	if (rs.getClob("p8Descripcion") != null) {
		long length = rs.getClob("p8Descripcion").length();
		x_p8Descripcion = rs.getClob("p8Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p8Descripcion = "";
	}

	// p9Titulo
	if (rs.getClob("p9Titulo") != null) {
		long length = rs.getClob("p9Titulo").length();
		x_p9Titulo = rs.getClob("p9Titulo").getSubString((long) 1, (int) length);
	}else{
		x_p9Titulo = "";
	}

	// p9Descripcion
	if (rs.getClob("p9Descripcion") != null) {
		long length = rs.getClob("p9Descripcion").length();
		x_p9Descripcion = rs.getClob("p9Descripcion").getSubString((long) 1, (int) length);
	}else{
		x_p9Descripcion = "";
	}
%>
	<tr class="<%= rowclass %>">
	<% key =  arRecKey[recCount-1]; %>
	<input type="hidden" name="key" value="<%= HTMLEncode(key) %>">
		<td class="<%= rowclass %>"><% out.print(x_idcorporativo); %>&nbsp;</td>
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
