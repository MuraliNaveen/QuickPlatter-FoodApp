package com.foodmodel.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodmodel.dao.OrderHistoryDAO;
import com.foodmodel.pojo.OrderHistory;

public class OrderHistoryImpl implements OrderHistoryDAO {

    private static final String INSERT_ORDER_HISTORY_QUERY =
            "INSERT INTO orderhistory (orderId, restaurantId, userId, total, status) VALUES (?, ?, ?, ?, ?)";

    private static final String UPDATE_ORDER_HISTORY_QUERY =
            "UPDATE orderhistory SET orderId=?, restaurantId=?, userId=?, total=?, status=? WHERE orderHistoryId=?";

    private static final String DELETE_ORDER_HISTORY_QUERY =
            "DELETE FROM orderhistory WHERE orderHistoryId=?";

    private static final String SELECT_ORDER_HISTORY_QUERY =
            "SELECT * FROM orderhistory WHERE orderHistoryId=?";

    private static final String SELECT_ALL_ORDER_HISTORY_QUERY =
            "SELECT * FROM orderhistory";

    private Connection con;
    private PreparedStatement pstmt;

    public OrderHistoryImpl() {
        try {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/foodclone";  // Change database URL if needed
            String username = "root";  // Change username if needed
            String password = "8374@Naveen";  // Change password if needed
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertOrderHistory(OrderHistory orderHistory) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_HISTORY_QUERY);
            pstmt.setInt(1, orderHistory.getOrderId());
            pstmt.setInt(2, orderHistory.getRestaurantId());
            pstmt.setInt(3, orderHistory.getUserId());
            pstmt.setInt(4, orderHistory.getTotal());
            pstmt.setString(5, orderHistory.getStatus());

            int status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order History Inserted Successfully." : "Failed to Insert Order History.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int updateOrderHistory(OrderHistory orderHistory) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(UPDATE_ORDER_HISTORY_QUERY);
            pstmt.setInt(1, orderHistory.getOrderId());
            pstmt.setInt(2, orderHistory.getRestaurantId());
            pstmt.setInt(3, orderHistory.getUserId());
            pstmt.setInt(4, orderHistory.getTotal());
            pstmt.setString(5, orderHistory.getStatus());
            pstmt.setInt(6, orderHistory.getOrderHistoryId());

            status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order History Updated Successfully." : "Failed to Update Order History.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteOrderHistory(int orderHistoryId) {
        int status = 0;
        try {
            pstmt = con.prepareStatement(DELETE_ORDER_HISTORY_QUERY);
            pstmt.setInt(1, orderHistoryId);
            status = pstmt.executeUpdate();
            System.out.println(status > 0 ? "Order History Deleted Successfully." : "Failed to Delete Order History.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public OrderHistory fetchOrderHistoryById(int orderHistoryId) {
        OrderHistory orderHistory = null;
        try {
            pstmt = con.prepareStatement(SELECT_ORDER_HISTORY_QUERY);
            pstmt.setInt(1, orderHistoryId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                orderHistory = new OrderHistory(
                        rs.getInt("orderId"),
                        rs.getInt("restaurantId"),
                        rs.getInt("userId"),
                        rs.getInt("total"),
                        rs.getString("status")
                );
                orderHistory.setOrderHistoryId(orderHistoryId);  // Set the orderHistoryId
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderHistory;
    }

    @Override
    public ArrayList<OrderHistory> fetchAllOrderHistories() {
        ArrayList<OrderHistory> orderHistories = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(SELECT_ALL_ORDER_HISTORY_QUERY);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                OrderHistory orderHistory = new OrderHistory(
                        rs.getInt("orderId"),
                        rs.getInt("restaurantId"),
                        rs.getInt("userId"),
                        rs.getInt("total"),
                        rs.getString("status")
                );
                orderHistory.setOrderHistoryId(rs.getInt("orderHistoryId"));
                orderHistories.add(orderHistory);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderHistories;
    }
}
