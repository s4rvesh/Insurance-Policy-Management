
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*,JDBC.jsp.*"%>

<head>
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#ad_main').load('admin_main.jsp');
		$('#dashboard').addClass('active');

		$("#addAgent").click(function() {
			$('#ad_main').load('addAgent.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#dashboard").click(function() {
			$('#ad_main').load('admin_main.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#backtodashboard").click(function() {
			$('#ad_main').load('admin_main.jsp');
			$('.highlight').removeClass('active');
			$('#dashboard').addClass('active');
		});

		$("#addPolicy").click(function() {
			$('#ad_main').load('addNewPolicy.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});
		allAgents

		$("#allPlans").click(function() {
			$('#ad_main').load('allPlans.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$("#allAgents").click(function() {
			$('#ad_main').load('allAgents.jsp');
			$('.highlight').removeClass('active');
			$(this).addClass('active');
		});

		$(".highlight").hover(function() {
			$(this).toggleClass("mod");
		});

		$(".highlight").click(function() {
			$(this).toggleClass(".active");
		});
		
	});
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>LIC Admin Login</title>
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


<body class="fixed-nav sticky-footer bg-des" id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-des fixed-top"
		id="mainNav" style="padding-bottom: 0.1em;">
		<a class="navbar-brand" href="#" style="color: #F2B809"><span
			style="margin-left: 23%; font-size: 1.2em;">Welcome, Admin <span><img
					id="backtodashboard" src="images/logolic.png"
					style="z-index: 1000; width: 18%; margin-top: -45px; float: left;">
			</span>
			<!-- session.getAttribute("userid")-->
		</span> </a>
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
					<div id="addAgent" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-plus"></i> <span
							class="nav-link-text"> Add Agent</span>
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
					<div id="allAgents" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-server"></i> <span
							class="nav-link-text"> All Agents</span>
						</a>
					</div>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts">
					<div id="allPlans" class="nav-link highlight"
						style="color: #F2B809;">
						<a> <i class="fa fa-fw fa-server"></i> <span
							class="nav-link-text">All Plans</span>
						</a>
					</div>
				</li>

			</ul>
			<!--  -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"
						style="color: #F2B809; font-size: 1.2em;"></i> <span
						style="color: #F2B809; font-size: 1.2em">Logout</span>
				</a></li>
			</ul>
			<!--  -->
		</div>
	</nav>


	<div class="content-wrapper">

		<div id="ad_main" class="container-fluid"></div>
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
					<a class="btn btn-primary" href="login.jsp">Logout</a>
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
