package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.RestaurantImp;
import com.foodmodel.pojo.Restaurant;

public class GetRestaurantHome1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RestaurantImp rimp = new RestaurantImp();
         
        // Fetch all restaurants from the database
        ArrayList<Restaurant> restaurantList = rimp.fetchAll();

        // Check if the list is null or empty
        if (restaurantList != null && !restaurantList.isEmpty()) {
            // Set the restaurant list in the session for access in Home1.jsp
            req.getSession().setAttribute("RList", restaurantList); 
        } else {
            // If no restaurants found, set an error message
            req.setAttribute("errorMessage", "No restaurants found.");
        }

        // Forward the request to Home1.jsp
        req.getRequestDispatcher("Home1.jsp").forward(req, resp);
    }
}
