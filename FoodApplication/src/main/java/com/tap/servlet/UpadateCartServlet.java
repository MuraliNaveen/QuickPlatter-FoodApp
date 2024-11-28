package com.tap.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.CartDAOImpl;
import com.foodmodel.pojo.CartItem;

;

public class UpadateCartServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the cart from the session
        @SuppressWarnings("unchecked")
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) req.getSession().getAttribute("cart");

        // If the cart doesn't exist, initialize a new one
        if (cart == null) {
            cart = new HashMap<>();
        }

        // Get the itemId and the new quantity to update
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Create a CartDAOImpl object and call the update method, passing the current cart
        CartDAOImpl cartDao = new CartDAOImpl();
        cart = cartDao.updateItem(cart, itemId, quantity);

        // Save the updated cart back into the session
        req.getSession().setAttribute("cart", cart);

        // Redirect back to the cart page to display updated cart and totals
        resp.sendRedirect("cart.jsp");
    }
}


