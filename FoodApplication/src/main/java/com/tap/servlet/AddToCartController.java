package com.tap.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.MenuDAOImp;
import com.foodmodel.pojo.CartItem;
import com.foodmodel.pojo.Menu;

public class AddToCartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the cart from the session
        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) req.getSession().getAttribute("cart");

        // If no cart exists in the session, create a new one
        if (cart == null) {
            cart = new HashMap<>();
        }

        // Retrieve menu ID and quantity from the request
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int RId = Integer.parseInt(req.getParameter("restaurantid"));
        String RImage = req.getParameter("rimage");

        System.out.println("CheckImage:::::->" + RImage);
        System.out.println("MenuId :" + menuId);
        System.out.println("Quantity: " + quantity);
        System.out.println("RestaurantId:" + RId);
            req.getSession().setAttribute("Restaurantids", RId);
            req.getSession().setAttribute("MenuIds", menuId);
        // Fetch the specific menu item from the database
        MenuDAOImp mdao = new MenuDAOImp();
        Menu menu = mdao.fetchSpecific(menuId);

        // Create or update the cart item
        if (cart.containsKey(menuId)) {
            // Update the quantity if the item already exists
            CartItem existingItem = cart.get(menuId);
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            // Add a new item to the cart
            CartItem newItem = new CartItem(menuId, menu.getR_ID(), menu.getName(), quantity, menu.getPrice(),menu.getImage());
            cart.put(menuId, newItem);
        }

        // Save the updated cart back into the session
        req.getSession().setAttribute("cart", cart);

        // Redirect to cart.jsp with additional parameters
        resp.sendRedirect("cart.jsp?menuId=" + menuId + "&restaurantId=" + RId + "&rimage=" + RImage);
    }
}
