<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Feedback</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-gray-700 min-h-screen flex items-center justify-center p-6">

  <div class="bg-gray-900 text-white p-10 rounded-xl shadow-xl w-full max-w-2xl">
    <h2 class="text-3xl font-bold text-center mb-8">Update Feedback</h2>

    <form action="feedUpdate" method="post" class="space-y-6">
      
    

      <!-- Name -->
      <div>
        <label class="block mb-1 font-medium" for="name">Name:</label>
        <div class="relative">
          <i class="bi bi-person absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="text" name="name" value="${param.name}" 
                 class="pl-10 w-full bg-gray-800 text-white border border-gray-600 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-yellow-400" />
        </div>
      </div>

      <!-- Email (read-only) -->
      <div>
        <label class="block mb-1 font-medium" for="email">Email:</label>
        <div class="relative">
          <i class="bi bi-envelope absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="email" name="email"value="${param.email}" readonly
                 class="pl-10 w-full bg-gray-700 text-gray-400 border border-gray-600 rounded-full py-2 px-4" />
        </div>
      </div>

      <!-- Game Name -->
      <div>
        <label class="block mb-1 font-medium" for="gname">Game Name:</label>
        <div class="relative">
          <i class="bi bi-controller absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="text" name="gname" value="${param.gname}" 
                 class="pl-10 w-full bg-gray-800 text-white border border-gray-600 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-yellow-400" />
        </div>
      </div>

      <!-- Message -->
      <div>
        <label class="block mb-1 font-medium" for="message">Message:</label>
        <div class="relative">
          <i class="bi bi-chat-dots absolute left-3 top-3 text-gray-400"></i>
          <input type = "text" name="msg"  value = "${param.msg}"
                    class="pl-10 w-full bg-gray-800 text-white border border-gray-600 rounded-lg py-2 px-4 focus:outline-none focus:ring-2 focus:ring-yellow-400" />
        </div>
      </div>

      <!-- Submit -->
      <div class="text-center">
        <button type="submit"
                class="bg-yellow-400 hover:bg-yellow-500 text-black font-semibold py-2 px-6 rounded-full transition duration-200 flex items-center justify-center space-x-2">
          <i class="bi bi-save"></i><span>Update Feedback</span>
        </button>
      </div>
    </form>

    <!-- Back Button -->
    <div class="text-center mt-4">
      <a href="feedbackui.jsp" class="text-yellow-400 hover:text-yellow-300 transition duration-200 flex items-center justify-center space-x-1">
        <i class="bi bi-arrow-left-circle-fill"></i><span>Back to Feedbacks</span>
      </a>
    </div>
  </div>

</body>
</html>
