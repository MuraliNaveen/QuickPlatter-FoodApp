package com.foodmodel.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import com.connection.MyConnection;
import com.foodmodel.dao.UserDAO;
import com.foodmodel.pojo.User;



public class UserImp implements UserDAO {
	private final String USER_INSERT = "INSERT INTO user (`UserName`, `Email`, `Password`, `MobileNumber`) VALUES (?, ?, ?, ?)";
    private final String FETCH_ALL_USERS = "SELECT * FROM user";
    private final String FETCH_USER_BY_ID = "SELECT * FROM user WHERE U_ID = ?";
    private final String UPDATE_USER = "UPDATE user SET `Email` = ?, `Password` = ?, `MobileNumber` = ? WHERE `U_ID` = ?";
    private final String DELETE_USER = "DELETE FROM user WHERE U_ID = ?";
    private final String FETCH_ON_EMAIL="select * from user where `Email`=?";
	ArrayList<User> userList=new ArrayList<User>();
	
	 User user ;
	private Connection con;
	
	

	public UserImp() {
		try {
		con=MyConnection.connect();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int Insert(User u) {
	    int status = 0; // Declare status locally
	    try (PreparedStatement pstmt = con.prepareStatement(USER_INSERT)) {
	        pstmt.setString(1, u.getUserName());
	        pstmt.setString(2, u.getEmail());
	        pstmt.setString(3, u.getPassword());
	        pstmt.setInt(4, u.getMobileNumber());
	        status = pstmt.executeUpdate();
	        System.out.println(status != 0 ? "Insert Success" : "Insert Failure");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;  // Return the status
	}


	    @Override
	    public ArrayList<User> fetchAll() {
	       
	        try (Statement stmt = con.createStatement();
	             ResultSet rs = stmt.executeQuery(FETCH_ALL_USERS)) {
	            while (rs.next()) {
	                userList.add(new User(
	                        rs.getInt("U_ID"),
	                        rs.getString("UserName"),
	                        rs.getString("Email"),
	                        rs.getString("Password"),
	                        rs.getInt("MobileNumber"),
	                        rs.getString("role")
	                ));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return userList;
	    }

	    @Override
	    public User fetchSpecific(int id) {
	       
	        try (PreparedStatement pstmt = con.prepareStatement(FETCH_USER_BY_ID)) {
	            pstmt.setInt(1, id);
	            ResultSet rs = pstmt.executeQuery();
	                if (rs.next()) {
	                    user = new User(
	                            rs.getString("UserName"),
	                            rs.getString("Email"),
	                            rs.getString("Password"),
	                            rs.getInt("MobileNumber")
	                            ,rs.getString("role"));
	                    
	                } 
	                
	                else {
	                    System.out.println("User not found.");
	                }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return user;
	    }

	    @Override
	    public int update(User u) {
	        int status = 0;
	        try (PreparedStatement pstmt = con.prepareStatement(UPDATE_USER)) {
	            pstmt.setString(1, u.getEmail());
	            pstmt.setString(2, u.getPassword());
	            pstmt.setLong(3, u.getMobileNumber());
	            pstmt.setInt(4, u.getU_ID());
	            status = pstmt.executeUpdate();
	            System.out.println(status != 0 ? "Update Success" : "Update Failure");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    @Override
	    public int delete(int id) {
	        int status = 0;
	        try (PreparedStatement pstmt = con.prepareStatement(DELETE_USER)) {
	            pstmt.setInt(1, id);
	            status = pstmt.executeUpdate();
	            System.out.println(status != 0 ? "Delete Success" : "Delete Failure");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

		@Override
		public User fetchOnEmail(String Email) {
			User user = null;
	        try  {
	        	PreparedStatement pstmt = con.prepareStatement(FETCH_ON_EMAIL);
	            pstmt.setString(1, Email);
	            ResultSet rs = pstmt.executeQuery();
	                if (rs.next()) {
	                    user = new User(
	                            rs.getInt("U_ID"),
	                            rs.getString("UserName"),
	                            rs.getString("Email"),
	                            rs.getString("Password"),
	                            rs.getInt("MobileNumber"),
	                            rs.getString("role"));
	                    
	                } 
	                
	                else {
	                    System.out.println("User not found.");
	                }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return user;
		}
	
}
