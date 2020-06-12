<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="a_JDBC.jsp.*"%>
<%@ page import="java.sql.*"%>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#cont").delegate('.checkout_done', 'click', function() {
			var cust_id=$(this).parent().attr('id')
			var pol_no = $(this).attr('id');
			$('#amain').load('agent_checkout.jsp?pol_no=' + pol_no+'&cust_id='+cust_id);
		});

		$("#search-name").keyup(function() {
			name = $("#search-name").val();
			$.ajax({
				type : "POST",
				url : "search_payment.jsp",
				data : "name=" + name,
				success : function(data) {
					$("#cont").html(data);
				}
			});
		});

	});
</script>


</head>

<body>
	<!-- Page Content -->
	<div class="container" style="max-width: 150%;">

		<div class="row">
			<div class="col-md-4">
				<h1 class="my-4">Policy Payment</h1>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">

				<form>
					<div class="input-group" style="margin-left: 22em;">
						<input style="margin-top: 2.0em;" type='text' id="search-name"
							class='form-control' placeholder='Search Customers...'> <span
							class="input-group-btn">
							<button class="btn btn-primary" style="margin-top: 2.0em;"
								type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- <input type="text" id="search-name">-->




			</div>
			<div class="col-md-3"></div>
			<div class="col-md-1"></div>

		</div>

		<div>

			<div class="row"
				style="padding: 3em; padding-left: 0; color: #03275A">
				<div class="col-md-12">
					<div class="row" style="text-align: center;">
						<div class="col-md-1" style="font-size: 1em; color: grey;">

						</div>
						<div class="col-md-3" style="font-size: 1em; color: grey;">
							Customer name</div>
						<div class="col-md-2" style="font-size: 1em; color: grey;">
							Policy name</div>
						<div class="col-md-2" style="font-size: 1em; color: grey;">
							Premium</div>
						<div class="col-md-1"
							style="font-size: 1em; color: grey; padding-right: 1.65em;">
							Due in</div>
						<div class="col-md-2" style="font-size: 1em; color: grey;">
							Due Date</div>

					</div>
					<hr style="width:81em">
					<div id="cont">
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
						for (acnt = 0; acnt < cnt; acnt++) {
							String name[] = new Cust_name().c_name(cust_id[acnt]);
							String first = name[0];
							String mid = name[1];
							String last = name[2];
							String full = first + " " + mid + " " + last;
					%>
					<!-- Project One -->



					<div class="row"
						style="text-align: center; margin-top: 3em; padding: 0;">


						<div class="col-md-1">

							<span style="font-size: 1em;"> <%
 	out.println(acnt + 1);
 %>
							</span>


						</div>
						<div class="col-md-3">
							<span style="font-size: 1.0em;font-weight:700;"> <%
 	out.println(full);
 %>
							</span>
						</div>



						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	out.println(new Prem_name().p_name(pol_no[acnt]));
 %>
							</span>

						</div>

						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	int prem[] = new Prem_amount().p_details(pol_no[acnt]);
 		out.println("₹ "+prem[0]);
 %>
							</span>


						</div>


						<div class="col-md-1">

							<span style="font-size: 1em;"> <%
 	if (day_diff[acnt] < 0) {
 			out.println("<span style='color:red'>Late</span>");
 		} else if (day_diff[acnt] == 0) {
 			out.println("<span style='color:red'>Today</span>");
 		} else if (day_diff[acnt] > 0) {

 			out.println(day_diff[acnt] + " days");
 			//+ " days on " + new Prem_date().due_date(id, pols[acnt]) + ".");

 		}
 %>
							</span>

						</div>


						<div class="col-md-2">
							<span style="font-size: 1em; padding-left: 1.8em;"> <%
 	if (day_diff[acnt] < 0)
 			out.println("-");
 		else
 			out.println(new Prem_date().due_date(cust_id[acnt], pol_no[acnt]));
 %></span>
						</div>

						<div class="col-md-1" id="<%out.print(cust_id[acnt]);%>">
							<a class=" btn btn-primary checkout_done"
								style="color: white; margin-left: 2em;margin-top:-0.5em;"
								id="<%out.print(pol_no[acnt]);%>">Pay now</a>
						</div>
					</div>



					<hr style="width:81em">

					<%
						}
					%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
</body>


</html>
