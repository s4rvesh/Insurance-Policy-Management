<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a_JDBC.jsp.*"%>
<%
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add = request.getParameter("address");
		String uname = request.getParameter("uname");
		String passwd = request.getParameter("passd");
		new Add_agent().addAgentInfo(fname, lname, email, phone, add, uname, passwd);
		//c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "01/01/0101", "u", "i", "o","1");
		//response.sendRedirect("aindex.jsp?policy="+policy+"&first_name="+fname+"&middle_name="+mname+"&last_name="+lname+"&email="+email+"&phone="+phone+"&address="+add+"&dob"+dob+"&uname="+uname+"&passd="+passwd+"&desig="+desig);
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#ad_main').load('admin_main.jsp');
	});
	$("#addCust").click(function() {
		$('#ad_main').load('addAgent.jsp');
	});
	
	
});

</script>
</head>
<body>
<div id="main">
<center
			style="height: 100v; width: 50%; margin: 0 auto; position: relative; top: 29vh !important;
	 top: 0; bottom: 0; left: 0; right: 0;">
			<div style="font-size:2em;font-weight:bold">Agent Added Successfully</div><br>
			<br>
			<button style="width:200px;margin:20px;" id="goHome" class="btn btn-primary">Go to Dashboard</button>
			<button style="width:200px;margin:20px;" id="addCust" class="btn btn-primary">Add another Agent</button>
			
</center>

</div>
</body>
</html>