<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Feedbacks</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-gray-700 min-h-screen p-8">

  <div class="max-w-5xl mx-auto">
    <h1 class="text-3xl font-bold text-white text-center mb-8">All Feedbacks</h1>
    <a href="UserDashboard" class="text-yellow-400 hover:text-yellow-300 transition duration-200 flex items-center justify-center space-x-1">
        <i class="bi bi-arrow-left-circle-fill"></i><span>Back to User Dashboard</span>
      </a>

    <!-- Loop Starts Here -->
          <c:forEach var="cus" items="${list1}">

    <div class="bg-gray-900 text-white p-6 rounded-xl shadow-lg mb-6">
      <div class="mb-2 text-xl font-semibold"> Game Title : ${cus.gname}</div>
      <div class="mb-1">Name: ${cus.name}</div>
      <div class="mb-1">Email: ${cus.email}</div>
      <div class="text-gray-300 mt-3">${cus.msg}.</div>

      <div class="flex justify-end space-x-4 mt-4">
        <!-- See More Button -->
        <form action="singleFeed" method="post">

                    <input type="hidden" name="email" value="${cus.email}" />

          
          <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full flex items-center space-x-2">
            <i class="bi bi-eye-fill"></i><span>See More...</span>
          </button>
        </form>

        <!-- Delete Button -->
        <form action="deletefeedback" method="post" onsubmit="return confirm('Are you sure you want to delete this feedback?');">
          <input type="hidden" name="email" value="${cus.email}" />
          <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-full flex items-center space-x-2">
            <i class="bi bi-trash-fill"></i><span>Delete</span>
          </button>
        </form>
      </div>
    </div>
  </c:forEach>
    <!-- Loop Ends Here -->

  </div>

</body>
</html>
