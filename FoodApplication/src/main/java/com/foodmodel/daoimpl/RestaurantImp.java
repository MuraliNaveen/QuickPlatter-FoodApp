package com.foodmodel.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.connection.MyConnection;
import com.foodmodel.dao.RestaurantDAO;
import com.foodmodel.pojo.Restaurant;
import com.mysql.cj.xdevapi.Statement;




public class RestaurantImp implements RestaurantDAO {
	private Connection con;

    private final String RESTAURANT_INSERT = "insert into restaurant (`RName`,`CusineType`,`Address`,`Rating`,`Available`,`Rimage`,`RestaurantOwner`) values(?,?,?,?,?,?,?)";
    private final String FETCH_ALL = "select * from restaurant";
    private final String FETCH_SPECIFIC = "select * from restaurant where RestaurantOwner=?";
    private final String UPDATE_RESTAURANT = "update restaurant set RName=?, CusineType=?, Address=?, Rating=?, Available=? where R_ID=?";
    private final String DELETE_RESTAURANT = "delete from restaurant where R_ID=?";
    
    private PreparedStatement pstmt;
    private java.sql.Statement stmt;
    private ResultSet result;
   
    ArrayList<Restaurant> restaurantList =new ArrayList<Restaurant>();

	private Restaurant r;
    public RestaurantImp() {
    	try {
    	con=MyConnection.connect();
    	}
    	catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    @Override
    public int insert(Restaurant r) {
    	int status=0;
        try {
            pstmt = con.prepareStatement(RESTAURANT_INSERT);
            pstmt.setString(1, r.getRName());
            pstmt.setString(2, r.getCusineType());
            pstmt.setString(3, r.getAddress());
            pstmt.setInt(4, r.getRating());
            pstmt.setString(5, r.getisAvailable());
            pstmt.setString(6, r.getImage());
            pstmt.setString(7,r.getOwnerName());
            status = pstmt.executeUpdate();
            if (status != 0) {
                System.out.println("Restaurant Inserted Successfully");
            } else {
                System.out.println("Failed to Insert Restaurant");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
		return status;
    }

   

    @Override
    public Restaurant fetchSpecific(int id) {
    	Restaurant restaurant = null;
        try {
            pstmt = con.prepareStatement(FETCH_SPECIFIC);
            pstmt.setInt(1, id);
            result = pstmt.executeQuery();
            if (result.next()) {
                restaurant = new Restaurant(
                    result.getInt("R_ID"),
                    result.getString("RName"),
                    result.getString("CusineType"),
                    result.getString("Address"),
                    result.getInt("Rating"),
                    result.getString("Available"),
                    result.getString("Rimage"),
                    result.getString("RestaurantOwner")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    @Override
    public int update(Restaurant r) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(UPDATE_RESTAURANT);
            pstmt.setString(1, r.getRName());
            pstmt.setString(2, r.getCusineType());
            pstmt.setString(3, r.getAddress());
            pstmt.setInt(4, r.getRating());
            pstmt.setString(5, r.getisAvailable());
            pstmt.setInt(6, r.getR_ID());
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int delete(int id) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(DELETE_RESTAURANT);
            pstmt.setInt(1, id);
            status = pstmt.executeUpdate();
            if (status != 0) {
                System.out.println("Restaurant Deleted Successfully");
            } else {
                System.out.println("Failed to Delete Restaurant");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    

    @Override
    public ArrayList<Restaurant> fetchAll() {
      
        try {
            stmt = con.createStatement();
            result = stmt.executeQuery(FETCH_ALL);
          restaurantList=  ExtractAll(result);
            }
        
    
    catch (Exception e) {
            e.printStackTrace();
        }
      return  restaurantList;
    }
    
    ArrayList<Restaurant> ExtractAll(ResultSet result) {
       
        try {
            while (result.next()) {
                 r = new Restaurant(
                        result.getInt("R_ID"),
                        result.getString("RName"),
                        result.getString("CusineType"),
                        result.getString("Address"),
                        result.getInt("Rating"),
                        result.getString("Available"),
                        result.getString("Rimage")
                );
                 restaurantList.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
      
        return   restaurantList;
       
    }
       public Restaurant getRestaurantDetails(String Name) {
    	   try {
    		  pstmt =con.prepareStatement(FETCH_SPECIFIC);
    		  pstmt.setString(1, Name);
    		  result=pstmt.executeQuery();
    		  if(result.next()) {
    		  r=new Restaurant(
    				 
    				 result.getInt("R_Id"),
    			        result.getString("RName"),
    			       
    			        result.getString("Address"),
    			        result.getInt("Rating"),
    			        result.getString("Available"),  
    			        result.getString("RestaurantOwner")
    				 
    				 );
    				 
    		  }	 
    	   }
    	   catch(Exception e) {
    		   e.printStackTrace();
    	   }
    	   return r;
       }
}
