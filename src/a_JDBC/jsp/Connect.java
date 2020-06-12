package a_JDBC.jsp;

import java.sql.*;

public class Connect {
	String url, username, password, sql;

	public Connect() {
		url = "jdbc:mysql://localhost:3306/lic";
		username = "root";
		password = "password";
	}

	public Connection myDBConnect() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
	}
}
