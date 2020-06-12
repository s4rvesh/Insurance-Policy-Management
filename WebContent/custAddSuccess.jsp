<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%
		int aid = (Integer) session.getAttribute("Id");
		String policy = request.getParameter("policy");
		String fname = request.getParameter("first_name");
		String mname = request.getParameter("middle_name");
		String lname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add = request.getParameter("address");
		String dob = request.getParameter("dob");
		String uname = request.getParameter("uname");
		String passwd = request.getParameter("passd");
		String desig = request.getParameter("desig");
		Add_cust c = new Add_cust();
		c.addCustInfo(aid, fname, mname, lname, email, phone, add, dob, uname, passwd, desig, policy);
		//c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "01/01/0101", "u", "i", "o","1");
		//response.sendRedirect("aindex.jsp?policy="+policy+"&first_name="+fname+"&middle_name="+mname+"&last_name="+lname+"&email="+email+"&phone="+phone+"&address="+add+"&dob"+dob+"&uname="+uname+"&passd="+passwd+"&desig="+desig);
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#amain').load('main.jsp');
	});
	$("#addCust").click(function() {
		$('#amain').load('addCustomers.jsp');
	});
	
});

</script>
</head>
<body>
<div id="main">
<center
			style="height: 100v; width: 50%; margin: 0 auto; position: relative; top: 29vh;
	/* top: 50%; */ bottom: 50%; left: 0px; right: 0;">
			<div style="font-size:2em;font-weight:bold">Customer Added Successfully</div><br>
			<br>
			<button style="width:200px;margin:20px;"id="goHome" class="btn btn-primary">Go to Dashboard</button>
			<button style="width:200px;margin:20px;" id="addCust" class="btn btn-primary">Add another customer</button>
</center>


</div>
</body>
</html>