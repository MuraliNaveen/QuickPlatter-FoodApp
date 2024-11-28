package com.tap.servlet;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.foodmodel.dao.OrderDAO;
import com.foodmodel.dao.OrderItemDAO;
import com.foodmodel.dao.OrderHistoryDAO;
import com.foodmodel.daoimpl.OrderImpl;
import com.foodmodel.daoimpl.OrderItemImpl;
import com.foodmodel.daoimpl.OrderHistoryImpl;
import com.foodmodel.pojo.CartItem;
import com.foodmodel.pojo.Order;
import com.foodmodel.pojo.OrderHistory;
import com.foodmodel.pojo.OrderItem;
import com.foodmodel.pojo.User;
import java.io.IOException;
import java.util.Map;

public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO = new OrderImpl();
    private OrderItemDAO orderItemDAO = new OrderItemImpl();
    private OrderHistoryDAO orderHistoryDAO = new OrderHistoryImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	
    	
    	
    	HttpSession session = req.getSession();
      
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
             System.out.print(cart);
        // Check if cart is empty
        if (cart == null || cart.isEmpty()) {
            System.out.println("Cart is empty. Redirecting to cart.jsp...");
           
           
        }

        // Retrieve logged-in user
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            System.out.println("User not logged in. Redirecting to Login.jsp...");
            resp.sendRedirect("Login.jsp");
            return;
        }

        // Extract parameters
        int menuId=(Integer)(req.getSession().getAttribute("MenuIds"));
       
            
            System.out.println("menuId");
      

       // String plotNo = req.getParameter("plotNo");
       // String street = req.getParameter("street");
      //  String city = req.getParameter("city");
        String modeOfPayment = req.getParameter("paymentMode");
        String status = "Pending";

        int userId = user.getU_ID();
        int totalOrderAmount = 0;

        // Calculate total amount
        for (CartItem item : cart.values()) {
            totalOrderAmount += item.getQuantity() * item.getPrice();
        }

        try {
            // Process each item in the cart
            for (CartItem item : cart.values()) {
                // Insert order
                Order order = new Order(
                    userId,
                    item.getRestaurant_id(),
                    menuId,
                    item.getQuantity(),
                    item.getQuantity() * item.getPrice(),
                    modeOfPayment,
                    status
                );

                int orderId = orderDAO.insertOrder(order);
                if (orderId == -1) {
                    throw new Exception("Failed to create order for user: " + userId);
                }

                // Insert order item
                OrderItem orderItem = new OrderItem(
                    orderId,
                    menuId,
                    item.getQuantity(),
                    item.getQuantity() * item.getPrice()
                );
                orderItemDAO.insertOrderItem(orderItem);

                // Insert order history
                OrderHistory orderHistory = new OrderHistory(
                    orderId,
                    item.getRestaurant_id(),
                    userId,
                    item.getQuantity() * item.getPrice(),
                    status
                );
                orderHistoryDAO.insertOrderHistory(orderHistory);
            }

            // Pass the cart and total amount to order confirmation page
            req.setAttribute("cart", cart);
            req.setAttribute("totalOrderAmount", totalOrderAmount);

            // Clear the cart from the session
            session.removeAttribute("cart");

            // Redirect to order confirmation page
           // req.getRequestDispatcher("orderconfirm.jsp").forward(req, resp);
            resp.sendRedirect("orderconfirm.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred while processing your order. Please try again.");
            req.getRequestDispatcher("Checkout.jsp").forward(req, resp);
        }
    }
}


