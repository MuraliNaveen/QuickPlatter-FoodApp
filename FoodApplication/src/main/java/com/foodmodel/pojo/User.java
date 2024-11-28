package com.foodmodel.pojo;


public class User {
	 private int U_ID;
	    private String UserName;
	    private String Email;
	    private String Password;
	    private int MobileNumber;
	    private String Role;

	    // Default constructor
	    public User() {
	        super();
	    }

	    // Constructor without ID
	    public User(String userName, String email, String password, int mobileNumber,String Role) {
	        super();
	        this.UserName = userName;
	        this.Email = email;
	        this.Password = password;
	        this.MobileNumber = mobileNumber;
	        this.Role=Role;
	        }
	    
	    

	    public User(String userName, String email, String password, int mobileNumber) {
			super();
			UserName = userName;
			Email = email;
			Password = password;
			MobileNumber = mobileNumber;
		}

		// Constructor with ID
public User(int u_ID, String userName, String email, String password, int mobileNumber,String Role) {
	        super();
	        this.U_ID = u_ID;
	        this.UserName = userName;
	        this.Email = email;
	        this.Password = password;
	        this.MobileNumber = mobileNumber;
	        this.Role=Role;
	    }

	    public String getRole() {
	return Role;
}

public void setRole(String role) {
	Role = role;
}

		// Getter and Setter methods
	    public int getU_ID() {
	        return U_ID;
	    }

	    public void setU_ID(int u_ID) {
	        this.U_ID = u_ID;
	    }

	    public String getUserName() {
	        return UserName;
	    }

	    public void setUserName(String userName) {
	        this.UserName = userName;
	    }

	    public String getEmail() {
	        return Email;
	    }

	    public void setEmail(String email) {
	        this.Email = email;
	    }

	    public String getPassword() {
	        return Password;
	    }

	    public void setPassword(String password) {
	        this.Password = password;
	    }

	    public int getMobileNumber() {
	        return MobileNumber;
	    }

	    public void setMobileNumber(int mobileNumber) {
	        this.MobileNumber = mobileNumber;
	    }

		@Override
		public String toString() {
			return "User [U_ID=" + U_ID + ", UserName=" + UserName + ", Email=" + Email + ", Password=" + Password
					+ ", MobileNumber=" + MobileNumber + ", Role=" + Role + "]";
		}

	   
}
