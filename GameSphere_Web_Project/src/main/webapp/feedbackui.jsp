<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback Form</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-gray-600 min-h-screen flex items-center justify-center">

  <div class="bg-gray-900 text-white p-10 rounded-lg shadow-lg w-full max-w-lg">
    <h2 class="text-2xl font-bold text-center mb-6">Feedback Form</h2>

    <form action="addFeedBack" method="POST" class="space-y-5">
      <!-- Name -->
      <div>
        <label class="block mb-1 font-medium" for="name">Name:</label>
        <div class="relative">
          <i class="bi bi-person absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="text" name="name" placeholder="Enter name"
                 class="pl-10 w-full bg-gray-800 text-white border border-gray-700 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-teal-400" />
        </div>
      </div>

      <!-- Email -->
      <div>
        <label class="block mb-1 font-medium" for="email">Email:</label>
        <div class="relative">
          <i class="bi bi-envelope absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="email" name="email" placeholder="Enter email"
                 class="pl-10 w-full bg-gray-800 text-white border border-gray-700 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-teal-400" />
        </div>
      </div>

      <!-- Subject -->
      <div>
        <label class="block mb-1 font-medium" for="subject">Game Name :</label>
        <div class="relative">
          <i class="bi bi-pencil-square absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
          <input type="text" name="gname" placeholder="Enter Game"
                 class="pl-10 w-full bg-gray-800 text-white border border-gray-700 rounded-full py-2 px-4 focus:outline-none focus:ring-2 focus:ring-teal-400" />
        </div>
      </div>

      <!-- Message -->
      <div>
        <label class="block mb-1 font-medium" for="message">Message:</label>
        <div class="relative">
          <i class="bi bi-chat-text absolute left-3 top-3 text-gray-400"></i>
          <input type = "text" name="msg" rows="4" placeholder="Enter message"
                    class="pl-10 w-full bg-gray-800 text-white border border-gray-700 rounded-lg py-2 px-4 focus:outline-none focus:ring-2 focus:ring-teal-400"></input>
        </div>
      </div>

      <!-- Submit -->
      <div class="text-center">
        <button type="submit"
                class="bg-teal-500 hover:bg-teal-600 text-white font-semibold py-2 px-6 rounded-full transition duration-200">
          Submit <i class="bi bi-arrow-right ml-2"></i>
        </button>
      </div>
    </form>
    
       <!-- See Feedbacks Button -->
       <form action="getAllFeedBacks" method = "post">
           <div class="text-center mt-6">
      <button href="viewFeedbacks.jsp" class="inline-block bg-yellow-400 hover:bg-yellow-500 text-black font-semibold py-2 px-6 rounded-full transition duration-200">
        <i class="bi bi-eye-fill mr-2"></i>See Your Feedbacks!
      </butoon>
    </div>
       </form>

  </div>

</body>
</html>
