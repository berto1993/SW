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
	response.sendRedirect("produccionlist.jsp");
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
Object x_titulo = null;
Object x_sinopsis = null;
Object x_trailer = null;
Object x_fecha = null;
Object x_id_di = null;
Object x_id_tipo = null;
Object x_id_genero = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")){ // Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `produccion` WHERE `id_pro`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("produccionlist.jsp");
			response.flushBuffer();
			return;
		}else{
			rs.first();

			// Get the field contents
	x_id_pro = String.valueOf(rs.getLong("id_pro"));
			if (rs.getClob("titulo") != null) {
				long length = rs.getClob("titulo").length();
				x_titulo = rs.getClob("titulo").getSubString((long) 1, (int) length);
			}else{
				x_titulo = "";
			}
			if (rs.getClob("sinopsis") != null) {
				long length = rs.getClob("sinopsis").length();
				x_sinopsis = rs.getClob("sinopsis").getSubString((long) 1, (int) length);
			}else{
				x_sinopsis = "";
			}
			if (rs.getClob("trailer") != null) {
				long length = rs.getClob("trailer").length();
				x_trailer = rs.getClob("trailer").getSubString((long) 1, (int) length);
			}else{
				x_trailer = "";
			}
			if (rs.getString("fecha") != null){
				x_fecha = rs.getString("fecha");
			}else{
				x_fecha = "";
			}
	x_id_di = String.valueOf(rs.getLong("id_di"));
	x_id_tipo = String.valueOf(rs.getLong("id_tipo"));
	x_id_genero = String.valueOf(rs.getLong("id_genero"));
		}
		rs.close();
	}else if (a.equals("U")) {// Update

		// Get fields from form
		if (request.getParameter("x_id_pro") != null){
			x_id_pro = (String) request.getParameter("x_id_pro");
		}else{
			x_id_pro = "";
		}
		if (request.getParameter("x_titulo") != null){
			x_titulo = (String) request.getParameter("x_titulo");
		}else{
			x_titulo = "";
		}
		if (request.getParameter("x_sinopsis") != null){
			x_sinopsis = (String) request.getParameter("x_sinopsis");
		}else{
			x_sinopsis = "";
		}
		if (request.getParameter("x_trailer") != null){
			x_trailer = (String) request.getParameter("x_trailer");
		}else{
			x_trailer = "";
		}
		if (request.getParameter("x_fecha") != null){
			x_fecha = (String) request.getParameter("x_fecha");
		}else{
			x_fecha = "";
		}
		if (request.getParameter("x_id_di") != null){
			x_id_di = request.getParameter("x_id_di");
		}
		if (request.getParameter("x_id_tipo") != null){
			x_id_tipo = request.getParameter("x_id_tipo");
		}
		if (request.getParameter("x_id_genero") != null){
			x_id_genero = request.getParameter("x_id_genero");
		}

		// Open record
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `produccion` WHERE `id_pro`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("produccionlist.jsp");
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

		// Field titulo
		tmpfld = ((String) x_titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("titulo");
		}else{
			rs.updateString("titulo", tmpfld);
		}

		// Field sinopsis
		tmpfld = ((String) x_sinopsis);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("sinopsis");
		}else{
			rs.updateString("sinopsis", tmpfld);
		}

		// Field trailer
		tmpfld = ((String) x_trailer);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("trailer");
		}else{
			rs.updateString("trailer", tmpfld);
		}

		// Field fecha
		tmpfld = ((String) x_fecha);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("fecha");
		}else{
			rs.updateString("fecha", tmpfld);
		}

		// Field id_di
		tmpfld = ((String) x_id_di).trim();
		if (!IsNumeric(tmpfld)) { tmpfld = null;}
		if (tmpfld == null) {
			rs.updateNull("id_di");
		} else {
			rs.updateInt("id_di",Integer.parseInt(tmpfld));
		}

		// Field id_tipo
		tmpfld = ((String) x_id_tipo).trim();
		if (!IsNumeric(tmpfld)) { tmpfld = null;}
		if (tmpfld == null) {
			rs.updateNull("id_tipo");
		} else {
			rs.updateInt("id_tipo",Integer.parseInt(tmpfld));
		}

		// Field id_genero
		tmpfld = ((String) x_id_genero).trim();
		if (!IsNumeric(tmpfld)) { tmpfld = null;}
		if (tmpfld == null) {
			rs.updateNull("id_genero");
		} else {
			rs.updateInt("id_genero",Integer.parseInt(tmpfld));
		}
		rs.updateRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("produccionlist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
		out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Edit TABLE: produccion<br><br><a href="produccionlist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript" src="popcalendar.js"></script>
<script language="JavaScript">
<!-- start Javascript
_editor_url = "";                     // URL to htmlarea files
var win_ie_ver = parseFloat(navigator.appVersion.split("MSIE")[1]);
if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }
if (win_ie_ver >= 5.5) {
  document.write('<scr' + 'ipt src="' +_editor_url+ 'editor.js" language="Javascript"></scr' + 'ipt>');
} else { document.write('<scr'+'ipt>function editor_generate() { return false; }</scr'+'ipt>'); }

