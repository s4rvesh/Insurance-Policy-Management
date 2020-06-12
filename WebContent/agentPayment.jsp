<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="a_JDBC.jsp.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
	
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".checkout_done").click(function() {
	         var pol_no=$(this).attr('id');
			$('#amain').load('agent_checkout.jsp?pol_no='+pol_no);
		});

	});
</script>	

</head>

<body style="color: #03275A !important;">

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<div class="row">
		<div class="col-md-4"><h1 class="my-4">Its Sharan Bitches</h1></div>
		<div class="col-md-2"></div>
		<div class="col-md-6"><input type="text" id="search"></div>
		</div>
		<%
		int agent_id = (Integer) session.getAttribute("Id");
		int pols[] = new int[30];
		int day_diff[] = new int[30];
		int cust_id[] = new int[30];
		int pol_no[] = new int[30];
		int cnt = 0, acnt = 0;
		int details[][] = new Details().c_details(agent_id);

		/*int day_diff[] = new int[30];
		String sql1 = "select pol_no from customer_policy where cust_id=?";*/
		//String sql2 = "select datediff(curdate(),?)";
		for (int i = 0; i < 30; i++) {
			if (details[i][1] == 0) {
				break;
			} else {
				cust_id[cnt] = details[i][0];
				pol_no[cnt] = details[i][1];
				day_diff[cnt] = new Premium().date(cust_id[cnt], pol_no[cnt]);
				cnt++;
			}
		}
		for(acnt=0;acnt<cnt;acnt++){
			String name[]=new Cust_name().c_name(cust_id[acnt]);
			String first=name[0];
			String mid=name[1];
			String last=name[2];
			String full=first+" "+mid+" " +last;
		%>
		<hr>

		<!-- Project One -->

		<div class="row">
			<div class="col-md-8">
				<h3>
					<%
						out.println(full);
					%>
				</h3>
				<p>
					<b>Policy Name: </b>
					<%
						out.println(new Prem_name().p_name(pol_no[acnt]));
					%><br> <b>Policy Number: </b>
					<%
						out.println(pol_no[acnt]);
					%><br> <b>Premium Amount: </b>
					<%
						int prem[]=new Prem_amount().p_details(pol_no[acnt]);
						out.println(prem[0]);
					%>
					<br>
					<%
					if (day_diff[acnt] < 0) {
						out.println(full+ " has missed his/her premium due date for Policy Number: " + pol_no[acnt] + ".");
					} else if (day_diff[acnt] == 0) {
						out.println(full+"'s premium due date for Policy Number: " + pol_no[acnt] + " is today.");
					} else if (day_diff[acnt] > 0) {
							out.println(full+"'s next premium for Policy Number: " + pol_no[acnt] + " is due in " + day_diff[acnt]
									+ " days on " + new Prem_date().due_date(cust_id[acnt], pol_no[acnt]) + ".");
					}
					%>
				</p>
				<!-- Button trigger modal -->
				<button type="button" style="margin-left: 80%; margin-top: -33%;"
					class="btn btn-primary checkout_done" id="<%out.print(pol_no[acnt]);%>">Make Payment</button>

			</div>
		</div>
		<!-- /.row -->
		<hr>
		<%
					} 
		%>
	</div>
</body>


</html>