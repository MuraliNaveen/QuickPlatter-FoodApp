<%@ page import="com.foodmodel.pojo.Order" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        header {
            background-color: #f4f7f6; /* Green */
            padding: 20px;
            text-align: center;
            color: Black;
        }

        h2 {
            margin: 0;
            font-size: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .order-table th, .order-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .order-table th {
            background-color: #4CAF50; /* Green */
            color: white;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        .order-table td {
            font-size: 0.9rem;
        }

        .order-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .order-table tr:hover {
            background-color: #eaf5ea; /* Light green hover effect */
        }

        .btn-view {
            background-color: #66BB6A; /* Lighter Green */
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: background-color 0.3s;
        }

        .btn-view:hover {
            background-color: #4CAF50; /* Darker Green on hover */
        }

        .no-orders {
            text-align: center;
            font-size: 1.2rem;
            color: #4CAF50; /* Green for no orders message */
            margin-top: 20px;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #888;
            font-size: 0.9rem;
        }

        .footer a {
            text-decoration: none;
            color: #4CAF50; /* Green for footer links */
        }
/* Define column widths */
.col-serial {
    width: 10%;
    text-align: center;
}

.col-date {
    width: 25%;
}

.col-total {
    width: 20%;
}

.col-status {
    width: 20%;
}

.col-actions {
    width: 25%;
    text-align: center;
}

    </style>
</head>
<body>

<header>
    <h2>Your Orders</h2>
</header>

<div class="container">
    <% 
        // Fetch order history from the request
        List<Order> orderHistoryList = (List<Order>) request.getAttribute("orderhistorylist");

        // Fetch message if any (like an error message)
        String message = (String) request.getAttribute("orderHistoryMessage");
        if (message != null) {
            out.println("<div class='no-orders'>" + message + "</div>");
        }

        if (orderHistoryList != null && !orderHistoryList.isEmpty()) {
    %>
    <table class="order-table">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>View Items</th>
            </tr>
        </thead>
        <tbody>
            <% 
                int counter = 1;
                for (Order order : orderHistoryList) {
            %>
            <tr>
                <td><%= counter++ %></td>
                <td><%= order.getDateAndTime() %></td>
                <td>₹<%= order.getTotal() %></td>
                <td><%= order.getStatus() %></td>
                <td>
                    <form action="ViewOrderItemsHistory" method="post">
                        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                        <button type="submit" class="btn-view">View Items</button>
                    </form>
                </td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
    <% 
        } else {
    %>
    <div class="no-orders">No orders found.</div>
    <% 
        }
    %>
</div>

<div class="footer">
    <p>&copy; 2024 QuickPlatter | <a href="Home.jsp">Back to Home</a></p>
</div>

</body>
</html>
