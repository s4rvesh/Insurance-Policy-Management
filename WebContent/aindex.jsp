
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.*"%>
<%
if(session.getAttribute("agent_user")==null)
	response.sendRedirect("login.jsp");
%>
<head>

<style>
/*!
 * Start Bootstrap - Round About (http://startbootstrap.com/)
 * Copyright 2013-2016 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */

/*body {
    padding-top: 70px;  Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes.
}*/
.img-center {
	margin: 0 auto;
}

.box {
	display: inline-block;
	height: 8em;
	padding-top: 1.5em;
	margin-bottom: 1em;
	width: 20em;
	border-radius: 2%;
	box-shadow: 1px 1px 1px 1px #0c1b86;
	margin-left: 1.5em;
	top: 0; /*the image won't appear without specifing these*/
	bottom: 0;
	left: 0;
	right: 0;
	font-weight:bold;
	background: url(./images/5.jpg);
    background-size: cover;
    opacity: 0.94;
}

.box:hover .after {
    display: block;
    background: rgba(0, 0, 0, .6);
}

.box:hover {
	border-color: #696969;
}

.shade {
	background-color: #d3d3d3;
}

footer {
	margin:0;
}

/*background*/
.ancient-bg {
	position: relative;
	z-index: 1;
}

.ancient-bg:before {
	content: "";
	position: absolute;
	z-index: -1;
}

</style>

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>



<script type="text/javascript">
	$(document).ready(function() {

		$('#dashboard').addClass('active');

		$("#myProfile").click(function() {
			$('#amain').load('agentProfile.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$('#amain').load('agent_main.jsp');

		$("#myCustomers").click(function() {
			$('#amain').load('myCustomers.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#dashboard").click(function() {
			$('#amain').load('agent_main.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});
		
		$("#backtodashboard").click(function() {
			$('#amain').load('agent_main.jsp');
			$('.highlight').removeClass('active');
			$('#dashboard').addClass('active');
		});

		$("#aPolicyPayment").click(function() {
			$('#amain').load('agent_PolicyPayment.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#addCustomers").click(function() {
			$('#amain').load('addCustomers.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#addPolicy").click(function() {
			$('#amain').load('addPolicy.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#allPlans").click(function() {
			$('#amain').load('allPlans.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#Invoices").click(function() {
			$('#amain').load('aInvoices.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$(".highlight").hover(function() {
			$(this).toggleClass("mod ");
		});

		$("#summary").click(function() {
			$('#amain').load('agentSummary.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});




	});
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>LIC Agent Login</title>
<link rel="shortcut icon" href="images/logolic.png" />
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


<body class="fixed-nav sticky-footer bg-des" id="page-top" style="padding:-1em;">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-des fixed-top"
		id="mainNav" style="padding-bottom:0.1em;">
		<a class="navbar-brand" href="#" style="color: #F2B809"><span style="font-size:1.2em;margin-left:23%;">Welcome, <%
			try {
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				String sql = "select a_fname,a_lname from agent where agent_id=?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				ResultSet rs = stmt.executeQuery();
				rs.next();
				out.println(rs.getString(1) + " " + rs.getString(2));
			} catch (Exception e) {
				System.out.println(e);
			}
		%></span><span><img id="backtodashboard" src="images/logolic.png" style="z-index:1000;width:18%;margin-top:-45px;float:left;"></span><!-- session.getAttribute("userid")-->
		</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard">
					<div id="dashboard" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-dashboard"></i> <span
							class="nav-link-text"> Dashboard</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="myProfile" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-address-card-o"></i> <span
							class="nav-link-text"> My Profile</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="myCustomers" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-server"></i> <span
							class="nav-link-text"> My Customers</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="addCustomers" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-plus"></i> <span
							class="nav-link-text"> Add Customers</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="addPolicy" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-plus"></i> <span
							class="nav-link-text"> Add Policy</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="aPolicyPayment" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-money"></i> <span
							class="nav-link-text"> Make Payment</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables">
					<div id="allPlans" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-server"></i> <span
							class="nav-link-text"> All Plans</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables">
					<div id="Invoices" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-print"></i> <span
							class="nav-link-text">Invoice</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables">
					<div id="summary" class="nav-link highlight" style="color:#F2B809;">
						<a > <i class="fa fa-fw fa-industry"></i>
							<span class="nav-link-text"> Summary</span>
						</a>
					</div>
				</li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a style="visibility: hidden;"
					class="nav-link dropdown-toggle mr-lg-2" href="#"
					id="messagesDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <span class="new-indicator text-primary d-none d-lg-block">
							<i class="fa fa-fw fa-circle"></i> <span class="number">12</span>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">New Messages:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Carmen
								Miller</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div class="dropdown-message small">Hey there! This new
								version of SB Admin is pretty awesome! These messages clip off
								when they reach the end of the box so they don't overflow over
								to the sides!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jane Smith</strong>
							<span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I was wondering if you
								could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>John Doe</strong> <span
							class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I've sent the final
								files over to you for review. When you're able to sign off of
								them let me know and we can discuss distribution.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#"> View all messages </a>
					</div></li>
				<li class="nav-item dropdown"><a style="visibility: hidden;"
					class="nav-link dropdown-toggle mr-lg-2" href="#"
					id="alertsDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-bell"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="new-indicator text-warning d-none d-lg-block">
							<i class="fa fa-fw fa-circle"></i> <span class="number">6</span>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">New Alerts:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-danger">
								<strong> <i class="fa fa-long-arrow-down"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#"> View all alerts </a>
					</div></li>

				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"
						style="color: #F2B809; font-size: 1.2em;"></i> <span
						style="color: #F2B809; font-size: 1.2em">Logout</span>
				</a></li>
			</ul>
		</div>
	</nav>


	<div class="content-wrapper">

		<div id="amain" class="container-fluid">

			<!-- Breadcrumbs -->
			<!-- <ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol> -->

			<!-- Icon Cards -->

		</div>
	</div>
	<!-- /.content-wrapper -->

	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright &copy; LIC 2017</small>
			</div>
		</div>
	</footer>

	<!-- Scroll to Top Button -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>

	<!-- Logout Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to logout?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="logout.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="dashboard/vendor/jquery/jquery.min.js"></script>
	<script src="dashboard/vendor/popper/popper.min.js"></script>
	<script src="dashboard/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="dashboard/vendor/chart.js/Chart.min.js"></script>
	<script src="dashboard/vendor/datatables/jquery.dataTables.js"></script>
	<script src="dashboard/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this template -->
	<script src="dashboard/js/sb-admin.min.js"></script>

</body>

</html>
