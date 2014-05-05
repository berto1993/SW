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
String key = request.getParameter("key");
if (key == null || key.length() == 0 ) {
	response.sendRedirect("contactolist.jsp");
	response.flushBuffer();
	return;
}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}

// Get fields from form
Object x_name = null;
Object x_email = null;
Object x_ruta = null;
Object x_coments = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")){ // Get a record to display
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `contacto` WHERE `email`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("contactolist.jsp");
			response.flushBuffer();
			return;
		}else{
			rs.first();

			// Get the field contents
			if (rs.getString("name") != null){
				x_name = rs.getString("name");
			}else{
				x_name = "";
			}
			if (rs.getString("email") != null){
				x_email = rs.getString("email");
			}else{
				x_email = "";
			}
			if (rs.getString("ruta") != null){
				x_ruta = rs.getString("ruta");
			}else{
				x_ruta = "";
			}
			if (rs.getClob("coments") != null) {
				long length = rs.getClob("coments").length();
				x_coments = rs.getClob("coments").getSubString((long) 1, (int) length);
			}else{
				x_coments = "";
			}
		}
		rs.close();
	}else if (a.equals("U")) {// Update

		// Get fields from form
		if (request.getParameter("x_name") != null){
			x_name = (String) request.getParameter("x_name");
		}else{
			x_name = "";
		}
		if (request.getParameter("x_email") != null){
			x_email = (String) request.getParameter("x_email");
		}else{
			x_email = "";
		}
		if (request.getParameter("x_ruta") != null){
			x_ruta = (String) request.getParameter("x_ruta");
		}else{
			x_ruta = "";
		}
		if (request.getParameter("x_coments") != null){
			x_coments = (String) request.getParameter("x_coments");
		}else{
			x_coments = "";
		}

		// Open record
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `contacto` WHERE `email`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("contactolist.jsp");
			response.flushBuffer();
			return;
		}

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

		// Field email
		tmpfld = ((String) x_email);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = "";
		}
		if (tmpfld == null) {
			rs.updateNull("email");
		}else{
			rs.updateString("email", tmpfld);
		}

		// Field ruta
		tmpfld = ((String) x_ruta);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = "";
		}
		if (tmpfld == null) {
			rs.updateNull("ruta");
		}else{
			rs.updateString("ruta", tmpfld);
		}

		// Field coments
		tmpfld = ((String) x_coments);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("coments");
		}else{
			rs.updateString("coments", tmpfld);
		}
		rs.updateRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("contactolist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
		out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Edit TABLE: contacto<br><br><a href="contactolist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_name && !EW_hasValue(EW_this.x_name, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_name, "TEXT", "Invalid Field - name"))
                return false; 
        }
if (EW_this.x_email && !EW_hasValue(EW_this.x_email, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_email, "TEXT", "Invalid Field - email"))
                return false; 
        }
if (EW_this.x_ruta && !EW_hasValue(EW_this.x_ruta, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_ruta, "TEXT", "Invalid Field - ruta"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  name="contactoedit" action="contactoedit.jsp" method="post">
<p>
<input type="hidden" name="a" value="U">
<input type="hidden" name="key" value="<%= key %>">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">name&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_name" size="30" maxlength="25" value="<%= HTMLEncode((String)x_name) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">email&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_email" size="30" maxlength="100" value="<%= HTMLEncode((String)x_email) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">ruta&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_ruta" size="30" maxlength="100" value="<%= HTMLEncode((String)x_ruta) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">coments&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_coments" cols="35" rows="4"><% if (x_coments!=null) out.print(x_coments); %></textarea>&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="EDIT">
</form>
<%@ include file="footer.jsp" %>