// end JavaScript -->
</script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_id_pro && !EW_hasValue(EW_this.x_id_pro, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_pro, "TEXT", "Incorrect integer - id pro"))
                return false; 
        }
if (EW_this.x_id_pro && !EW_checkinteger(EW_this.x_id_pro.value)) {
        if (!EW_onError(EW_this, EW_this.x_id_pro, "TEXT", "Incorrect integer - id pro"))
            return false; 
        }
if (EW_this.x_titulo && !EW_hasValue(EW_this.x_titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_titulo, "TEXTAREA", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_sinopsis && !EW_hasValue(EW_this.x_sinopsis, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_sinopsis, "TEXTAREA", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_trailer && !EW_hasValue(EW_this.x_trailer, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_trailer, "TEXTAREA", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_fecha && !EW_hasValue(EW_this.x_fecha, "TEXT" )) {
            if (!EW_onError(EW_this, EW_this.x_fecha, "TEXT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_id_di && !EW_hasValue(EW_this.x_id_di, "SELECT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_di, "SELECT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_id_tipo && !EW_hasValue(EW_this.x_id_tipo, "SELECT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_tipo, "SELECT", "Campo Obligatorio"))
                return false; 
        }
if (EW_this.x_id_genero && !EW_hasValue(EW_this.x_id_genero, "SELECT" )) {
            if (!EW_onError(EW_this, EW_this.x_id_genero, "SELECT", "Campo Obligatorio"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  name="produccionedit" action="produccionedit.jsp" method="post">
<p>
<input type="hidden" name="a" value="U">
<input type="hidden" name="key" value="<%= key %>">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">id pro&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_id_pro" size="30" value="<%= HTMLEncode((String)x_id_pro) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_titulo" cols="70" rows="2"><% if (x_titulo!=null) out.print(x_titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">sinopsis&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_sinopsis" cols="70" rows="4"><% if (x_sinopsis!=null) out.print(x_sinopsis); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">trailer&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_trailer" cols="70" rows="1"><% if (x_trailer!=null) out.print(x_trailer); %></textarea><script language="JavaScript1.2">editor_generate('x_trailer');</script>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">fecha&nbsp;</td>
		<td class="ewTableAltRow"><input type="text" name="x_fecha" size="10" maxlength="1" value="<%= HTMLEncode((String)x_fecha) %>">&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id di&nbsp;</td>
		<td class="ewTableAltRow"><%
String cbo_x_id_di_js = "";
String x_id_diList = "<select name=\"x_id_di\"><option value=\"\">Please Select</option>";
String sqlwrk_x_id_di = "SELECT DISTINCT `id_di`, `nombred` FROM `director`";
Statement stmtwrk_x_id_di = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rswrk_x_id_di = stmtwrk_x_id_di.executeQuery(sqlwrk_x_id_di);
	int rowcntwrk_x_id_di = 0;
	while (rswrk_x_id_di.next()) {
		x_id_diList += "<option value=\"" + HTMLEncode(rswrk_x_id_di.getString("id_di")) + "\"";
		if (rswrk_x_id_di.getString("id_di").equals(x_id_di)) {
			x_id_diList += " selected";
		}
		String tmpValue_x_id_di = "";
		if (rswrk_x_id_di.getString("nombred")!= null) tmpValue_x_id_di = rswrk_x_id_di.getString("nombred");
		x_id_diList += ">" + tmpValue_x_id_di
 + "</option>";
		rowcntwrk_x_id_di++;
	}
rswrk_x_id_di.close();
rswrk_x_id_di = null;
stmtwrk_x_id_di.close();
stmtwrk_x_id_di = null;
x_id_diList += "</select>";
out.println(x_id_diList);
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id tipo&nbsp;</td>
		<td class="ewTableAltRow"><%
String cbo_x_id_tipo_js = "";
String x_id_tipoList = "<select name=\"x_id_tipo\"><option value=\"\">Please Select</option>";
String sqlwrk_x_id_tipo = "SELECT DISTINCT `id_tipo`, `nombre` FROM `tipo`";
Statement stmtwrk_x_id_tipo = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rswrk_x_id_tipo = stmtwrk_x_id_tipo.executeQuery(sqlwrk_x_id_tipo);
	int rowcntwrk_x_id_tipo = 0;
	while (rswrk_x_id_tipo.next()) {
		x_id_tipoList += "<option value=\"" + HTMLEncode(rswrk_x_id_tipo.getString("id_tipo")) + "\"";
		if (rswrk_x_id_tipo.getString("id_tipo").equals(x_id_tipo)) {
			x_id_tipoList += " selected";
		}
		String tmpValue_x_id_tipo = "";
		if (rswrk_x_id_tipo.getString("nombre")!= null) tmpValue_x_id_tipo = rswrk_x_id_tipo.getString("nombre");
		x_id_tipoList += ">" + tmpValue_x_id_tipo
 + "</option>";
		rowcntwrk_x_id_tipo++;
	}
rswrk_x_id_tipo.close();
rswrk_x_id_tipo = null;
stmtwrk_x_id_tipo.close();
stmtwrk_x_id_tipo = null;
x_id_tipoList += "</select>";
out.println(x_id_tipoList);
%>
&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">id genero&nbsp;</td>
		<td class="ewTableAltRow"><%
String cbo_x_id_genero_js = "";
String x_id_generoList = "<select name=\"x_id_genero\"><option value=\"\">Please Select</option>";
String sqlwrk_x_id_genero = "SELECT DISTINCT `id_genero`, `nombreg` FROM `genero`";
Statement stmtwrk_x_id_genero = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rswrk_x_id_genero = stmtwrk_x_id_genero.executeQuery(sqlwrk_x_id_genero);
	int rowcntwrk_x_id_genero = 0;
	while (rswrk_x_id_genero.next()) {
		x_id_generoList += "<option value=\"" + HTMLEncode(rswrk_x_id_genero.getString("id_genero")) + "\"";
		if (rswrk_x_id_genero.getString("id_genero").equals(x_id_genero)) {
			x_id_generoList += " selected";
		}
		String tmpValue_x_id_genero = "";
		if (rswrk_x_id_genero.getString("nombreg")!= null) tmpValue_x_id_genero = rswrk_x_id_genero.getString("nombreg");
		x_id_generoList += ">" + tmpValue_x_id_genero
 + "</option>";
		rowcntwrk_x_id_genero++;
	}
rswrk_x_id_genero.close();
rswrk_x_id_genero = null;
stmtwrk_x_id_genero.close();
stmtwrk_x_id_genero = null;
x_id_generoList += "</select>";
out.println(x_id_generoList);
%>
&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="EDIT">
</form>
<%@ include file="footer.jsp" %>
