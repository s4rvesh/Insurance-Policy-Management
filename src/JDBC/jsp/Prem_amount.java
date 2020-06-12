package JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Prem_amount {
	public int[] p_details(int pol_no) {
		int details[] = new int[3];
		String sql1 = "select premium,commision,late_fee from policy where pol_no=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			details[0] = rs1.getInt(1);
			details[1] = rs1.getInt(2);
			details[2] = rs1.getInt(3);
			//System.out.println(details[0]);
			//System.out.println(details[1]);
			//System.out.println(details[2]);
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
		return details;
	}

	

}