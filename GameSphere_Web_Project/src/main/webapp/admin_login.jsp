<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F4F2F7; /* Light lavender/off-white background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            color: #333;
        }

        .login-container {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 20px; /* Rounded corners like the image */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); /* Softer shadow */
            width: 100%;
            max-width: 380px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 25px;
            font-weight: 600;
            font-size: 26px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #E0E0E0; /* Light grey border */
            border-radius: 8px; /* Rounded corners for inputs */
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #7E57C2; /* NEW Purple for focus */
            box-shadow: 0 0 0 3px rgba(126, 87, 194, 0.2); /* Adjusted RGBA for NEW Purple */
            outline: none;
        }

        button[type="submit"] {
            background-color: #7E57C2; /* NEW Purple button color */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px; /* Rounded corners for button */
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            width: 100%;
            transition: background-color 0.3s ease;
            letter-spacing: 0.5px;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            background-color: #673AB7; /* NEW Darker purple for hover */
        }

        .error-message {
            color: #D8000C;
            background-color: #FFD2D2;
            border: 1px solid #D8000C;
            padding: 10px 15px;
            border-radius: 6px;
            margin-top: 20px;
            font-size: 14px;
            text-align: center;
        }

        .footer-links {
            margin-top: 25px;
            font-size: 14px;
        }
        .footer-links a {
            color: #7E57C2; /* NEW Purple for links */
            text-decoration: none;
            margin: 0 10px;
        }
        .footer-links a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>

        <form action="Adminlogin" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <%-- Display login error message if present (JSTL preferred) --%>
            <%-- Ensure JSTL taglib is declared at the top: <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
            <c:if test="${not empty loginError}">
                <div class="error-message">
                    <c:out value="${loginError}" />
                </div>
            </c:if>
            <%-- Fallback scriptlet, remove if using JSTL and the c:if block above --%>
            <% if (request.getAttribute("loginError") != null && !((String)request.getAttribute("loginError")).isEmpty() && pageContext.findAttribute("loginError") == null) { %>
                <div class="error-message">
                    <%= request.getAttribute("loginError") %>
                </div>
            <% } %>

            <button type="submit">Login</button>
        </form>

        <div class="footer-links">
            <a href="/GameSphere_Web_Project/login">User Login</a>
            
        </div>
    </div>

</body>
</html>