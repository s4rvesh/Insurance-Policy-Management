package JDBC.jsp;

import java.sql.*;

public class surrenderPolicy {

	public void deletefromALL(String pol, int id) {

		int pol_no = Integer.parseInt(pol);

		try {
			Connection conn = new Connect().myDBConnect();

			String sql;
			sql = "delete from customer_agent_policy where pol_no =? AND cust_id =?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, pol_no);
			stmt.setInt(2, id);
			stmt.executeUpdate();

			/*sql1 = "delete from customer_policy where pol_no =? AND cust_id=?";
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, pol_no);
			stmt1.setInt(2, id);
			stmt1.executeUpdate();*/
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
