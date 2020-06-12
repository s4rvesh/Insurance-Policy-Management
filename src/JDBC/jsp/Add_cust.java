package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;


public class Add_cust {
	public void addCustInfo(int aid, String fname, String mname, String lname, String email, String phone, String add, String dob, String uname, String passwd, String desig, String policy) {
		String sql = "INSERT INTO customer(c_uname,c_passwd,c_email,c_phone,c_dob,c_addr,c_fname,c_mname,c_lname,desig) VALUES (?,?,?,?,?,?,?,?,?,?)";
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String cusAgPolsql = "INSERT INTO customer_agent_policy(cust_id,agent_id,pol_no) VALUES (?,?,?)";
		String getCusIdsql = "SELECT cust_id from customer where c_uname='"+uname+"'";
		String cusPolsql = "INSERT INTO customer_policy(cust_id,pol_no,prem_sdate,prem_edate,prem_pdate) VALUES(?,?,curdate(),?,?)";
		System.out.println("dob"+dob);
		//get prem_pdate
		String premPdatesql = "SELECT DATE_ADD((SELECT DATE_ADD(curdate(), INTERVAL 1 MONTH)),INTERVAL 5 DAY);";
		
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, uname);
			prep.setString(2, passwd);
			prep.setString(3, email);
			prep.setString(4, phone);
			java.util.Date utildate= sdf.parse(dob);
			java.sql.Date sqldate= new java.sql.Date( utildate.getTime()); 
			prep.setDate(5, sqldate);
			prep.setString(6, add);
			prep.setString(7, fname);
			prep.setString(8, mname);
			prep.setString(9, lname);
			prep.setString(10, desig);
			prep.execute();
			
			Statement prepgetCusId = conn.createStatement();
			ResultSet rsCusId = prepgetCusId.executeQuery(getCusIdsql);
			rsCusId.next();
			int custId= rsCusId.getInt("cust_id");
			
			PreparedStatement prepcusAgPol = conn.prepareStatement(cusAgPolsql);
			int polint = Integer.parseInt(policy);
			
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
			if (prep != null) {
				try {
					prep.close();
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
			System.out.println("Exception Occured: "+e);
		}
		//return 1;
	}
	
	/*public static void main(String args[]) {
		Add_cust c = new Add_cust();
		//c.addCustInfo(aid, fname, mname, lname, email, phone, add, dob, uname, passwd, desig, policy);
		c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "1/2/1993", "u", "i", "o","1");
		
	}*/
	
	

}
