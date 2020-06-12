package JDBC.jsp;


import java.sql.*;

public class custInvestments {

	public int myInvestments(String pol,int id) {
	
		int pol_no = Integer.parseInt(pol);
		Date sdate,pdate;
		int total=-1;
		try {
			Connection conn = new Connect().myDBConnect();
			int diff;
			String sql1,sql2,sql3;
			sql1 = "select prem_sdate,prem_pdate from customer_policy where pol_no = ? and cust_id= ?";
			sql2 = "Select TIMESTAMPDIFF(MONTH,?,?)";
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt1.setInt(1, pol_no);
			stmt1.setInt(2, id);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			sdate =rs1.getDate(1);
			pdate =rs1.getDate(2);
			stmt2.setDate(1,sdate);
			stmt2.setDate(2, pdate);
			ResultSet rs2 = stmt2.executeQuery();
			rs2.next();
			diff=rs2.getInt(1);
			int details[]=new Prem_amount().p_details(pol_no);
			int premium=details[0];
			total=premium*diff;
		} catch (Exception e) {
			System.out.println(e);
		}

		return total;
	}
	
	/*public static void main(String args[])
	{
		int total=new custInvestments().myInvestments(897456126, 5);
		System.out.println("total="+total);
	}*/

}
