<%@ page import="com.foodmodel.pojo.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Mumma's Kitchen Express</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: #f7f7f7;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f1f1f1;
            color: #333;
        }

        td img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
        }

        .total {
            text-align: right;
            font-size: 1.2em;
            font-weight: bold;
            color: #28a745;
        }

        .checkout-form {
            margin-top: 20px;
        }

        .checkout-form input, .checkout-form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .checkout-form button {
            width: 100%;
            padding: 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2rem;
            cursor: pointer;
        }

        .checkout-form button:hover {
            background-color: #218838;
        }

        .empty-cart {
            text-align: center;
            padding: 20px;
        }

        .empty-cart h3 {
            color: #dc3545;
        }

        .empty-cart a {
            text-decoration: none;
            color: #007bff;
        }

        .empty-cart a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Checkout</h2>
        <%
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                int grandTotal = 0;
        %>
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartItem item : cart.values()) {
                        int subtotal = item.getQuantity() * item.getPrice();
                        grandTotal += subtotal;
                %>
                <tr>
                    <td><img src="<%= item.getImage() %>" alt="<%= item.getName() %>"></td>
                    <td><%= item.getName() %></td>
                    <td>₹<%= item.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>₹<%= subtotal %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <div class="total">Grand Total: ₹<%= grandTotal %></div>

        <div class="checkout-form">
            <form action="CheckoutController" method="POST">
                <input type="hidden" name="grandTotal" value="<%= grandTotal %>">
                <input type="text" name="name" placeholder="Enter your full name" required>
                <input type="text" name="address" placeholder="Enter your delivery address" required>
                <input type="tel" name="phone" placeholder="Enter your phone number" pattern="[0-9]{10}" required>
                <select name="paymentMode" required>
                    <option value="" disabled selected>Select Payment Mode</option>
                    <option value="Cash on Delivery">Cash on Delivery</option>
                    <option value="Credit/Debit Card">Credit/Debit Card</option>
                    <option value="UPI">UPI</option>
                </select>
                <button type="submit">Place Order</button>
            </form>
        </div>
        <% 
            } else { 
        %>
        <div class="empty-cart">
            <h3>Your cart is empty!</h3>
            <p><a href="menu.jsp">Add items to your cart</a></p>
        </div>
        <% } %>
    </div>
</body>
</html>
