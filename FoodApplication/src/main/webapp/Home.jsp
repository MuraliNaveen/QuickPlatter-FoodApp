<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodmodel.pojo.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickPlatter</title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="https://res.cloudinary.com/dko49jfq3/image/upload/v1732344582/FlogoNoclar_n8u2ig.png" type="image/png">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4fdf9;
            color: #333;
        }

        /* Header Section */
             header {
    background-color: white;
    color: #333;
    padding: 5px 30px; /* Reduce padding to decrease height */
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

header .logo {
    display: flex;
    align-items: center; /* Vertically center logo with heading */
}

header .logo img {
    border-radius: 50%;
    height: 50px;
    width: 50px;
    margin-right: 10px; /* Add a small space between logo and text */
}

.app-name {
    font-family: 'Poppins', sans-serif;
    font-size: 24px; /* Reduce font size slightly if needed */
    font-weight: bold;
    color: #28A745;
    margin: 0; /* Remove extra margin to eliminate gap */
}

.app-name span {
    color: #000000;
    font-style: italic;
}
      
        .items {
            list-style: none;
            display: flex;
            gap: 15px;
            margin: 0;
            padding: 0;
        }

        .items li {
            display: inline-block;
        }

        .items a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
            padding: 8px 12px;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .items a:hover {
            background-color: #f5f5f5;
            color: #ff5722;
        }

        .location {
            font-weight: bold;
            color: #ff5722;
            font-size: 14px;
        }

        /* Carousel Section */
/* Carousel Section */
.container {
    padding: 20px; /* Add space inside the container */
    margin: 0 auto; /* Center the container horizontally */
    max-width: 1300px; /* Optional: Limit the container's width for better design */
     background-color: #f4fdf9;
}

.carousel-container {
    text-align: center;
    margin: 0 auto; /* Centers horizontally */
    display: flex;
    flex-direction: column;
    align-items: center; /* Aligns items in the center horizontally */
    width: 80%; /* Adjust the width as needed */
}

.carousel-wrapper {
    display: flex;
    align-items: center;
    position: relative;
    justify-content: center; /* Center the carousel within the wrapper */
    gap: 15px;
    width: 100%; /* Ensures the wrapper takes the full width of the container */
}

#carousel {
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth;
    gap: 20px;
    width: 100%; /* Matches the container width */
}
#carousel::-webkit-scrollbar {
    display: none; /* For Chrome, Safari, and Edge */
}
.carousel {
    display: flex;
    transition: transform 0.5s ease-in-out; /* Smooth scrolling effect */
    gap: 15px; /* Space between items */
}

.carousel-item {
    flex: 0 0 auto;
    width: 200px;
    height: 200px;
    text-align: center;
}

.carousel-item img {
    width: 100%; /* Ensures images fill their container */
    height: auto;
    max-height: 120px; /* Limits image height */
    object-fit: cover; /* Maintains aspect ratio */
    border-radius: 8px; /* Rounded corners for images */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.carousel-item p {
    margin-top: 10px;
    font-size: 14px;
    color: #333;
    font-weight: bold;
}

.carousel-arrow {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    cursor: pointer;
    padding: 10px 15px;
    font-size: 18px;
    border-radius: 50%;
    z-index: 10;
    transition: background-color 0.3s ease;
}

.carousel-arrow:hover {
    background-color: rgba(0, 0, 0, 0.7);
}

.left-arrow {
    left: -50px; /* Adjust to align outside the carousel */
}

.right-arrow {
    right: -50px; /* Adjust to align outside the carousel */
}

button {
    cursor: pointer;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 10px;
}

/* Responsive Carousel */
@media (max-width: 768px) {
    .carousel-item {
        width: 120px; /* Adjust size for smaller screens */
    }

    .carousel-item img {
        max-height: 100px; /* Limit image height for smaller devices */
    }

    .carousel-arrow {
        padding: 8px; /* Smaller arrow buttons */
    }
}

@media (max-width: 480px) {
    .carousel-item {
        width: 100px; /* Compact size for extra small screens */
    }

    .carousel-item img {
        max-height: 80px;
    }

    .carousel-arrow {
        font-size: 14px; /* Smaller font size for arrows */
        padding: 5px;
    }
}




/**********************************************************************************************/





/* Brand Section */
.brand-container {
    text-align: center;
    margin: 40px auto;
    width: 80%;
    display: flex;
    flex-direction: column;
    align-items: center;
     background-color: #f4fdf9;
}

.brand-wrapper {
    display: flex;
    align-items: center;
    position: relative;
    justify-content: center;
    gap: 15px;
    width: 100%;
}

.brand-carousel {
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth;
    gap: 20px;
    width: 100%;
}

.brand-carousel::-webkit-scrollbar {
    display: none;
}

.brand-item {
    flex: 0 0 auto;
    width: 100px;
    text-align: center;
}

.brand-image {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.brand-item p {
    margin-top: 10px;
    font-size: 14px;
    font-weight: bold;
    color: #333;
}





/**********************************************************************************************/


        /* Restaurant Listing Section */
        /* Reusing the styles from sample CSS */
.explore-menu-section {
    background-color:  background-color: #f4fdf9;;
    padding-top: 40px;
    padding-bottom: 40px;
}

.menu-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 20px;
    text-align: center;
}

/* Restaurant Grid Layout */
.restaurant-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Adjusts to fit 5-6 cards */
    gap: 20px;
    padding: 20px 0;
    justify-content: center; /* Centers single card */
}

