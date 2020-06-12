<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Date"%>

<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<script type="text/javascript">
	$(document).ready(function() {

		$(".surrender").click(function() {
			var pol_no = $(this).attr('id');
			$('#main').load('Surrender.jsp?pol_no=' + pol_no);
		});

	});
</script>
<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body style="color: #03275A !important;">

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<h1 class="my-4">My Policies</h1>
		<hr>
		<%
			String pName = "";
			String pDuration = "";
			String pLatefee = "";
			String pPremium = "";
			Date maturity;
			String imgUrl = "";


			int modeli = 1;
			try {
				String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				String policydetails = "select pol_no from customer_policy where cust_id=" + id;
				Statement s = conn.createStatement();
				ResultSet agentlist = s.executeQuery(policydetails);
				while (agentlist.next()) {

					int f = agentlist.getInt(1);

					String sql = "select p_name, duration, premium, prem_edate,image from customer_policy,policy where customer_policy.pol_no=? and policy.pol_no=? and cust_id="
							+ id;

					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, agentlist.getInt(1));
					stmt.setInt(2, agentlist.getInt(1));

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						pName = rs.getString(1);
						pDuration = rs.getString(2);
						pPremium = rs.getString(3);
						maturity = rs.getDate(4);
						imgUrl = rs.getString(5);

		%>
		

		<!-- Project One -->

		<div class="row">
			<div class="col-md-4">
				<a href="#"> <img class="fixsize img-responsive img-fluid rounded mb-3 mb-md-0"
					src="<%out.print(imgUrl); %>" alt="">
				</a>
			</div>
			<div class="col-md-8">
				<h3>
					<%
						out.println(pName);
					%>
				</h3>
				<p style="margin-top:1em">
					<b>Policy Duration: </b>
					<%
						out.println(pDuration+" months");
					%><br> <b>Premium Amount: </b>
					<%
						out.println("₹ "+pPremium);
					%><br> <b>Maturity Date: </b>
					<%
						out.println(maturity);
					%>
				</p>
				<!-- Button trigger modal -->
				<button type="button" style="margin-left: 80%; margin-top: -34%;"
					class="btn btn-primary" data-toggle="modal"
					data-target="#polDetModal<%out.print(modeli);%>">Policy
					Details</button>

				<%
					String polDetailsSql = "select descp from policy_description where p_name='" + pName + "';";
								Statement polDetCon = conn.createStatement();
								ResultSet polDescRes = polDetCon.executeQuery(polDetailsSql);
								polDescRes.next();
				%>











				<button type="button" style="margin-left: 80%; margin-top: -10%;"
					class="btn btn-danger surrender" id="<%out.print(f);%>">Surrender</button>



















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
								%>s
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
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	</div>
	<!-- /.container -->
</body>


</html>
