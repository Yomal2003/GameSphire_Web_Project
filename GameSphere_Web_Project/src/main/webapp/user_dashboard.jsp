<%-- File: user_dashboard.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <%-- For potential icons --%>

    <style>
        
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', 'Roboto', Arial, sans-serif;
            
            background-image: url('${pageContext.request.contextPath}/images/gif.jpg'); /* Ensure this path is correct */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
            background-color: #eef1f5; 
            color: #333;
            line-height: 1.6;
            padding-top: 90px; 
        }

        /* Common Header Styles (from ticketDashboard.jsp) */
        header.site-header {
            position: fixed;
            width: 99%;
            max-width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 2%;
            z-index: 1000;
            top: 5px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 8px 32px 0 rgba(51, 51, 51, 0.2);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 10px;
        }
        .site-header .logo {
            display: flex;
            align-items: center;
        }
        .site-header .logo .logoimg {
            width: 50px;
            height: 50px;
            margin-right: 10px;
            cursor: pointer;
        }
        .site-header .nav_link ul {
            list-style: none;
            display: flex;
            margin: 0; padding: 0;
            align-items: center; /* Align items vertically for button */
        }
        .site-header .nav_link li {
            padding: 0 15px;
        }
        .site-header .nav_link li a {
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            font-size: 15px;
            color: #02182B;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .site-header .nav_link li a:hover {
            color: #7A68EE; /* Purple theme accent */
        }
        /* Style for Logout Button */
        .site-header .nav_link li a.nav-logout-button {
            padding: 8px 15px;
            background-color: #7A68EE; /* Purple theme accent */
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .site-header .nav_link li a.nav-logout-button:hover {
            background-color: #6A5ACD; /* Darker purple on hover */
            color: #f0f0f0; /* Slightly off-white on hover */
        }
        .site-header .account .user-photo {
            width: 40px;
            height: 40px;
            object-fit: cover;
            cursor: pointer;
        }

        /* Dashboard Specific Container */
        .dashboard-content-wrapper {
            width: 100%;
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 20px;
        }

        /* Welcome Box Style */
        .welcome-box {
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            margin-bottom: 30px;
            text-align: center;
            backdrop-filter: blur(5px); /* Optional blur for the box */
            -webkit-backdrop-filter: blur(5px);
        }
        .welcome-box p {
            font-size: 1.2em;
            color: #2c3e50;
            font-weight: 500;
        }
        .welcome-box .username {
            color: #7A68EE;
            font-weight: 600;
        }

        /* "See Packages" Section Style */
        .see-packages-section {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
            background-size: cover;
            background-position: center;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            margin-bottom: 30px;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
        }
        .see-packages-section h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.8em;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .btn-pkg {
            padding: 12px 30px;
            background-color: #7A68EE;
            border: none;
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-family: 'Montserrat', sans-serif;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-pkg:hover {
            background-color: #6A5ACD;
            box-shadow: 0 4px 12px rgba(122, 104, 238, 0.4);
        }

        /* Services Section (Cards) Style */
        .services-section {
            text-align: center;
            padding: 20px 0;
        }
        .services-section-title {
            font-size: 2em;
            color: #ffffff; /* White title for better contrast on bg image */
            margin-bottom: 30px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            /* Add text shadow for readability */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }
        .service-cards-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 25px;
        }
        .service-card {
            border: 1px solid rgba(224, 224, 224, 0.5); /* Lighter border */
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1); /* Slightly increased shadow */
            width: 100%;
            max-width: 400px;
            padding: 25px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 180px;
            position: relative; /* Needed for overlay */
            overflow: hidden; /* Clip overlay */
            background-size: cover;
            background-position: center;
        }
        /* Overlay for cards to improve text readability */
        .service-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.35); /* Dark semi-transparent overlay */
            border-radius: 12px; /* Match parent border-radius */
            z-index: 1; /* Place overlay above background but below content */
        }
        /* Ensure content is above the overlay */
        .service-card > * {
            position: relative;
            z-index: 2;
        }
        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }
        .service-card h3 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.4em;
            color: #ffffff; /* White text on overlay */
            margin-bottom: 15px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
        }
        .service-card a {
            color: #ffffff; /* White text */
            background-color: rgba(122, 104, 238, 0.8); /* Semi-transparent Purple button */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            padding: 10px 15px;
            border: none; /* Removed border */
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
            display: inline-block;
        }
        .service-card a:hover {
            background-color: rgba(106, 90, 205, 0.9); /* Darker semi-transparent purple */
            color: #f0f0f0; /* Slightly off-white on hover */
        }

        /* Specific background images for cards */
        .card-feedback {
            background-image: url('${pageContext.request.contextPath}/images/feedback.jpg'); /* Ensure path is correct */
        }
        .card-support {
            background-image: url('${pageContext.request.contextPath}/images/contact-us.jpg'); /* Ensure path is correct */
        }

        /* Footer Styles */
        .footerNavi {
            width:100%;
            margin-top: 60px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 0 -8px 32px 0 rgba(51, 51, 51, 0.1);
            background-color: #ffffff;
        }
        .footerContainer {
            padding: 40px 20px 20px 20px;
            text-align: center;
        }
        .footerNav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding-left: 0;
            margin-bottom: 20px;
        }
        .footerNav ul li a {
            font-family: "Montserrat", sans-serif;
            color: #02182B;
            margin: 10px 15px;
            text-decoration: none;
            font-size: 0.95em;
            transition: color 0.3s ease;
        }
        .footerNav ul li a:hover {
            color: #7A68EE;
        }
        .social_media {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .social_media a {
            text-decoration: none;
            padding: 8px;
            margin: 0 8px;
        }
        .social_media a i {
            font-size: 1.8em;
            color: #02182B;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        .social_media a i:hover {
            color: #7A68EE;
            transform: scale(1.1);
        }
        .footerBottom {
            background-color: #e0e0e0;
            padding: 15px;
            text-align: center;
        }
        .footerBottom p {
            font-family: "Montserrat", sans-serif;
            font-weight: 400;
            color: #333;
            font-size: 0.9em;
            margin: 3px 0;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            body { padding-top: 70px; }
            header.site-header { padding: 8px 2%; width: 95%; }
            .site-header .logo .logoimg { width: 40px; height: 40px; }
            .site-header .nav_link li { padding: 0 10px; }
            .site-header .nav_link li a { font-size: 14px; }
            /* Ensure logout button font size matches in responsive */
            .site-header .nav_link li a.nav-logout-button { font-size: 14px; padding: 6px 12px;}
            .site-header .account .user-photo { width: 30px; height: 30px;}

            .dashboard-content-wrapper { padding: 0 15px; margin-top:20px;}
            .welcome-box { padding: 20px; }
            .welcome-box p { font-size: 1.1em; }
            .see-packages-section { padding: 30px; }
            .see-packages-section h2 { font-size: 1.5em; }
            .btn-pkg { padding: 10px 25px; font-size: 0.95em; }
            .service-cards-container { flex-direction: column; align-items: center; }
            .service-card { max-width: 90%; margin-bottom: 20px; min-height: 150px;}
            .services-section-title { font-size: 1.6em; }
        }
        @media (max-width: 600px) {
            header.site-header {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }
            .site-header .nav_link ul {
                flex-direction: column;
                width: 100%;
                margin-top: 10px;
            }
            .site-header .nav_link li {
                padding: 8px 0;
                text-align: left;
                width: 100%;
            }
            
            .site-header .nav_link li a.nav-logout-button {
                display: inline-block; 
                width: auto; 
                margin-top: 5px; 
            }
            .site-header .account {
                margin-top: 10px;
                width: 100%;
                
            }
            body { padding-top: 200px;  }
            .footerNav ul li a { margin: 8px 10px; }
            .social_media a i { font-size: 1.6em; }
        }
    </style>
</head>
<body>
    <%-- Common Site Header --%>
    <header class="site-header">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/Homepage">
                <img src="${pageContext.request.contextPath}/images/CompanyLogo.png" alt="Company Logo" class="logoimg">
            </a>
        </div>
        <nav class="nav_link">
            <ul>
                <li><a href="${pageContext.request.contextPath}/UserDashboard">Dashboard</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Packages</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Feedback</a></li>
                <%-- MODIFIED LOGOUT LINK TO BE A BUTTON --%>
                <li><a href="${pageContext.request.contextPath}/Logout" class="nav-logout-button">Logout</a></li>
            </ul>
        </nav>
        <div class="account">
            <a href="${pageContext.request.contextPath}/UserDashboard">
                <img src="${pageContext.request.contextPath}/images/user.png" alt="User Photo" class="user-photo">
            </a>
        </div>
    </header>

   
    <div class="dashboard-content-wrapper">
        <main>
            <div class="welcome-box">
                <p>Hello,
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            <span class="username"><c:out value="${sessionScope.username}"/></span>
                        </c:when>
                        <c:otherwise>
                            Welcome
                        </c:otherwise>
                    </c:choose>!
                </p>
            </div>
        </main>

        <div class="see-packages-section">
            <h2>Explore Our Exciting Packages</h2>
            <div class="pkg-btn">
                <a href="#" class="btn-pkg">See Packages</a>
            </div>
        </div>

        <section class="services-section">
            <h2 class="services-section-title">Quick Actions</h2>
            <div class="service-cards-container">
                
                <div class="service-card card-feedback">
                    <a href="/GameSphere_Web_Project/addFeedBack">Add Your Feedback</a>
                </div>
                <div class="service-card card-support">
                    <a href="${pageContext.request.contextPath}/tickets?action=list">Create/View Support Tickets</a>
                </div>
            </div>
        </section>
    </div>

    
    <footer class="footerNavi">
        <div class="footerContainer">
            <div class="footerNav">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Packages</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Feedback</a></li>
                </ul>
            </div>
            <div class="social_media">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <div class="footerBottom">
            <p>&copy; <script>document.write(new Date().getFullYear())</script> GameSphere. All rights reserved.</p>
            <p><a href="#" style="color:#333; text-decoration:none;">Terms and Conditions</a> | <a href="#" style="color:#333; text-decoration:none;">Privacy Policy</a></p>
        </div>
    </footer>
</body>
</html>