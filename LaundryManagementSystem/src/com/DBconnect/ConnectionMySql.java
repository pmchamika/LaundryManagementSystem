package com.DBconnect;
import java.sql.*;

public class ConnectionMySql {
	
	public Connection getCon() {
	
		Connection conn=null;
	       try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "12345");
		    System.out.println("Connection successful");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
	       
	       
	      
	       
	   
	    
	    return conn;
	  }
	
}
