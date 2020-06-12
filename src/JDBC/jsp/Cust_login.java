package JDBC.jsp;

import java.sql.*;

import JDBC.jsp.Connect;

public class Cust_login {

	public int ID(String u_name, String pass) {

		int cust_id = 122;
		String name = "";
		String sql;
		sql = "select cust_id,c_fname from customer where c_uname=? AND c_passwd=?";

		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, u_name);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			rs.next();

			// System.out.println(rs.getInt(1) + " " + rs.getString(2));
			cust_id = rs.getInt("cust_id");
			name = rs.getString("c_fname");
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
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
			return cust_id;
		} catch (Exception e) {
			System.out.println(e);
		}

		return cust_id;

	}

}
