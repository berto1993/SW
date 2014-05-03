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
int displayRecs = 20;
int recRange = 10;
%>
<%
String tmpfld = null;
String escapeString = "\\\\'";
String dbwhere = "";
String masterdetailwhere = "";
String searchwhere = "";
String a_search = "";
String b_search = "";
String whereClause = "";
int startRec = 0, stopRec = 0, totalRecs = 0, recCount = 0;
%>
<%

// Get clear search cmd
startRec = 0;
if (request.getParameter("cmd") != null && request.getParameter("cmd").length() > 0) {
	String cmd = request.getParameter("cmd");
	if (cmd.toUpperCase().equals("RESET")) {
		searchwhere = ""; // Reset search criteria
		session.setAttribute("corporativo_searchwhere", searchwhere);
	}else if (cmd.toUpperCase().equals("RESETALL")) {
		searchwhere = ""; // Reset search criteria
		session.setAttribute("corporativo_searchwhere", searchwhere);
	}
	startRec = 1; // Reset start record counter (reset command)
	session.setAttribute("corporativo_REC", new Integer(startRec));
}

// Build dbwhere
if (masterdetailwhere != null && masterdetailwhere.length() > 0) {
	dbwhere = dbwhere + "(" + masterdetailwhere + ") AND ";
}
if (searchwhere != null && searchwhere.length() > 0) {
	dbwhere = dbwhere + "(" + searchwhere + ") AND ";
}
if (dbwhere != null && dbwhere.length() > 5) {
	dbwhere = dbwhere.substring(0, dbwhere.length()-5); // Trim rightmost AND
}
%>
<%

// Load Default Order
String DefaultOrder = "";
String DefaultOrderType = "";

// No Default Filter
String DefaultFilter = "";

// Check for an Order parameter
String OrderBy = request.getParameter("order");
if (OrderBy != null && OrderBy.length() > 0) {
	if (session.getAttribute("corporativo_OB") != null &&
		((String) session.getAttribute("corporativo_OB")).equals(OrderBy)) { // Check if an ASC/DESC toggle is required
		if (((String) session.getAttribute("corporativo_OT")).equals("ASC")) {
			session.setAttribute("corporativo_OT", "DESC");
		}else{
			session.setAttribute("corporativo_OT", "ASC");
		}
	}else{
		session.setAttribute("corporativo_OT", "ASC");
	}
	session.setAttribute("corporativo_OB", OrderBy);
	session.setAttribute("corporativo_REC", new Integer(1));
}else{
	OrderBy = (String) session.getAttribute("corporativo_OB");
	if (OrderBy == null || OrderBy.length() == 0) {
		OrderBy = DefaultOrder;
		session.setAttribute("corporativo_OB", OrderBy);
		session.setAttribute("corporativo_OT", DefaultOrderType);
	}
}

