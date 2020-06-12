package JDBC.jsp;

import java.sql.*;

import JDBC.jsp.Connect;
public class cust_profile {



		public String[] cust_p(String u_name) {

			String [] tuple=new String[10];
			//String name = "";
			String sql;
			sql = "select cust_id,c_fname,c_mname,c_lname,c_addr,c_phone,c_dob,c_email from customer where c_uname=?;";

			try {
				int i=0;
				Connection conn = new Connect().myDBConnect();
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, u_name);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					tuple[0]=rs.getString("c_fname");
					tuple[1]=rs.getString("c_mname");
					tuple[2]=rs.getString("c_lname");
					tuple[3]=rs.getString("c_addr");
					tuple[4]=rs.getString("c_phone");
					tuple[5]=(String)rs.getString("c_dob");
					tuple[6]=rs.getString("c_email");
					
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
