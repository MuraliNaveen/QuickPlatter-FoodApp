package com.foodmodel.dao;

import java.util.ArrayList;


import com.foodmodel.pojo.Restaurant;





public interface RestaurantDAO {

    int insert(Restaurant r);             // Insert a new restaurant
    ArrayList<Restaurant> fetchAll();           // Fetch all restaurant records
    Restaurant fetchSpecific(int id);      // Fetch a specific restaurant by its ID
    int update(Restaurant r);              // Update a restaurant
    int delete(int id);    
}
