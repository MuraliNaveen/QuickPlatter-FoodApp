<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodmodel.pojo.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Menu List</title>
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        /* General Body Styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: #f1fcf7;
            color: #333;
        }

        /* Header Section */
        header {
            background: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content:space-between;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header .logo {
            display: flex;
            align-items: center;
        }

        header .logo img {
            border-radius: 50%;
            height: 50px;
            width: 50px;
            margin-right: 10px;
        }

        .app-name {
            font-size: 24px;
            font-weight: bold;
            color: #28A745;
            margin: 0;
        }

        .app-name span {
            color: #000000;
            font-style: italic;
        }

        header h1 {
            font-size: 24px;
            color: #28A745;
            margin: 0;
             position: absolute; /* Position it absolutely to the center */
    left: 50%; /* Move the title horizontally to the center */
    transform: translateX(-50%); /* Offset it to align properly */
        }

        /* Container Styling */
     /* Center the Container */
.container {
    padding: 20px;
    max-width: 900px; /* Define a max width for the container */
    margin: 0 auto; /* Center the container horizontally */
}

/* Card Styling */
.card {
    display: flex;
    align-items: center;
    background: #eafaf1;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    padding: 20px;
    gap: 20px; /* Space between content and image */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
    transform-origin: center; /* Set the center as the origin for scaling */
    position: relative;
    max-width: 600px; /* Limit the card width for medium size */
    margin: 20px auto; /* Center each card horizontally */
    flex-direction: row; /* Restore side-by-side layout */
}

.card:hover {
    transform: scale(1.05) translateY(-10px); /* Pop-out effect + slight upward movement */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Enhanced shadow on hover */
}

/* Image Styling */
.card img {
    width: 200px;
    height: 200px;
    border-radius: 10px;
    object-fit: cover;
    transition: transform 0.3s ease; /* Smooth transition on hover */
}

/* Content Section */
.card-content {
    flex-grow: 1; /* Allow content to take available space */
    text-align: left; /* Align text to the left */
}

.card-content h3 {
    font-size: 20px;
    font-weight: bold;
    color: #28A745;
    margin: 0 0 10px;
}

.card-content p {
    margin: 5px 0;
    color: #333;
}

.card-content p.description {
    font-weight: bold;
    color: black;
}

/* Rating Styling */
.rating {
    display: flex;
    align-items: center;
    margin: 10px 0;
    font-size: 16px;
    justify-content: flex-start; /* Align rating to the left */
}

.rating i {
    margin-right: 5px;
    color: #20df40; /* Green color for rating stars */
}

/* Availability Styling */
.availability {
    font-weight: bold;
    margin: 10px 0;
    color: #28A745;
}

.availability.no {
    color: #e63946; /* Red color when unavailable */
}

/* Order Button Styling */
.order-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #28A745;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.order-btn:hover {
    background-color: #1d7a32;
}

.quantity-spinner {
    width: 60px;
    padding: 5px;
    margin-right: 10px;
    font-size: 14px;
    border-radius: 5px;
    border: 1px solid #ccc;
}
     

        /* Back Button */
        .back-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #28A745;
            color: white;
            text-align: center;
            width: fit-content;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .back-button:hover {
            background-color: #1d7a32;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <a href="#home">
                <img src="https://res.cloudinary.com/dko49jfq3/image/upload/v1732344582/FlogoNoclar_n8u2ig.png" alt="Logo">
            </a>
            <div class="app-name">
                Quick<span>Platter</span>
            </div>
        </div>
        <h1>
            <% String restaurantName = (String) session.getAttribute("RestaurantName"); %>
            <%= restaurantName != null ? restaurantName : "Restaurant" %>'s Menu
        </h1>
    </header>

    <div class="container">
        <% 
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu menu : menuList) {
        %>
        <div class="card">
            <!-- Content Section (Left) -->
            <div class="card-content">
                <h3><%= menu.getName() %></h3>
                <p class="description"><strong>Description:</strong> <%= menu.getDescription() %></p>
                <p><strong>Price:</strong>
            <i class="fa-solid fa-indian-rupee-sign" style="color: #0e7acd;"></i>
                
                <%= menu.getPrice() %></p>
                <div class="rating">
                    <i class="fa-solid fa-star"></i> 
                    <span><%= menu.getRating() %>/5</span>
                </div>
                <p class="availability <%= menu.isAvailable().equals("Yes") ? "" : "no" %>">
                    <strong>Available:</strong> <%= menu.isAvailable().equals("Yes") ? "Yes" : "No" %>
                </p>

                <form action="AddToCartController" method="POST">
                    <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                     <input type="hidden" name="restaurantid" value="<%= menu.getR_ID() %>">
                    <input type ="hidden" name="rimage" value="<%=menu.getImage() %>">
                    <%
    // Print the Menu ID in the console
    System.out.println("Menu.jsp Check");
    System.out.println("Menu ID: " + menu.getMenuId());
                    System.out.println("Restaurant id: "+ menu.getR_ID());
                    
%>
                    <input type="number" 
                           class="quantity-spinner" 
                           name="quantity" 
                           min="1" 
                         
                           value="1">
                    <button type="submit" class="order-btn">Add to Cart</button>
                </form>
            </div>
                 
            <!-- Image Section (Right) -->
            <img src="<%= menu.getImage() %>" alt="<%= menu.getName() %>">
        </div>
        <% 
                }
            } else { 
        %>
        <p style="text-align: center; color: #555; font-size: 18px;">No menu items available.</p>
        <% 
            } 
        %>
    </div>

    <a href="Home.jsp" class="back-button">Back to Home</a>
</body>
</html>
