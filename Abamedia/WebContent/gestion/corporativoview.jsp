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
if (key == null || key.length() == 0) { response.sendRedirect("corporativolist.jsp");}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}
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

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")) {// Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `corporativo` WHERE `idcorporativo`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			out.clear();
			response.sendRedirect("corporativolist.jsp");
		}else{
			rs.first();
		}

		// Get field values
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
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">View TABLE: corporativo<br><br><a href="corporativolist.jsp">Back to List</a></span></p>
<p>
<form>
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">idcorporativo&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_idcorporativo); %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 1Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p1Titulo != null) { out.print(((String)x_p1Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 1Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p1Descripcion != null) { out.print(((String)x_p1Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 2Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p2Titulo != null) { out.print(((String)x_p2Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 2Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p2Descripcion != null) { out.print(((String)x_p2Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 3Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p3Titulo != null) { out.print(((String)x_p3Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 3Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p3Descripcion != null) { out.print(((String)x_p3Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 4Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p4Titulo != null) { out.print(((String)x_p4Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 4Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p4Descripcion != null) { out.print(((String)x_p4Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 5Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p5Titulo != null) { out.print(((String)x_p5Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 5Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p5Descripcion != null) { out.print(((String)x_p5Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 6Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p6Titulo != null) { out.print(((String)x_p6Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 6Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p6Descripcion != null) { out.print(((String)x_p6Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 7Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p7Titulo != null) { out.print(((String)x_p7Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 7Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p7Descripcion != null) { out.print(((String)x_p7Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 8Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p8Titulo != null) { out.print(((String)x_p8Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 8Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p8Descripcion != null) { out.print(((String)x_p8Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 9Titulo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p9Titulo != null) { out.print(((String)x_p9Titulo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 9Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_p9Descripcion != null) { out.print(((String)x_p9Descripcion).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
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
