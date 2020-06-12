<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*,a_JDBC.jsp.*,JDBC.jsp.*"%>

<head>

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#premium-payment-details").click(function() {
			$('#amain').load('agent_PolicyPayment.jsp');
			$('.highlight').removeClass('active');
			$('#aPolicyPayment').addClass('active');
		});

		$("#my-customers").click(function() {
			$('#amain').load('myCustomers.jsp');
			$('.highlight').removeClass('active');
			$('#myCustomers').addClass('active');
		});

		$("#new-customer").click(function() {
			$('#amain').load('addCustomers.jsp');
			$('.highlight').removeClass('active');
			$('#addCustomers').addClass('active');
		});

		$("#plan-details").click(function() {
			$('#amain').load('allPlans.jsp');
			$('.highlight').removeClass('active');
			$('#allPlans').addClass('active');
		});
		
		
		$(".media-body").click(function(){
			var cust_id=$(this).attr('id');
			var pol_no = $(this).parent().attr('id');
			$('#amain').load('agent_checkout.jsp?pol_no=' + pol_no+'&cust_id='+cust_id);
			$('.highlight').removeClass('active');
			$('#aPolicyPayment').addClass('active');
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
					<div class="mr-5" style="font-size: 1.5em">My Customers</div>
				</div>
				<a href="#" id="my-customers"
					class="card-footer text-white clearfix small z-1"> <span
					class="float-left" style="font-size: 1.2em">View Details</span> <span
					class="float-right"> <i class="fa fa-angle-right"></i>
				</span>
				</a>
			</div>
		</div>
		<div class="col-xl-6 col-sm-6 mb-3" style="display: block;">
			<div class="card text-white bg-warning o-hidden h-100">
				<div class="card-body">
					<div class="card-body-icon">
						<i class="fa fa-fw fa-money"></i>
					</div>
					<div class="mr-5" style="font-size: 1.5em">Premium Payment</div>
				</div>
				<a href="#" id="premium-payment-details"
					class="card-footer text-white clearfix small z-1"> <span
					class="float-left" style="font-size: 1.2em">View Details</span> <span
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
					<div class="mr-5" style="font-size: 1.5em">Add New Customer</div>
				</div>
				<a href="#" id="new-customer"
					class="card-footer text-white clearfix small z-1"> <span
					id="new-customer" class="float-left" style="font-size: 1.2em">View
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
					<div class="mr-5" style="font-size: 1.5em">All plans by LIC!</div>
				</div>
				<a href="#" id="plan-details"
					class="card-footer text-white clearfix small z-1"> <span
					class="float-left" style="font-size: 1.2em">View Details</span> <span
					class="float-right"> <i class="fa fa-angle-right"></i>
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
							if(day_diff[acnt] > 5)
								continue;
					%>
					<a href="#" class="list-group-item list-group-item-action"
						>
						<div class="media" id="<%out.print(pol_no[acnt]);%>">
							<!--<img class="d-flex mr-3 "
										src="http://placehold.it/45x45" alt="">-->
								<div class="media-body" id="<%out.print(cust_id[acnt]);%>" style="padding: 1em">
								
									<%
									String name[]=new Cust_name().c_name(cust_id[acnt]);
									String first=name[0];
									String mid=name[1];
									String last=name[2];
									String full=first+" "+mid+" " +last;
									if (day_diff[acnt] < 0) {
											out.println(full+ " has missed his/her premium due date for " + new Prem_name().p_name(pol_no[acnt]) + ".");
										} else if (day_diff[acnt] == 0) {
											out.println(full+"'s premium due date for " + new Prem_name().p_name(pol_no[acnt]) + " is today.");
										} else if (day_diff[acnt] > 0) {
											if (day_diff[acnt] <= 5) {
												//Date d=new Prem_date().due_date(cust_id, pols[acnt]);
												out.println(full+"'s next premium for " + new Prem_name().p_name(pol_no[acnt]) + " is due in " + day_diff[acnt]
														+ " days on " + new Prem_date().due_date(cust_id[acnt], pol_no[acnt]) + ".");
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