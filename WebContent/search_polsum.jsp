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
<%
	String r_name = request.getParameter("name");
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
			if((!pName.toLowerCase().contains(r_name.toLowerCase())))
				continue;
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