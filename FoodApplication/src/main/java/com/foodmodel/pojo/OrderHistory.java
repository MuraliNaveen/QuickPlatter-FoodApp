package com.foodmodel.pojo;

public class OrderHistory {

    private int orderHistoryId;
    private int orderId;  // Correct column name 'orderId'
    private int restaurantId;  // Correct column name 'restaurantId'
    private int userId;  // Correct column name 'userId'
    private int total;
    private String status;
  public OrderHistory() {
	  
  }
    // Constructor
    public OrderHistory(int orderId, int restaurantId, int userId, int total, String status) {
        this.orderId = orderId;
        this.restaurantId = restaurantId;
        this.userId = userId;
        this.total = total;
        this.status = status;
    }

    // Getters and Setters
    public int getOrderHistoryId() {
        return orderHistoryId;
    }

    public void setOrderHistoryId(int orderHistoryId) {
        this.orderHistoryId = orderHistoryId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderHistoryPojo{" +
                "orderHistoryId=" + orderHistoryId +
                ", orderId=" + orderId +
                ", restaurantId=" + restaurantId +
                ", userId=" + userId +
                ", total=" + total +
                ", status='" + status + '\'' +
                '}';
    }
}
