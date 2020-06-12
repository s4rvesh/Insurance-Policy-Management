package a_JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cust_comm {
	public  int comm(int cust_id,int agent_id) {
		int sum = 0;
		String sql1 = "SELECT sum(commision) FROM payment WHERE agent_id =? AND cust_id=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, agent_id);
			stmt1.setInt(2, cust_id);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			sum= rs1.getInt(1);
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
		return sum;
	}

}
