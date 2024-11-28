package com.foodmodel.daoimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.connection.MyConnection;
import com.foodmodel.dao.OrderItemDAO;
import com.foodmodel.pojo.OrderItem;

public class OrderItemImpl implements OrderItemDAO {

	private static final String INSERT_ORDER_ITEM_QUERY = 
            "INSERT INTO orderItems (`order_id`, `menu_id`, `quantity`, `itemTotal`) VALUES (?, ?, ?, ?)";
    
    private static final String UPDATE_ORDER_ITEM_QUERY = 
            "UPDATE orderItems SET `order_id`=?, `menu_id`=?, `quantity`=?, `itemTotal`=? WHERE `orderItemId`=?";
    
    private static final String DELETE_ORDER_ITEM_QUERY = 
            "DELETE FROM orderItems WHERE `orderItemId`=?";
    
    private static final String SELECT_ORDERID_QUERY = 
            "SELECT * FROM orderItems WHERE `order_id`=?";
    
    private static final String SELECT_ALL_ORDER_ITEMS_QUERY = 
            "SELECT * FROM orderItems";
    
    private Connection con;
    private PreparedStatement pstmt;

    public OrderItemImpl() {
        try {
           
            con = MyConnection.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertOrderItem(OrderItem orderItem) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_ITEM_QUERY);
            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setInt(4, orderItem.getItemTotal());
            int status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order Item Inserted Successfully." : "Failed to Insert Order Item.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int update(OrderItem orderItem) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(UPDATE_ORDER_ITEM_QUERY);
            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setInt(4, orderItem.getItemTotal());
            pstmt.setInt(5, orderItem.getOrderItemId());
            status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order Item Updated Successfully." : "Failed to Update Order Item.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int delete(int orderItemId) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(DELETE_ORDER_ITEM_QUERY);
            pstmt.setInt(1, orderItemId);
            status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order Item Deleted Successfully." : "Failed to Delete Order Item.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public OrderItem fetchSpecific(int orderId) {
        OrderItem orderItem = null;
        try {
            pstmt = con.prepareStatement(SELECT_ORDERID_QUERY);
            pstmt.setInt(1, orderId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                orderItem = new OrderItem(
                    rs.getInt("order_id"),
                    rs.getInt("menu_id"),
                    rs.getInt("quantity"),
                    rs.getInt("itemTotal")
                );
                orderItem.setOrderItemId(orderId);  // Set the orderItemId
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderItem;
    }

    @Override
    public ArrayList<OrderItem> fetchAll() {
        ArrayList<OrderItem> orderItems = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(SELECT_ALL_ORDER_ITEMS_QUERY);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderItem orderItem = new OrderItem(
                    rs.getInt("order_id"),
                    rs.getInt("menu_id"),
                    rs.getInt("quantity"),
                    rs.getInt("itemTotal")
                );
                orderItem.setOrderItemId(rs.getInt("orderItemId"));  // Set the orderItemId
                orderItems.add(orderItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderItems;
    }
	
	
	
}