<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodmodel.pojo.OrderItem" %>
<%@ page import="com.foodmodel.daoimpl.MenuDAOImp" %>
<%@ page import="com.foodmodel.pojo.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Item Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .order-item-details {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-top: 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
        }

        .order-item-details img {
            max-width: 200px;
            margin-right: 30px;
            border-radius: 8px;
        }

        .item-info {
            flex: 1;
        }

        .item-info h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #4CAF50; /* Green */
        }

        .item-info p {
            font-size: 1.2rem;
            line-height: 1.6;
            color: #555;
        }

        .item-info .item-price {
            font-size: 1.5rem;
            color: #FF5722; /* Orange */
        }

        .go-back-btn {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #4CAF50; /* Green */
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .go-back-btn:hover {
            background-color: #388E3C; /* Darker green on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <%
        // Retrieve order item and menu details from the request
        OrderItem orderitem = (OrderItem) request.getAttribute("orderitemlist");
        int orderid = orderitem.getOrderId();
        int menuid = orderitem.getMenuId();
        int quantity = orderitem.getQuantity();
        int itemTotal = orderitem.getItemTotal();

        // Fetch menu details for the item
        MenuDAOImp menudao = new MenuDAOImp();
        Menu m = menudao.fetchSpecific(menuid);
        String imagepath = m.getImage();
        int price = m.getPrice();
    %>

    <div class="order-item-details">
        <!-- Display menu item image -->
        <img src="<%= imagepath %>" alt="Menu Item Image">

        <!-- Display order item details -->
        <div class="item-info">
            <h2><%= m.getName() %></h2>
            <p><strong>Order ID:</strong> <%= orderid %></p>
            <p><strong>Quantity:</strong> <%= quantity %></p>
            <p><strong>Price per item:</strong> ₹<%= price %></p>
            <p class="item-price"><strong>Total:</strong> ₹<%= itemTotal %></p>
        </div>
    </div>

    <!-- Go back to the order history page -->
    <a href="orderHistory.jsp" class="go-back-btn">Back to Order History</a>
</div>

</body>
</html>
