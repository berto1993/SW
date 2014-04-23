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
	response.sendRedirect("corporativolist.jsp");
	response.flushBuffer();
	return;
}

// Get action
String a = request.getParameter("a");
if (a == null || a.length() == 0) {
	a = "I";	// Display with input box
}

// Get fields from form
Object x_idcorporativo = null;
Object x_p1Titulo = null;
Object x_p1Descripcion = null;
Object x_p2Titulo = null;
Object x_p2Descripcion = null;
Object x_p3Titulo = null;
Object x_p3Descripcion = null;
Object x_p4Titulo = null;
Object x_p4Descripcion = null;
Object x_p5Titulo = null;
Object x_p5Descripcion = null;
Object x_p6Titulo = null;
Object x_p6Descripcion = null;
Object x_p7Titulo = null;
Object x_p7Descripcion = null;
Object x_p8Titulo = null;
Object x_p8Descripcion = null;
Object x_p9Titulo = null;
Object x_p9Descripcion = null;

// Open Connection to the database
try{
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = null;
	if (a.equals("I")){ // Get a record to display
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `corporativo` WHERE `idcorporativo`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("corporativolist.jsp");
			response.flushBuffer();
			return;
		}else{
			rs.first();

			// Get the field contents
	x_idcorporativo = String.valueOf(rs.getLong("idcorporativo"));
			if (rs.getClob("p1Titulo") != null) {
				long length = rs.getClob("p1Titulo").length();
				x_p1Titulo = rs.getClob("p1Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p1Titulo = "";
			}
			if (rs.getClob("p1Descripcion") != null) {
				long length = rs.getClob("p1Descripcion").length();
				x_p1Descripcion = rs.getClob("p1Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p1Descripcion = "";
			}
			if (rs.getClob("p2Titulo") != null) {
				long length = rs.getClob("p2Titulo").length();
				x_p2Titulo = rs.getClob("p2Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p2Titulo = "";
			}
			if (rs.getClob("p2Descripcion") != null) {
				long length = rs.getClob("p2Descripcion").length();
				x_p2Descripcion = rs.getClob("p2Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p2Descripcion = "";
			}
			if (rs.getClob("p3Titulo") != null) {
				long length = rs.getClob("p3Titulo").length();
				x_p3Titulo = rs.getClob("p3Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p3Titulo = "";
			}
			if (rs.getClob("p3Descripcion") != null) {
				long length = rs.getClob("p3Descripcion").length();
				x_p3Descripcion = rs.getClob("p3Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p3Descripcion = "";
			}
			if (rs.getClob("p4Titulo") != null) {
				long length = rs.getClob("p4Titulo").length();
				x_p4Titulo = rs.getClob("p4Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p4Titulo = "";
			}
			if (rs.getClob("p4Descripcion") != null) {
				long length = rs.getClob("p4Descripcion").length();
				x_p4Descripcion = rs.getClob("p4Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p4Descripcion = "";
			}
			if (rs.getClob("p5Titulo") != null) {
				long length = rs.getClob("p5Titulo").length();
				x_p5Titulo = rs.getClob("p5Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p5Titulo = "";
			}
			if (rs.getClob("p5Descripcion") != null) {
				long length = rs.getClob("p5Descripcion").length();
				x_p5Descripcion = rs.getClob("p5Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p5Descripcion = "";
			}
			if (rs.getClob("p6Titulo") != null) {
				long length = rs.getClob("p6Titulo").length();
				x_p6Titulo = rs.getClob("p6Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p6Titulo = "";
			}
			if (rs.getClob("p6Descripcion") != null) {
				long length = rs.getClob("p6Descripcion").length();
				x_p6Descripcion = rs.getClob("p6Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p6Descripcion = "";
			}
			if (rs.getClob("p7Titulo") != null) {
				long length = rs.getClob("p7Titulo").length();
				x_p7Titulo = rs.getClob("p7Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p7Titulo = "";
			}
			if (rs.getClob("p7Descripcion") != null) {
				long length = rs.getClob("p7Descripcion").length();
				x_p7Descripcion = rs.getClob("p7Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p7Descripcion = "";
			}
			if (rs.getClob("p8Titulo") != null) {
				long length = rs.getClob("p8Titulo").length();
				x_p8Titulo = rs.getClob("p8Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p8Titulo = "";
			}
			if (rs.getClob("p8Descripcion") != null) {
				long length = rs.getClob("p8Descripcion").length();
				x_p8Descripcion = rs.getClob("p8Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p8Descripcion = "";
			}
			if (rs.getClob("p9Titulo") != null) {
				long length = rs.getClob("p9Titulo").length();
				x_p9Titulo = rs.getClob("p9Titulo").getSubString((long) 1, (int) length);
			}else{
				x_p9Titulo = "";
			}
			if (rs.getClob("p9Descripcion") != null) {
				long length = rs.getClob("p9Descripcion").length();
				x_p9Descripcion = rs.getClob("p9Descripcion").getSubString((long) 1, (int) length);
			}else{
				x_p9Descripcion = "";
			}
		}
		rs.close();
	}else if (a.equals("U")) {// Update

		// Get fields from form
		if (request.getParameter("x_p1Titulo") != null){
			x_p1Titulo = (String) request.getParameter("x_p1Titulo");
		}else{
			x_p1Titulo = "";
		}
		if (request.getParameter("x_p1Descripcion") != null){
			x_p1Descripcion = (String) request.getParameter("x_p1Descripcion");
		}else{
			x_p1Descripcion = "";
		}
		if (request.getParameter("x_p2Titulo") != null){
			x_p2Titulo = (String) request.getParameter("x_p2Titulo");
		}else{
			x_p2Titulo = "";
		}
		if (request.getParameter("x_p2Descripcion") != null){
			x_p2Descripcion = (String) request.getParameter("x_p2Descripcion");
		}else{
			x_p2Descripcion = "";
		}
		if (request.getParameter("x_p3Titulo") != null){
			x_p3Titulo = (String) request.getParameter("x_p3Titulo");
		}else{
			x_p3Titulo = "";
		}
		if (request.getParameter("x_p3Descripcion") != null){
			x_p3Descripcion = (String) request.getParameter("x_p3Descripcion");
		}else{
			x_p3Descripcion = "";
		}
		if (request.getParameter("x_p4Titulo") != null){
			x_p4Titulo = (String) request.getParameter("x_p4Titulo");
		}else{
			x_p4Titulo = "";
		}
		if (request.getParameter("x_p4Descripcion") != null){
			x_p4Descripcion = (String) request.getParameter("x_p4Descripcion");
		}else{
			x_p4Descripcion = "";
		}
		if (request.getParameter("x_p5Titulo") != null){
			x_p5Titulo = (String) request.getParameter("x_p5Titulo");
		}else{
			x_p5Titulo = "";
		}
		if (request.getParameter("x_p5Descripcion") != null){
			x_p5Descripcion = (String) request.getParameter("x_p5Descripcion");
		}else{
			x_p5Descripcion = "";
		}
		if (request.getParameter("x_p6Titulo") != null){
			x_p6Titulo = (String) request.getParameter("x_p6Titulo");
		}else{
			x_p6Titulo = "";
		}
		if (request.getParameter("x_p6Descripcion") != null){
			x_p6Descripcion = (String) request.getParameter("x_p6Descripcion");
		}else{
			x_p6Descripcion = "";
		}
		if (request.getParameter("x_p7Titulo") != null){
			x_p7Titulo = (String) request.getParameter("x_p7Titulo");
		}else{
			x_p7Titulo = "";
		}
		if (request.getParameter("x_p7Descripcion") != null){
			x_p7Descripcion = (String) request.getParameter("x_p7Descripcion");
		}else{
			x_p7Descripcion = "";
		}
		if (request.getParameter("x_p8Titulo") != null){
			x_p8Titulo = (String) request.getParameter("x_p8Titulo");
		}else{
			x_p8Titulo = "";
		}
		if (request.getParameter("x_p8Descripcion") != null){
			x_p8Descripcion = (String) request.getParameter("x_p8Descripcion");
		}else{
			x_p8Descripcion = "";
		}
		if (request.getParameter("x_p9Titulo") != null){
			x_p9Titulo = (String) request.getParameter("x_p9Titulo");
		}else{
			x_p9Titulo = "";
		}
		if (request.getParameter("x_p9Descripcion") != null){
			x_p9Descripcion = (String) request.getParameter("x_p9Descripcion");
		}else{
			x_p9Descripcion = "";
		}

		// Open record
		String tkey = "" + key.replaceAll("'",escapeString) + "";
		String strsql = "SELECT * FROM `corporativo` WHERE `idcorporativo`=" + tkey;
		rs = stmt.executeQuery(strsql);
		if (!rs.next()) {
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
			out.clear();
			response.sendRedirect("corporativolist.jsp");
			response.flushBuffer();
			return;
		}

		// Field p1Titulo
		tmpfld = ((String) x_p1Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p1Titulo");
		}else{
			rs.updateString("p1Titulo", tmpfld);
		}

		// Field p1Descripcion
		tmpfld = ((String) x_p1Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p1Descripcion");
		}else{
			rs.updateString("p1Descripcion", tmpfld);
		}

		// Field p2Titulo
		tmpfld = ((String) x_p2Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p2Titulo");
		}else{
			rs.updateString("p2Titulo", tmpfld);
		}

		// Field p2Descripcion
		tmpfld = ((String) x_p2Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p2Descripcion");
		}else{
			rs.updateString("p2Descripcion", tmpfld);
		}

		// Field p3Titulo
		tmpfld = ((String) x_p3Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p3Titulo");
		}else{
			rs.updateString("p3Titulo", tmpfld);
		}

		// Field p3Descripcion
		tmpfld = ((String) x_p3Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p3Descripcion");
		}else{
			rs.updateString("p3Descripcion", tmpfld);
		}

		// Field p4Titulo
		tmpfld = ((String) x_p4Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p4Titulo");
		}else{
			rs.updateString("p4Titulo", tmpfld);
		}

		// Field p4Descripcion
		tmpfld = ((String) x_p4Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p4Descripcion");
		}else{
			rs.updateString("p4Descripcion", tmpfld);
		}

		// Field p5Titulo
		tmpfld = ((String) x_p5Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p5Titulo");
		}else{
			rs.updateString("p5Titulo", tmpfld);
		}

		// Field p5Descripcion
		tmpfld = ((String) x_p5Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p5Descripcion");
		}else{
			rs.updateString("p5Descripcion", tmpfld);
		}

		// Field p6Titulo
		tmpfld = ((String) x_p6Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p6Titulo");
		}else{
			rs.updateString("p6Titulo", tmpfld);
		}

		// Field p6Descripcion
		tmpfld = ((String) x_p6Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p6Descripcion");
		}else{
			rs.updateString("p6Descripcion", tmpfld);
		}

		// Field p7Titulo
		tmpfld = ((String) x_p7Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p7Titulo");
		}else{
			rs.updateString("p7Titulo", tmpfld);
		}

		// Field p7Descripcion
		tmpfld = ((String) x_p7Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p7Descripcion");
		}else{
			rs.updateString("p7Descripcion", tmpfld);
		}

		// Field p8Titulo
		tmpfld = ((String) x_p8Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p8Titulo");
		}else{
			rs.updateString("p8Titulo", tmpfld);
		}

		// Field p8Descripcion
		tmpfld = ((String) x_p8Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p8Descripcion");
		}else{
			rs.updateString("p8Descripcion", tmpfld);
		}

		// Field p9Titulo
		tmpfld = ((String) x_p9Titulo);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p9Titulo");
		}else{
			rs.updateString("p9Titulo", tmpfld);
		}

		// Field p9Descripcion
		tmpfld = ((String) x_p9Descripcion);
		if (tmpfld == null || tmpfld.trim().length() == 0) {
			tmpfld = null;
		}
		if (tmpfld == null) {
			rs.updateNull("p9Descripcion");
		}else{
			rs.updateString("p9Descripcion", tmpfld);
		}
		rs.updateRow();
		rs.close();
		rs = null;
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
		response.sendRedirect("corporativolist.jsp");
		response.flushBuffer();
		return;
	}
}catch (SQLException ex){
		out.println(ex.toString());
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Edit TABLE: corporativo<br><br><a href="corporativolist.jsp">Back to List</a></span></p>
<script language="JavaScript" src="ew.js"></script>
<script language="JavaScript">
<!-- start Javascript
function  EW_checkMyForm(EW_this) {
if (EW_this.x_p1Titulo && !EW_hasValue(EW_this.x_p1Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p1Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p1Descripcion && !EW_hasValue(EW_this.x_p1Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p1Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p2Titulo && !EW_hasValue(EW_this.x_p2Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p2Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p2Descripcion && !EW_hasValue(EW_this.x_p2Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p2Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p3Titulo && !EW_hasValue(EW_this.x_p3Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p3Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p3Descripcion && !EW_hasValue(EW_this.x_p3Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p3Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p4Titulo && !EW_hasValue(EW_this.x_p4Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p4Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p4Descripcion && !EW_hasValue(EW_this.x_p4Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p4Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p5Titulo && !EW_hasValue(EW_this.x_p5Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p5Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p5Descripcion && !EW_hasValue(EW_this.x_p5Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p5Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p6Titulo && !EW_hasValue(EW_this.x_p6Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p6Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p6Descripcion && !EW_hasValue(EW_this.x_p6Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p6Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p7Titulo && !EW_hasValue(EW_this.x_p7Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p7Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p7Descripcion && !EW_hasValue(EW_this.x_p7Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p7Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p8Titulo && !EW_hasValue(EW_this.x_p8Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p8Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p8Descripcion && !EW_hasValue(EW_this.x_p8Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p8Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p9Titulo && !EW_hasValue(EW_this.x_p9Titulo, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p9Titulo, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
if (EW_this.x_p9Descripcion && !EW_hasValue(EW_this.x_p9Descripcion, "TEXTAREA" )) {
            if (!EW_onError(EW_this, EW_this.x_p9Descripcion, "TEXTAREA", "Campo obligatorio"))
                return false; 
        }
return true;
}

// end JavaScript -->
</script>
<form onSubmit="return EW_checkMyForm(this);"  name="corporativoedit" action="corporativoedit.jsp" method="post">
<p>
<input type="hidden" name="a" value="U">
<input type="hidden" name="key" value="<%= key %>">
<table class="ewTable">
	<tr>
		<td class="ewTableHeader">idcorporativo&nbsp;</td>
		<td class="ewTableAltRow"><% out.print(x_idcorporativo); %>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 1Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p1Titulo" cols="70" rows="2"><% if (x_p1Titulo!=null) out.print(x_p1Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 1Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p1Descripcion" cols="70" rows="4"><% if (x_p1Descripcion!=null) out.print(x_p1Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 2Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p2Titulo" cols="70" rows="2"><% if (x_p2Titulo!=null) out.print(x_p2Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 2Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p2Descripcion" cols="70" rows="4"><% if (x_p2Descripcion!=null) out.print(x_p2Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 3Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p3Titulo" cols="70" rows="2"><% if (x_p3Titulo!=null) out.print(x_p3Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 3Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p3Descripcion" cols="70" rows="4"><% if (x_p3Descripcion!=null) out.print(x_p3Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 4Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p4Titulo" cols="70" rows="2"><% if (x_p4Titulo!=null) out.print(x_p4Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 4Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p4Descripcion" cols="70" rows="4"><% if (x_p4Descripcion!=null) out.print(x_p4Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 5Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p5Titulo" cols="70" rows="2"><% if (x_p5Titulo!=null) out.print(x_p5Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 5Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p5Descripcion" cols="70" rows="4"><% if (x_p5Descripcion!=null) out.print(x_p5Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 6Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p6Titulo" cols="70" rows="2"><% if (x_p6Titulo!=null) out.print(x_p6Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 6Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p6Descripcion" cols="70" rows="4"><% if (x_p6Descripcion!=null) out.print(x_p6Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 7Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p7Titulo" cols="70" rows="2"><% if (x_p7Titulo!=null) out.print(x_p7Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 7Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p7Descripcion" cols="70" rows="4"><% if (x_p7Descripcion!=null) out.print(x_p7Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 8Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p8Titulo" cols="70" rows="2"><% if (x_p8Titulo!=null) out.print(x_p8Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 8Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p8Descripcion" cols="70" rows="4"><% if (x_p8Descripcion!=null) out.print(x_p8Descripcion); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 9Titulo&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p9Titulo" cols="70" rows="2"><% if (x_p9Titulo!=null) out.print(x_p9Titulo); %></textarea>&nbsp;</td>
	</tr>
	<tr>
		<td class="ewTableHeader">p 9Descripcion&nbsp;</td>
		<td class="ewTableAltRow"><textarea name="x_p9Descripcion" cols="70" rows="4"><% if (x_p9Descripcion!=null) out.print(x_p9Descripcion); %></textarea>&nbsp;</td>
	</tr>
</table>
<p>
<input type="submit" name="Action" value="EDIT">
</form>
<%@ include file="footer.jsp" %>
