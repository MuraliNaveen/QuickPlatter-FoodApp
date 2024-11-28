package com.foodmodel.dao;

import java.util.ArrayList;

import com.foodmodel.pojo.OrderHistory;

public interface OrderHistoryDAO {

    // Method to insert a new order history
    void insertOrderHistory(OrderHistory orderHistory);

    // Method to update an existing order history
    int updateOrderHistory(OrderHistory orderHistory);

    // Method to delete an order history
    int deleteOrderHistory(int orderHistoryId);

    // Method to fetch a specific order history by OrderHistoryId
    OrderHistory fetchOrderHistoryById(int orderHistoryId);

    // Method to fetch all order histories
    ArrayList<OrderHistory> fetchAllOrderHistories();
}