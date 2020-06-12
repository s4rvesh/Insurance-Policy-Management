<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".checkout_done").click(function() {
			var pol_no = $(this).attr('id');
			$('#main').load('checkout.jsp?pol_no=' + pol_no);
		});

	});
</script>
<style>
.checkout_done:hover{
cursor: pointer;
}
</style>

</head>

<body>
	<!-- Page Content -->
	<div class="container" style="max-width: 150%;">

		<!-- Page Heading -->
		<h1 class="my-4" style="margin-left:1.5em">Premium Payments</h1>		
		<div>

			<div class="row"
				style="padding: 3em; padding-left: 0; color: #03275A">
				<div class="col-md-12">
					<div class="row" style="text-align: center;">
						<div class="col-md-1" style="font-size: 1.6em; color: grey;">

						</div>
						<div class="col-md-3" style="font-size: 1.6em; color: grey;">
							Policy name</div>
						<div class="col-md-2" style="font-size: 1.6em; color: grey;">
							Policy number</div>
						<div class="col-md-2" style="font-size: 1.6em; color: grey;">
							Premium</div>
						<div class="col-md-1"
							style="font-size: 1.6em; color: grey; padding-right: 1.65em;">
							Due in</div>
						<div class="col-md-2" style="font-size: 1.6em; color: grey;">
							Due Date</div>

					</div>
					<hr style="width:81em">
					<%
						try {

							//String type = (String) session.getAttribute("type");
							Connection conn = new Connect().myDBConnect();

							int id = (Integer) session.getAttribute("Id");
							System.out.println("ID:" + id);
							int pols[] = new int[30];
							int pols_amt[] = new int[30];
							int day_diff[] = new int[30];
							String pol_names[] = new String[30];
							int cnt = 0, acnt = 0;
							//String agentid = "select agent_id from customer_agent where cust_id="+id;
							String sql1 = "select pol_no from customer_policy where cust_id=?";
							String sql2 = "select p_name,premium from policy where pol_no=?";
							PreparedStatement stmt1 = conn.prepareStatement(sql1);
							PreparedStatement stmt2 = conn.prepareStatement(sql2);
							stmt1.setInt(1, id);
							ResultSet rs1 = stmt1.executeQuery();
							while (rs1.next()) {
								pols[cnt++] = rs1.getInt(1);
							}
							acnt = 0;
							for (int i = 0; i < cnt; i++) {
								System.out.println("Pol no " + i + ":" + pols[i]);
							}
							for (int i = 0; i < cnt; i++) {
								day_diff[i] = new Premium().date(id, pols[i]);
							}
							for (acnt = 0; acnt < cnt; acnt++) {
								stmt2.setInt(1, pols[acnt]);
								ResultSet rs2 = stmt2.executeQuery();
								rs2.next();
								pol_names[acnt] = rs2.getString(1);
								pols_amt[acnt] = rs2.getInt(2);
					%>



					<!-- Project One -->



					<div class="row"
						style="text-align: center; margin-top: 1em; padding: 0;">


						<div class="col-md-1">

							<span style="font-size: 1.0em;"> <%
 	out.println(acnt + 1);
 %>
							</span>


						</div>
						<div class="col-md-3">
							<span style="font-size: 1.0em;font-weight:700;">
								<%
									out.println(pol_names[acnt]);
								%>
							</span>
						</div>



						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	out.println(pols[acnt]);
 %>
							</span>

						</div>

						<div class="col-md-2">

							<span style="font-size: 1em;"> <%
 	out.println("₹ "+pols_amt[acnt]);
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
 				out.println("       " + new Prem_date().due_date(id, pols[acnt]));
 %></span>
						</div>

						<div class="col-md-1">
						<a class=" btn btn-primary checkout_done"
							style="color: white; margin-left: 2em;margin-top:-0.5em;"
							id="<%out.print(pols[acnt]);%>">Pay now</a>
					</div>
					</div>




					<hr style="width:81em">

					<%
						}
						} catch (Exception e) {
							System.out.println(e);
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
</body>


</html>