
package com.tap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClearCartController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Simply remove the cart from the session
        req.getSession().removeAttribute("cart");
        
        // Redirect to the cart page, which will now be empty
        resp.sendRedirect("cart.jsp");
    }
}

