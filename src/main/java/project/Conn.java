package project;

/**
 * @author Leonard
 *
 */

import java.sql.*;
public class Conn {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolawebinfo","root","tobbycole");
			System.out.println("Connected");
			return con;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