// Open Connection to the database
try{
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs = null;

// Build SQL
String strsql = "SELECT * FROM `corporativo`";
whereClause = "";
if (DefaultFilter.length() > 0) {
	whereClause = whereClause + "(" + DefaultFilter + ") AND ";
}
if (dbwhere.length() > 0) {
	whereClause = whereClause + "(" + dbwhere + ") AND ";
}
if (whereClause.length() > 5 && whereClause.substring(whereClause.length()-5, whereClause.length()).equals(" AND ")) {
	whereClause = whereClause.substring(0, whereClause.length()-5);
}
if (whereClause.length() > 0) {
	strsql = strsql + " WHERE " + whereClause;
}
if (OrderBy != null && OrderBy.length() > 0) {
	strsql = strsql + " ORDER BY `" + OrderBy + "` " + (String) session.getAttribute("corporativo_OT");
}

//out.println(strsql);
rs = stmt.executeQuery(strsql);
rs.last();
totalRecs = rs.getRow();
rs.beforeFirst();
startRec = 0;
int pageno = 0;

// Check for a START parameter
if (request.getParameter("start") != null && Integer.parseInt(request.getParameter("start")) > 0) {
	startRec = Integer.parseInt(request.getParameter("start"));
	session.setAttribute("corporativo_REC", new Integer(startRec));
}else if (request.getParameter("pageno") != null && Integer.parseInt(request.getParameter("pageno")) > 0) {
	pageno = Integer.parseInt(request.getParameter("pageno"));
	if (IsNumeric(request.getParameter("pageno"))) {
		startRec = (pageno-1)*displayRecs+1;
		if (startRec <= 0) {
			startRec = 1;
		}else if (startRec >= ((totalRecs-1)/displayRecs)*displayRecs+1) {
			startRec =  ((totalRecs-1)/displayRecs)*displayRecs+1;
		}
		session.setAttribute("corporativo_REC", new Integer(startRec));
	}else {
		startRec = ((Integer) session.getAttribute("corporativo_REC")).intValue();
		if (startRec <= 0) {
			startRec = 1; // Reset start record counter
			session.setAttribute("corporativo_REC", new Integer(startRec));
		}
	}
}else{
	if (session.getAttribute("corporativo_REC") != null)
		startRec = ((Integer) session.getAttribute("corporativo_REC")).intValue();
	if (startRec==0) {
		startRec = 1; //Reset start record counter
		session.setAttribute("corporativo_REC", new Integer(startRec));
	}
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">Tabla: corporativo</span></p>
<table border="0" cellspacing="0" cellpadding="4">
	<tr>
		<td><span class="jspmaker"><a href="corporativoadd.jsp">Add</a></span></td>
	</tr>
</table>
<p>
<span class="jspmaker">
<%
boolean isPrev, rsEof, isMore;

// Display page numbers
if (totalRecs > 0) {
	rsEof = (totalRecs < (startRec + displayRecs));

	// Find out if there should be Backward or Forward Buttons on the table.
	if 	(startRec == 1) {
		isPrev = false;
	}else{
		isPrev = true;
		int PrevStart = startRec - displayRecs;
		if (PrevStart < 1) { PrevStart = 1; } %>
	<a href="corporativolist.jsp?start=<%=PrevStart%>"><b>Prev</b></a>
	<%
	}
	if (isPrev || (!rsEof)) {
		int x = 1;
		int y = 1;
		int dx2,dy2;
		int dx1 = ((startRec-1)/(displayRecs*recRange))*displayRecs*recRange+1;
		int dy1 = ((startRec-1)/(displayRecs*recRange))*recRange+1;
		if ((dx1+displayRecs*recRange-1) > totalRecs) {
			dx2 = (totalRecs/displayRecs)*displayRecs+1;
			dy2 = (totalRecs/displayRecs)+1;
		}else{
			dx2 = dx1+displayRecs*recRange-1;
			dy2 = dy1+recRange-1;
		}
		while (x <= totalRecs) {
			if (x >= dx1 && x <= dx2) {
				if (startRec == x) { %>
	<b><%=y%></b>
				<%	}else{ %>
	<a href="corporativolist.jsp?start=<%=x%>"><b><%=y%></b></a>
				<%	}
				x += displayRecs;
				y ++;
			}else if (x >= (dx1-displayRecs*recRange) && x <= (dx2+displayRecs*recRange)) {
				if ((x+recRange*displayRecs) < totalRecs) { %>
	<a href="corporativolist.jsp?start=<%=x%>"><b><%=y%>-<%=y+recRange-1%></b></a>
				<% }else{
					int ny= (totalRecs-1)/displayRecs+1;
					if (ny == y) { %>
	<a href="corporativolist.jsp?start=<%=x%>"><b><%=y%></b></a>
					<% }else{ %>
	<a href="corporativolist.jsp?start=<%=x%>"><b><%=y%>-<%=ny%></b></a>
					<% }
				}
				x+=recRange*displayRecs;
				y+=recRange;
			}else{
				x+=recRange*displayRecs;
				y+=recRange;
			}
		}
	}

	// Next link
	if (!rsEof) {
		int NextStart = startRec + displayRecs;
		isMore = true; %>
	<a href="corporativolist.jsp?start=<%=NextStart%>"><b>Next</b></a>
	<% }else{
		isMore = false;
	} %>
	<br>
	<% if (startRec > totalRecs) { startRec = totalRecs;}
	stopRec = startRec + displayRecs - 1;
	recCount = totalRecs - 1;
	if (rsEof) { recCount = totalRecs;}
	if (stopRec > recCount) { stopRec = recCount;} %>
	Records <%= startRec %> to <%= stopRec %> of <%= totalRecs %>
<% }else{ %>
	No records found
<% } %>
<br>
</span>
<form method="post">
<table class="ewTable">
	<tr class="ewTableHeader">
		<td>
<a href="corporativolist.jsp?order=<%= java.net.URLEncoder.encode("idcorporativo","UTF-8") %>">idcorporativo&nbsp;<% if (OrderBy != null && OrderBy.equals("idcorporativo")) { %><span class="ewTableOrderIndicator"><% if (((String) session.getAttribute("corporativo_OT")).equals("ASC")) { %>5<% }else if (((String) session.getAttribute("corporativo_OT")).equals("DESC")) { %>6<% } %></span><% } %></a>
		</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<%

// Avoid starting record > total records
if (startRec > totalRecs) {
	startRec = totalRecs;
}

// Set the last record to display
stopRec = startRec + displayRecs - 1;

// Move to first record directly for performance reason
recCount = startRec - 1;
if (rs.next()) {
	rs.first();
	rs.relative(startRec - 1);
}
long recActual = 0;
if (startRec == 1)
   rs.beforeFirst();
else
   rs.previous();
while (rs.next() && recCount < stopRec) {
	recCount++;
	if (recCount >= startRec) {
		recActual++;
%>
<%
	String rowclass = "ewTableRow"; // Set row color
%>
<%
	if (recCount%2 != 0) { // Display alternate color for rows
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

	// Load Key for record
	String key = "";
	key = String.valueOf(rs.getLong("idcorporativo"));

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
		<td><% out.print(x_idcorporativo); %>&nbsp;</td>
<td><span class="jspmaker"><a href="<% key =  rs.getString("idcorporativo"); 
if (key != null && key.length() > 0) { 
	out.print("corporativoview.jsp?key=" + java.net.URLEncoder.encode(key,"UTF-8"));
}else{
	out.print("javascript:alert('Invalid Record! Key is null');");
} %>">View</a></span></td>
<td><span class="jspmaker"><a href="<% key =  rs.getString("idcorporativo"); 
if (key != null && key.length() > 0) { 
	out.print("corporativoedit.jsp?key=" + java.net.URLEncoder.encode(key,"UTF-8"));
}else{
	out.print("javascript:alert('Invalid Record! Key is null');");
} %>">Edit</a></span></td>
<td><span class="jspmaker"><input type="checkbox" name="key" value="<%=key %>" class="jspmaker">Delete</span></td>
	</tr>
<%

//	}
}
}
%>
</table>
<% if (recActual > 0) { %>
<p><input type="button" name="btndelete" value="DELETE SELECTED" onClick="this.form.action='corporativodelete.jsp';this.form.submit();"></p>
<% } %>
</form>
<%

// Close recordset and connection
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
