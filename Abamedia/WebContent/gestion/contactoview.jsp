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
if (key == null || key.length() == 0) { response.sendRedirect("contactolist.jsp");}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}
String x_coments = "";
String x_name = "";
String x_email = "";
String x_archivo = "";
String x_id = "";

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")) {// Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `contacto` WHERE `id`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			out.clear();
			response.sendRedirect("contactolist.jsp");
		}else{
			rs.first();
		}

		// Get field values
		// coments

		if (rs.getClob("coments") != null) {
			long length = rs.getClob("coments").length();
			x_coments = rs.getClob("coments").getSubString((long) 1, (int) length);
		}else{
			x_coments = "";
		}

		// name
		if (rs.getClob("name") != null) {
			long length = rs.getClob("name").length();
			x_name = rs.getClob("name").getSubString((long) 1, (int) length);
		}else{
			x_name = "";
		}

		// email
		if (rs.getClob("email") != null) {
			long length = rs.getClob("email").length();
			x_email = rs.getClob("email").getSubString((long) 1, (int) length);
		}else{
			x_email = "";
		}

		// archivo
		if (rs.getClob("archivo") != null) {
			long length = rs.getClob("archivo").length();
			x_archivo = rs.getClob("archivo").getSubString((long) 1, (int) length);
		}else{
			x_archivo = "";
		}

		// id
		x_id = String.valueOf(rs.getLong("id"));
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">View TABLE: contacto<br><br><a href="contactolist.jsp">Back to List</a></span></p>
<p>
<form>
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">coments&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_coments != null) { out.print(((String)x_coments).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">name&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_name != null) { out.print(((String)x_name).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">email&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_email != null) { out.print(((String)x_email).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">archivo&nbsp;</td>
		<td class="ewTableAltRow"><% if (x_archivo != null) { out.print(((String)x_archivo).replaceAll("\r\n", "<br>"));} %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_id); %>&nbsp;</td>
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
