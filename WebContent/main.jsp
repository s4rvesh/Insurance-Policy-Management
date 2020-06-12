<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*,JDBC.jsp.*"%>

<head>

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#premium-payment-details").click(function() {
			$('#main').load('policyPayment.jsp');
			$('.highlight').removeClass('active');
			$('#policyPayment').addClass('active');
		});
		
		

		$("#my-policies-details").click(function() {
			$('#main').load('myPolicies.jsp');
			$('.highlight').removeClass('active');
			$('#myPolicies').addClass('active');
		});

		$("#my-profile-details").click(function() {
			$('#main').load('myProfile.jsp');
			$('.highlight').removeClass('active');
			$('#myProfile').addClass('active');
		});

		$("#new-plans-details").click(function() {
			$('#main').load('allPlans.jsp');
			$('.highlight').removeClass('active');
			$('#newplans').addClass('active');
		});
		
		$(".media-body").click(function(){
			var pol_no = $(this).attr('id');
			$('#main').load('checkout.jsp?pol_no=' + pol_no);
			$('.highlight').removeClass('active');
			$('#policyPayment').addClass('active');
		})
		
		

	});
</script>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>LIC</title>

<!-- Bootstrap core CSS -->
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="dashboard/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="dashboard/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard/css/sb-admin.css" rel="stylesheet">


</head>

<body>
	<div class="row">
		<div class="col-xl-6 col-sm-6 mb-3">
			<div class="card text-white bg-primary o-hidden h-100">
				<div class="card-body">
					<div class="card-body-icon">
						<i class="fa fa-fw fa-server"></i>
					</div>
					<div class="mr-5" style="font-size: 1.5em">My Policies</div>
				</div>
				<a href="#" id="my-policies-details" class="card-footer text-white clearfix small z-1"> <span
					 class="float-left"
					style="font-size: 1.2em">View Details</span> <span
					class="float-right"> <i class="fa fa-angle-right"></i>
				</span>
				</a>
			</div>
		</div>
		<div class="col-xl-6 col-sm-6 mb-3"  style="display: block;">
			<div class="card text-white bg-warning o-hidden h-100";">
				<div class="card-body">
					<div class="card-body-icon">
						<i class="fa fa-fw fa-money"></i>
					</div>
					<div class="mr-5" style="font-size: 1.5em">Premium Payment</div>
				</div>
				<a href="#" id="premium-payment-details" class="card-footer text-white clearfix small z-1"> <span
					class="float-left"
					style="font-size: 1.2em">View Details</span> <span
					class="float-right"> <i class="fa fa-angle-right"></i>
				</span>
				</a>
			</div>
		</div>
		<div class="col-xl-6 col-sm-6 mb-3">
			<div class="card text-white bg-success o-hidden h-100">
				<div class="card-body">
					<div class="card-body-icon">
						<i class="fa fa-fw fa-address-card-o"></i>
					</div>
					<div class="mr-5" style="font-size: 1.5em">My Profile</div>
				</div>
				<a href="#" id="my-profile-details"  class="card-footer text-white clearfix small z-1"> <span
					class="float-left" style="font-size: 1.2em">View
						Details</span> <span class="float-right"> <i
						class="fa fa-angle-right"></i>
				</span>
				</a>
			</div>
		</div>
		<div class="col-xl-6 col-sm-6 mb-3">
			<div class="card text-white bg-danger o-hidden h-100">
				<div class="card-body">
					<div class="card-body-icon">
						<i class="fa fa-fw fa-newspaper-o"></i>
					</div>
					<div class="mr-5" style="font-size: 1.5em">New plans by LIC!</div>
				</div>
				<a href="#" id="new-plans-details" class="card-footer text-white clearfix small z-1"> <span
					 class="float-left" style="font-size: 1.2em">View
						Details</span> <span class="float-right"> <i
						class="fa fa-angle-right"></i>
				</span>
				</a>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<!-- Example Notifications Card -->
			<div class="card mb-3">
				<div class="card-header"
					style="font-size: larger; font-weight: bolder;">
					<i class="fa fa-bell-o"></i> Notifications
				</div>
				<div class="list-group list-group-flush small">
					<%
						int cust_id = (Integer) session.getAttribute("Id");
						int pols[] = new int[30];
						int cnt = 0, acnt = 0;
						int day_diff[] = new int[30];
						String sql1 = "select pol_no from customer_policy where cust_id=?";
						//String sql2 = "select datediff(curdate(),?)";
						try {
							Connection conn = new Connect().myDBConnect();
							PreparedStatement stmt1 = conn.prepareStatement(sql1);
							stmt1.setInt(1, cust_id);
							ResultSet rs1 = stmt1.executeQuery();
							while (rs1.next()) {
								pols[cnt++] = rs1.getInt(1);
							}
							for (int i = 0; i < 30; i++) {
								day_diff[i] = 0;
							}
							for (int i = 0; i < cnt; i++) {
								day_diff[i] = new Premium().date(cust_id, pols[i]);
							}
						} catch (Exception e) {
							System.out.println(e);
						}
						for (acnt = 0; acnt < cnt; acnt++) {
					%>
					<a href="#" class="list-group-item list-group-item-action"
						>
						<div class="media">
							<!--<img class="d-flex mr-3 "
										src="http://placehold.it/45x45" alt="">-->
							<div class="media-body" id="<%out.print(pols[acnt]);%>" style="padding: 1em">
								<%
									if (day_diff[acnt] < 0) {
											out.println("You have missed your premium due date for " + new Prem_name().p_name(pols[acnt]) + ".");
											out.println("Please pay it ASAP!");
										} else if (day_diff[acnt] == 0) {
											out.println("Your premium due date for " + new Prem_name().p_name(pols[acnt]) + " is today.");
											out.println("Please pay it ASAP!");
										} else if (day_diff[acnt] > 0) {
											if (day_diff[acnt] >= 30) {
												//Date d=new Prem_date().due_date(cust_id, pols[acnt]);
												out.println("You have paid your premium for " + new Prem_name().p_name(pols[acnt]) + " for this month.");
												out.println("Next premium is due in " + day_diff[acnt] + " days on "
														+ new Prem_date().due_date(cust_id, pols[acnt]) + ".");
											} else {
												out.println("Next premium for " + new Prem_name().p_name(pols[acnt]) + " is due in " + day_diff[acnt]
														+ " days on " + new Prem_date().due_date(cust_id, pols[acnt]) + ".");
											}

										}
								%>

							</div>
						</div>
					</a>
					<%
						}
					%>
					<!--<a href="#" class="list-group-item list-group-item-action"
						style="padding: 1.5em">
						<div class="media">
							
							<div class="media-body">
								<strong>Jeffery Wellings</strong> added a new photo to the album
								<strong>Beach</strong>.

							</div>
						</div>
					</a> <a href="#" class="list-group-item list-group-item-action"
						style="padding: 1.5em">
						<div class="media">
							
							<div class="media-body">
								<strong>Monica Dennis</strong> forked the <strong>startbootstrap-sb-admin</strong>
								repository on <strong>GitHub</strong>.

							</div>
						</div>
					</a> <a href="#" class="list-group-item list-group-item-action"
						style="padding: 1.5em"> View all activity... </a>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>-->
				</div>
			</div>
		</div>

		<!-- Example Tables Card -->
		<!-- <div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-table"></i> Data Table Example
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" id="dataTable"
					cellspacing="0">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td>Customer Support</td>
							<td>New York</td>
							<td>27</td>
							<td>2011/01/25</td>
							<td>$112,000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at
			11:59 PM</div>
	</div>-->

	</div>


</body>

</html>