package com.foodmodel.dao;

import java.util.ArrayList;

import com.foodmodel.pojo.OrderItem;

public interface OrderItemDAO {
	void insertOrderItem(OrderItem orderItem);
    ArrayList<OrderItem> fetchAll();
    OrderItem fetchSpecific(int orderItemId);
    int update(OrderItem orderItem);
    int delete(int orderItemId);
}
