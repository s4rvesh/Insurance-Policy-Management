<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.*"%>
<%
	int id = (Integer) session.getAttribute("Id");
	//String [] tuple=new String[10];
	String sql1, sql2, sql3, sql4, sql5, sql6;
	String firstname = request.getParameter("first_name");
	String middlename = request.getParameter("middle_name");
	String lastname = request.getParameter("last_name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	sql1 = "update customer " + "set c_fname = '" + firstname + "' where cust_id= " + id + ";";
	sql2 = "update customer " + "set c_mname = '" + middlename + "' where cust_id= " + id + ";";
	sql3 = "update customer " + "set c_lname = '" + lastname + "' where cust_id= " + id + ";";
	sql4 = "update customer " + "set c_email = '" + email + "' where cust_id= " + id + ";";
	sql5 = "update customer " + "set c_phone = '" + phone + "' where cust_id= " + id + ";";
	sql6 = "update customer " + "set c_addr = '" + address + "' where cust_id= " + id + ";";

	//out.println(sql6);
	try {
		int i = 0;
		Connection conn = new Connect().myDBConnect();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql1);
		stmt.executeUpdate(sql2);
		stmt.executeUpdate(sql3);
		stmt.executeUpdate(sql4);
		stmt.executeUpdate(sql5);
		stmt.executeUpdate(sql6);
	} catch (Exception e) {
		System.out.println(e);
	}
	response.sendRedirect("index.jsp");
%>