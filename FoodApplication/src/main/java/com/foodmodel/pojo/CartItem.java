package com.foodmodel.pojo;

public class CartItem {
 private int orderItemId;
 private int restaurant_id;
 private String Name;
 private  int quantity;
 private  int price;
 private String image;
public CartItem() {
	super();
}
public CartItem(int orderItemId, int restaurant_id, String name, int quantity, int price,String image) {
	super();
	this.orderItemId = orderItemId;
	this.restaurant_id = restaurant_id;
	this.Name = name;
	this.quantity = quantity;
	this.price = price;
	this.image=image;
}
public int getOrderItemId() {
	return orderItemId;
}
public void setOrderItemId(int orderItemId) {
	this.orderItemId = orderItemId;
}
public int getRestaurant_id() {
	return restaurant_id;
}
public void setRestaurant_id(int restaurant_id) {
	this.restaurant_id = restaurant_id;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getTotalPrice() {
    return this.quantity * this.price;
}



public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
@Override
public String toString() {
	return "CartItem [orderItemId=" + orderItemId + ", restaurant_id=" + restaurant_id + ", Name=" + Name
			+ ", quantity=" + quantity + ", price=" + price + ", image=" + image + "]";
}

 


}
