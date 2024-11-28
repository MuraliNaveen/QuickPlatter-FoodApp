<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodmodel.pojo.Menu" %>
<%@ page import="com.foodmodel.pojo.Restaurant" %>
<%@ page import="com.foodmodel.pojo.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
   /* General Body Styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  
    background-size: cover;
    color: #fff;
}

/* Navbar Styling */
header {
   background-color: rgba(34, 102, 34, 0.9);
    backdrop-filter: blur(5px); /* Adds blur effect */
    position: sticky;
    top: 0;
    z-index: 1000;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
    position: sticky;
    top: 0;
    z-index: 1000;
}

header .logo img {
    height: 50px;
}

.items {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}

.items li {
    margin: 0 15px;
}

.items a {
    text-decoration: none;
    color: #fff; /* White text for contrast */
    font-size: 16px;
    transition: color 0.3s ease-in-out;
    display: flex;
    align-items: center;
    gap: 5px; /* Space between icon and text */
}

.items a:hover {
    color: #a6f6a1; /* Light green hover color */
}

.items i {
    font-size: 18px;
}

/* Welcome Section Styling */
.welcome-section {
    text-align: center;
    margin: 20px 0;
}

.welcome-section h1 {
    font-size: 32px;
    margin-bottom: 10px;
    color: #35a184; /* Highlighted orange for welcome text */
}

.welcome-section h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

/* Menu Section Styling */
.menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin: 20px auto;
    padding: 20px;
    width: 90%;
}

.menu-item-card {
           background-color: #eafaf1;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
    text-align: center;
    color: #fff;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.menu-item-card:hover {
    transform: scale(1.05);
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.7);
}

.menu-item-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 10px;
}

.menu-item-card h2 {
    margin: 10px 0;
    color: #ffa500; /* Highlighted orange for menu item titles */
    font-size: 1.5em;
}

.menu-item-card p {
    margin: 5px 0;
    font-size: 1em;
    color:black;
}

/* Action Buttons */
.actions {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 15px;
}

.actions .btn-edit,
.actions .btn-delete {
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

.actions .btn-edit {
    background-color: #4caf50; /* Green */
    color: #fff;
}

.actions .btn-edit:hover {
    background-color: #45a049;
}

.actions .btn-delete {
    background-color: #ff4d4d; /* Red */
    color: #fff;
}

.actions .btn-delete:hover {
    background-color: #e63939;
}

/* No Menus Section */
.no-menus {
    text-align: center;
    font-size: 18px;
    color: #ffa500; /* Highlighted orange */
    margin-top: 20px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .menu-grid {
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    }

    .items {
        flex-direction: column;
        align-items: flex-start;
    }

    .items li {
        margin: 10px 0;
    }
}
   
</style>
</head>
<body>
<%= session.getId() %>


    <% 
        // Retrieve user and restaurant details from the session
        User user = (User) session.getAttribute("loggedInUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("Restaurant");
        String userName = user != null ? user.getUserName() : "User";
        String restaurantName =  restaurant.getRName() ;
        
        int restaurantId = restaurant != null ? restaurant.getR_ID() : -1; // Get the RestaurantId
    %>
<% 
    System.out.println("Logged in user in JSP: " + userName);
    System.out.println("Restaurant in JSP: " + restaurant);
    System.out.println("Restaurantid" + restaurantId);
%>

    <!-- Header -->
    <header>
        <div class="logo">
            <img src="https://res.cloudinary.com/dko49jfq3/image/upload/v1732204296/file_nm57rf.jpg" alt="Logo">
        </div>
        <ul class="items">
            <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="addMenu.jsp?restaurantId=<%= restaurantId %>"><i class="fas fa-plus"></i> Add Menu</a></li>
            <%System.err.print(restaurantId); %>
            <li><a href="editMenu.jsp"><i class="fas fa-edit"></i> Edit Menu</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </header>
 
    <!-- Welcome Section -->
    <div class="welcome-section">
        <h1>Welcome to <%= restaurantName %>'s Admin Panel</h1>
       
    </div>

   <!-- Menu Section -->
<div class="menu-section">
    <h2 class="menu-heading" style="text-align: center; color: #ffa500;">Your Menu</h2>
    <% 
        // Retrieve the menu list from the session
        List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
        if (menuList != null && !menuList.isEmpty()) {
    %>
    <div class="menu-grid">
        <% for (Menu menu : menuList) { %>
         <%System.err.println("This Menu Image:"+menu.getImage()); %>
        <div class="menu-item-card">
            <!-- Display menu image or default image if none is provided -->
            <img src="<%= menu.getImage() %>" alt="<%= menu.getName() %>" >
             
            <h2><%= menu.getName() %></h2>
            <p><b>Price:</b> <i class="fa-solid fa-indian-rupee-sign" style="color: #124f7d;"></i><%= (int)menu.getPrice() %></p>
            <p><b>Description:</b> <%= menu.getDescription() %></p>
            <p>
   <b>Rating:</b> <i class="fa-solid fa-star" style="color: #FFD43B;"></i><%= menu.getRating() %>
   </p>
                <p><b>Is Available:</b><%=menu.isAvailable() %>
   
            <div class="actions">
                <!-- Edit button -->
                <form action="editMenu" method="post">
                    <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                    <button type="submit" class="btn-edit">Edit</button>
                </form>
                <!-- Delete button -->
                <form action="deleteMenu" method="post">
                    <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                    <button type="submit" class="btn-delete">Delete</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>
    <% 
        } else { 
    %>
    <p class="no-menus">No menu items available. Please add some!</p>
    <% } %>
</div>
 
</body>
 
</html>
