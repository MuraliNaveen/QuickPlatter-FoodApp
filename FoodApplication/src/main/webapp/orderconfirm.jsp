<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - FoodApp</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow-x: hidden;
        }

        .success-card {
            background: white;
            padding: 40px;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 100%;
            position: relative;
            animation: cardFloat 3s ease-in-out infinite;
        }

        @keyframes cardFloat {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        .gif-container {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .gif-container img {
            max-width: 100%;
            border-radius: 16px;
        }

        .title {
            font-size: 32px;
            color: #2d3748;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .order-info {
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            border-radius: 16px;
            padding: 20px;
            margin: 20px 0;
            transform: scale(0.9);
            opacity: 0;
            animation: scaleIn 0.5s ease-out 0.6s forwards;
        }

        @keyframes scaleIn {
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .order-id {
            font-size: 18px;
            color: #2d3748;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .estimated-time {
            font-size: 16px;
            color: #4a5568;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .button {
            background: linear-gradient(135deg, #4CAF50 0%, #43a047 100%);
            color: white;
            border: none;
            padding: 16px 36px;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            position: relative;
        }

        .button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(76, 175, 80, 0.2);
        }

        @media (max-width: 480px) {
            .success-card {
                padding: 30px 20px;
            }
            
            .title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="success-card">
        <div class="gif-container">
            <img src="https://res.cloudinary.com/dko49jfq3/image/upload/v1732386885/placed2_n9ssn7.gif" alt="Order Placed Successfully">
        </div>
        <h1 class="title">Order Confirmed!</h1>

        <div class="order-info">
            <div class="order-id" id="orderId">Order #2024001</div>
            <div class="estimated-time">
                <span>⏰ Estimated delivery Time: 30-45 minutes</span>
            </div>
        </div>

        <p class="subtitle">Your delicious food is being prepared with extra care and love!</p>
        <a href="Home.jsp" class="button">Explore More Delicious Food &#x1F924; &#x1F60B;</a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Generate and animate order ID
            const orderNumber = 'FD' + Math.floor(Math.random() * 1000000);
            const orderIdElement = document.getElementById('orderId');
            orderIdElement.style.opacity = '0';

            setTimeout(() => {
                orderIdElement.style.transition = 'opacity 0.5s ease';
                orderIdElement.textContent = orderNumber;
                orderIdElement.style.opacity = '1';
            }, 500);
        });
    </script>
</body>
</html>
