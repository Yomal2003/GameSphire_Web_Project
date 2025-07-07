<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins',sans-serif;
        }
        body{
            background: #e4e9f7;
            display: flex; /* For centering the container */
            align-items: center; /* For centering the container */
            justify-content: center; /* For centering the container */
            min-height: 100vh; /* Full viewport height */
        }
        .container{
            /* display: flex; Removed as body handles centering now */
            /* align-items: center; */
            /* justify-content: center; */
            /* min-height: 90vh; */
            padding: 20px; /* Add some padding around the box if needed */
        }
        .box{
            background: white;
            /* opacity: 70%; Consider removing or adjusting for readability */
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
            font-size: 28px; /* Slightly larger */
            font-weight: 600;
            padding-bottom: 10px;
            border-bottom: 1px solid #e6e6e6;
            margin-bottom: 20px; /* Increased margin */
            text-align: center;
        }
        .form-box form .field{
            display: flex;
            margin-bottom: 15px; /* Spacing between fields */
            flex-direction: column;
        }
        .form-box form .field label { /* Style for labels */
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        .form-box form .input input{
            height: 45px; /* Taller input fields */
            width: 100%;
            font-size: 16px;
            padding: 0 15px; /* More padding inside input */
            border-radius: 8px; /* More rounded */
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
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color .3s ease, transform 0.2s ease;
            margin-top: 10px; /* Space above button */
            padding: 0px 10px;
            width: 100%; /* Full width button */
        }
        .btn:hover{
            background: rgba(56,48,162,0.9); /* Darker on hover */
            transform: translateY(-2px); /* Slight lift */
        }
         .btn:active {
            transform: translateY(0px); /* Button press effect */
        }
        /* .submit class is not strictly needed if .btn is used for the submit button and styled for full width */
        .links{
            margin-top: 20px; /* Increased margin */
            text-align: center;
            font-size: 14px;
        }
        .links a {
            color: rgba(76,68,182,0.808);
            text-decoration: none;
        }
        .links a:hover {
            text-decoration: underline;
        }

        /* Message Styles */
        .message-display {
            width: 100%;
            margin-bottom: 15px; /* Space below messages */
            text-align: center;
        }
        .message-display .message-text {
            padding: 12px 15px;
            border-radius: 8px;
            font-size: 15px;
            display: block; /* Make it block to take full width if needed */
        }
        .error-message {
            background: #f8d7da; /* Light red */
            color: #721c24;    /* Dark red */
            border: 1px solid #f5c6cb;
        }
        .success-message {
            background: #d4edda; /* Light green */
            color: #155724;    /* Dark green */
            border: 1px solid #c3e6cb;
        }

        /* Styles for dashboard, services, footer are removed as they are not part of this specific form page */
        /* Ensure paths to images like ../images/gif.jpg are correct if used for body background */
    </style>
</head>
<body>
    <div class="container">
        <div class="box form-box">
            <header>Sign Up</header>

            <div class="message-display">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null && !errorMessage.isEmpty()) {
            %>
                <span class="message-text error-message">
                    <%= errorMessage %>
                </span>
            <%
                }
            %>
            <%
                String successMessage = (String) request.getAttribute("successMessage");
                if (successMessage != null && !successMessage.isEmpty()) {
            %>
                <span class="message-text success-message">
                    <%= successMessage %>
                </span>
            <%
                }
            %>
            </div>
            
            <%
                String unameValue = request.getAttribute("uname") != null ? (String)request.getAttribute("uname") : "";
                String emailValue = request.getAttribute("email") != null ? (String)request.getAttribute("email") : "";
                String phoneValue = request.getAttribute("phone") != null ? (String)request.getAttribute("phone") : "";
            %>

            <form action="Register" method="post"> 
                <div class="field input">
                    <label for="uname">Username</label>
                    <input type="text" name="uname" id="uname" value="<%= unameValue %>" autocomplete="off" required>
                </div>
                
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="<%= emailValue %>" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="phone">Phone</label>
                    <input type="tel" name="phone" id="phone" value="<%= phoneValue %>" autocomplete="off" required>
                </div>
                
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Register">
                </div>
                <div class="links">
                    Already a member? <a href="${pageContext.request.contextPath}/login">Sign In</a>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
