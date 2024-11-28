package com.foodmodel.daoimpl;

import java.util.HashMap;
import java.util.Map;

import com.foodmodel.pojo.CartItem;

public class CartDAOImpl {

    private Map<Integer, CartItem> items;

    public CartDAOImpl() {
        this.items = new HashMap<>();
    }

    public Map<Integer, CartItem> addItem(CartItem item) {
        int itemId = item.getOrderItemId();
        if (items.containsKey(itemId)) {
            CartItem existingItem = items.get(itemId);
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            items.put(itemId, item);
        }
        return items;
    }

    public Map<Integer, CartItem> updateItem(Map<Integer, CartItem> items, int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            if (quantity == 0) {
                items.remove(itemId); // Remove item if quantity is 0
            } else {
                items.get(itemId).setQuantity(quantity); // Update item quantity
            }
        }
        return items;
    }

    public void removeItem(Map<Integer, CartItem> cart, int itemId) {
        if (cart != null) {
            cart.remove(itemId);  // Remove item by ID
        }
    }
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void clear() {
        items.clear();
    }
}

