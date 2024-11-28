package com.foodmodel.dao;

import java.util.ArrayList;

import com.foodmodel.pojo.Order;

public interface OrderDAO {

	int insertOrder(Order order);
    Order fetchOrderById(int orderId);
    ArrayList<Order> fetchAllOrders();
    int updateOrder(Order order);
    int deleteOrder(int orderId);
}