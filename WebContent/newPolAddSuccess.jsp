<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%
		String pname = request.getParameter("policy_name");
		String pno = request.getParameter("policy_number");
		String dur = request.getParameter("duration");
		String lfee = request.getParameter("late_fee");
		String prem = request.getParameter("premium");
		String comm = request.getParameter("commision");
		String desc = request.getParameter("policy_desc");
		
		Add_pol p = new Add_pol();
		p.addNewPolicy(pname,pno,dur,lfee,prem,comm,desc);
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
		$('#main').load('admin_main.jsp');
	});
	$("#addPol").click(function() {
		$('#main').load('addNewPolicy.jsp');
	});
	
	
	
	
});

</script>
</head>
<body>
<div id="main">

<center
			style="height: 100v; width: 50%; margin: 0 auto; position: relative; top: 29vh; bottom: 50%; left: 0px; right: 0;">
			<div style="font-size:2em;font-weight:bold">Policy Added Successfully</div><br>
			<br>
			<button style="width:200px;margin:20px;"id="goHome" class="btn btn-primary">Go to Dashboard</button>
			<button style="width:200px;margin:20px;" id="addPol" class="btn btn-primary">Add another Policy</button>
</center>

</div>
</body>
</html>