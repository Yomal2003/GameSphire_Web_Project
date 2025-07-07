<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Feedback</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-gray-800 min-h-screen flex items-center justify-center p-6">

  <div class="bg-gray-900 text-white p-8 rounded-xl shadow-xl w-full max-w-xl">
    <h2 class="text-3xl font-bold text-center mb-6">Feedback Details</h2>


    <c:set var="fd" value="${fd2}" />
    <!-- Feedback Display Card -->
    <div class="space-y-5 text-lg">
      <div class="flex items-center space-x-3">
        <i class="bi bi-person text-yellow-400"></i>
        <span><strong>Name:</strong> ${fd.name}</span>
      </div>
      
      <div class="flex items-center space-x-3">
        <i class="bi bi-envelope text-yellow-400"></i>
        <span><strong>Email:</strong> ${fd.email}</span>
      </div>
      
      <div class="flex items-center space-x-3">
        <i class="bi bi-controller text-yellow-400"></i>
        <span><strong>Game Name:</strong> ${fd.gname}</span>
      </div>
      
      <div class="flex items-start space-x-3">
        <i class="bi bi-chat-dots text-yellow-400 mt-1"></i>
        <div>
          <strong>Message:</strong>
          <p class="mt-1 text-gray-300">${fd.msg}</p>
        </div>
      </div>
    </div>

    <!-- Edit Button -->
    <div class="text-center mt-8">
      <form action="feedbackUpdate.jsp" method="get">
        <input type="hidden" name="name" value="${fd.name}" />
        <input type="hidden" name="email" value="${fd.email}" />
        <input type="hidden" name="gname" value="${fd.gname}" />
        <input type="hidden" name="msg" value="${fd.msg}" />
        <button type="submit"
                class="bg-yellow-400 hover:bg-yellow-500 text-black font-semibold py-2 px-6 rounded-full flex items-center justify-center space-x-2 transition duration-200">
          <i class="bi bi-pencil-square"></i><span>Edit</span>
        </button>
      </form>
    </div>
    <!-- Back Button -->
    <div class="text-center mt-4">
      <a href="addFeedBack" class="text-yellow-400 hover:text-yellow-300 transition duration-200 flex items-center justify-center space-x-1">
        <i class="bi bi-arrow-left-circle-fill"></i><span>Back to Feedbacks</span>
      </a>
    </div>
  </div>

</body>
</html>
