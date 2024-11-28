<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodmodel.pojo.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Your Shopping Cart - Mumma's Kitchen Express!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: #fff;
            color: #333;
        }

        /* Container */
        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #eafaf1;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #28a745; /* Green color for heading */
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Card Container for Cart Items */
        .cart-items {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .cart-item {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            width: calc(33.333% - 20px); /* Three cards in a row */
            box-sizing: border-box;
            text-align: center;
        }

        .cart-item img {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .cart-item h3 {
            color: #333;
            font-size: 20px;
        }

        .cart-item .price {
            font-size: 18px;
            color: #28a745;
            margin: 10px 0;
        }

        .actions button {
            padding: 8px 14px;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s ease;
            font-size: 14px;
        }

        .update-btn {
            background-color: #007bff; /* Blue for Update */
            color: white;
            border: none;
        }

        .remove-btn {
            background-color: #dc3545; /* Red for Remove */
            color: white;
            border: none;
        }

        .update-btn:hover, .remove-btn:hover {
            transform: scale(1.05);
        }

        /* Checkout Section */
        .checkout {
            text-align: right;
            margin-top: 20px;
        }

        .checkout button {
            background-color: #28a745; /* Green color for checkout */
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .checkout button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* More Items Button */
        .more-items-btn {
            background-color: #007bff; /* Blue color */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            text-align: center;
            width: 200px;
            transition: transform 0.3s ease;
        }

        .more-items-btn:hover {
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .cart-item {
                width: 100%;
            }
            .checkout button, .more-items-btn {
                width: 100%;
                padding: 14px;
            }
        }
    </style>
</head>
<body>
<%
    // Retrieve session attributes with null check
    Integer menuId = (Integer) request.getSession().getAttribute("MenuIds");
    Integer restaurantId = (Integer) request.getSession().getAttribute("Restaurantids");
    String mimage = request.getParameter("rimage");

    // Ensure session attributes are not null before proceeding
    if (menuId == null || restaurantId == null) {
    	  response.sendRedirect("emptyCart.jsp");
        return; // Or redirect to an appropriate page if data is missing
    }

    System.out.println("MenuId: " + menuId);
    System.out.println("RestaurantId: " + restaurantId);
%>
<% System.out.println("MenUId ::::::::"+menuId);


 System.err.println("++++++++++++");
System.out.println(" restaurantId ");




%>

<div class="container">
    <!-- Home and Clear Cart Buttons -->
    <div class="button-container">
        <a href="Home.jsp" style="text-decoration: none;">
            <button class="home-btn" style="background-color: #007bff; color: white; border: none; padding: 12px 20px; border-radius: 8px;">
                <i class="fas fa-home"></i> Home
            </button>
        </a>
        <form action="ClearCartController" method="POST" style="margin: 0;">
            <button type="submit" style="background-color: #dc3545; color: white; border: none; padding: 12px 20px; border-radius: 8px;">
                Clear Cart
            </button>
        </form>
    </div>

    <h2>Your Shopping Cart</h2>

    <!-- Cart Items -->
    <div class="cart-items">
        <%
            int grandTotal = 0;
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart.values()) {
                    int itemTotal = item.getTotalPrice();
                    grandTotal += itemTotal;
        %>
        <div class="cart-item">
            <img src="<%=item.getImage()%>" alt="<%= item.getName() %>">
            <h3><%= item.getName() %></h3>
            <div class="price">$<%= item.getPrice() %></div>

            <form action="UpadateCartServlet" method="POST" style="display: inline;">
                <input type="hidden" name="itemId" value="<%= item.getOrderItemId() %>">
                <input type="number" name="quantity" min="1" value="<%= item.getQuantity() %>" style="width: 60px; padding: 6px;">
                <button type="submit" class="actions update-btn">Update</button>
            </form>

            <form action="RemoveCartController" method="POST" style="display: inline;">
                <input type="hidden" name="itemId" value="<%= item.getOrderItemId() %>">
                <button type="submit" class="actions remove-btn">Remove</button>
            </form>

            <div>Total: $<%= itemTotal %></div>
        </div>
        <% 
                }
            } else { 
        %>
        <div class="cart-item" style="text-align: center; color: #dc3545;">Your cart is empty!</div>
        <% 
            } 
        %>
    </div>

    <% if (cart != null && !cart.isEmpty()) { %>
    <!-- Checkout Button -->
    <div class="checkout">
        <form action="Checkout.jsp" method="POST">
            <input type="hidden" name="totalAmount" value="<%= grandTotal %>">
            <input type="hidden" name="menuid" value="<%= menuId %>">
              <input type="hidden" name="resid" value="<%= restaurantId %>">
            <%System.out.println("This is the main Problem Menuid:"+"(" +menuId+")"); %>
            <button type="submit">Proceed to Checkout</button>
        </form>
    </div>
    <% } %>

    <!-- More Items Button -->
    <a href="menu.jsp">
        <button class="more-items-btn">Add More Items</button>
    </a>
</div>

</body>
</html>
