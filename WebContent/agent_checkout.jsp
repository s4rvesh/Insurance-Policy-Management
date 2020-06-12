
<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.jsp.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Responsive Shopping Cart</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<!-- <link rel="stylesheet" href="CSS/paystyle.css">
 -->
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<%
	String pol = request.getParameter("pol_no");
	int pol_no = Integer.parseInt(pol);
	String cust = request.getParameter("cust_id");
	int cust_id = Integer.parseInt(cust);
	int agent_id = (Integer) session.getAttribute("Id");
	//int cust_id = new Get_cust().get_id(agent_id, pol_no);
	int details[] = new Prem_amount().p_details(pol_no);
	int premium = details[0];
	int commision = details[1];
	int late_fee = details[2];
	int act_latefee = 0;
	int day_diff = new Premium().date(cust_id, pol_no);
	//out.println("Day-Diff:"+day_diff);
	if (day_diff < 0) {
		act_latefee = late_fee;
	} else if (day_diff > 0) {
		act_latefee = 0;
	}
	double tax = (premium + act_latefee) * 0.05;
	double total = premium + tax + act_latefee;
	double perc = commision / 100.00;
	System.out.println("acom:" + commision);
	System.out.println("perc:" + perc);
	double commision1 = premium * perc;
	System.out.println("Com:" + commision1);
%>

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#pay_done").click(
						function() {
							var pol_no =
<%=pol_no%>
	;
							var total =
<%=total%>
	;
							var commision =
<%=commision1%>
	;
							var cust_id =
<%=cust_id%>
	;
							$('#amain').load(
									'atrans_final.jsp?pol_no=' + pol_no
											+ '&total=' + total + '&commision='
											+ commision+ '&cust_id=' + cust_id);
						});
			});
</script>

</head>

<body>

	<br>
	<h1>Policy Payment</h1>
	<br>

	<div style="margin: 20px;">

		<!-- headers -->
		<div class="row">
			<div class="col-md-3">
				<p>
					<b>Customer Name</b>
				</p>
			</div>

			<div class="col-md-2">
				<p>
					<b>Policy Name</b>
				</p>
			</div>

			<div class="col-md-2">
				<p>
					<b>Policy Number</b>
				</p>
			</div>

			<div style="padding-left: 0px;" class="col-md-3">
				<p>
					<b>Term</b>
				</p>
			</div>

			<div class="col-md-2">
				<p>
					<b>Cost</b>
				</p>
			</div>

		</div>
		<hr>
		<div class="row">
			<div class="col-md-3">
				<p>
					<%
						String name[] = new Cust_name().c_name(cust_id);
						String first = name[0];
						String mid = name[1];
						String last = name[2];
						String full = first + " " + mid + " " + last;
						out.print("<p>" + full + "</p>");
					%>
				</p>
			</div>

			<div class="col-md-2">
				<p>
					<%
						String pol_name = new Prem_name().p_name(pol_no);
						out.println("<p>" + pol_name + "</p>");
					%>
				</p>
			</div>

			<div style="padding-top: 16px;" class="col-md-2">
				<p>
					<%
						out.print(pol_no);
					%>
				</p>
			</div>

			<div style="padding-top: 16px; padding-left: 0px;" class="col-md-3">
				<p>
					<%
						Date e_date = new Prem_date().due_date(cust_id, pol_no);
						Date s_date = new Term().term_date(cust_id, pol_no);
						out.println(e_date + " to " + s_date);
					%>
				</p>
			</div>

			<div style="padding-top: 16px;" class="col-md-2">
				<p>
					<%
						out.println("INR " + premium);
					%>
				</p>
			</div>
		</div>
		<hr>
		<br> <br>
		<div class="row">
			<div class="col-md-4"></div>

			<div class="col-md-4"></div>

			<div class="col-md-4" style="padding-right: 70px;">
				<p style="float: right;">
					<b>Late Fee: </b>
					<%
						out.println("INR " + act_latefee);
					%>
				</p>
				<br> <br>
				<p style="float: right;">
					<b>Tax (5%): </b>
					<%
						out.println("INR " + tax);
					%>
				</p>
				<br>
				<p style="font-weight: 800; font-size: 1.5em; float: right;">
					<b>Grand Total: </b>
					<%
						out.println("<span style='color: red;'>INR " + total + "</span>");
					%>
				</p>
				<br> <br>
				<button style="float: right;" id="pay_done" class="btn btn-primary">Checkout</button>
			</div>
		</div>


	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/payment.js"></script>
</body>
</html>
