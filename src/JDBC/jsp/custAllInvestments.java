package JDBC.jsp;


import java.sql.*;

public class custAllInvestments {

	public int all(int cust_id) {
		int total=0;
		int nos[]=new Get_nos().all_nos(cust_id);
		int temp;
		String num;
		for(int i=0;i<30;i++)
		{
			if(nos[i]==-1)
				break;
			num=Integer.toString(nos[i]);
			temp=new custInvestments().myInvestments(num, cust_id);
			total+=temp;
		}
		return total;
	}
}
