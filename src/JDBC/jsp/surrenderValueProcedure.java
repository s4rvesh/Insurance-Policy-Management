package JDBC.jsp;

import java.sql.*;

public class surrenderValueProcedure {
    int ye;

    public int surrenderValue(int x) {

        // String name = "";
        String sql;        sql = "call surrender("+ x +")";
        
        try {
            
            Connection conn = new Connect().myDBConnect();
            Statement stmt= conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                 ye=rs.getInt("(x)");
            }
             
        

        } catch (Exception e) {
            System.out.println(e);
        }

        return ye;
    }

    public static void main(String[] args)
    {
        int x = new surrenderValueProcedure().surrenderValue(100);
        System.out.println(x);
    }
    
}