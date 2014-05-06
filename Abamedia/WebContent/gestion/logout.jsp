<%
session.setAttribute("login", null);
session.setAttribute("name", null);
//session.invalidate();
response.sendRedirect("../index.jsp");
%>