<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>QuickPlatter</title>
    
    <!-- Favicon -->
    <link rel="icon" href="https://res.cloudinary.com/dko49jfq3/image/upload/v1732344582/FlogoNoclar_n8u2ig.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://res.cloudinary.com/dko49jfq3/image/upload/v1732267079/login_image_2_p1iy3l.jpg') no-repeat center center;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: rgba(240, 250, 240, 0.9); /* Light green matching the background */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .login-container h1 {
            color: #388e3c; /* Dark green for title */
            font-size: 28px;
            margin-bottom: 20px;
        }
        .login-container .input-group {
            margin: 15px 0;
            display: flex;
            align-items: center;
            border: 1px solid #a5d6a7; /* Light green border */
            border-radius: 8px;
            padding: 10px;
            background: #e8f5e9; /* Very light green background */
        }
        .login-container .input-group i {
            margin-right: 10px;
            color: #558b2f; /* Medium green for icons */
        }
        .login-container input {
            width: 100%;
            border: none;
            outline: none;
            font-size: 14px;
            background: transparent;
            color: #2e7d32; /* Medium green for input text */
        }
        .login-container .btn {
            margin-top: 20px;
            background-color: #388e3c; /* Dark green for button */
            color: #fff; /* White text */
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .login-container .btn:hover {
            background-color: #2e7d32; /* Slightly darker green on hover */
        }
        .login-container a {
            text-decoration: none;
            color: #388e3c; /* Dark green for links */
            display: block;
            margin-top: 15px;
        }
        .login-container a:hover {
            color: #2e7d32; /* Darker green on hover */
        }
        .error-message {
            color: #d32f2f; /* Red for error messages */
            font-size: 14px;
            margin-top: 10px;
        }
        .span{
        color:black;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login to Quick <span>Platter</span></h1>
        <form action="Login" method="post">
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn">Login</button>
            <a href="signup.jsp">Don't have an account? Sign Up</a>
        </form>
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>
    </div>
</body>
</html>
