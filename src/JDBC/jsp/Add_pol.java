package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;


public class Add_pol {
	public void addNewPolicy(String pname, String pno, String dur, String lfee, String prem, String comm, String desc) {
		String sql = "INSERT INTO policy(p_name,duration,late_fee,premium,commision,image) VALUES (?,?,?,?,?,?)";
		String descsql = "INSERT INTO policy_description(p_name,descp) VALUES (?,?)";
		//get prem_pdate
		
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			PreparedStatement descprep = conn.prepareStatement(descsql);
			descprep.setString(1, pname);
			descprep.setString(2, desc);
			prep.setString(1, pname);
			prep.setString(2, dur);
			prep.setString(3, lfee);
			prep.setString(4, prem);
			prep.setString(5, comm);
			prep.setString(6, "images/plan4.jpg");

			prep.execute();
			descprep.execute();
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	/*public static void main(String args[]) {
		Add_cust c = new Add_cust();
		//c.addCustInfo(aid, fname, mname, lname, email, phone, add, dob, uname, passwd, desig, policy);
		c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "1/2/1993", "u", "i", "o","1");
		
	}*/
	
	

	}
