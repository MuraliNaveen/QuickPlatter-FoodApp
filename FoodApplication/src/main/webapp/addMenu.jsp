<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Menu</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
        font-family: Arial, sans-serif;
         background-color: #eafaf1;
        margin: 0;
        padding: 0;
    }
    header {
        background-color: #1a7d50; /* A soft greenish color */
        padding: 15px 0;
        text-align: center;
    }
    header .items {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }
    header .items li {
        display: inline;
        margin-right: 20px;
    }
    header .items li a {
        color: #ffffff; /* White text */
        text-decoration: none;
        font-size: 18px;
    }
    .form-container {
        background-color: #ffffff; /* White background */
        padding: 20px;
        margin-top: 30px;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .form-container h1 {
        color: #000000; /* Black text */
        text-align: center;
        font-size: 24px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        font-size: 16px;
        color: #000000; /* Black text */
    }
    .form-group input, .form-group textarea, .form-group select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #dcdcdc;
        border-radius: 5px;
        font-size: 14px;
    }
    .form-group textarea {
        resize: vertical;
    }
    .form-actions {
        text-align: center;
    }
    .submit-button {
        background-color: #39d3af; /* Greenish button */
        color: #ffffff; /* White text */
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }
    .submit-button:hover {
        background-color: #2ba88a; /* Darker green on hover */
    }
    .back-button {
        display: inline-block;
        margin-top: 10px;
        color: #39d3af; /* Greenish text */
        text-decoration: none;
        font-size: 16px;
    }
    .back-button:hover {
        text-decoration: underline;
    }
    .h1{
    color: #4CAF50; }
    </style>
</head>
<body>
   
    <!-- Header -->
    <header>
        <ul class="items">
            <li><a href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
        </ul>
    </header>

    <!-- Add Menu Form -->
    <div class="form-container">
        <h1>Add a New Menu Item</h1>
        <form action="addMenuServlet" method="post" >
            <!-- Hidden field for Restaurant ID -->
           
            <!-- Name -->
            <div class="form-group">
                <label for="name">Menu Name:</label>
                <input type="text" id="name" name="name"  placeholder="Enter menu name" required>
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="3" required placeholder="Enter menu description"></textarea>
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="price">Price (₹):</label>
                <input type="number" id="price" name="price" required step="0.01" placeholder="Enter price">
            </div>

            <!-- Rating -->
            <div class="form-group">
                <label for="rating">Rating (1-5):</label>
                <input type="number" id="rating" name="rating" required min="1" max="5" placeholder="Enter rating">
            </div>

            <!-- Is Available -->
            <div class="form-group">
                <label for="isAvailable">Is Available:</label>
                <select id="isAvailable" name="isAvailable" required>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>

            <!-- Image -->
            <div class="form-group">
                <label for="image">Menu Image:</label>
                <input type="text" id="image" name="image">
            </div>

            <!-- Submit Button -->
            <div class="form-actions">
                <button type="submit" class="submit-button">Add Menu</button>
                <a href="RestaurantAdmin.jsp" class="back-button">Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html>

