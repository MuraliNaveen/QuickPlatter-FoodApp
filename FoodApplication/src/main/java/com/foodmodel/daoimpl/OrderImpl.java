package com.foodmodel.daoimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.connection.MyConnection;
import com.foodmodel.dao.OrderDAO;
import com.foodmodel.pojo.Order;

public class OrderImpl implements OrderDAO {
	  private static final String INSERT_ORDER_QUERY = 
		        "INSERT INTO orders (`user_id`, `restaurant_id`, `menu_id`, `quantity`, `total`, `payment`, `status`) VALUES (?, ?, ?, ?, ?, ?, ?)";
		    private static final String UPDATE_ORDER_QUERY = 
		        "UPDATE orders SET `user_id`=?, `restaurant_id`=?, `menu_id`=?, `quantity`=?, `total`=?, `payment`=?, `status`=? WHERE `order_id`=?";
		    private static final String DELETE_ORDER_QUERY = 
		        "DELETE FROM orders WHERE `order_id`=?";
		    private static final String SELECT_ORDER_QUERY = 
		        "SELECT * FROM orders WHERE `order_id`=?";
		    private static final String SELECT_ALL_ORDERS_QUERY = 
		        "SELECT * FROM orders";
		    private static final String SELECT_FFROM_USERID="select * from `orders` where `user_id`=? ";
		    private Connection con;
		    private PreparedStatement pstmt;
			//private int status;

		    public OrderImpl() {
		        try {
		           
		            con = MyConnection.connect();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }

		/*    @Override
		    public int insertOrder(Order order) {
		        try {
		            pstmt = con.prepareStatement(INSERT_ORDER_QUERY);
		            pstmt.setInt(1, order.getUserId());
		            pstmt.setInt(2, order.getRestaurantId());
		            pstmt.setInt(3, order.getMenuId());
		            pstmt.setInt(4, order.getQuantity());
		            pstmt.setInt(5, order.getTotal());
		            pstmt.setString(6, order.getPayment());
		            pstmt.setString(7, order.getStatus());
		            status = pstmt.executeUpdate();
		            System.out.println(status > 0 ? "Order Inserted Successfully." : "Failed to Insert Order.");
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return status;
		    }
*/
		    @Override
		    public int insertOrder(Order order) {
		        int generatedOrderId = -1;
		        try {
		            pstmt = con.prepareStatement(INSERT_ORDER_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
		            pstmt.setInt(1, order.getUserId());
		            pstmt.setInt(2, order.getRestaurantId());
		            pstmt.setInt(3, order.getMenuId());
		            pstmt.setInt(4, order.getQuantity());
		            pstmt.setInt(5, order.getTotal());
		            pstmt.setString(6, order.getPayment());
		            pstmt.setString(7, order.getStatus());

		            int status = pstmt.executeUpdate();
		            if (status > 0) {
		                ResultSet rs = pstmt.getGeneratedKeys();
		                if (rs.next()) {
		                    generatedOrderId = rs.getInt(1); // Retrieve the generated order ID
		                }
		                System.out.println("Order Inserted Successfully with ID: " + generatedOrderId);
		            } else {
		                System.out.println("Failed to Insert Order.");
		            }
		            
		        }


		        catch (Exception e) {
		            e.printStackTrace();
		        }
		       		        return generatedOrderId;
		    }
		    @Override
		    public int updateOrder(Order order) {
		        int status = 0;
		        try {
		            pstmt = con.prepareStatement(UPDATE_ORDER_QUERY);
		            pstmt.setInt(1, order.getUserId());
		            pstmt.setInt(2, order.getRestaurantId());
		            pstmt.setInt(3, order.getMenuId());
		            pstmt.setInt(4, order.getQuantity());
		            pstmt.setInt(5, order.getTotal());
		            pstmt.setString(6, order.getPayment());
		            pstmt.setString(7, order.getStatus());
		            pstmt.setInt(8, order.getOrderId());
		            status = pstmt.executeUpdate();
		            System.out.println(status > 0 ? "Order Updated Successfully." : "Failed to Update Order.");
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return status;
		    }

		    @Override
		    public int deleteOrder(int orderId) {
		        int status = 0;
		        try {
		            pstmt = con.prepareStatement(DELETE_ORDER_QUERY);
		            pstmt.setInt(1, orderId);
		            status = pstmt.executeUpdate();
		            System.out.println(status > 0 ? "Order Deleted Successfully." : "Failed to Delete Order.");
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return status;
		    }

		    @Override
		    public Order fetchOrderById(int orderId) {
		        Order order = null;
		        try {
		            pstmt = con.prepareStatement(SELECT_ORDER_QUERY);
		            pstmt.setInt(1, orderId);
		            ResultSet rs = pstmt.executeQuery();
		            if (rs.next()) {
		                order = new Order(
		                    rs.getInt("user_id"), 
		                    rs.getInt("restaurant_id"), 
		                    rs.getInt("menu_id"), 
		                    rs.getInt("quantity"),
		                    rs.getInt("total"),
		                    rs.getString("payment"),
		                    rs.getString("status")
		                );
		                order.setOrderId(orderId);  // Set the order ID
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return order;
		    }

		    @Override
		    public ArrayList<Order> fetchAllOrders() {
		        ArrayList<Order> orders = new ArrayList<Order>();
		        try {
		            pstmt = con.prepareStatement(SELECT_ALL_ORDERS_QUERY);
		            ResultSet rs = pstmt.executeQuery();
		            while (rs.next()) {
		                Order order = new Order(
		                    rs.getInt("user_id"),
		                    rs.getInt("restaurant_id"),
		                    rs.getInt("menu_id"),
		                    rs.getInt("quantity"),
		                    rs.getInt("total"),
		                    rs.getString("payment"),
		                    rs.getString("status")
		                );
		                order.setOrderId(rs.getInt("order_id"));  // Set the order ID
		                orders.add(order);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return orders;
		    }
		    public ArrayList<Order> fetchAllOrdersofUser(int userID) {
		        ArrayList<Order> orders = new ArrayList<Order>();
		        try {
		            pstmt = con.prepareStatement(SELECT_FFROM_USERID);
		            pstmt.setInt(1, userID);
		            ResultSet rs = pstmt.executeQuery();
		            while (rs.next()) {
		                Order order = new Order(
		                		rs.getInt("Order_Id"),
		                    rs.getInt("user_id"),
		                    rs.getInt("restaurant_id"),
		                    rs.getInt("menu_id"),
		                    rs.getInt("quantity"),
		                    rs.getInt("total"),
		                    rs.getString("payment"),
		                    rs.getString("status"),
		                    rs.getTimestamp("dateAndTime").toLocalDateTime()
		                );
		                order.setOrderId(rs.getInt("order_id"));  // Set the order ID
		                orders.add(order);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return orders;
		    }
}