.menu-item-card {
    background-color: #fff;
    border-radius: 16px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    text-align: center;
}

.menu-item-card:hover {
    transform: translateY(-5px) scale(1.02);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.menu-item-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 16px 16px 0 0;
}

.menu-card-title {
    color: #323f4b;
    font-family: "Roboto";
    font-size: 18px;
    font-weight: 500;
    margin-top: 16px;
}

.menu-item-text {
    color: #555;
    font-family: "Roboto";
    font-size: 14px;
    margin: 8px 0;
}

.menu-item-link {
    display: inline-block;
    background-color: #d0b200;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: 500;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 8px;
    margin-top: 10px;
    cursor: pointer;
}

.menu-item-link:hover {
    background-color: #b89600;
}

@media (max-width: 768px) {
    .menu-item-card {
        width: 100%;
        margin: 0 auto;
    }

    .restaurant-grid {
        gap: 16px; /* Compact spacing for smaller screens */
    }
}

        

        /* Footer Section */
        footer {
            background-color: white;
            padding: 20px;
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <a href="#home">
                <img src="https://res.cloudinary.com/dko49jfq3/image/upload/v1732344582/FlogoNoclar_n8u2ig.png" alt="Logo">
            </a>
            <div class="app-name">
    Quick<span>Platter</span>
</div>
        </div>
        <ul class="items">
            <li><a href="#">🔍 Search</a></li>
            <li><a href="#">🎁 Offers</a></li>
            <li><a href="#">📢 Help</a></li>
            <li><a href="#">👤 Profile</a></li>
            <li><a href="Home1.jsp">🔓 Logout</a></li>
            <li><a href="OrderHistoryServlet">🛒 Order History</a></li>
             <li><a href="cart.jsp"> <i class="fa-sharp fa-solid fa-cart-plus" style="color: #32ae19;"></i>Cart</a></li>
            <li><a href="javascript:void(0);" id="location-link">📍 Location <span class="location">Tirupati</span></a></li>
           
        </ul>
    </header>

    <!-- Carousel Section -->
   <!-- Carousel Section -->
<!-- Carousel Section -->
<!-- Carousel Section -->
<!-- Carousel Section -->
<!-- Carousel Section -->
<div class="carousel-container">
    <h2>What's on your mind?</h2>
    <div class="carousel-wrapper">
        <button id="left-arrow" class="carousel-arrow left-arrow" onclick="scrollCarousel(-1)">&#8592;</button>
        <div class="carousel" id="carousel">
            <!-- Sample code integrated into carousel -->
            <%-- Assuming dynamic data from the session, adjust or replace accordingly if static content --%>
            <%
                List<String[]> items = (List<String[]>) session.getAttribute("carouselItems");
                if (items == null) {
                    // Fallback: Example static data
                    items = List.of(
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182596/images1_mfk2lk.jpg", "Poori"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182585/india-food-samosa-1120x732_2_uee1bb.webp", "Samosa"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182578/11_ymof3d.webp", "Biryani"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182570/downloa7_nwzczy.jpg", "Idli"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262315/Plain-Dosa_ikxx1b.webp", "Dosa"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732279231/226_lobrxe.jpg","VegRice"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262351/homemade-chapthi-and-curry-indian-cooking-background_d7dz18.jpg","Chapthi"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262482/ven-pongal_mblzn8.jpg","Pongal"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732260117/behtout_rmhr6f.jpg","Biriyani"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182811/mutt_mvcueq.jpg","Mutton"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732182492/4_knmizv.webp","Icecream"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262552/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b_lqaedz.jpg","Burger"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262609/Creole-for-the-Soul-Buffalo-Chicken-Lollipops-5_r4lsk6.jpg","Chicken Lollipop"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262645/Baked-seabass-ec17e28_v3rbsn.jpg","Fish"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732262537/Salami-pizza-hero_ivzce1.jpg","Pizza"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732279232/tarkari-palav-karnataka-vegetable-palav-recipe-1_bsbshg.jpg","Palav"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732279250/IMG_0744_s31ejd.jpg","Mandi"},
                        new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732339897/f4604e05f6a9eaca99afddd69e849005_c02485d4-0841-4de6-b152-69deb38693f2_o7icd1.jpg","Bread Omlet"}
                       
                       
                        
                    );
                }
                for (String[] item : items) {
            %>
                <div class="carousel-item">
                    <img src="<%= item[0] %>" alt="<%= item[1] %>">
                    <p><%= item[1] %></p>
                </div>
            <% } %>
        </div>
        <button id="right-arrow" class="carousel-arrow right-arrow" onclick="scrollCarousel(1)">&#8594;</button>
    </div>
</div>


<!-- -------------------------------------------------------------------------------------------------- -->

<!-- Brand Section -->
<div class="brand-container">
    <h2>Top Brands</h2>
    <div class="brand-wrapper">
        <button id="brand-left-arrow" class="carousel-arrow left-arrow">&#8592;</button>
        <div class="brand-carousel" id="brand-carousel">
            <%-- Example static brand data --%>
            <% 
                List<String[]> brands = List.of(
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369220/2560px-McDonald_27s_logo.svg_yt1eht.png", "Mc Donald's"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369284/640px-KFC_logo-image.svg_bpsc34.png", "Kfc"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369403/800px-Taco_Bell_2016.svg_wkeeei.png", "TacoBell"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369310/h6yyfduc5f681_hepcp9.png", "StarBugs"},
                 
                    
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369498/1200px-Dominos_pizza_logo.svg_jl8xtb.png", "Domino's"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369752/FXBy66vr_400x400_woriog.jpg", "Pizza Hut"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369837/bvi0f2wyrrovcenqcdrt.jpg", "Cafe Coffee Day"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370173/Karachi_Bakery_pocihj.png", "Karachi Bakery"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370126/Faasos_Logo_fzw5qs.svg", "Faasos"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370072/berco_s_restaurants_logo_oc2zlo.jpg", "Bercos"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370053/chai-point_iax71f.png", "Chai Point"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370031/Nandos_logo_lt0ous.svg", "Nando's"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732370009/indian_coffee_house_logo_by_dj0024_d71hq69-fullview.jpg_hqrhs8.jpg", "Indian Coffee House"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369986/images_gt8uej.png", "Dunkin' Donuts"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369963/Bikanervala_Logo_zrjtkl.png", "Bikanervala"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369946/1200px-The_Pizza_Company_Logo__282023_29.svg_obg6cu.png", "The Pizza Company"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369939/SUBWAY_Logo_x3lqfu.jpg", "Subway"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369914/barbeque-nation-logo-D7C74DCC19-seeklogo.com_ahhbgw.png", "Barbeque Nation"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369886/640px-Haldiram_27s_2024_Logo.svg_hnotjt.png", "Haldiram's"},
                    new String[]{"https://res.cloudinary.com/dko49jfq3/image/upload/v1732369752/FXBy66vr_400x400_woriog.jpg", "Pizza Hut"}

                );
                for (String[] brand : brands) {
            %>
            <div class="brand-item">
                <img src="<%= brand[0] %>" alt="<%= brand[1] %>" class="brand-image">
                <p><%= brand[1] %></p>
            </div>
            <% } %>
        </div>
        <button id="brand-right-arrow" class="carousel-arrow right-arrow">&#8594;</button>
    </div>
</div>



<!-- ----------------------------------------------------------------------------------------------- -->


    <!-- Restaurant Listing -->
   <div class="explore-menu-section pt-5 pb-5">
    <div class="container">
        <h1 class="menu-section-heading">Explore Restaurants</h1>
        <% 
        List<Restaurant> restaurants = (List<Restaurant>) session.getAttribute("restaurantList");
        if (restaurants != null && !restaurants.isEmpty()) { 
        %>
        <div class="restaurant-grid">
            <% for (Restaurant restaurant : restaurants) { %>
                <div class="menu-item-card shadow">
                    <form action="ShowMenu" method="post">
<input type="hidden" name="restaurantId" value="<%= restaurant.getR_ID() %>">
 <input type="hidden" name="restaurantname" value="<%= restaurant.getRName() %>">
                        <div class="image-container">
                            <img src="<%= restaurant.getImage() %>" alt="Image of <%= restaurant.getRName() %>" class="menu-item-image">
                        </div>
                        <h1 class="menu-card-title"><%= restaurant.getRName() %></h1>
                        <p class="menu-item-text">⭐ Rating: <%= restaurant.getRating() %></p>
                        <p class="menu-item-text">🍽️ Cuisine: <%= restaurant.getCusineType() %></p>
                        <p class="menu-item-text">📍 Address: <%= restaurant.getAddress() %></p>
                        <button type="submit" class="menu-item-link">View Menu</button>
                    </form>
                </div>
            <% } %>
        </div>
        <% 
        } else { 
        %>
        <p class="no-restaurants-text">No restaurants found. Please check back later!</p>
        <% } %>
    </div>
</div>
   

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Food Delivery Service</p>
    </footer>

    <!-- JavaScript -->
    
    <!-- Include External JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    
    <!-- Carousel JavaScript Logic -->
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Select carousel elements
        const carousel = document.getElementById('carousel');
        const leftArrow = document.getElementById('left-arrow');
        const rightArrow = document.getElementById('right-arrow');
        const scrollAmount = 300; // Adjust scroll distance

        // Check if all required elements are present
        if (!carousel || !leftArrow || !rightArrow) {
            console.error('Error: Carousel or arrows not found in the DOM.');
            return;
        }

        // Add event listener to the left arrow
        leftArrow.addEventListener('click', function () {
            console.log('Left arrow clicked'); // Debugging log
            carousel.scrollBy({
                left: -scrollAmount,
                behavior: 'smooth'
            });
        });

        // Add event listener to the right arrow
        rightArrow.addEventListener('click', function () {
            console.log('Right arrow clicked'); // Debugging log
            carousel.scrollBy({
                left: scrollAmount,
                behavior: 'smooth'
            });
        });

        // Debugging: Log carousel current scroll position
        carousel.addEventListener('scroll', function () {
            console.log('Current scroll position:', carousel.scrollLeft);
        });

        // Handle resize to ensure responsive functionality (optional)
        window.addEventListener('resize', function () {
            console.log('Window resized');
        });
    });
    
    
    
    
    
    // Brand Carousel JavaScript Logic==============================================================
       document.addEventListener('DOMContentLoaded', function () {
           const brandCarousel = document.getElementById('brand-carousel');
           const brandLeftArrow = document.getElementById('brand-left-arrow');
           const brandRightArrow = document.getElementById('brand-right-arrow');
           const brandScrollAmount = 300; // Adjust scroll distance

           if (!brandCarousel || !brandLeftArrow || !brandRightArrow) {
               console.error('Error: Brand carousel or arrows not found in the DOM.');
               return;
           }

           brandLeftArrow.addEventListener('click', function () {
               brandCarousel.scrollBy({
                   left: -brandScrollAmount,
                   behavior: 'smooth'
               });
           });

           brandRightArrow.addEventListener('click', function () {
               brandCarousel.scrollBy({
                   left: brandScrollAmount,
                   behavior: 'smooth'
               });
           });
       });

    <!--   ------------------------------------                             -->
    
    document.getElementById('location-link').addEventListener('click', function() {
        if (navigator.geolocation) {
            // Try to get the user's current position
            navigator.geolocation.getCurrentPosition(function(position) {
                // If successful, get the latitude and longitude
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;
                
                // Update the location span with the real location (e.g., using a reverse geocoding API)
                // For now, just updating the span with latitude and longitude as an example
                document.querySelector('.location').textContent = `Latitude: ${latitude.toFixed(2)}, Longitude: ${longitude.toFixed(2)}`;
            }, function(error) {
                // Handle errors (e.g., if the user denies location access)
                alert("Unable to retrieve your location. Please allow location access.");
            });
        } else {
            alert("Geolocation is not supported by your browser.");
        }
    });
    
    
    
    </script>
</body>
</html>
