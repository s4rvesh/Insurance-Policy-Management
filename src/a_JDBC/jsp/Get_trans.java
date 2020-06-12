package a_JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Get_trans {
	public int get_no(int cust_id,int agent_id) {
		int trans_no=101;
		String sql1 = "select trans_no from payment where cust_id=? AND agent_id=? order by(trans_no) desc LIMIT 1;";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, cust_id);
			stmt1.setInt(2, agent_id);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			trans_no = rs1.getInt(1);
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
		return trans_no;
}
}