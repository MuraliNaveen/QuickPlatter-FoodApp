package com.foodmodel.daoimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import com.connection.MyConnection;
import com.foodmodel.dao.MenuDAO;
import com.foodmodel.pojo.Menu;


public class MenuDAOImp implements MenuDAO {
	    private final String INSERT = "INSERT INTO menu (R_ID, Name, Description, price, Rating,Image, isAvailable) VALUES (?,?, ?, ?, ?, ?, ?)";
	    private final String FETCH_ALL = "SELECT * FROM menu";
	    private final String FETCH_SPECIFIC = "SELECT * FROM menu WHERE MenuId = ?";
	    private final String UPDATE = "UPDATE menu SET R_ID = ?, Name = ?, Description = ?, price = ?, Rating = ?, isAvailable = ? WHERE MenuId = ?";
	    private final String DELETE = "DELETE FROM menu WHERE MenuId = ?";
	    final String FETCH_ON_RID="select * from menu where `R_ID`=?";
	    private Connection con;
		private PreparedStatement pstmt;
		private ResultSet resultset;
		 ArrayList<Menu> menuList = new ArrayList<>();
		private int status;
	    public MenuDAOImp() {
	        try {
	           con= MyConnection.connect();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		@Override
		public int insert(Menu m) {
			try {
				pstmt=con.prepareStatement(INSERT);
				pstmt.setInt(1, m.getR_ID());
				pstmt.setString(2, m.getName());
				pstmt.setString(3, m.getDescription());
				pstmt.setFloat(4,m.getPrice());
				pstmt.setInt(5, m.getRating());
				pstmt.setString(6, m.getImage());
				pstmt.setString(7, m.isAvailable());
				status=pstmt.executeUpdate();
				System.out.println("1Row executed i mean menu addded");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		}
		@Override
		public ArrayList<Menu> fetchAll() {
			
			
try {
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		@Override
		public Menu fetchSpecific(int menuId) {
			try {
				pstmt=con.prepareStatement(FETCH_SPECIFIC);
				pstmt.setInt(1, menuId);
				resultset=pstmt.executeQuery();
				menuList	=exetract(resultset);
			}
			catch (Exception e) {
			e.printStackTrace();
			}
			
		 return menuList.get(0);
			
	
		}
		@Override
		public int update(Menu m) {

               try {
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		@Override
		public int delete(int menuId) {

               try {
 				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		@Override
		public ArrayList<Menu> getOnRid(int rid) {
			
			
            try {
				pstmt=con.prepareStatement(FETCH_ON_RID);
				pstmt.setInt(1, rid);
				resultset=pstmt.executeQuery();
				menuList	=exetract(resultset);
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return menuList;
		}
		private ArrayList<Menu> exetract(ResultSet resultset2) {

            try {
				
            	
            	while(resultset2.next()) {
            		menuList.add(new Menu(
            				resultset2.getInt("MenuId"),
            				resultset2.getInt("R_ID"),
            				resultset2.getString("Name"),
            				resultset2.getString("Description"),
            				resultset2.getInt("price"),
            				resultset2.getInt("Rating"),
            				resultset2.getString("Image"),
            				resultset2.getString("isAvailable")
            				
            				));
            	}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
            
            return menuList;
		}
       
	   
}
