package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	static String  url = "jdbc:mysql://localhost:3306/foodclone";
	static  String username = "root";
	static  String password = "8374@Naveen";
	    private static Connection con;

	    public static Connection  connect() {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection(url, username, password);
	        } 
	        catch (ClassNotFoundException e) {
	            System.out.println("JDBC Driver not found: " + e.getMessage());
	        } catch (SQLException e) {
	            System.out.println("Error while connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	        return con;
	    }
	    public static void close() {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
