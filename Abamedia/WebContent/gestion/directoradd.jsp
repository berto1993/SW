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
Object x_id_di = null;
Object x_nombred = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("C")){ // Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `director` WHERE `id_di`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()){
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("directorlist.jsp");
			response.flushBuffer();
			return;
		}
		rs.first();

			// Get the field contents
	if (rs.getString("nombred") != null){
		x_nombred = rs.getString("nombred");
	}else{
		x_nombred = "";
	}
		rs.close();
		rs = null;
	}else if (a.equals("A")) { // Add

		// Get fields from form
		if (request.getParameter("x_nombred") != null){
			x_nombred = (String) request.getParameter("x_nombred");
		}else{
			x_nombred = "";
		}

		// Open record
		String strsql = "SELECT * FROM `director` WHERE 0 = 1";
		rs = stmt.executeQuery(strsql);
		rs.moveToInsertRow();

		// Field nombred
		tmpfld = ((String) x_nombred);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("nombred");
		}else{
			rs.updateString("nombred", tmpfld);
		}
		rs.insertRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		out.clear();
		response.sendRedirect("directorlist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
	out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Add to TABLE: director<br><br><a href="directorlist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_nombred && !EW_hasValue(EW_this.x_nombred, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_nombred, "TEXT", "Campo Obligatorio"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  action="directoradd.jsp" method="post">
<p>
<input type="hidden" name="a" value="A">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">nombred&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_nombred" size="30" maxlength="50" value="<%= HTMLEncode((String)x_nombred) %>">&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="ADD">
</form>
<%@ include file="footer.jsp" %>
