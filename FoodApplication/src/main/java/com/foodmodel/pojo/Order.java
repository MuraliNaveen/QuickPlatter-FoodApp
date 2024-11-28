package com.foodmodel.pojo;
import java.time.LocalDateTime;

public class Order {

	  private int orderId;
	    private int userId;
	    private int restaurantId;
	    private int menuId;
	    private int quantity;
	    private int total;
	    private String payment;
	    private String status;
	    private LocalDateTime dateAndTime;
	    // Constructors
	    public Order() {}

	    public Order(int userId, int restaurantId, int menuId, int quantity, int total, String payment, String status) {
	        this.userId = userId;
	        this.restaurantId = restaurantId;
	        this.menuId = menuId;
	        this.quantity = quantity;
	        this.total = total;
	        this.payment = payment;
	        this.status = status;
	    }

	    public Order(int orderId, int userId, int restaurantId, int menuId, int quantity, int total, String payment,
				String status, LocalDateTime dateAndTime) {
			super();
			this.orderId = orderId;
			this.userId = userId;
			this.restaurantId = restaurantId;
			this.menuId = menuId;
			this.quantity = quantity;
			this.total = total;
			this.payment = payment;
			this.status = status;
			this.dateAndTime = dateAndTime;
		}

		public LocalDateTime getDateAndTime() {
			return dateAndTime;
		}

		public void setDateAndTime(LocalDateTime dateAndTime) {
			this.dateAndTime = dateAndTime;
		}

		// Getters and Setters
	    public int getOrderId() {
	        return orderId;
	    }

	    public void setOrderId(int orderId) {
	        this.orderId = orderId;
	    }

	    public int getUserId() {
	        return userId;
	    }

	    public void setUserId(int userId) {
	        this.userId = userId;
	    }

	    public int getRestaurantId() {
	        return restaurantId;
	    }

	    public void setRestaurantId(int restaurantId) {
	        this.restaurantId = restaurantId;
	    }

	    public int getMenuId() {
	        return menuId;
	    }

	    public void setMenuId(int menuId) {
	        this.menuId = menuId;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    public int getTotal() {
	        return total;
	    }

	    public void setTotal(int total) {
	        this.total = total;
	    }

	    public String getPayment() {
	        return payment;
	    }

	    public void setPayment(String payment) {
	        this.payment = payment;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    @Override
	    public String toString() {
	        return "OrderId=" + orderId + ", UserId=" + userId + ", RestaurantId=" + restaurantId + 
	               ", MenuId=" + menuId + ", Quantity=" + quantity + ", Total=" + total + 
	               ", Payment=" + payment + ", Status=" + status;
	    }
	
}
