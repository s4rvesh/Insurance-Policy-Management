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
<%@ page import="java.sql.*,JDBC.jsp.*"%>

<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.content-wrapper {
	background-color: #e8e8e8;
}
</style>

</head>

<body style="color: #03275A !important;">

	<!-- Page Content -->



	<div class="container">
		<h1
			style="margin: 3%; margin-bottom: 0; margin-left: 0; font-size: 2.2em;">Summary</h1>

		<%
			String pName = "";
			String pDuration = "";
			String pLatefee = "";
			String pPremium = "";
			String pComission = "";
			double pMaturity;
			int modeli = 1;
			try {
				String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				String policydetails = "select pol_no, prem_edate from customer_policy where cust_id=" + id;
				Statement s = conn.createStatement();
				ResultSet agentlist = s.executeQuery(policydetails);
				while (agentlist.next()) {
					String sql = "select p_name, duration, late_fee, premium, commision from policy where pol_no=?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, agentlist.getInt(1));

					Date maturityDate = null;
					maturityDate = agentlist.getDate(2);
					int pol = (agentlist.getInt(1));
					String pol_no = Integer.toString(pol);
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						pName = rs.getString(1);
						pDuration = rs.getString(2);
						pLatefee = rs.getString(3);
						pPremium = rs.getString(4);
						pComission = rs.getString(4);
						double dDuration = Double.parseDouble(pDuration);
						double dPremium = Double.parseDouble(pPremium);

						pMaturity = 1.10 * dDuration * dPremium;
						pMaturity = Math.round(pMaturity * 100) / 100;
		%>




		<!-- Project One -->

		<div class="row"
			style="border: solid grey 1px; box-shadow: 1px 1px 1px 1px grey; margin-top: 1.7em; margin-bottom: 3em; padding: 1.2em; background-color: white;">

			<div class="col-md-12">

				<div class="row" style="text-align: center;">

					<div class="col-md-3">

						<span style="color: grey; font-size: 1.1.2em;">Policy name </span>

					</div>
					<div class="col-md-3">
						<span style="color: grey; font-size: 1.1.2em">Maturity Date<br></span>
					</div>
					<div class="col-md-2">
						<span style="color: grey; font-size: 1.1.2em;">Invested
							Amount </span>
					</div>

					<div class="col-md-2">
						<span style="color: grey; font-size: 1.1.2em;">Amount on
							Maturity </span>
					</div>
					<div class="col-md-2">
						<span style="color: grey; font-size: 1.1.2em;">Amount on
							Surrender<br>
						</span>
					</div>

				</div>
				<hr>
				<div class="row" style="text-align: center;">

					<div class="col-md-3">

						<span style="font-size: 1.2em;"> <%
 	out.println(pName);
 %>
						</span>
					</div>
					<div class="col-md-3">

						<span style="font-size: 1em;"> <%
 	out.println(maturityDate);
 %>
						</span>
					</div>
					<div class="col-md-2">
						<span style="font-size: 1em;"> <%
 	out.print("₹");
 %> <%=new custInvestments().myInvestments(pol_no, id)%>
						</span>
					</div>

					<div class="col-md-2">

						<span style="font-size: 1em;"> <%
 	out.println("₹ " + pMaturity);
 %>
						</span>
					</div>

					<div class="col-md-2">

						<span style="font-size: 1em;"> <%
 	out.print("₹ ");
 %><%=1.05 * new custInvestments().myInvestments(pol_no, id)%>

						</span>
					</div>

				</div>

			</div>
		</div>

		<!-- /.row -->

		<%
			}
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		<!-- /.container -->
	</div>
</body>


</html>