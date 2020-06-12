package JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Prem_duration {
	public  int p_dur(int pol_no) {
		int duration = 0;
		String sql1 = "select duration from policy where pol_no=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			duration= rs1.getInt(1);
			//System.out.println("Date:"+p_date);
			//return p_date;
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
		return duration;
	}
	
	/*public static void main(String args[])
	{
		Date d=new prem_date().due_date(1,897456123);
		System.out.println("Key="+d);
	}*/
	
}