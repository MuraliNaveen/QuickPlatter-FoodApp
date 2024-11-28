<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empty Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .empty-cart-container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .empty-cart-container img {
            width: 200px;
            margin-bottom: 20px;
        }

        .empty-cart-container h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .empty-cart-container p {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }

        .empty-cart-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .empty-cart-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="empty-cart-container">
        <img src="https://res.cloudinary.com/dko49jfq3/image/upload/v1732382947/a7e6c2e9333d0989e3a54c95dd8321d7_yvuoww.gif" alt="Empty Cart Icon">
        <h1>Your Cart is Empty</h1>
        <p>Looks like you haven’t added anything to your cart yet.</p>
        <a href="Home.jsp">Start Ordering</a>
    </div>
</body>
</html>
