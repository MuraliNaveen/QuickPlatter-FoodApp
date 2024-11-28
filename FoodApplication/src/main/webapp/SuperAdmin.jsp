<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.foodmodel.pojo.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - Mumma's Kitchen Express</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    /* Set the background image for the page */
    body {
        background: url('https://res.cloudinary.com/dko49jfq3/image/upload/v1732267079/login_image_2_p1iy3l.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        color: #fff; /* White text for contrast */
    }

    header {
        background-color: rgba(51, 34, 22, 0.7); /* Semi-transparent navbar background */
        padding: 10px 20px;
    }

    nav {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .nav-item {
        display: flex;
        align-items: center;
        margin: 0 15px;
        color: #ffffff; /* White text for navbar items */
        font-size: 18px;
        text-decoration: none;
        transition: color 0.3s ease-in-out;
    }

    .nav-item i {
        margin-right: 10px;
        font-size: 20px;
    }

    /* Hover effect for navbar items */
    .nav-item:hover {
        color: #ffa500; /* Highlight color on hover (orange) */
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }

    .nav-left {
        display: flex;
        align-items: center;
    }

    .nav-right {
        display: flex;
        align-items: center;
    }

    /* Welcome message styling */
    h1 {
        text-align: center;
        margin-top: 20px;
        font-family: Arial, sans-serif;
        color: #ff9360; /* Warm color for the heading */
    }

    /* Action buttons container */
    .div1 {
        display: flex;
        justify-content: center;
        align-items: center;
        column-gap: 25px;
        margin-top: 30px;
    }

    /* Action button styling */
    .action-btn {
        display: inline-block;
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 20px 40px;
        text-align: center;
        text-decoration: none;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .action-btn:hover {
        background-color: #45a049;
        transform: scale(1.1);
    }

    .action-btn i {
        margin-right: 20px;
    }
</style>
</head>
<body>

<header>
    <nav class="navbar">
        <!-- Left aligned items -->
        <div class="nav-left">
            <a href="#" class="nav-item">
                <i class="fa-solid fa-house"></i>Home
            </a>
            <a href="#" class="nav-item">
                <i class="fa-solid fa-person" style="color: #ffa500;"></i>Add Delivery Agent
            </a>
            <a href="#" class="nav-item">
                <i class="fa-solid fa-bowl-food" style="color: #ff9360;"></i>Add Restaurant
            </a>
            <a href="#" class="nav-item">
                <i class="fa-solid fa-bowl-food" style="color: #ff9360;"></i>Remove Restaurant
            </a>
        </div>

        <!-- Right aligned item -->
        <div class="nav-right">
            <a href="Login.jsp" class="nav-item">
                <i class="fa-solid fa-right-to-bracket"></i>Logout
            </a>
        </div>
    </nav>
</header>

<% 
    User u = (User) request.getSession().getAttribute("loggedInUser");  
    String UserName = u.getUserName();
%>

<h1>Welcome, <%= UserName %></h1>

<div class="div1">
    <!-- Link to Add Delivery Agent page -->
    <a href="addDeliveryAgent.jsp" class="action-btn add-delivery-agent">
        <i class="fa fa-plus" style="color: green;"></i> Add Delivery Agent
    </a>

    <!-- Link to Add Restaurant page -->
    <a href="addRestaurant.jsp" class="action-btn add-restaurant">
        <i class="fa fa-plus" style="color: green;"></i> Add Restaurant
    </a>

    <!-- Link to Remove Restaurant page -->
    <a href="removeRestaurant" class="action-btn remove-restaurant">
        <i class="fa fa-plus" style="color: green;"></i> Remove Restaurant
    </a>
</div>

</body>
</html>
