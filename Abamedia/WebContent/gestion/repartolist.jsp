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
		session.setAttribute("reparto_searchwhere", searchwhere);
	}else if (cmd.toUpperCase().equals("RESETALL")) {
		searchwhere = ""; // Reset search criteria
		session.setAttribute("reparto_searchwhere", searchwhere);
	}
	startRec = 1; // Reset start record counter (reset command)
	session.setAttribute("reparto_REC", new Integer(startRec));
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
	if (session.getAttribute("reparto_OB") != null &&
		((String) session.getAttribute("reparto_OB")).equals(OrderBy)) { // Check if an ASC/DESC toggle is required
		if (((String) session.getAttribute("reparto_OT")).equals("ASC")) {
			session.setAttribute("reparto_OT", "DESC");
		}else{
			session.setAttribute("reparto_OT", "ASC");
		}
	}else{
		session.setAttribute("reparto_OT", "ASC");
	}
	session.setAttribute("reparto_OB", OrderBy);
	session.setAttribute("reparto_REC", new Integer(1));
}else{
	OrderBy = (String) session.getAttribute("reparto_OB");
	if (OrderBy == null || OrderBy.length() == 0) {
		OrderBy = DefaultOrder;
		session.setAttribute("reparto_OB", OrderBy);
		session.setAttribute("reparto_OT", DefaultOrderType);
	}
}

// Open Connection to the database
try{
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs = null;

// Build SQL
String strsql = "SELECT * FROM `reparto`";
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
	strsql = strsql + " ORDER BY `" + OrderBy + "` " + (String) session.getAttribute("reparto_OT");
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
	session.setAttribute("reparto_REC", new Integer(startRec));
}else if (request.getParameter("pageno") != null && Integer.parseInt(request.getParameter("pageno")) > 0) {
	pageno = Integer.parseInt(request.getParameter("pageno"));
	if (IsNumeric(request.getParameter("pageno"))) {
		startRec = (pageno-1)*displayRecs+1;
		if (startRec <= 0) {
			startRec = 1;
		}else if (startRec >= ((totalRecs-1)/displayRecs)*displayRecs+1) {
			startRec =  ((totalRecs-1)/displayRecs)*displayRecs+1;
		}
		session.setAttribute("reparto_REC", new Integer(startRec));
	}else {
		startRec = ((Integer) session.getAttribute("reparto_REC")).intValue();
		if (startRec <= 0) {
			startRec = 1; // Reset start record counter
			session.setAttribute("reparto_REC", new Integer(startRec));
		}
	}
}else{
	if (session.getAttribute("reparto_REC") != null)
		startRec = ((Integer) session.getAttribute("reparto_REC")).intValue();
	if (startRec==0) {
		startRec = 1; //Reset start record counter
		session.setAttribute("reparto_REC", new Integer(startRec));
	}
}
%>
<%@ include file="header.jsp" %>
<p><span class="jspmaker">TABLE: reparto</span></p>
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
	<a href="repartolist.jsp?start=<%=PrevStart%>"><b>Prev</b></a>
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
	<a href="repartolist.jsp?start=<%=x%>"><b><%=y%></b></a>
				<%	}
				x += displayRecs;
				y ++;
			}else if (x >= (dx1-displayRecs*recRange) && x <= (dx2+displayRecs*recRange)) {
				if ((x+recRange*displayRecs) < totalRecs) { %>
	<a href="repartolist.jsp?start=<%=x%>"><b><%=y%>-<%=y+recRange-1%></b></a>
				<% }else{
					int ny= (totalRecs-1)/displayRecs+1;
					if (ny == y) { %>
	<a href="repartolist.jsp?start=<%=x%>"><b><%=y%></b></a>
					<% }else{ %>
	<a href="repartolist.jsp?start=<%=x%>"><b><%=y%>-<%=ny%></b></a>
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
	<a href="repartolist.jsp?start=<%=NextStart%>"><b>Next</b></a>
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
<a href="repartolist.jsp?order=<%= java.net.URLEncoder.encode("id_pro","UTF-8") %>">id pro&nbsp;<% if (OrderBy != null && OrderBy.equals("id_pro")) { %><span class="ewTableOrderIndicator"><% if (((String) session.getAttribute("reparto_OT")).equals("ASC")) { %>5<% }else if (((String) session.getAttribute("reparto_OT")).equals("DESC")) { %>6<% } %></span><% } %></a>
		</td>
		<td>
<a href="repartolist.jsp?order=<%= java.net.URLEncoder.encode("id_actor","UTF-8") %>">id actor&nbsp;<% if (OrderBy != null && OrderBy.equals("id_actor")) { %><span class="ewTableOrderIndicator"><% if (((String) session.getAttribute("reparto_OT")).equals("ASC")) { %>5<% }else if (((String) session.getAttribute("reparto_OT")).equals("DESC")) { %>6<% } %></span><% } %></a>
		</td>
		<td>
<a href="repartolist.jsp?order=<%= java.net.URLEncoder.encode("nombrepersonaje","UTF-8") %>">nombrepersonaje&nbsp;(*)<% if (OrderBy != null && OrderBy.equals("nombrepersonaje")) { %><span class="ewTableOrderIndicator"><% if (((String) session.getAttribute("reparto_OT")).equals("ASC")) { %>5<% }else if (((String) session.getAttribute("reparto_OT")).equals("DESC")) { %>6<% } %></span><% } %></a>
		</td>
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
	String x_id_pro = "";
	String x_id_actor = "";
	String x_nombrepersonaje = "";

	// Load Key for record
	String key = "";

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
%>
	<tr class="<%= rowclass %>">
		<td><%
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
		<td><%
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
		<td><% out.print(x_nombrepersonaje); %>&nbsp;</td>
	</tr>
<%

//	}
}
}
%>
</table>
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
