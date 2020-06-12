<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.jsp.*"%>
<%
	int agent_id = (Integer) session.getAttribute("Id");
	String pol = request.getParameter("pol_no");
	int pol_no = Integer.parseInt(pol);
	String tot = request.getParameter("total");
	double total = Double.parseDouble(tot);
	String com = request.getParameter("commision");
	double commision = Double.parseDouble(com);
	//int cust_id = new Get_cust().get_id(agent_id, pol_no);
	String cust = request.getParameter("cust_id");
	int cust_id = Integer.parseInt(cust);
	Date s_date = new Prem_date().due_date(cust_id, pol_no);
	Date e_date = new Term().term_date(cust_id, pol_no);
	new Invoice().enter(cust_id, agent_id, total, pol_no, commision, s_date, e_date);
%>
<html>
<head>
</head>
<body>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#goHome").click(function() {
				$('#amain').load('agent_main.jsp');
			});
		});
	</script>

	<div id="main">
		<center
			style="height: 100v; width: 50%; margin: 0 auto; position: relative; top: 29vh;
	/* top: 50%; */ bottom: 50%; left: 0px; right: 0;">
			<div style="font-size: 2em; font-weight: bold">Transaction
				Successful!</div>
			<br> <br>
			<button id="goHome" class="btn btn-primary">Home</button>
		</center>
	</div>
	<!-- top: 0; bottom: 0; left: 0; right: 0;">
			<div style="font-size:2em;font-weight:bold">Transaction Successful!</div><br>
			<br>
			<button style="width:200px;margin:20px;" id="goHome" class="btn btn-primary">Go to Dashboard</button>
</center>
</div> -->
</body>
</html>
