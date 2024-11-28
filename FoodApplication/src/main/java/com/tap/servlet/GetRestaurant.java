package com.tap.servlet;

import com.foodmodel.dao.RestaurantDAO;
import com.foodmodel.daoimpl.RestaurantImp;
import com.foodmodel.pojo.Restaurant;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class GetRestaurant extends HttpServlet {

    private RestaurantDAO restaurantDAO;
	private HttpSession session;

 
      
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  restaurantDAO = new RestaurantImp();
    	
    	// Fetch all restaurants from the database
        List<Restaurant> restaurantList = restaurantDAO.fetchAll();

        // Check if the restaurant list is empty
        if (restaurantList != null && !restaurantList.isEmpty()) {
        	session=request.getSession();
        	session.setAttribute("restaurantList", restaurantList);
            response.sendRedirect("Home.jsp");
        } else {
            // If no restaurants are found, set a message and forward to the JSP page
            request.setAttribute("message", "No restaurants found.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        }
    }

}

