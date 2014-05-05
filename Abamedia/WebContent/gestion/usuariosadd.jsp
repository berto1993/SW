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
request.setCharacterEncoding("UTF-8");

// Get action
String a = request.getParameter("a");
String key = "";
if (a == null || a.length() == 0) {
	key = request.getParameter("key");
	if (key != null && key.length() > 0) {
		a = "C"; // Copy record
	} else {
		a = "I"; // Display blank record
	}
}
Object x_name = null;
Object x_password = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("C")){ // Get a record to display
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `usuarios` WHERE `password`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()){
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("usuarioslist.jsp");
			response.flushBuffer();
			return;
		}
		rs.first();

			// Get the field contents
	if (rs.getString("name") != null){
		x_name = rs.getString("name");
	}else{
		x_name = "";
	}
	if (rs.getString("password") != null){
		x_password = rs.getString("password");
	}else{
		x_password = "";
	}
		rs.close();
		rs = null;
	}else if (a.equals("A")) { // Add

		// Get fields from form
		if (request.getParameter("x_name") != null){
			x_name = (String) request.getParameter("x_name");
		}else{
			x_name = "";
		}
		if (request.getParameter("x_password") != null){
			x_password = (String) request.getParameter("x_password");
		}else{
			x_password = "";
		}

		// Open record
		String strsql = "SELECT * FROM `usuarios` WHERE 0 = 1";
		rs = stmt.executeQuery(strsql);
		rs.moveToInsertRow();

		// Field name
		tmpfld = ((String) x_name);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = "";
		}
		if (tmpfld == null) {
			rs.updateNull("name");
		}else{
			rs.updateString("name", tmpfld);
		}

		// Field password
		tmpfld = ((String) x_password);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = "";
		}
		if (tmpfld == null) {
			rs.updateNull("password");
		}else{
		String srchfld = "'" + tmpfld + "'";
			srchfld = srchfld.replaceAll("'","\\\\'");
			strsql = "SELECT * FROM `usuarios` WHERE `password` = '" + srchfld +"'";
			Statement stmtchk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rschk = stmtchk.executeQuery(strsql);
			if (rschk.next()) {
				out.print("Duplicate key for password, value = " + tmpfld + "<br>");
				out.print("Press [Previous Page] key to continue!");
				return;
			}
			rschk.close();
			rschk = null;
			rs.updateString("password", tmpfld);
		}
		rs.insertRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		out.clear();
		response.sendRedirect("usuarioslist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
	out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Add to TABLE: usuarios<br><br><a href="usuarioslist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_name && !EW_hasValue(EW_this.x_name, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_name, "TEXT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_password && !EW_hasValue(EW_this.x_password, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_password, "TEXT", "Campo Obligatorio"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  action="usuariosadd.jsp" method="post">
<p>
<input type="hidden" name="a" value="A">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">name&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_name" size="30" maxlength="25" value="<%= HTMLEncode((String)x_name) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">password&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_password" size="30" maxlength="25" value="<%= HTMLEncode((String)x_password) %>">&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="ADD">
</form>
<%@ include file="footer.jsp" %>
