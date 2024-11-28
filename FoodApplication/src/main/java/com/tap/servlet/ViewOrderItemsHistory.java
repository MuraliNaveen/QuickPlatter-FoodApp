package com.tap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.OrderItemImpl;
import com.foodmodel.pojo.OrderItem;

/**
 * Servlet implementation class ViewOrderItemsHistory
 */
//@WebServlet("/ViewOrderItemsHistory")
public class ViewOrderItemsHistory extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  
		 int orderid=Integer.parseInt(req.getParameter("orderId"));
		 
		 
		 
		 
		 System.out.println("orderid = mawa______"+orderid);
		 try {
		OrderItemImpl orderitemimpl=new OrderItemImpl();
		     OrderItem    orderitem =orderitemimpl.fetchSpecific(orderid);
		
		     System.out.println("Fetched Order Items: " + orderitem);
		     if (orderitem != null ) {
	                req.setAttribute("orderitemlist", orderitem);
	            } else {
	                req.setAttribute("message", "No items found for this order.");
	            }
		     
		     
		     
		     
		     req.getRequestDispatcher("OrderItemHistory.jsp").forward(req, resp);
		}
		 catch (NumberFormatException e) {
	            // Handle invalid order ID format
	            System.err.println("Invalid order ID format: " + e.getMessage());
	            req.setAttribute("errorMessage", "Invalid order ID format."); // Set error message for the JSP
	            req.getRequestDispatcher("/errorPage.jsp").forward(req, resp); // Forward to error page

	        } catch (Exception e) {
	            // Handle general errors
	            System.err.println("Error retrieving order items: " + e.getMessage());
	            req.setAttribute("errorMessage", "Error retrieving order items."); // Set error message for the JSP
	            req.getRequestDispatcher("/errorPage.jsp").forward(req, resp); // Forward to error page
	        }
	}
}
