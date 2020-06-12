<%@ page import="JDBC.jsp.*"%>

<%
	int id = (Integer) session.getAttribute("Id");
	String pol_no = request.getParameter("pol_no");

	out.print(id);
	out.print(pol_no);

	surrenderPolicy s = new surrenderPolicy();
	s.deletefromALL(pol_no, id);
%>
<h1>Your policies have been surrendered.</h1>