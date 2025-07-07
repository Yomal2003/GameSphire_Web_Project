<%-- File: newTicketForm.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New Support Ticket</title>
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

        .form-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 650px; /* Consistent width with edit form */
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
            padding: 12px 15px;
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
            resize: vertical;
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            gap: 10px; /* Space between buttons */
        }

        .button {
            padding: 10px 22px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 0.95em;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .button.primary { /* Create Ticket button */
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
        /* .success class would be similar if needed */

        /* NEW: Styles for JavaScript validation messages */
        .validation-error-message {
            color: #D8000C; /* Red color for errors */
            font-size: 0.85em;
            display: block; /* Ensure it takes its own line */
            margin-top: 4px;
            font-family: 'Roboto', sans-serif;
        }
        .input-error-highlight {
            border-color: #D8000C !important; /* Highlight border of invalid input */
            box-shadow: 0 0 0 0.2rem rgba(216, 0, 12, 0.25) !important;
        }


        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
                margin-top: 20px;
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
        <h1>Create New Support Ticket</h1>

        
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="message error">${requestScope.errorMessage}</div>
        </c:if>

        
        <form id="newTicketForm" action="${pageContext.request.contextPath}/tickets" method="post" novalidate>
            <input type="hidden" name="action" value="create"/>

            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<c:out value='${not empty requestScope.ticketTitle ? requestScope.ticketTitle : param.title}'/>" required>
                <%-- Placeholder for JS validation message --%>
                <span id="titleError" class="validation-error-message"></span>
            </div>

            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" required><c:out value='${not empty requestScope.ticketDescription ? requestScope.ticketDescription : param.description}'/></textarea>
                <%-- Placeholder for JS validation message --%>
                <span id="descriptionError" class="validation-error-message"></span>
            </div>

            <div>
                <label for="priority">Priority:</label>
                <select id="priority" name="priority">
                    <%-- Determine current priority for re-population, preferring requestScope over param --%>
                    <c:set var="currentPriorityValue" value="${not empty requestScope.ticketPriority ? requestScope.ticketPriority : param.priority}" />
                    <option value="Low" ${currentPriorityValue == 'Low' ? 'selected' : ''}>Low</option>
                    <%-- Default to Medium if no priority is set or repopulated --%>
                    <option value="Medium" ${currentPriorityValue == 'Medium' || empty currentPriorityValue ? 'selected' : ''}>Medium</option>
                    <option value="High" ${currentPriorityValue == 'High' ? 'selected' : ''}>High</option>
                    <option value="Urgent" ${currentPriorityValue == 'Urgent' ? 'selected' : ''}>Urgent</option>
                </select>
                <%-- No specific validation for select here, but could be added if needed --%>
                <span id="priorityError" class="validation-error-message"></span>
            </div>

            <div class="button-group">
                <a href="${pageContext.request.contextPath}/tickets?action=list" class="button secondary">Cancel</a>
                <input type="submit" value="Create Ticket" class="button primary">
            </div>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('newTicketForm');
            const titleInput = document.getElementById('title');
            const descriptionInput = document.getElementById('description');

            form.addEventListener('submit', function (event) {
                let isValid = validateForm();
                if (!isValid) {
                    event.preventDefault();
                }
            });

            function validateForm() {
                let isValid = true;
                clearAllErrors(); 

                
                if (titleInput.value.trim() === '') {
                    displayError('titleError', titleInput, 'Title is required.');
                    isValid = false;
                } else if (titleInput.value.trim().length < 5) {
                    displayError('titleError', titleInput, 'Title must be at least 5 characters long.');
                    isValid = false;
                } else if (titleInput.value.trim().length > 100) {
                     displayError('titleError', titleInput, 'Title cannot exceed 100 characters.');
                     isValid = false;
                }


                
                if (descriptionInput.value.trim() === '') {
                    displayError('descriptionError', descriptionInput, 'Description is required.');
                    isValid = false;
                } else if (descriptionInput.value.trim().length < 10) {
                    displayError('descriptionError', descriptionInput, 'Description must be at least 10 characters long.');
                    isValid = false;
                } else if (descriptionInput.value.trim().length > 1000) {
                     displayError('descriptionError', descriptionInput, 'Description cannot exceed 1000 characters.');
                     isValid = false;
                }

    

                return isValid;
            }

            function displayError(errorElementId, inputElement, message) {
                const errorElement = document.getElementById(errorElementId);
                if (errorElement) {
                    errorElement.textContent = message;
                }
                if (inputElement) {
                    inputElement.classList.add('input-error-highlight');
                }
            }

            function clearError(errorElementId, inputElement) {
                const errorElement = document.getElementById(errorElementId);
                if (errorElement) {
                    errorElement.textContent = ''; 
                }
                if (inputElement) {
                    inputElement.classList.remove('input-error-highlight');
                }
            }

            function clearAllErrors() {
                clearError('titleError', titleInput);
                clearError('descriptionError', descriptionInput);
                clearError('priorityError', document.getElementById('priority')); 
                
            }

            
            titleInput.addEventListener('input', function() {
                if (this.value.trim() !== '') clearError('titleError', this);
            });
             titleInput.addEventListener('blur', function() { 
                if (this.value.trim() === '') {
                    displayError('titleError', this, 'Title is required.');
                } else if (this.value.trim().length < 5) {
                    displayError('titleError', this, 'Title must be at least 5 characters long.');
                } else if (this.value.trim().length > 100) {
                    displayError('titleError', this, 'Title cannot exceed 100 characters.');
                } else {
                    clearError('titleError', this);
                }
            });


            descriptionInput.addEventListener('input', function() {
                if (this.value.trim() !== '') clearError('descriptionError', this);
            });
            descriptionInput.addEventListener('blur', function() { 
                if (this.value.trim() === '') {
                    displayError('descriptionError', this, 'Description is required.');
                } else if (this.value.trim().length < 10) {
                    displayError('descriptionError', this, 'Description must be at least 10 characters long.');
                } else if (this.value.trim().length > 1000) {
                    displayError('descriptionError', this, 'Description cannot exceed 1000 characters.');
                } else {
                    clearError('descriptionError', this);
                }
            });
        });
    </script>
</body>
</html>