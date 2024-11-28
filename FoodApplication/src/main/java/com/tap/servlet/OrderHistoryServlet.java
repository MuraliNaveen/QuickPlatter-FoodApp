package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.OrderImpl;
import com.foodmodel.pojo.Order;
import com.foodmodel.pojo.User;
/**
 * Servlet implementation class OrderHistoryServlet
 */
//@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 
    	
    	 User user=(User)req.getSession().getAttribute("loggedInUser");
    	  if (user == null) {
              System.out.println("User is null in OrderHistoryServlet, redirecting to login page.");
              resp.sendRedirect("login.jsp");  // Redirect to login if no user found
              return;
          }
    	  
    	  int userid=user.getU_ID();
    	    try {
    	    	OrderImpl odmpl=new OrderImpl();
    	    	ArrayList<Order>orderlist=odmpl.fetchAllOrdersofUser(userid);
    	    	if (orderlist == null || orderlist.isEmpty()) {
                    System.out.println("No order history found for userId: " + userid);
                   
                   resp.sendRedirect("NoOrderfound.jsp");
                }
    	    	else {
    	    		 System.out.println("Order history list found for userId: " + userid);
    	                req.setAttribute("orderhistorylist", orderlist);
    	    	}
    	    }
    	    
    	  catch (Exception e) {
    		  e.printStackTrace();
              req.setAttribute("orderHistoryMessage", "An error occurred while fetching order history.");
		}
    	    
    	    req.getRequestDispatcher("orderHistory.jsp").forward(req, resp);
    }

}
