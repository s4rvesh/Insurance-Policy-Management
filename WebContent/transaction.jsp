<%@ page import="java.sql.*,JDBC.jsp.*"%>

<html>
<head>



</head>
<body>
<%
String pol = request.getParameter("pol_no");
int pol_no = Integer.parseInt(pol);
String tot = request.getParameter("total");
Double total = Double.parseDouble(tot);
String comm = request.getParameter("commision");
int commisio = Integer.parseInt(comm);
Double commision = Double.parseDouble(comm);
int cust_id = (Integer) session.getAttribute("Id");
int agent_id = new Get_Agent().agent_no(cust_id, pol_no);
//new Invoice().enter(cust_id, agent_id, total, pol_no, commision);
%>

<h1>Transaction Successful</h1>
<%out.println("Transaction Successful."); %>

</body>


</html>