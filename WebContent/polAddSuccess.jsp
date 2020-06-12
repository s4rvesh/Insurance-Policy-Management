<%@ page import="JDBC.jsp.*,java.sql.*,a_JDBC.jsp.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#main').load('main.jsp');
	});
	$("#addCust").click(function() { 
		$('#main').load('addPolicy.jsp');
	});
});

</script>
</head>

<%
int agent_id = (Integer) session.getAttribute("Id");
String pol = request.getParameter("pol_no");
int pol_no = Integer.parseInt(pol);
String cust= request.getParameter("cust_id");
int cust_id=Integer.parseInt(cust);
new Add_policy().addPolInfo(agent_id, pol_no,cust_id);
%>

<body>
<div id="main">
<h1>Policy Added Successfully</h1>
<button id="addCust" class="btn btn-primary">Add another Policy</button>
<button id="goHome" class="btn btn-primary">Go to Dashboard</button>
</div>
</body>
</html>