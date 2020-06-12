package a_JDBC.jsp;

import java.sql.*;

public class Cust_name {
	public  String[] c_name(int cust_id) {
		String name[] = new String[3];
		String sql1 = "select c_fname,c_mname,c_lname from customer where cust_id=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, cust_id);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			name[0]= rs1.getString(1);
			name[1]= rs1.getString(2);
			name[2]= rs1.getString(3);
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
		return name;
	}
	
	/*public static void main(String args[])
	{
		Date d=new prem_date().due_date(1,897456123);
		System.out.println("Key="+d);
	}*/
	
}
