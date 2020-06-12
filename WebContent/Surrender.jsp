<%@ page import="JDBC.jsp.*,java.sql.*"%>
<%@ page import="java.text.*"%>


<html>
<%
	int id = (Integer) session.getAttribute("Id");
	String pol_no = request.getParameter("pol_no");
	int total = new custInvestments().myInvestments(pol_no, id);
	
	/* double i = 1.05 * total;
	DecimalFormat df = new DecimalFormat("#.##"); */
%>
<script type="text/javascript">
	$(document).ready(function() {

		$(".SureSurrender").click(function() {
			var pol_no =
<%=pol_no%>
	;
			$('#main').load('SurrenderFinal.jsp?pol_no=' + pol_no);
		});
		$(".backToMyPolicies").click(function() {
			$('#main').load('myPolicies.jsp');
		});

	});
</script>



<div class="container">
	<h1
		style="margin: 3%; margin-bottom: 0; margin-left: 0; font-size: 4.2em text-align:center;">Policy
		History</h1>

	<%
		String transacNo = "";
		String agentName = "";
		String policyName = "";
		String date = "";

		int pol = Integer.parseInt(pol_no);
		try {
			//String type = (String) session.getAttribute("type");
			Connection conn = new Connect().myDBConnect();
			String sql = "select sum(amt) from payment where pol_no=? AND cust_id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, pol);
			stmt.setInt(2, id);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			/* 
			
			String sql9 = "select agent_id from payment where pol_no=? AND cust_id=?";
			PreparedStatement stmt9 = conn.prepareStatement(sql9);
			stmt9.setInt(1, pol);
			stmt9.setInt(2, id);
			ResultSet rs9 = stmt.executeQuery();
			rs9.next();
			int a = rs9.getInt(1);
			 	String sql1 = "select a_fname,a_lname from agent where agent_id=?" ;
				PreparedStatement stmt1 = conn.prepareStatement(sql1);
				stmt1.setInt(1,a);
				ResultSet rs1 = stmt1.executeQuery();
				rs1.next();  */
			String sql2 = "select p_name from policy where pol_no=?";
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt2.setInt(1, pol);
			ResultSet rs2 = stmt2.executeQuery();
			rs2.next();
			String sql3 = "select prem_edate from customer_policy where pol_no=? and cust_id=?";
			PreparedStatement stmt3 = conn.prepareStatement(sql3);
			stmt3.setInt(1, pol);
			stmt3.setInt(2, id);
			ResultSet rs3 = stmt3.executeQuery();
			rs3.next();

			//agentName = rs1.getString(1)+" "+rs1.getString(2);
			date = rs3.getString(1);
			policyName = rs2.getString(1);
	%>



	<!-- Project One -->

	<div class="row"
		style="border: solid grey 1px; box-shadow: 1px 1px 1px 1px grey; margin-top: 2.7em; margin-bottom: 3em; padding: 2em; background-color: white;">

		<div class="col-md-12">

			<div class="row" style="text-align: center;">

				<div class="col-md-3">

					<span style="color: grey; font-size: 1.2em;">Policy name </span>

				</div>
				<div class="col-md-3">
					<span style="color: grey; font-size: 1.2em;">Invested Amount
					</span>
				</div>

				<!-- <div class="col-md-2">
					<span style="color: grey; font-size: 1.2em;">Agent Name</span>
				</div> -->
				<div class="col-md-3">
					<span style="color: grey; font-size: 1.2em;">Amount on
						Surrender<br>
					</span>
				</div>
				<div class="col-md-3">
					<span style="color: grey; font-size: 1.2em">Maturity Date<br></span>
				</div>
			</div>
			<hr>
			<div class="row" style="text-align: center;">

				<div class="col-md-3">

					<span style="font-size: 2em;"> <%
 	out.println(policyName);
 %>
					</span>
				</div>

				<div class="col-md-3">
					<span style="font-size: 1.6em;"> <%=total%>
					</span>
				</div>

				<%-- 	<div class="col-md-2">

					<span style="font-size: 1.6em;"> <%
 	out.println(agentName);
 %>
					</span>
				</div> --%>

				<div class="col-md-3">

					<span style="font-size: 1.6em;"> <%int x1 = new surrenderValueProcedure().surrenderValue(total);
					out.println(x1);
					%> <%-- <%=df.format(i)%> --%>

					</span>
				</div>
				<div class="col-md-3">

					<span style="font-size: 1.6em;"> <%
 	out.println(date);
 %>
					</span>
				</div>
			</div>

		</div>
	</div>

	<!-- /.row -->

	<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	<!-- /.container -->
</div>
<div style="margin-left: 25%; margin-top: 10%;">
	<button type="button"
		style="width: 200px; height: 65px; font-size: 1.7em;"
		class="btn btn-danger SureSurrender">
		<b>Yes,I am Sure</b>
	</button>




	<button type="button"
		style="margin-left:8em; width: 200px; height: 65px; font-size: 1.7em;"
		class="btn btn-primary backToMyPolicies">
		<b>No</b>
	</button>
</div>

</html>