package JDBC.jsp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Premium {
	public int date(int cust_id, int pol_no) {
		int date_diff = 100;
		String sql1 = "select prem_pdate from customer_policy where cust_id=? AND pol_no=?";
		String sql2= "select datediff(?,curdate())";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt1.setInt(1, cust_id);
			stmt1.setInt(2, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			Date p_date= rs1.getDate("prem_pdate");
			System.out.println("Date:"+p_date);
			stmt2.setDate(1, p_date);
			ResultSet rs2= stmt2.executeQuery();
			rs2.next();
			date_diff=rs2.getInt(1);
			if (rs1 != null) {
				try {
					rs1.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			if (rs2 != null) {
				try {
					rs2.close();
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

		return date_diff;

	}
	
	public static void main(String args[])
	{
		int key=new Premium().date(1,897456123);
		System.out.println("Key="+key);
	}
	
}
