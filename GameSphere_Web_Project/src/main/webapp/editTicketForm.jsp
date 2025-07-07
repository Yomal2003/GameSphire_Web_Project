<%-- File: editTicketForm.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Ticket #${ticket.ticketId}</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            background-color: #eef1f5; /* Light grayish blue background */
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }

        .form-container { /* Changed from .container to avoid conflicts if this is part of a larger layout */
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 650px; /* Slightly wider for forms */
        }

        .form-container h1 {
            color: #2c3e50; /* Darker blue-gray */
            text-align: center;
            margin-bottom: 25px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 1.8em;
        }

        label {
            display: block;
            margin-top: 18px;
            margin-bottom: 6px;
            font-weight: 500;
            font-family: 'Montserrat', sans-serif;
            color: #34495e; /* Slightly muted label color */
            font-size: 0.95em;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 12px 15px; /* Increased padding */
            margin-top: 5px;
            border: 1px solid #ced4da; /* Lighter border */
            border-radius: 6px; /* Softer radius */
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            border-color: #7A68EE; /* Purple focus border */
            box-shadow: 0 0 0 0.2rem rgba(122, 104, 238, 0.25); /* Purple focus shadow */
            outline: none;
        }


        textarea {
            height: 140px; /* Taller textarea */
            resize: vertical;/*this is for the make as horizontal*/
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            gap: 10px; /* Space between buttons */
        }

        .button {
            padding: 10px 22px; /* Adjusted padding */
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 0.95em;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            display: inline-flex; /* For aligning text and potential icons */
            align-items: center;
            justify-content: center;
        }

        .button.primary { /* Update Ticket button */
            background-color: #7A68EE; /* Purple color */
            color: white;
        }
        .button.primary:hover {
            background-color: #6A5ACD; /* Darker purple */
            box-shadow: 0 2px 8px rgba(122, 104, 238, 0.4);
        }

        .button.secondary { /* Cancel button */
            background-color: #6c757d; /* Gray for cancel/secondary */
            color: white;
        }
        .button.secondary:hover {
            background-color: #5a6268;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        .message { /* For success/error messages */
            padding: 15px 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 0.95em;
            border: 1px solid transparent;
        }
        .error {
            color: #842029;
            background-color: #f8d7da;
            border-color: #f5c2c7;
        }
        .success { /* If you add success messages on this page */
            background-color: #d1e7dd; 
            color: #0f5132;
            border-color: #badbcc;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
                margin-top: 20px; /* Add some margin from top on smaller screens */
            }
            .form-container h1 {
                font-size: 1.6em;
            }
            label {
                font-size: 0.9em;
            }
            input[type="text"], textarea, select {
                padding: 10px 12px;
            }
            .button {
                padding: 9px 18px;
                font-size: 0.9em;
            }
        }

    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit Ticket #${ticket.ticketId}</h1>

        <c:if test="${not empty requestScope.errorMessage}">
            <div class="message error">${requestScope.errorMessage}</div>
        </c:if>

        <c:if test="${empty ticket && empty requestScope.errorMessage}"> 
             <div class="message error">Ticket data not found. It might have been deleted or you do not have permission to view it.</div>
             <div style="text-align:center; margin-top:20px;">
                <a href="${pageContext.request.contextPath}/tickets?action=list" class="button secondary">Back to Dashboard</a>
             </div>
        </c:if>

        <c:if test="${not empty ticket}">
            <form action="${pageContext.request.contextPath}/tickets" method="post">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="ticketId" value="${ticket.ticketId}"/>

                <div>
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" value="<c:out value='${not empty requestScope.ticketTitle ? requestScope.ticketTitle : ticket.title}'/>" required>
                </div>

                <div>
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" required><c:out value='${not empty requestScope.ticketDescription ? requestScope.ticketDescription : ticket.description}'/></textarea>
                </div>

                <div>
                    <label for="priority">Priority:</label>
                    <select id="priority" name="priority">
                        <c:set var="currentPriority" value="${not empty requestScope.ticketPriority ? requestScope.ticketPriority : ticket.priority}" />
                        <option value="Low" ${currentPriority == 'Low' ? 'selected' : ''}>Low</option>
                        <option value="Medium" ${currentPriority == 'Medium' ? 'selected' : ''}>Medium</option>
                        <option value="High" ${currentPriority == 'High' ? 'selected' : ''}>High</option>
                        <option value="Urgent" ${currentPriority == 'Urgent' ? 'selected' : ''}>Urgent</option>
                    </select>
                </div>

                <div>
                    <label for="status">Status:</label>
                     <select id="status" name="status">
                        <c:set var="currentStatus" value="${not empty requestScope.ticketStatus ? requestScope.ticketStatus : ticket.status}" />
                        <option value="Open" ${currentStatus == 'Open' ? 'selected' : ''}>Open</option>
                        <option value="In Progress" ${currentStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
                        <option value="Resolved" ${currentStatus == 'Resolved' ? 'selected' : ''}>Resolved</option>
                        <option value="Closed" ${currentStatus == 'Closed' ? 'selected' : ''}>Closed</option>
                        <option value="Pending Customer" ${currentStatus == 'Pending Customer' ? 'selected' : ''}>Pending Customer</option>
                    </select>
                </div>

                <div class="button-group">
                    <a href="${pageContext.request.contextPath}/tickets?action=list" class="button secondary">Cancel</a>
                    <input type="submit" value="Update Ticket" class="button primary">
                </div>
            </form>
        </c:if>
    </div>
</body>
</html>
