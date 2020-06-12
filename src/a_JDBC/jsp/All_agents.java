package a_JDBC.jsp;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import com.mysql.jdbc.Statement;

public class All_agents {
	public  String[][] all_agn() {
		int cnt=0,op;
		String[][] name = new String[50][2];
		String t1,t2;
		String sql1 = "select agent_id,a_fname,a_lname from agent where 1";
		try {
			Connection conn = new Connect().myDBConnect();
			java.sql.Statement stmt1 = conn.createStatement();
			ResultSet rs1 = stmt1.executeQuery(sql1);
			while(rs1.next())
			{
				t1=rs1.getString(2);
				t2=rs1.getString(3);
				name[cnt][0]= t1+" "+t2;
				op=rs1.getInt(1);
				name[cnt++][1]=Integer.toString(op);
			}
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