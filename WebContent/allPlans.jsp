<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#search-name").keyup(function() {
			console.log = "Yeess";
			name = $("#search-name").val();
			$.ajax({
				type : "POST",
				url : "search_plans.jsp",
				data : "name=" + name,
				success : function(data) {
					$("#cont").html(data);
				}
			});
		});

	});
</script>

</head>

<body style="color: #03275A !important;">

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-md-4">
				<h1 class="my-4">All Plans</h1>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">

				<form>
					<div class="input-group" style="margin-left: 22em;">
						<input style="margin-top: 2.0em;" type='text' id="search-name"
							class='form-control' placeholder='Search all plans...'> <span
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




		<hr>
		<div id="cont">
			<%
				String pName = "";
				String pDuration = "";
				String pLatefee = "";
				String pPremium = "";
				String pComission = "";
				String imgUrl = "";
				int modeli = 1;
				try {
					String type = (String) session.getAttribute("type");
					Connection conn = new Connect().myDBConnect();
					int id = (Integer) session.getAttribute("Id");/*
																	String policydetails = "select pol_no from customer_policy ";
																	Statement s = conn.createStatement();
																	ResultSet agentlist = s.executeQuery(policydetails); */
					// 		while (agentlist.next()) {

					String sql = "select p_name, duration, late_fee, premium, commision, image from policy where 1";

					//	stmt.setInt(1, agentlist.getInt(1));*/
					java.sql.Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
						pName = rs.getString(1);
						pDuration = rs.getString(2);
						pLatefee = rs.getString(5);
						pPremium = rs.getString(3);
						pComission = rs.getString(4);
						imgUrl = rs.getString(6);
			%>
			

			<!-- Project One -->

			<div class="row">
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
						src="<% out.print(imgUrl);%>" alt="">
					</a>
				</div>
				<div class="col-md-8">
					<h3>
						<%
							out.println(pName);
						%>
					</h3>
					<p>
						<b>Policy Duration: </b>
						<%
							out.println(pDuration+" months");
						%><br> <b>Late Fee: </b>
						<%
							out.println(pLatefee+" %");
						%><br> <b>Premium Amount: </b>
						<%
							out.println("₹ "+pPremium);
						%>
					</p>
					<!-- Button trigger modal -->
					<button type="button" style="margin-left: 80%; margin-top: -33%;"
						class="btn btn-primary" data-toggle="modal"
						data-target="#polDetModal<%out.print(modeli);%>">Policy
						Details</button>

					<%
						String polDetailsSql = "select descp from policy_description where p_name='" + pName + "';";
						Statement polDetCon = conn.createStatement();
						ResultSet polDescRes = polDetCon.executeQuery(polDetailsSql);
						polDescRes.next();
					%>

					<!-- Modal -->
					<div class="modal fade" id="polDetModal<%out.print(modeli);%>"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">
										<%
											out.println(pName);
										%>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<%
										out.println(polDescRes.getString(1));
									%>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<hr>
			<%
				modeli++;
					}
					//}
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
					if (stmt != null) {
						try {
							stmt.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
				} catch (Exception e) {
					System.out.println(e+"Hoo");
				}
			%>
		</div>
	</div>
</body>


</html>
