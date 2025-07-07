<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>My Support Tickets</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            background-color: #eef1f5; 
            color: #333;
            line-height: 1.6;
            padding-top: 90px; 
            box-sizing: border-box;
        }

        
        header.navi {
            position: fixed;
            width: 99%; 
            max-width: 1200px; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 2%; 
            z-index: 1000; 
            top: 5px; 
            left: 50%; 
            transform: translateX(-50%); 
            background: rgba(255, 255, 255, 0.7); 
            box-shadow: 0 8px 32px 0 rgba(51, 51, 51, 0.2);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 10px;
        }

        .logo {
            background: transparent;
            display: flex;
            align-items: center;
        }

        .logo .logoimg {
            background: transparent;
            width: 50px; 
            height: 50px;
            margin-right: 10px;
            cursor: pointer;
        }

        .logo .company { 
            background: transparent;
            font-family: "Montserrat", sans-serif;
            font-weight: 700;
            color: #02182B;
            font-size: 20px;
            margin-right: 10px;
        }


        .nav_link {
            background: transparent;
            list-style: none;
            margin: 0; 
            padding: 0; 
        }

        .nav_link ul {
            background: transparent;
            padding-left: 0;
            margin: 0; 
            display: flex; 
        }

        .nav_link li {
            background: transparent;
            display: inline-block;
            padding: 0px 15px; 
        }

        .nav_link li a, .account span a, .account .username { 
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            font-size: 15px; 
            color: #02182B;
            text-decoration: none;
            transition: all 0.3s ease 0s;
        }

        .nav_link li a:hover, .account span a:hover { 
            color: #3652AD; 
        }

        
        .account {
            background: transparent;
            display: flex;
            align-items: center;
        }

        .account .user-photo { 
            background: transparent;
            width: 40px; 
            height: 40px; 
            
           
            object-fit: cover; 
            
            cursor: pointer; 
        }

        
        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 1000px;
            margin: auto; 
           	margin-top: 40px
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 500;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 25px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 15px 18px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background: linear-gradient(to right, #3652AD, #2A7886); 
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 0.5px;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover {
            background-color: #f8f9fa;
        }

        .action-links a, .button {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-block;
            font-size: 0.9em;
            border: 1px solid transparent; 
        }
        .action-links a {
            margin-right: 8px;
        }

        
        .action-links a.edit, .button.create-ticket {
            background-color: #7A68EE; 
            color: white;
            border-color: #7A68EE; 
        }
        .action-links a.edit:hover, .button.create-ticket:hover {
            background-color: #6A5ACD; 
            border-color: #6A5ACD;
            box-shadow: 0 2px 8px rgba(122, 104, 238, 0.4);
        }

        .action-links a.delete {
            background-color: #e74c3c; 
            color: white;
            border-color: #e74c3c;
        }
        .action-links a.delete:hover {
            background-color: #c0392b;
            border-color: #c0392b;
            box-shadow: 0 2px 5px rgba(231, 76, 60, 0.3);
        }
        
        .button.create-ticket {
            
            cursor: pointer;
            margin-bottom: 20px;
        }
        


        .message {
            padding: 15px 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 0.95em;
            border: 1px solid transparent;
        }
        .success {
            background-color: #d1e7dd;
            color: #0f5132;
            border-color: #badbcc;
        }
        .error {
            background-color: #f8d7da;
            color: #842029;
            border-color: #f5c2c7;
        }
        .no-tickets {
            text-align: center;
            padding: 30px;
            font-size: 1.1em;
            color: #777;
        }

        .footer-links {
            text-align: center;
            margin-top: 30px;
        }
        .footer-links a {
            color: #3652AD;
            text-decoration: none;
            font-weight: 500;
        }
        .footer-links a:hover {
            text-decoration: underline;
        }

        
        @media (max-width: 768px) {
            body {
                padding-top: 70px;
            }
            header.navi {
                padding: 8px 2%;
                width: 95%;
            }
            .logo .logoimg { width: 40px; height: 40px; }
            .logo .company { font-size: 18px; }
            .nav_link li { padding: 0 10px; }
            .nav_link li a { font-size: 14px; } 
            .account .user-photo { width: 30px; height: 30px;}

            .container {
                padding: 20px;
                margin-top: 10px;
            }
            th, td {
                padding: 10px 12px;
            }
            .action-links a, .button {
                padding: 6px 10px;
                font-size: 0.85em;
            }
            h1 {
                font-size: 1.8em;
            }
        }

        @media (max-width: 600px) {
            header.navi {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }
            .nav_link ul {
                flex-direction: column;
                width: 100%;
            }
            .nav_link li {
                padding: 8px 0;
                text-align: left;
                width: 100%;
            }
            .account { 
                margin-top: 10px;
                width: 100%;
                justify-content: flex-end; 
            }
             body {
                padding-top: 180px; 
            }

            table, thead, tbody, th, td, tr { display: block; }
            thead tr { position: absolute; top: -9999px; left: -9999px; }
            tr { border: 1px solid #ccc; margin-bottom: 10px; border-radius: 0;}
            td {
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                padding-left: 50%; 
                text-align: right; 
            }
            td:before {
                position: absolute; top: 12px; left: 12px; width: 45%;
                padding-right: 10px; white-space: nowrap; text-align: left;
                font-weight: bold;
            }
            td:nth-of-type(1):before { content: "ID"; }
            td:nth-of-type(2):before { content: "Title"; }
            td:nth-of-type(3):before { content: "Status"; }
            td:nth-of-type(4):before { content: "Priority"; }
            td:nth-of-type(5):before { content: "Created"; }
            td:nth-of-type(6):before { content: "Updated"; }
            td:nth-of-type(7):before { content: "Actions"; }
            .action-links { text-align: right; }
            .action-links a { margin-bottom: 5px; display:block; text-align:center; }
        }
    </style>
</head>
<body>

    <header class="navi">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/Homepage"> 
                <img src="${pageContext.request.contextPath}/images/CompanyLogo.png" alt="Company Logo" class="logoimg">
                <%-- <span class="company">GameSphere</span> --%>
            </a>
        </div>

        <nav class="nav_link">
            <ul>
                <li><a href="${pageContext.request.contextPath}/UserDashboard">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Packages</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Feedback</a></li>
            </ul>
        </nav>

        <div class="account">
        	<a href="${pageContext.request.contextPath}/UserDashboard"> 
            	<img  src="${pageContext.request.contextPath}/images/user.png" alt="User Photo" class="user-photo">
            </a>
        </div>
    </header>

    <div class="container">
        <h1>My Support Tickets</h1>

        <c:if test="${not empty sessionScope.successMessage}">
            <div class="message success">
                <c:out value="${sessionScope.successMessage}"/>
            </div>
            <c:remove var="successMessage" scope="session" />
        </c:if>
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="message error">
                <c:out value="${sessionScope.errorMessage}"/>
            </div>
            <c:remove var="errorMessage" scope="session" />
        </c:if>
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="message error">
                <c:out value="${requestScope.errorMessage}"/>
            </div>
        </c:if>

        <a href="${pageContext.request.contextPath}/tickets?action=new" class="button create-ticket">Create New Ticket</a>

        <c:choose>
            <c:when test="${not empty userTickets}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Created At</th>
                            <th>Last Updated</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ticket" items="${userTickets}">
                            <tr>
                                <td>${ticket.ticketId}</td>
                                <td><c:out value="${ticket.title}"/></td>
                                <td><c:out value="${ticket.status}"/></td>
                                <td><c:out value="${ticket.priority}"/></td>
                                <td><fmt:formatDate value="${ticket.createdAt}" type="both" dateStyle="medium" timeStyle="short"/></td>
                                <td><fmt:formatDate value="${ticket.updatedAt}" type="both" dateStyle="medium" timeStyle="short"/></td>
                                <td class="action-links">
                                    <a href="${pageContext.request.contextPath}/tickets?action=edit&ticketId=${ticket.ticketId}" class="edit">Edit</a>
                                    <a href="${pageContext.request.contextPath}/tickets?action=delete&ticketId=${ticket.ticketId}"
                                       class="delete"
                                       onclick="return confirm('Are you sure you want to delete ticket #${ticket.ticketId}?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-tickets">You have not created any tickets yet. Why not create one now?</p>
            </c:otherwise>
        </c:choose>
        
    </div>

</body>
</html>
