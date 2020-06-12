package JDBC.jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import JDBC.jsp.Connect;

public class Agent_login {

	public int ID(String u_name, String pass) {
		int agent_id = 122;
		String sql;
		sql = "select agent_id from agent where a_uname=? AND a_passwd=?";
		try {

			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, u_name);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			agent_id = rs.getInt("agent_id");
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
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

		return agent_id;

	}

}
