package a_JDBC.jsp;

import java.sql.*;


public class Add_agent {
	public void addAgentInfo(String fname, String lname, String email, String phone, String add, String uname, String passwd) {
		String sql = "INSERT INTO agent(a_uname,a_passwd,a_email,a_phone,a_addr,a_fname,a_lname,image) VALUES (?,?,?,?,?,?,?,?)";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, uname);
			prep.setString(2, passwd);
			prep.setString(3, email);
			prep.setString(4, phone);
			prep.setString(5, add);
			prep.setString(6, fname);
			prep.setString(7, lname);
			prep.setString(8, "images/newpolicy.png");
			prep.execute();
			if (prep != null) {
				try {
					prep.close();
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
			System.out.println("Exception Occured: "+e);
		}
		//return 1;
	}
	
}
