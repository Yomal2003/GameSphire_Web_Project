<%-- File: error.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %> <%-- This makes exception object available --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; color: #333; text-align: center; }
        .container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); display: inline-block; }
        h1 { color: #dc3545; }
        .error-message { font-size: 1.2em; margin-bottom: 20px; }
        a.button {
            display: inline-block; padding: 10px 20px; background-color: #007bff; color: white;
            text-decoration: none; border-radius: 4px;
        }
        a.button:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>An Error Occurred</h1>
        <p class="error-message">
            <c:choose>
                <c:when test="${not empty requestScope.errorMessage}">
                    <c:out value="${requestScope.errorMessage}"/>
                </c:when>
                <c:when test="${not empty param.errorMessage}">
                     <c:out value="${param.errorMessage}"/>
                </c:when>
                <c:when test="${pageContext.errorData != null && pageContext.errorData.throwable != null}">
                    Message: <c:out value="${pageContext.errorData.throwable.message}"/>
                </c:when>
                <c:otherwise>
                    An unexpected error occurred. Please try again later.
                </c:otherwise>
            </c:choose>
        </p>
        <a href="${pageContext.request.contextPath}/tickets?action=list" class="button">Back to Dashboard</a>
        <a href="${pageContext.request.contextPath}/" class="button">Go to Homepage</a>
    </div>
</body>
</html>