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
			if((!full.toLowerCase().contains(r_name.toLowerCase())))
				continue;
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