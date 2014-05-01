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
if (key == null || key.length() == 0) { response.sendRedirect("repartolist.jsp");}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}
String x_id_pro = "";
String x_id_actor = "";
String x_nombrepersonaje = "";

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")) {// Get a record to display
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `reparto` WHERE `nombrepersonaje`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			out.clear();
			response.sendRedirect("repartolist.jsp");
		}else{
			rs.first();
		}

		// Get field values
		// id_pro

		x_id_pro = String.valueOf(rs.getLong("id_pro"));

		// id_actor
		x_id_actor = String.valueOf(rs.getLong("id_actor"));

		// nombrepersonaje
		if (rs.getString("nombrepersonaje") != null){
			x_nombrepersonaje = rs.getString("nombrepersonaje");
		}else{
			x_nombrepersonaje = "";
		}
	}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">View TABLE: reparto<br><br><a href="repartolist.jsp">Back to List</a></span></p>
<p>
<form>
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">id pro&nbsp;</td>
		<td class="ewTableAltRow"><%
if (x_id_pro!=null && ((String)x_id_pro).length() > 0) {
	String sqlwrk_where = "";
	sqlwrk_where = "`id_pro` = " + x_id_pro;
	String sqlwrk = "SELECT DISTINCT `id_pro`, `titulo` FROM `produccion`";
	if (sqlwrk_where.length() > 0) {
	sqlwrk += " WHERE " + sqlwrk_where;
	}
	Statement stmtwrk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rswrk = stmtwrk.executeQuery(sqlwrk);
	if (rswrk.next()) {
		out.print(rswrk.getString("titulo"));
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
		<td class="ewTableHeader">id actor&nbsp;</td>
		<td class="ewTableAltRow"><%
if (x_id_actor!=null && ((String)x_id_actor).length() > 0) {
	String sqlwrk_where = "";
	sqlwrk_where = "`id_actor` = " + x_id_actor;
	String sqlwrk = "SELECT DISTINCT `id_actor`, `nombrea` FROM `actor`";
	if (sqlwrk_where.length() > 0) {
	sqlwrk += " WHERE " + sqlwrk_where;
	}
	Statement stmtwrk = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rswrk = stmtwrk.executeQuery(sqlwrk);
	if (rswrk.next()) {
		out.print(rswrk.getString("nombrea"));
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
		<td class="ewTableHeader">nombrepersonaje&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_nombrepersonaje); %>&nbsp;</td>
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
