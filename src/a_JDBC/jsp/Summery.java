package a_JDBC.jsp;

import java.sql.*;

import JDBC.jsp.Connect;

public class Summery {
	String sql = "SELECT p_name from policy WHERE pol_no = (SELECT pol_no FROM customer_agent_policy where agent_id = 1)";
	
/*	ResultSet getSummery(int agentId) {
		String polIdsql = "SELECT DISTINCT pol_no FROM customer_agent_policy where agent_id = "+agentId;*/
		//String pol
		
/*		try {
			Connection conn = new Connect().myDBConnect();
			Statement stPolId = conn.createStatement(); 
			ResultSet rsPolId = stPolId.executeQuery(polIdsql);
			while(rsPolId.next()) {
				rsPolId.getInt(1);
			}
			return rsPolId;
			conn.close();*/
/*		} catch (Exception e) {
			// TODO: handle exception
		}*/
		
		
		//return "Hi";
//	}
}
