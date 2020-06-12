<%@ page import="JDBC.jsp.*"%>
<%@ page import="a_JDBC.jsp.All_agents"%>
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
				url : "search_agents.jsp",
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
				<h1 class="my-4">All Agents</h1>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<form>
					<div class="input-group" style="margin-left: 22em;">
						<input style="margin-top: 2.0em;" type='text' id="search-name"
							class='form-control' placeholder='Search all Agents...'>
						<span class="input-group-btn">
							<button class="btn btn-primary" style="margin-top: 2.0em;"
								type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-1"></div>
		</div>
		<div id="cont">
		<hr>
			<%
				int cnt = 0, cnt2 = 0, cnt3 = 0, modeli = 0;
				String names[][] = new All_agents().all_agn();
				for (int i = 0; i < 50; i++) {
					if (names[i][0] == null)
						break;
					String full = names[i][0];
					int agent_id = Integer.parseInt(names[i][1]);
					modeli++;
					try {
						Connection conn = new Connect().myDBConnect();
						String sql4 = "select a_phone, a_addr, a_email from agent where agent_id=?";
						PreparedStatement stmt4 = conn.prepareStatement(sql4);
						stmt4.setInt(1, agent_id);
						ResultSet rs4 = stmt4.executeQuery();
						rs4.next();
						String p_no = rs4.getString("a_phone");
						String addr = rs4.getString("a_addr");
						String email = rs4.getString("a_email");
			%>
			

			<!-- Project One -->

			<div class="row">
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
						src="http://placehold.it/700x300" alt="">
					</a>
				</div>
				<div class="col-md-8">
					<h3 style="margin-top: 0.4em;">
						<%
							out.print(full);
						%></h3>
						<p style="margin-top:1em">
							<b>Agent ID: </b>
							<%
								out.println(agent_id);
							%><br> <b>Phone Number: </b>
							<%
								out.println(p_no);
							%>
						</p>
					<!-- Button trigger modal -->
					<button type="button" style="margin-left: 80%; margin-top: -29%;"
						class="btn btn-primary" data-toggle="modal"
						data-target="#polDetModal<%out.print(modeli);%>">View
						Details</button>

					<!-- Modal -->
					<div class="modal fade" id="polDetModal<%out.print(modeli);%>"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">
										<%
											out.println("Details");
										%>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<%
										out.println("Name: " + full + "<br>");
												out.println("Phone: " + p_no + "<br>");
												out.println("Address: " + addr + "<br>");
												out.println("Email: " + email + "<br>");
												if (stmt4 != null) {
													try {
														stmt4.close();
													} catch (SQLException e) {
														System.out.println(e);
													}
												}
												if (rs4 != null) {
													try {
														rs4.close();
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
												System.out.println(e);
											}
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
				}
			%>
		</div>
	</div>
	<!-- /.container -->
</body>


</html>
