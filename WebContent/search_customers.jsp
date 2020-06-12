<%@ page import="java.sql.*,a_JDBC.jsp.*"%>
<%@ page import="JDBC.jsp.Prem_name"%>
<%
	try {
		String r_name = request.getParameter("name");
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
			int j = cust[i];
			stmt2.setInt(1, j);
			ResultSet rs2 = stmt2.executeQuery();
			rs2.next();

			fname = rs2.getString("c_fname");
			mname = rs2.getString("c_mname");
			lname = rs2.getString("c_lname");
			String full = fname + " " + mname + " " + lname;
			if ((!full.toLowerCase().contains(r_name.toLowerCase())))
				continue;
			modeli++;
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
		<!-- Button trigger modal -->
		<button type="button" style="margin-left: 80%; margin-top: -25%;"
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
							String sql4 = "select c_phone, c_addr, c_email from customer where cust_id=?";
									PreparedStatement stmt4 = conn.prepareStatement(sql4);
									stmt4.setInt(1, j);
									ResultSet rs4 = stmt4.executeQuery();
									rs4.next();
									out.println("Name: " + fname + " " + mname + " " + lname + "<br>");
									out.println("Policy number(s): ");
									for (int k = 0; k < 10; k++) {
										if (pol_no[k] != null)
											out.println(pol_no[k] + " ");
									}
									out.println("<br>");
									out.println("Phone: " + rs4.getString("c_phone") + "<br>");
									out.println("Address: " + rs4.getString("c_addr") + "<br>");
									out.println("Email: " + rs4.getString("c_email") + "<br>");
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