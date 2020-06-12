<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="a_JDBC.jsp.Cust_comm"%>
<%@ page import="a_JDBC.jsp.Cust_name"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#search-pol").keyup(function() {
			name = $("#search-pol").val();
			$.ajax({
				type : "POST",
				url : "search_polsum.jsp",
				data : "name=" + name,
				success : function(data) {
					$("#cont1").html(data);
				}
			});
		});
		
		
		$("#search-cust").keyup(function() {
			name = $("#search-cust").val();
			$.ajax({
				type : "POST",
				url : "search_custsum.jsp",
				data : "name=" + name,
				success : function(data) {
					$("#cont2").html(data);
				}
			});
		});

	});
</script>
</head>
<body>

	<div class="card mb-3">
		<div class="card-header" style="font-size: 1.4em">
			<i class="fa fa-table"></i> Policy Summary
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6"></div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>Search:<input type="search" id="search-pol"
									class="form-control form-control-sm"
									placeholder="Search Policy.."></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" width="100%"
								id="dataTable" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Policy</th>
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Duration</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 10em;">Customer Count</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 8.5em;">Total Commission Earned</th>
									</tr>
								</thead>
								<tbody id="cont1">
									<%
										String pName = "";
										double pMaturity;
										int modeli = 1;
										try {
											String type = (String) session.getAttribute("type");
											Connection conn = new Connect().myDBConnect();
											int id = (Integer) session.getAttribute("Id");
											String policyIdsql = "SELECT DISTINCT pol_no FROM customer_agent_policy where agent_id = " + id;
											Statement s = conn.createStatement();
											ResultSet rsPolicylist = s.executeQuery(policyIdsql);
											while (rsPolicylist.next()) {
												String custCountsql = "SELECT DISTINCT COUNT(cust_id) FROM customer_agent_policy where pol_no = ?";
												String totalCommisql = "SELECT sum(commision) FROM payment WHERE agent_id =" + id
														+ " AND pol_no=?;";
												int pol_no = rsPolicylist.getInt(1);
												PreparedStatement prepcustCount = conn.prepareStatement(custCountsql);
												prepcustCount.setInt(1, pol_no);

												PreparedStatement preptotalCommi = conn.prepareStatement(totalCommisql);
												preptotalCommi.setInt(1, pol_no);
												ResultSet rsCount = prepcustCount.executeQuery();
												ResultSet rsTotalCommi = preptotalCommi.executeQuery();
												rsCount.next();
												rsTotalCommi.next();
												pName = new Prem_name().p_name(pol_no);
												int cusCount = rsCount.getInt(1);
												int totalCommi = rsTotalCommi.getInt(1);
									%>

									<tr role="row">
										<td class="sorting_1">
											<%
												out.println(pName);
											%>
										</td>
										<td>
											<%
												int duration = new Prem_duration().p_dur(pol_no);
														out.println(duration + " months");
											%>
										</td>
										<td>
											<%
												out.println(cusCount);
											%>
										</td>
										<td>
											<%
												out.println("₹ " + totalCommi);
											%>
										</td>
									</tr>
									<%
										}
											conn.close();
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-3">
		<div class="card-header" style="font-size: 1.4em">
			<i class="fa fa-table"></i> Customer Summary

		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6"></div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>Search:<input type="search" id="search-cust"
									class="form-control form-control-sm"
									placeholder="Search Customer.."></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" width="100%"
								id="dataTable" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Customer</th>
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Number of Policies</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 10em;">Total Investment</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 8.5em;">Total Commission Earned</th>
									</tr>
								</thead>
								<tbody id="cont2">
									<%
										String pName1 = "";
										double pMaturity1;
										int modeli1 = 1;
										try {
											String type = (String) session.getAttribute("type");
											Connection conn = new Connect().myDBConnect();
											int id = (Integer) session.getAttribute("Id");
											String custIdsql = "SELECT DISTINCT cust_id FROM customer_agent_policy where agent_id = " + id;
											Statement crCustId = conn.createStatement();
											ResultSet rsCustId = crCustId.executeQuery(custIdsql);

											while (rsCustId.next()) {
												int cust_id = rsCustId.getInt(1);
												int agent_id = id;

												int totalCommi = new Cust_comm().comm(cust_id, agent_id);
												int totalInvest = new custAllInvestments().all(cust_id);
												String name[] = new Cust_name().c_name(cust_id);
												String full = name[0] + " " + name[1] + " " + name[2];
									%>

									<tr role="row">
										<td class="sorting_1">
											<%
												out.println(full);
											%>
										</td>
										<td>
											<%
												out.println(new no_pol().get_no(cust_id));
											%>
										</td>
										<td>
											<%
												out.println("₹ " + totalInvest);
											%>
										</td>
										<td>
											<%
												out.println("₹ " + totalCommi);
											%>
										</td>
									</tr>
									<%
										}
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>