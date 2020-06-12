package JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import a_JDBC.jsp.Connect;

public class no_pol {
	public int get_no(int cust_id) {
		int total = 101;
		String sql1 = "select count(pol_no) from customer_policy where cust_id=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, cust_id);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			total = rs1.getInt(1);
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
		return total;
	}
}
