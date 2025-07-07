<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Login</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins',sans-serif;
        }
        body{
            background: #e4e9f7; /* Or your desired background */
            /* Example for GIF background:
            background-image: url('path/to/your/images/your-background.gif');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            */
        }
        .container{
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 90vh; /* Adjust to 100vh if using full page background */
        }
        .box{
            background: white; /* Or a semi-transparent white like: rgba(255, 255, 255, 0.9) */
            /* opacity: 70%; /* Consider if you want this level of transparency */
            display: flex;
            flex-direction: column;
            padding: 30px 35px; /* Increased padding */
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1); /* Softer shadow */
        }
        .form-box{
            width: 400px; /* Adjusted width */
            margin: 0px 10px;
        }
        .form-box header{
            font-size: 28px; /* Slightly larger header */
            font-weight: 600;
            padding-bottom: 10px;
            border-bottom: 1px solid #e6e6e6;
            margin-bottom: 20px; /* Increased margin */
            text-align: center;
        }
        .form-box form .field{
            display: flex;
            margin-bottom: 15px; /* Increased margin */
            flex-direction: column;
        }
        .form-box form .input label { /* Style for labels */
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        .form-box form .input input{
            height: 45px; /* Increased height */
            width: 100%;
            font-size: 16px;
            padding: 0 15px; /* Increased padding */
            border-radius: 8px; /* More rounded corners */
            border: 1px solid #ccc;
            outline: none;
            transition: border-color 0.3s ease;
        }
        .form-box form .input input:focus {
            border-color: rgba(76,68,182,0.808); /* Highlight on focus */
        }
        .btn{
            height: 45px;
            background: rgba(76,68,182,0.808);
            border: 0;
            border-radius: 8px;
            color: #fff;
            font-size: 16px; /* Increased font size */
            font-weight: 500; /* Medium font weight */
            cursor: pointer;
            transition: background-color .3s ease, transform 0.2s ease; /* Added transform transition */
            margin-top: 10px;
            padding: 0px 10px;
            width: 100%;
        }
        .btn:hover{
            background: rgba(56,48,162,0.9); /* Darker on hover */
            transform: translateY(-2px); /* Slight lift on hover */
        }
        .btn:active {
            transform: translateY(0px); /* Button press effect */
        }
        .links{
            margin-top: 20px; /* Increased margin */
            text-align: center;
            font-size: 14px; /* Slightly smaller font for links */
        }
        .links a {
            color: rgba(76,68,182,0.808);
            text-decoration: none;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .message{
            text-align: center;
            background: #f8d7da;
            color: #721c24;
            padding: 12px 15px; /* Increased padding */
            border:1px solid #f5c6cb;
            border-radius: 8px;
            margin-bottom: 20px; /* Increased margin */
            font-size: 15px; /* Adjusted font size */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="box form-box">
            <header>User Login</header>
            <form action="login" method="post">
                
                <%
                    // Retrieve the error message set by the servlet
                    String loginErrorMessage = (String) request.getAttribute("loginError"); 
                    if (loginErrorMessage != null && !loginErrorMessage.isEmpty()) {
                %>
                    <div class="message">
                        <%= loginErrorMessage %> <%-- Display the error message --%>
                    </div>
                <%
                    }
                %>

                <div class="field input">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" autocomplete="off" required>
                </div>
                
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field">
                    <input type="submit" class="btn" value="Login">
                </div>
                <div class="links">
                    Not a member yet? <a href="${pageContext.request.contextPath}/Register">Sign Up</a>
                </div>
                <div class="links">
                    Are you an admin? <a href="${pageContext.request.contextPath}/Adminlogin">Admin Sign In</a>
                </div>
            </form>
            <%-- ADDED NAVIGATION LINK TO HOMEPAGE --%>
            <div class="links">
                <a href="${pageContext.request.contextPath}/Homepage">Go to Homepage</a>
            </div>
        </div>
    </div>
</body>
</html>