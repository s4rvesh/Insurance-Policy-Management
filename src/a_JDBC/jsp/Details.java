package a_JDBC.jsp;

import java.sql.*;

public class Details {
	public int[][] c_details(int agent_id) {
		int cnt;
		int[][] details = new int[30][2];
		for (int i = 0; i < 30; i++) {
			for (int j = 0; j < 2; j++) {
				details[i][j] = 0;
			}
		}
		String sql1 = "select cust_id,pol_no from customer_agent_policy where agent_id=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, agent_id);
			ResultSet rs1 = stmt1.executeQuery();
			cnt = 0;
			while (rs1.next()) {
				details[cnt][0] = rs1.getInt(1);
				details[cnt][1] = rs1.getInt(2);
				cnt++;
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
		return details;
	}

	public static void main(String args[]) {
		int details[][] = new Details().c_details(4);
		for (int i = 0; i < 30; i++) {
			if (details[i][1] == 0) {
				break;
			} else {
				System.out.println("Cust_id:" + details[i][0]);
				System.out.println("Pol_no:" + details[i][1]);
			}
		}
	}
}