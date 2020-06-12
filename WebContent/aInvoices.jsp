<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>Invoices</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<!-- Example Tables Card -->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-table"></i> Generate Invoice
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" id="dataTable"
					cellspacing="0">
					<thead>
						<tr>
							<th>Transaction No.</th>
							<th>Policy No</th>
							<th>Term</th>
							<th>Customer-Name</th>
							<th>Date of Transaction</th>
							<th>Amount</th>

						</tr>
					</thead>
					
					<tbody>
						<%
							String transacNo = "";
							String policyNo = "";
							String customerName = "";
							String pPremium = "";
							String date = "",sdate="",edate="";
							
							try {
								//String type = (String) session.getAttribute("type");
								Connection conn = new Connect().myDBConnect();
								int id = (Integer) session.getAttribute("Id");										
									String sql = "select trans_no,pol_no,cust_id,amt,date,sdate,edate from payment where agent_id=" + id;
									Statement stmt = conn.createStatement();
									ResultSet rs = stmt.executeQuery(sql);
									
									while (rs.next()) {
										int a = rs.getInt(3);
										String sql1 = "select c_fname,c_lname from customer where cust_id=?" ;
										PreparedStatement stmt1 = conn.prepareStatement(sql1);
										stmt1.setInt(1,a);
										ResultSet rs1 = stmt1.executeQuery();
										rs1.next();
										transacNo = rs.getString(1);
										policyNo = rs.getString(2);
										customerName = rs1.getString(1)+" "+rs1.getString(2);
										pPremium = rs.getString(4);
										date = rs.getString(5);
										sdate = rs.getString(6);
										edate = rs.getString(7);
						%>
						<tr>
							<td>
								<%

									out.print(transacNo);
								%>
							</td>
							<td>
								<%
									out.print(policyNo);
								%>
							</td>
							<td>
								<%out.print(sdate+"&nbsp to &nbsp"+edate); %>
							</td>
							<td>
								<%
									out.print(customerName);
								%>
							</td>
							<td>
								<%
									out.print(date);
								%>
							</td>
							<td>
								<%
									out.print("₹ "+pPremium);
								%>
							</td>

						</tr>

						<!-- /.row -->
						<%
						}
								}
							catch (Exception e) {
								System.out.println(e);
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at
			11:59 PM</div>
	</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- /.content-wrapper -->

	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright &copy; Your Website 2017</small>
			</div>
		</div>
	</footer>

	<!-- Scroll to Top Button -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/sb-admin.min.js"></script>

</body>

</html>

