<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#cont").delegate('.add_policy', 'click', function() {
			var cust_id = $(this).attr('id');
			$('#amain').load('addPolicyForm.jsp?cust_id=' + cust_id);
		});
		
		$("#search-name").keyup(function() {
			name = $("#search-name").val();
			$.ajax({
				type : "POST",
				url : "search_customer_policy.jsp",
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
				<h1 class="my-4">Add Policy</h1>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
			
			<form >
			  <div class="input-group" style="margin-left:22em;">
			   <input style=" margin-top:2.0em; "type='text' id="search-name"class='form-control' placeholder='Search Customers...'> <span class="input-group-btn"> 
			   <button class="btn btn-primary" style=" margin-top:2.0em;" type="button"> <i class="fa fa-search"></i> 
			   </button>
			   </span>
			   </div>
			   </form>
				<!-- <input type="text" id="search-name">-->	
			</div>
			<div class="col-md-3">
			</div>
			<div class="col-md-1"></div>
			
		</div>
			<hr>		
		<div id="cont">

			<%
				try {

					Connection conn = new Connect().myDBConnect();

					int id = (Integer) session.getAttribute("Id");
					System.out.println("ID:" + id);

					int cust[] = new int[30];
					int cnt = 0, cnt2 = 0, cnt3 = 0;
					String fname = "";
					String mname = "";
					String lname = "";
					String pol_no[] = new String[30];
					int modeli = 0;
					String email = "";
					String phone = "";
					String addr = "";

					String names[] = new String[20];

					String sql1 = "select cust_id from customer_agent_policy where agent_id=?";
					String sql2 = "select c_fname,c_mname,c_lname from customer where cust_id=?";
					String sql3 = "select pol_no from customer_agent_policy where cust_id=? and agent_id=?";
					PreparedStatement stmt1 = conn.prepareStatement(sql1);
					PreparedStatement stmt2 = conn.prepareStatement(sql2);
					PreparedStatement stmt3 = conn.prepareStatement(sql3);
					stmt1.setInt(1, id);
					ResultSet rs1 = stmt1.executeQuery();

					while (rs1.next()) {
						int cust_check = rs1.getInt(1);
						if (cnt != 0) {
							if (cust_check == cust[cnt - 1])
								cnt--;
						}
						cust[cnt++] = cust_check;
					}

					for (int i = 0; i < cnt; i++) {
						modeli++;
						int j = cust[i];
						stmt2.setInt(1, j);
						ResultSet rs2 = stmt2.executeQuery();
						rs2.next();
						fname = rs2.getString("c_fname");
						mname = rs2.getString("c_mname");
						lname = rs2.getString("c_lname");
						String full = fname + " " + mname + " " + lname;
						stmt3.setInt(1, j);
						stmt3.setInt(2, id);
						ResultSet rs3 = stmt3.executeQuery();
						while (rs3.next()) {
							pol_no[cnt3++] = rs3.getString(1);
						}
			%>




		

			<!-- Project One -->

			<div class="row">
				<div class="col-md-4">
					<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
						src="http://placehold.it/700x300" alt="">
					</a>
				</div>
				<div class="col-md-8">
					<h3>
						<%
							out.print(full);
						%>


					</h3>
					<h5>
						<%
							out.print("<br> Policy name(s): ");
									for (int k = 0; k < cnt3; k++) {
										if (pol_no[k] != null)
											out.println(new Prem_name().p_name(Integer.parseInt(pol_no[k])) + "<br><span style='padding-left:7.1em;'></span>");
									}
						%>

					</h5>
					<button type="button" style="margin-left: 80%; margin-top: -25%;"
						class="btn btn-primary add_policy" id="<%=j %>" data-toggle="modal">Add Policy</button>
				</div>
			</div>
			<!-- /.row -->

			<hr>
			<%
				cnt3 = 0;
					}
					if (rs1 != null) {
						try {
							rs1.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
					if (stmt1 != null) {
						try {
							stmt1.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
					if (stmt2 != null) {
						try {
							stmt2.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					}
					if (stmt3 != null) {
						try {
							stmt3.close();
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
	</div>
	<!-- /.container -->
</body>


</html>
