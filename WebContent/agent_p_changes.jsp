
<%@ page import="java.sql.*"%>
<%@ page import="a_JDBC.jsp.*"%>
<%

int id = (Integer) session.getAttribute("Id");
	//String [] tuple=new String[10];
	String sql1, sql3, sql4, sql5,sql6;
	String firstname=request.getParameter("first_name");
	String lastname=request.getParameter("last_name");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	
	sql1 = "update agent "+"set a_fname = '"+firstname+"' where agent_id= " + id + ";";
	//sql2 = "update agent "+"set c_mname = '"+middlename+"' where agent_id= " + id + ";";
	sql3 = "update agent "+"set a_lname = '"+lastname+"' where agent_id= " + id + ";";
	sql4 = "update agent "+"set a_email = '"+email+"' where agent_id= " + id + ";";
	sql5 = "update agent "+"set a_phone = '"+phone+"' where agent_id= " + id + ";";
	sql6 = "update agent "+"set a_addr = '"+address+"' where s= " + id + ";";
	
	
	//out.println(sql6);
	try {
		int i=0;
		Connection conn = new Connect().myDBConnect();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql1);
		stmt.executeUpdate(sql3);
	stmt.executeUpdate(sql4);
		stmt.executeUpdate(sql5);
		stmt.executeUpdate(sql6);
	} catch (Exception e) {
		System.out.println(e);
	}
	response.sendRedirect("aindex.jsp");

%>