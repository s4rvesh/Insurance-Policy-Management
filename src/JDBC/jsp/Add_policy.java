package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;

public class Add_policy {
	public void addPolInfo(int aid,int polint,int custId) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String cusAgPolsql = "INSERT INTO customer_agent_policy(cust_id,agent_id,pol_no) VALUES (?,?,?)";
		String cusPolsql = "INSERT INTO customer_policy(cust_id,pol_no,prem_sdate,prem_edate,prem_pdate) VALUES(?,?,curdate(),?,?)";
		
		//get prem_pdate
		String premPdatesql = "SELECT DATE_ADD((SELECT DATE_ADD(curdate(), INTERVAL 1 MONTH)),INTERVAL 5 DAY);";
		
		
		
		
		try {
			Connection conn = new Connect().myDBConnect();
			
			
			PreparedStatement prepcusAgPol = conn.prepareStatement(cusAgPolsql);
			prepcusAgPol.setInt(1, custId);
			prepcusAgPol.setInt(2, aid);
			prepcusAgPol.setInt(3, polint);
			prepcusAgPol.execute();
			
			
			Statement prepPremPdate = conn.createStatement();
			ResultSet rsPremPdate = prepPremPdate.executeQuery(premPdatesql);
			rsPremPdate.next();
			
			//get policy term
			String polTermsql = "SELECT duration from policy where pol_no='"+polint+"'";
			Statement preppolTerm = conn.createStatement();
			ResultSet rspolTerm = preppolTerm.executeQuery(polTermsql);
			rspolTerm.next();
			
			
			//get prem_edate
			String premEdatesql = "SELECT DATE_ADD((SELECT DATE_ADD((SELECT DATE_ADD(curdate(), INTERVAL 1 MONTH)),INTERVAL 5 DAY)),INTERVAL "+rspolTerm.getInt(1)+" YEAR);";
			//prem_edate
			//PreparedStatement prepPremEdate = conn.prepareStatement(premEdatesql);
			//prepPremEdate.setInt(1, rspolTerm.getInt(1));
			Statement prepPremEdate = conn.createStatement();
			ResultSet rsPremEdate = prepPremEdate.executeQuery(premEdatesql);
			rsPremEdate.next();
			
			
			//final addition to second relationship table
			PreparedStatement prepcusPol = conn.prepareStatement(cusPolsql);
			prepcusPol.setInt(1, custId);
			prepcusPol.setInt(2, polint);
			prepcusPol.setDate(3, rsPremEdate.getDate(1));
			prepcusPol.setDate(4, rsPremPdate.getDate(1));
			prepcusPol.execute();
			
			
			//rs.next();
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			System.out.println("Exception Occured: "+e);
		}
	}
	
	public static void main(String []args)
	{
		
	}
}
