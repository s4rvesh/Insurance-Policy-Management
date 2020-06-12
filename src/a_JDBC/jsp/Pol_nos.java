package a_JDBC.jsp;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import com.mysql.jdbc.Statement;

public class Pol_nos {
	public  int[] p_name() {
		int cnt=0;
		int[] nos = new int[50];
		for(int i=0;i<50;i++)
		{
			nos[i]=0;
		}
		String sql1 = "select pol_no from policy where 1";
		try {
			Connection conn = new Connect().myDBConnect();
			java.sql.Statement stmt1 = conn.createStatement();
			ResultSet rs1 = stmt1.executeQuery(sql1);
			while(rs1.next())
			nos[cnt++]= rs1.getInt(1);
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
		return nos;
	}
	
	/*public static void main(String args[])
	{
		Date d=new prem_date().due_date(1,897456123);
		System.out.println("Key="+d);
	}*/
	
}