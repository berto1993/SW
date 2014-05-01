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
	response.sendRedirect("repartolist.jsp");
	response.flushBuffer();
	return;
}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}

// Get fields from form
Object x_id_pro = null;
Object x_id_actor = null;
Object x_nombrepersonaje = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")){ // Get a record to display
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `reparto` WHERE `nombrepersonaje`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("repartolist.jsp");
			response.flushBuffer();
			return;
		}else{
			rs.first();

			// Get the field contents
	x_id_pro = String.valueOf(rs.getLong("id_pro"));
	x_id_actor = String.valueOf(rs.getLong("id_actor"));
			if (rs.getString("nombrepersonaje") != null){
				x_nombrepersonaje = rs.getString("nombrepersonaje");
			}else{
				x_nombrepersonaje = "";
			}
		}
		rs.close();
	}else if (a.equals("U")) {// Update

		// Get fields from form
		if (request.getParameter("x_id_pro") != null){
			x_id_pro = request.getParameter("x_id_pro");
		}
		if (request.getParameter("x_id_actor") != null){
			x_id_actor = request.getParameter("x_id_actor");
		}
		if (request.getParameter("x_nombrepersonaje") != null){
			x_nombrepersonaje = (String) request.getParameter("x_nombrepersonaje");
		}else{
			x_nombrepersonaje = "";
		}

		// Open record
		String tkey = "'" + key.replaceAll("'",escapeString) + "'";
		String strsql = "SELECT * FROM `reparto` WHERE `nombrepersonaje`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("repartolist.jsp");
			response.flushBuffer();
			return;
		}

		// Field id_pro
		tmpfld = ((String) x_id_pro).trim();
		if (!IsNumeric(tmpfld)) { tmpfld = "0";}
		if (tmpfld == null) {
			rs.updateNull("id_pro");
		} else {
			rs.updateInt("id_pro",Integer.parseInt(tmpfld));
		}

		// Field id_actor
		tmpfld = ((String) x_id_actor).trim();
		if (!IsNumeric(tmpfld)) { tmpfld = "0";}
		if (tmpfld == null) {
			rs.updateNull("id_actor");
		} else {
			rs.updateInt("id_actor",Integer.parseInt(tmpfld));
		}

		// Field nombrepersonaje
		tmpfld = ((String) x_nombrepersonaje);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("nombrepersonaje");
		}else{
			rs.updateString("nombrepersonaje", tmpfld);
		}
		rs.updateRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("repartolist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
		out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Edit TABLE: reparto<br><br><a href="repartolist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_id_pro && !EW_hasValue(EW_this.x_id_pro, "SELECT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_pro, "SELECT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_id_actor && !EW_hasValue(EW_this.x_id_actor, "SELECT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_actor, "SELECT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_nombrepersonaje && !EW_hasValue(EW_this.x_nombrepersonaje, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_nombrepersonaje, "TEXT", "Campo Obligatorio"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  name="repartoedit" action="repartoedit.jsp" method="post">
<p>
<input type="hidden" name="a" value="U">
<input type="hidden" name="key" value="<%= key %>">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">id pro&nbsp;</td>
		<td class="ewTableAltRow"><%
String cbo_x_id_pro_js = "";
String x_id_proList = "<select name=\"x_id_pro\"><option value=\"\">Please Select</option>";
String sqlwrk_x_id_pro = "SELECT DISTINCT `id_pro`, `titulo` FROM `produccion`";
Statement stmtwrk_x_id_pro = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rswrk_x_id_pro = stmtwrk_x_id_pro.executeQuery(sqlwrk_x_id_pro);
	int rowcntwrk_x_id_pro = 0;
	while (rswrk_x_id_pro.next()) {
		x_id_proList += "<option value=\"" + HTMLEncode(rswrk_x_id_pro.getString("id_pro")) + "\"";
		if (rswrk_x_id_pro.getString("id_pro").equals(x_id_pro)) {
			x_id_proList += " selected";
		}
		String tmpValue_x_id_pro = "";
		if (rswrk_x_id_pro.getString("titulo")!= null) tmpValue_x_id_pro = rswrk_x_id_pro.getString("titulo");
		x_id_proList += ">" + tmpValue_x_id_pro
 + "</option>";
		rowcntwrk_x_id_pro++;
	}
rswrk_x_id_pro.close();
rswrk_x_id_pro = null;
stmtwrk_x_id_pro.close();
stmtwrk_x_id_pro = null;
x_id_proList += "</select>";
out.println(x_id_proList);
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id actor&nbsp;</td>
		<td class="ewTableAltRow"><%
String cbo_x_id_actor_js = "";
String x_id_actorList = "<select name=\"x_id_actor\"><option value=\"\">Please Select</option>";
String sqlwrk_x_id_actor = "SELECT DISTINCT `id_actor`, `nombrea` FROM `actor`";
Statement stmtwrk_x_id_actor = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rswrk_x_id_actor = stmtwrk_x_id_actor.executeQuery(sqlwrk_x_id_actor);
	int rowcntwrk_x_id_actor = 0;
	while (rswrk_x_id_actor.next()) {
		x_id_actorList += "<option value=\"" + HTMLEncode(rswrk_x_id_actor.getString("id_actor")) + "\"";
		if (rswrk_x_id_actor.getString("id_actor").equals(x_id_actor)) {
			x_id_actorList += " selected";
		}
		String tmpValue_x_id_actor = "";
		if (rswrk_x_id_actor.getString("nombrea")!= null) tmpValue_x_id_actor = rswrk_x_id_actor.getString("nombrea");
		x_id_actorList += ">" + tmpValue_x_id_actor
 + "</option>";
		rowcntwrk_x_id_actor++;
	}
rswrk_x_id_actor.close();
rswrk_x_id_actor = null;
stmtwrk_x_id_actor.close();
stmtwrk_x_id_actor = null;
x_id_actorList += "</select>";
out.println(x_id_actorList);
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">nombrepersonaje&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_nombrepersonaje" size="30" maxlength="50" value="<%= HTMLEncode((String)x_nombrepersonaje) %>">&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="EDIT">
</form>
<%@ include file="footer.jsp" %>
