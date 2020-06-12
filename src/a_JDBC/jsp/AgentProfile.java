package a_JDBC.jsp;
//import JDBC.jsp.*;
//import java.sql.DriverManager;
import java.sql.*;

import JDBC.jsp.Connect;



public class AgentProfile {

public String[] agent_p(String u_name) {

				String [] tuple=new String[10];
				//String name = "";
				String sql;
				sql = "select agent_id,a_fname,a_lname,a_addr,a_phone,a_email from agent where a_uname=?;";

				try {
					int i=0;
					Connection conn = new Connect().myDBConnect();
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setString(1, u_name);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()) {
						tuple[0]=rs.getString("a_fname");
					//	tuple[1]=rs.getString("a_mname");
						tuple[2]=rs.getString("a_lname");
						tuple[3]=rs.getString("a_addr");
						tuple[4]=rs.getString("a_phone");
						//tuple[5]=(String)rs.getString("c_dob");
						tuple[5]=rs.getString("a_email");
						
					}
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

				return tuple;

			

		

		
	}

}
