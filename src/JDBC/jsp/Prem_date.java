package JDBC.jsp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Prem_date {
	public Date due_date(int cust_id, int pol_no) {
		Date p_date = null;
		String sql1 = "select prem_pdate from customer_policy where cust_id=? AND pol_no=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, cust_id);
			stmt1.setInt(2, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			p_date = rs1.getDate("prem_pdate");
			// System.out.println("Date:"+p_date);
			// return p_date;
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
		return p_date;
	}

	/*
	 * public static void main(String args[]) { Date d=new
	 * prem_date().due_date(1,897456123); System.out.println("Key="+d); }
	 */

}
