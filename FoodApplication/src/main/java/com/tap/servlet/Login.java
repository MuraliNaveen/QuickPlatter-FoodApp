package com.tap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.foodmodel.daoimpl.UserImp;
import com.foodmodel.pojo.User;
import java.util.logging.Logger;

public class Login extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(Login.class.getName());

    
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Retrieve parameters
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Email and Password cannot be empty.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }
	    // Logging input (avoid logging sensitive information in production)
	    LOGGER.info("Attempting login for user: " + email);

	    UserImp userImp = new UserImp();
	    User user = userImp.fetchOnEmail(email);

	    if (user != null) {
	        // Example password check - replace with hashed password verification in real use
	        if (user.getPassword().equals(password)) {
	            // Successful authentication
	            HttpSession session = req.getSession();
	            session.setAttribute("loggedInUser", user);
	            LOGGER.info("Login successful for user: " + email);

	            // Determine the redirection based on the user role
	            if (user.getRole().equals("RestaurantAdmin")) {
	                resp.sendRedirect("RestaurantAdmin");
	            } else if (user.getRole().equals("SuperAdmin")) {
	                resp.sendRedirect("SuperAdmin.jsp");
	            } else if (user.getRole().equals("DeliveryAgent")) {
	                resp.sendRedirect("DeliveryAgent.jsp");
	            } else {
	                resp.sendRedirect("GetRestaurant");
	            }
	        } else {
	            // Incorrect password
	            LOGGER.warning("Login failed: Incorrect password for user: " + email);
	            req.setAttribute("errorMessage", "Invalid password. Please try again.");
	            req.getRequestDispatcher("Login.jsp").forward(req, resp);
	        }
	    } else {
	        // User not found
	        LOGGER.warning("Login failed: User not found with email: " + email);
	        req.setAttribute("errorMessage", "User not found. Please check your email or sign up.");
	        req.getRequestDispatcher("Login.jsp").forward(req, resp);
	    }
	}

        
        
        
    
}

