<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Restaurant</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- For icons -->
    <style>
        /* General Body and Page Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #eafaf1; /* Light green background color */
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* For Scrolling */
        html, body {
            height: 100%;
            overflow-y: auto;
        }

        /* Container for the Form */
        .container-wrapper {
            display: flex;
            justify-content: center; /* Centers horizontally */
            align-items: flex-start; /* Aligns items to the top */
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 600px;
            width: 100%;  /* Ensures the container is responsive */
            padding: 20px;
            background-color: #ffffff; /* White background for form */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        /* Back to Home Button */
        .back-to-home {
            position: absolute;
            bottom: -50px; /* Moves the button below the form */
            left: 10px;
            width: 90px;
            height: 50px;
            text-decoration: none;
            background-color: #4CAF50; /* Green button */
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.3s ease;
        }

        .back-to-home:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        .back-to-home i {
            font-size: 18px;
        }

        /* Heading Styling */
        h1 {
            text-align: center;
            color: #4CAF50;  /* Green color for heading */
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        /* Form Field Styling */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: #333;
            margin-bottom: 8px;
            font-weight: 600;
        }

        input, select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border 0.3s ease;
        }

        input:focus, select:focus {
            border: 1px solid #5cbae6;
            outline: none;
        }

        /* Button Styling */
        button.btn {
            width: 100%;
            padding: 12px;
            background-color: #5cbae6;
            color: #fff;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button.btn:hover {
            background-color: #4ca3d1;
        }

        /* File Upload Styling */
        input[type="file"] {
            padding: 10px;
            font-size: 16px;
            border: none;
            background-color: #f5f5f5;
            border-radius: 5px;
        }

        input[type="file"]:hover {
            background-color: #e0e0e0;
        }

        /* Form Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
                margin: 20px;
            }

            h1 {
                font-size: 24px;
            }

            .back-to-home {
                width: 40px;
                height: 40px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container-wrapper">
        <div class="container">
            <h1>Add Restaurant</h1>
            <form action="addRestaurantServlet" method="post">
                <!-- Restaurant Name -->
                <div class="form-group">
                    <label for="rName">Restaurant Name</label>
                    <input type="text" id="rName" name="rName" required>
                </div>

                <!-- Cuisine Type -->
                <div class="form-group">
                    <label for="cusineType">Cuisine Type</label>
                    <input type="text" id="cusineType" name="cusineType" required>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>

                <!-- Rating -->
                <div class="form-group">
                    <label for="rating">Rating</label>
                    <input type="number" id="rating" name="rating" min="0" max="5" step="0.1" placeholder="Enter rating (0-5)">
                </div>

                <!-- Is Available -->
                <div class="form-group">
                    <label for="available">Is Available?</label>
                    <select id="available" name="available" required>
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>
                </div>

                <!-- Restaurant Image -->
                <div class="form-group">
                    <label for="rImage">Restaurant Image</label>
                    <input type="text" id="rImage" name="rImage" required>
                </div>

                <!-- Restaurant Owner -->
                <div class="form-group">
                    <label for="restaurantOwner">Restaurant Owner</label>
                    <input type="text" id="restaurantOwner" name="restaurantOwner" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn">Add Restaurant</button>
            </form>

            <!-- Back to Home Button -->
            <a href="SuperAdmin.jsp" class="back-to-home">Home</a>
        </div>
    </div>
</body>
</html>

